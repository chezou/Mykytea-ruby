#include <iostream>
// KyTea自体のコードが入っているファイル
#include "kytea/kytea.h"
// KyteaSentenceやKyTeaWordなどのデータ構造を定義するファイル
#include "kytea/kytea-struct.h"

using namespace std;
using namespace kytea;

int main(int argc, char** argv) {// KyTeaを初期化する
    Kytea kytea;
    
   // モデルを読み込む
   //  モデルはバイナリでもテキストでも良く、文字コードは自動的に検出される
    kytea.readModel("/usr/local/share/kytea/model.bin");


    // StringUtilは通常のstringからKyTea内部で利用する形式に変換できます
    //  mapString：通常のstring→KyteaString
    //  showString：KyteaString→通常のstring
    StringUtil* util = kytea.getStringUtil(); 

    // 設定クラスKyteaConfigは様々な設定を格納する
    KyteaConfig* config = kytea.getConfig();

    // 一文を表すオブジェクトを作る
    KyteaSentence sentence(util->mapString("これはテストです。"));

    // 単語境界を推定する
    kytea.calculateWS(sentence);
    // 各タグ種類に対してタグ付与を行う
    for(int i = 0; i < config->getNumTags(); i++)
        kytea.calculateTags(sentence,i);

    // 各単語に対して
    const KyteaSentence::Words & words =  sentence.words;

    for(int i = 0; i < (int)words.size(); i++) {
        // 単語を出力する
        cout << util->showString(words[i].surf);

        // 各タグ種に対して
        for(int j = 0; j < (int)words[i].tags.size(); j++) {
            cout << "\t";
            // タグと信頼度を出力
            for(int k = 0; k < (int)words[i].tags[j].size(); k++) {
                cout << " " << util->showString(words[i].tags[j][k].first) << 
                        "/" << words[i].tags[j][k].second;
            }
        }

        cout << endl;
    }
    cout << endl;

}
