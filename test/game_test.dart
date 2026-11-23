import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_boyama_kitabi/oyun_boyama_kitabi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(boyamaKitabiConfig.title.length, 33);
    expect(boyamaKitabiConfig.tagline.length, 33);
    for (final s in boyamaKitabiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(boyamaKitabiConfig.gameId, boyamaKitabiId);
    expect(boyamaKitabiRules.gameId, boyamaKitabiId);
    expect(boyamaKitabiConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(boyamaKitabiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: boyamaKitabiId, optionalMechanics: boyamaKitabiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(boyamaKitabiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
