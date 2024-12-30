Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C239AA019A4
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2025 14:38:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B87F60215;
	Sun,  5 Jan 2025 14:38:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B87F60215
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736084294;
	bh=OBGRu15LuQfjB7bfh0KpVa2T1U/KB0E/V53FIW5UAAk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=b98BRN1/+erwC69N3YjQoQt7U7WYAt2lCHaUlTjSJRKThjCyLVLXZ/5MGExlFRu1F
	 w8dCGwFJNu20+gLBozLSdTKQN0BMjsxD8x3L0I7OryXMZ2XfGJgOs1JOSHNVFrJ6uh
	 pQtBkwlDx+TZDcy5C35tnAji6VeRZylm/1bUk30A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C5EFF805C5; Sun,  5 Jan 2025 14:37:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87163F805AD;
	Sun,  5 Jan 2025 14:37:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0E81F80508; Mon, 30 Dec 2024 04:28:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp134-90.sina.com.cn (smtp134-90.sina.com.cn
 [180.149.134.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46F1CF8001D
	for <alsa-devel@alsa-project.org>; Mon, 30 Dec 2024 04:28:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46F1CF8001D
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.131])
	by sina.net (10.185.250.31) with ESMTP
	id 67721339000006DD; Mon, 30 Dec 2024 11:27:54 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 370DEC8F782E4D61B3404B31F1899B49
X-SMAIL-UIID: 370DEC8F782E4D61B3404B31F1899B49-20241230-112754
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH] ASoC: codecs: ES8326: Adjust ANA_MICBIAS to reduce pop noise
Date: Mon, 30 Dec 2024 11:27:52 +0800
Message-Id: <20241230032752.108298-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3X4MF7VDGNXGWJMNF4366QTIH6KHU64R
X-Message-ID-Hash: 3X4MF7VDGNXGWJMNF4366QTIH6KHU64R
X-Mailman-Approved-At: Sun, 05 Jan 2025 13:37:30 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3X4MF7VDGNXGWJMNF4366QTIH6KHU64R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We modify the value of ES8326_ANA_MICBIAS to reduce the pop noise

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index a5603b617688..b06eead7e0f6 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -616,7 +616,7 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 					0x0F, 0x0F);
 			if (es8326->version > ES8326_VERSION_B) {
 				regmap_update_bits(es8326->regmap, ES8326_VMIDSEL, 0x40, 0x40);
-				regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x70, 0x10);
+				regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x70, 0x30);
 			}
 		}
 	} else {
@@ -631,6 +631,8 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 			regmap_write(es8326->regmap, ES8326_HPR_OFFSET_INI, offset_r);
 			es8326->calibrated = true;
 		}
+		regmap_update_bits(es8326->regmap, ES8326_CLK_INV, 0xc0, 0x00);
+                regmap_update_bits(es8326->regmap, ES8326_CLK_MUX, 0x80, 0x00);
 		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
 			regmap_update_bits(es8326->regmap, ES8326_DAC_DSM, 0x01, 0x01);
 			usleep_range(1000, 5000);
@@ -645,7 +647,7 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 		} else {
 			msleep(300);
 			if (es8326->version > ES8326_VERSION_B) {
-				regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x70, 0x50);
+				regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x70, 0x70);
 				regmap_update_bits(es8326->regmap, ES8326_VMIDSEL, 0x40, 0x00);
 			}
 			regmap_update_bits(es8326->regmap,  ES8326_ADC_MUTE,
@@ -676,6 +678,10 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
 		regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x00);
 		regmap_update_bits(es8326->regmap,  ES8326_CLK_CTL, 0x20, 0x20);
 		regmap_update_bits(es8326->regmap, ES8326_RESET, 0x02, 0x00);
+		if (es8326->version > ES8326_VERSION_B) {
+			regmap_update_bits(es8326->regmap, ES8326_VMIDSEL, 0x40, 0x40);
+			regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x70, 0x30);
+		}
 		break;
 	case SND_SOC_BIAS_PREPARE:
 		break;
@@ -683,6 +689,12 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
 		regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x3b);
 		regmap_update_bits(es8326->regmap, ES8326_CLK_CTL, 0x20, 0x00);
 		regmap_write(es8326->regmap, ES8326_SDINOUT1_IO, ES8326_IO_INPUT);
+		if (es8326->version > ES8326_VERSION_B) {
+			regmap_update_bits(es8326->regmap, ES8326_VMIDSEL, 0x40, 0x40);
+			regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x70, 0x10);
+		}
+		regmap_update_bits(es8326->regmap, ES8326_CLK_INV, 0xc0, 0xc0);
+		regmap_update_bits(es8326->regmap, ES8326_CLK_MUX, 0x80, 0x80);
 		break;
 	case SND_SOC_BIAS_OFF:
 		clk_disable_unprepare(es8326->mclk);
@@ -773,7 +785,10 @@ static void es8326_jack_button_handler(struct work_struct *work)
 	case 0x6f:
 	case 0x4b:
 		/* button volume up */
-		cur_button = SND_JACK_BTN_1;
+		if ((iface == 0x6f) && (es8326->version > ES8326_VERSION_B))
+			cur_button = SND_JACK_BTN_0;
+		else
+			cur_button = SND_JACK_BTN_1;
 		break;
 	case 0x27:
 		/* button volume down */
@@ -1082,7 +1097,7 @@ static void es8326_init(struct snd_soc_component *component)
 	regmap_write(es8326->regmap, ES8326_ADC2_SRC, 0x66);
 	es8326_disable_micbias(es8326->component);
 	if (es8326->version > ES8326_VERSION_B) {
-		regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x73, 0x13);
+		regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x73, 0x10);
 		regmap_update_bits(es8326->regmap, ES8326_VMIDSEL, 0x40, 0x40);
 	}
 
-- 
2.17.1

