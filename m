Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B009FDEDD
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Dec 2024 13:57:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDEBC6055E;
	Sun, 29 Dec 2024 13:57:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDEBC6055E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735477078;
	bh=zB9flyLtIepwa4O2BRI6fjtVqh7Ypwgaie8FhewednI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GJn6DIWR1P5H323LL+2myTo8HVL5xKWBy1pZzq5znK9QGH3yJVoi4+D6yITu25HY+
	 8v+EGcMMXH0T+zbOxbZwb0GZQi7j9UdVAfBmsq0d1i9UIpEm/8qCeF8Yt90IRScYTW
	 qdaiSopaYrh3YYv0ru83OovsHlhoSkbUQ95WkOUA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53EBCF80674; Sun, 29 Dec 2024 13:56:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9D41F8065E;
	Sun, 29 Dec 2024 13:56:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E470F80171; Fri, 20 Dec 2024 11:43:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp134-90.sina.com.cn (smtp134-90.sina.com.cn
 [180.149.134.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50834F8003C
	for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2024 11:43:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50834F8003C
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.131])
	by sina.net (10.185.250.31) with ESMTP
	id 67654A4B00005BE8; Fri, 20 Dec 2024 18:43:25 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: FF28FB87C759468BB392BBB952871EB7
X-SMAIL-UIID: FF28FB87C759468BB392BBB952871EB7-20241220-184325
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH] ASoC: codecs: ES8326: Reduce pop noise
Date: Fri, 20 Dec 2024 18:43:22 +0800
Message-Id: <20241220104322.31867-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CXHW4ZMM7NKP327ETSET6ENOS4H4H3RJ
X-Message-ID-Hash: CXHW4ZMM7NKP327ETSET6ENOS4H4H3RJ
X-Mailman-Approved-At: Sun, 29 Dec 2024 12:56:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CXHW4ZMM7NKP327ETSET6ENOS4H4H3RJ/>
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
 sound/soc/codecs/es8326.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index a5603b617688..27736c6933c5 100755
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
@@ -771,6 +783,10 @@ static void es8326_jack_button_handler(struct work_struct *work)
 		cur_button = SND_JACK_BTN_0;
 		break;
 	case 0x6f:
+		if (es8326->version > ES8326_VERSION_B) {
+			cur_button = SND_JACK_BTN_0;
+			break;
+		}
 	case 0x4b:
 		/* button volume up */
 		cur_button = SND_JACK_BTN_1;
@@ -1082,7 +1098,7 @@ static void es8326_init(struct snd_soc_component *component)
 	regmap_write(es8326->regmap, ES8326_ADC2_SRC, 0x66);
 	es8326_disable_micbias(es8326->component);
 	if (es8326->version > ES8326_VERSION_B) {
-		regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x73, 0x13);
+		regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x73, 0x10);
 		regmap_update_bits(es8326->regmap, ES8326_VMIDSEL, 0x40, 0x40);
 	}
 
-- 
2.17.1

