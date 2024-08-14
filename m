Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EE4952A7A
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 10:29:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF19A2BF4;
	Thu, 15 Aug 2024 10:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF19A2BF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723710592;
	bh=I4lMMhnHMLmb2EGb4bZ/dbYwU5JnlaxrPyvAWzBO/qY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sfPRziQf5NMTPJ4xwTPuQfBwnK0dz7FRAW7VBMOovE3QIMh0/KqJ3otJTf2+RAaoZ
	 w7KGjyruIMi/h5dSpi8aPdww/uOIyXfhJWV/+NajZs0Q9UHg3m4ylhStLTbT2GN34p
	 kShXAqu1XKrxd9QpeXTt3A2iEkVD+8pgNUpnKuNc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACAE0F896ED; Thu, 15 Aug 2024 10:24:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B674F8060E;
	Thu, 15 Aug 2024 10:24:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21BE5F80423; Wed, 14 Aug 2024 08:09:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp134-89.sina.com.cn (smtp134-89.sina.com.cn
 [180.149.134.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32EEEF80107
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 08:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32EEEF80107
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.131])
	by sina.net (10.185.250.31) with ESMTP
	id 66BC4A0F00006D7C; Wed, 14 Aug 2024 14:09:20 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 9CBE1A98A9D141E1B6E4B43EE7CD460B
X-SMAIL-UIID: 9CBE1A98A9D141E1B6E4B43EE7CD460B-20240814-140920
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH v1] ASoC: codecs: ES8326: Adjust buttons
Date: Wed, 14 Aug 2024 14:09:21 +0800
Message-Id: <20240814060921.2521-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FNY6CDBTIKZJWE3QHYJBRVH43VPQMFI2
X-Message-ID-Hash: FNY6CDBTIKZJWE3QHYJBRVH43VPQMFI2
X-Mailman-Approved-At: Thu, 15 Aug 2024 08:24:37 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FNY6CDBTIKZJWE3QHYJBRVH43VPQMFI2/>
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
 sound/soc/codecs/es8326.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index d5362b3be484..cf22d3b745d5 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -752,6 +752,16 @@ static void es8326_jack_button_handler(struct work_struct *work)
 	static int button_to_report, press_count;
 	static int prev_button, cur_button;
 
+#if IS_ENABLED(CONFIG_SND_SOC_MT8188_MT6359)
+	const int hs_keys[] = {
+		SND_JACK_BTN_0, SND_JACK_BTN_2, SND_JACK_BTN_3
+	};
+#else
+	const int hs_keys[] = {
+		SND_JACK_BTN_0, SND_JACK_BTN_1, SND_JACK_BTN_2
+	};
+#endif
+
 	if (!(es8326->jack->status & SND_JACK_HEADSET)) /* Jack unplugged */
 		return;
 
@@ -760,16 +770,16 @@ static void es8326_jack_button_handler(struct work_struct *work)
 	switch (iface) {
 	case 0x93:
 		/* pause button detected */
-		cur_button = SND_JACK_BTN_0;
+		cur_button = hs_keys[0];
 		break;
 	case 0x6f:
 	case 0x4b:
 		/* button volume up */
-		cur_button = SND_JACK_BTN_1;
+		cur_button = hs_keys[1];
 		break;
 	case 0x27:
 		/* button volume down */
-		cur_button = SND_JACK_BTN_2;
+		cur_button = hs_keys[2];
 		break;
 	case 0x1e:
 	case 0xe2:
@@ -785,7 +795,7 @@ static void es8326_jack_button_handler(struct work_struct *work)
 		if (press_count > 3) {
 			/* report a press every 120ms */
 			snd_soc_jack_report(es8326->jack, cur_button,
-					SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2);
+				SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2 | SND_JACK_BTN_3);
 			press_count = 0;
 		}
 		button_to_report = cur_button;
@@ -800,9 +810,9 @@ static void es8326_jack_button_handler(struct work_struct *work)
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
@@ -845,7 +855,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
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

