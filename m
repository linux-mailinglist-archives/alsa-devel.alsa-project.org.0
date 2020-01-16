Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9309913D6A9
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 10:21:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA3CE17AF;
	Thu, 16 Jan 2020 10:20:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA3CE17AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579166461;
	bh=I+FCd4Yjvy2meL4r6xGPtu36oKGFTpVFmeAQvLh0N/I=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hjCU3RY1PR7vr1OfPZCm6VVOUgRrTD/s6gyNOb/VYQJ9nsZeJ7UdblhMpAhagnPlP
	 kmLgk6GPIt/MOsvP62bIG7WgD/zunGv0Uo72FwaKYTPae9U2cJ1w91fs9OclSiiZGP
	 bvDHSv6RKmQ5kLFZX/oRPoijKgeY5hFSp/BBSD/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A763F80171;
	Thu, 16 Jan 2020 10:19:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1F72F8014E; Thu, 16 Jan 2020 10:19:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0C04F80086
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 10:19:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0C04F80086
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 00G9J32W012940,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 00G9J32W012940
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 16 Jan 2020 17:19:03 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCASV01.realtek.com.tw (172.21.6.18) with Microsoft SMTP Server id
 14.3.468.0; Thu, 16 Jan 2020 17:19:02 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Thu, 16 Jan 2020 17:18:54 +0800
Message-ID: <20200116091854.18095-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, Shuming Fan <shumingf@realtek.com>, derek.fang@realtek.com,
 sathya.prakash.m.r@intel.com, flove@realtek.com
Subject: [alsa-devel] [PATCH] ASoC: rt1011: set the different setting for
	QFN/WLCSP package
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

The QFN package is a new one.
There is a different initial setting to the chip of QFN and WLCSP package.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1011.c | 17 +++++++++++++++--
 sound/soc/codecs/rt1011.h |  1 +
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 2552073e54ce..dec5638060c3 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -40,7 +40,6 @@ static const struct reg_sequence init_list[] = {
 
 	{ RT1011_ADC_SET_5, 0x0a20 },
 	{ RT1011_DAC_SET_2, 0xa032 },
-	{ RT1011_ADC_SET_1, 0x2925 },
 
 	{ RT1011_SPK_PRO_DC_DET_1, 0xb00c },
 	{ RT1011_SPK_PRO_DC_DET_2, 0xcccc },
@@ -2186,7 +2185,6 @@ static int rt1011_calibrate(struct rt1011_priv *rt1011, unsigned char cali_flag)
 	/* ADC/DAC setting */
 	regmap_write(rt1011->regmap, RT1011_ADC_SET_5, 0x0a20);
 	regmap_write(rt1011->regmap, RT1011_DAC_SET_2, 0xe232);
-	regmap_write(rt1011->regmap, RT1011_ADC_SET_1, 0x2925);
 	regmap_write(rt1011->regmap, RT1011_ADC_SET_4, 0xc000);
 
 	/* DC detection */
@@ -2235,8 +2233,18 @@ static int rt1011_calibrate(struct rt1011_priv *rt1011, unsigned char cali_flag)
 	dc_offset |= (value & 0xffff);
 	dev_info(dev, "Gain1 offset=0x%x\n", dc_offset);
 
+	/* check the package info. */
+	regmap_read(rt1011->regmap, RT1011_EFUSE_MATCH_DONE, &value);
+	if (value & 0x4)
+		rt1011->pack_id = 1;
 
 	if (cali_flag) {
+
+		if (rt1011->pack_id)
+			regmap_write(rt1011->regmap, RT1011_ADC_SET_1, 0x292c);
+		else
+			regmap_write(rt1011->regmap, RT1011_ADC_SET_1, 0x2925);
+
 		/* Class D on */
 		regmap_write(rt1011->regmap, RT1011_CLASS_D_POS, 0x010e);
 		regmap_write(rt1011->regmap,
@@ -2361,6 +2369,11 @@ static void rt1011_calibration_work(struct work_struct *work)
 
 		rt1011_r0_load(rt1011);
 	}
+
+	if (rt1011->pack_id)
+		snd_soc_component_write(component, RT1011_ADC_SET_1, 0x292c);
+	else
+		snd_soc_component_write(component, RT1011_ADC_SET_1, 0x2925);
 }
 
 static int rt1011_parse_dp(struct rt1011_priv *rt1011, struct device *dev)
diff --git a/sound/soc/codecs/rt1011.h b/sound/soc/codecs/rt1011.h
index 68fadc15fa8c..f3a9a96640f1 100644
--- a/sound/soc/codecs/rt1011.h
+++ b/sound/soc/codecs/rt1011.h
@@ -692,6 +692,7 @@ struct rt1011_priv {
 	unsigned int r0_reg, cali_done;
 	unsigned int r0_calib, temperature_calib;
 	int recv_spk_mode;
+	unsigned int pack_id; /* 0: WLCSP; 1: QFN */
 };
 
 #endif		/* end of _RT1011_H_ */
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
