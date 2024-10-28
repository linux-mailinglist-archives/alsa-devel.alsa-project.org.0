Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 207BE9B36F7
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2024 17:45:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC17CEC1;
	Mon, 28 Oct 2024 17:45:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC17CEC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730133912;
	bh=ZQpUc8rr8drZvAGg91DuY87mkamn5CvVszxJpLlQRhs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZIfyzAPDsrY9XrfKv7fN20+iYauMSYOpZP1T95x99p4nk83ZCAhmDZEVbRn26zRuR
	 oH7O2vFVV0iuyyzCUwBsp5n8Vr24Xm+jAVEdSd38zxJPGTh/HB90yfVwuSnMHok6xE
	 fUHeNp7aVHAUk4o1iicHjyxfhIdMg63G7UO06yxQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BDBBF805AE; Mon, 28 Oct 2024 17:43:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4A70F806C7;
	Mon, 28 Oct 2024 17:43:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0507F80269; Mon, 28 Oct 2024 07:05:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail78-50.sinamail.sina.com.cn (mail78-50.sinamail.sina.com.cn
 [219.142.78.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2FE0F80104
	for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2024 07:05:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2FE0F80104
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.131])
	by sina.net (10.185.250.30) with ESMTP
	id 671F29A900006BE1; Mon, 28 Oct 2024 14:05:30 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: AEF74285FCFE4222BA9CFBCC107CB715
X-SMAIL-UIID: AEF74285FCFE4222BA9CFBCC107CB715-20241028-140530
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH] ASoC: codecs: ES8326: Modify the configuration of and micbias
Date: Mon, 28 Oct 2024 14:05:29 +0800
Message-Id: <20241028060529.3359-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JV2ILCEW64CZIDMW32BFJBRJMWSI56PT
X-Message-ID-Hash: JV2ILCEW64CZIDMW32BFJBRJMWSI56PT
X-Mailman-Approved-At: Mon, 28 Oct 2024 16:42:59 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JV2ILCEW64CZIDMW32BFJBRJMWSI56PT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Because we designed a new version of ES8326, the configuration of
micbias needed to be modified.We tested the new driver,
on both the new version and the old one. It works well.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index d5362b3be484..aa3e364827c8 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -614,6 +614,10 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 		} else {
 			regmap_update_bits(es8326->regmap,  ES8326_ADC_MUTE,
 					0x0F, 0x0F);
+			if (es8326->version > ES8326_VERSION_B) {
+				regmap_update_bits(es8326->regmap, ES8326_VMIDSEL, 0x40, 0x40);
+				regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x70, 0x00);
+			}
 		}
 	} else {
 		if (!es8326->calibrated) {
@@ -640,6 +644,10 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 					ES8326_MUTE_MASK, ~(ES8326_MUTE));
 		} else {
 			msleep(300);
+			if (es8326->version > ES8326_VERSION_B) {
+				regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x70, 0x50);
+				regmap_update_bits(es8326->regmap, ES8326_VMIDSEL, 0x40, 0x00);
+			}
 			regmap_update_bits(es8326->regmap,  ES8326_ADC_MUTE,
 					0x0F, 0x00);
 		}
@@ -821,7 +829,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	dev_dbg(comp->dev, "gpio flag %#04x", iface);
 
-	if ((es8326->jack_remove_retry == 1) && (es8326->version != ES8326_VERSION_B)) {
+	if ((es8326->jack_remove_retry == 1) && (es8326->version < ES8326_VERSION_B)) {
 		if (iface & ES8326_HPINSERT_FLAG)
 			es8326->jack_remove_retry = 2;
 		else
@@ -859,7 +867,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 		/*
 		 * Inverted HPJACK_POL bit to trigger one IRQ to double check HP Removal event
 		 */
-		if ((es8326->jack_remove_retry == 0) && (es8326->version != ES8326_VERSION_B)) {
+		if ((es8326->jack_remove_retry == 0) && (es8326->version < ES8326_VERSION_B)) {
 			es8326->jack_remove_retry = 1;
 			dev_dbg(comp->dev, "remove event check, invert HPJACK_POL, cnt = %d\n",
 					es8326->jack_remove_retry);
@@ -954,7 +962,7 @@ static int es8326_calibrate(struct snd_soc_component *component)
 	regmap_read(es8326->regmap, ES8326_CHIP_VERSION, &reg);
 	es8326->version = reg;
 
-	if ((es8326->version == ES8326_VERSION_B) && (es8326->calibrated == false)) {
+	if ((es8326->version >= ES8326_VERSION_B) && (es8326->calibrated == false)) {
 		dev_dbg(component->dev, "ES8326_VERSION_B, calibrating\n");
 		regmap_write(es8326->regmap, ES8326_CLK_INV, 0xc0);
 		regmap_write(es8326->regmap, ES8326_CLK_DIV1, 0x03);
@@ -1047,7 +1055,7 @@ static void es8326_init(struct snd_soc_component *component)
 	regmap_write(es8326->regmap, ES8326_DAC_VPPSCALE, 0x15);
 
 	regmap_write(es8326->regmap, ES8326_HPDET_TYPE, 0x80 |
-			((es8326->version == ES8326_VERSION_B) ?
+			((es8326->version >= ES8326_VERSION_B) ?
 			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol) :
 			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol | 0x04)));
 	usleep_range(5000, 10000);
@@ -1073,6 +1081,10 @@ static void es8326_init(struct snd_soc_component *component)
 	regmap_write(es8326->regmap, ES8326_ADC1_SRC, 0x44);
 	regmap_write(es8326->regmap, ES8326_ADC2_SRC, 0x66);
 	es8326_disable_micbias(es8326->component);
+	if (es8326->version > ES8326_VERSION_B) {
+		regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x73, 0x03);
+		regmap_update_bits(es8326->regmap, ES8326_VMIDSEL, 0x40, 0x40);
+	}
 
 	msleep(200);
 	regmap_write(es8326->regmap, ES8326_INT_SOURCE, ES8326_INT_SRC_PIN9);
-- 
2.17.1

