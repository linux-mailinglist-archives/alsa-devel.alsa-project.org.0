Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0988952A76
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 10:29:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D5922BFE;
	Thu, 15 Aug 2024 10:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D5922BFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723710560;
	bh=IprM8RRessDIJrjofk4Bd2vse0GNObDd/kZ2NqgsEcU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iffRV+U0oeeXk/zQ2evXNcOhxgZ+epCZ4mnCDKokr1YSRlFMvpQ6gCftRXp1ztO96
	 RXwWDUYh3PWN8m12UYy3fCg95eMm4Qit/9HvZVdybJaopICAeTZ9+k9DX0KE22omQ4
	 H9S/h17mBO5eG/W5MoxCfzmXt3CeNeCciFk0gy4o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDB34F896B8; Thu, 15 Aug 2024 10:24:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41FB9F89664;
	Thu, 15 Aug 2024 10:24:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58082F80423; Tue, 13 Aug 2024 06:52:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp134-102.sina.com.cn (smtp134-102.sina.com.cn
 [180.149.134.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36ADDF800BF
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 06:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36ADDF800BF
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.131])
	by sina.net (10.185.250.32) with ESMTP
	id 66BAE666000078BE; Tue, 13 Aug 2024 12:51:51 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 99855257E7354864B1DB43395ACB49FD
X-SMAIL-UIID: 99855257E7354864B1DB43395ACB49FD-20240813-125151
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH] ASoC: codecs: ES8326: Adjust buttons
Date: Tue, 13 Aug 2024 12:51:49 +0800
Message-Id: <20240813045149.106488-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Q3PR6DKSYHUXW6GFCLRT5PYNFAPZ3ZKI
X-Message-ID-Hash: Q3PR6DKSYHUXW6GFCLRT5PYNFAPZ3ZKI
X-Mailman-Approved-At: Thu, 15 Aug 2024 08:24:37 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q3PR6DKSYHUXW6GFCLRT5PYNFAPZ3ZKI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To adapt to chrome, we have adjusted the buttons to match the system.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index d5362b3be484..5b4586d9e67a 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -765,11 +765,11 @@ static void es8326_jack_button_handler(struct work_struct *work)
 	case 0x6f:
 	case 0x4b:
 		/* button volume up */
-		cur_button = SND_JACK_BTN_1;
+		cur_button = SND_JACK_BTN_2;
 		break;
 	case 0x27:
 		/* button volume down */
-		cur_button = SND_JACK_BTN_2;
+		cur_button = SND_JACK_BTN_3;
 		break;
 	case 0x1e:
 	case 0xe2:
@@ -785,7 +785,7 @@ static void es8326_jack_button_handler(struct work_struct *work)
 		if (press_count > 3) {
 			/* report a press every 120ms */
 			snd_soc_jack_report(es8326->jack, cur_button,
-					SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2);
+				SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2 | SND_JACK_BTN_3);
 			press_count = 0;
 		}
 		button_to_report = cur_button;
@@ -800,9 +800,9 @@ static void es8326_jack_button_handler(struct work_struct *work)
 		/* released or no pressed */
 		if (button_to_report != 0) {
 			snd_soc_jack_report(es8326->jack, button_to_report,
-				    SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2);
+				SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2 | SND_JACK_BTN_3);
 			snd_soc_jack_report(es8326->jack, 0,
-				    SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2);
+				SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2 | SND_JACK_BTN_3);
 			button_to_report = 0;
 		}
 		es8326_disable_micbias(es8326->component);
@@ -845,7 +845,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 		if (es8326->jack->status & SND_JACK_HEADPHONE) {
 			dev_dbg(comp->dev, "Report hp remove event\n");
 			snd_soc_jack_report(es8326->jack, 0,
-				    SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2);
+				SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2 | SND_JACK_BTN_3);
 			snd_soc_jack_report(es8326->jack, 0, SND_JACK_HEADSET);
 			/* mute adc when mic path switch */
 			regmap_write(es8326->regmap, ES8326_ADC1_SRC, 0x44);
-- 
2.17.1

