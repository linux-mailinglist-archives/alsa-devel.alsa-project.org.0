Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F5082E85
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 11:17:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6B15167B;
	Tue,  6 Aug 2019 11:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6B15167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565083049;
	bh=O1Pibke1JR9DpdHGfibyEO+NrpF4ApvlUL60+5W40w0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KgrOCgpMIf3A9TesQWvUPJUfTcBu69qNzTj1FEFdNjAgfpdunJfuIN6Uu0slB5pmD
	 XH8bqepLCX1/LdMCik/CAkBz8629iWgdy/85SRQKC2M0L3yMm21BPBNfbOD6zDl5bF
	 E12A/LA2QOsbxJiwHS4h4vHhg6G62lic6E4u3ZCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 965FAF80535;
	Tue,  6 Aug 2019 11:15:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7678F80533; Tue,  6 Aug 2019 11:15:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7EF1F804CB
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 11:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7EF1F804CB
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x769F49s019379,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x769F49s019379
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 6 Aug 2019 17:15:04 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCASV01.realtek.com.tw (172.21.6.18) with Microsoft SMTP Server id
 14.3.439.0; Tue, 6 Aug 2019 17:15:03 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Tue, 6 Aug 2019 17:14:59 +0800
Message-ID: <20190806091459.14382-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, cychiang@google.com, Shuming Fan <shumingf@realtek.com>,
 derek.fang@realtek.com, frankbozar@google.com, sathya.prakash.m.r@intel.com,
 flove@realtek.com
Subject: [alsa-devel] [PATCH] ASoC: rt1011: Add a flag for the R0
	calibration test
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

The factory test needs to know whether the calibration completed.
This flag helps to confirm the calibration completed or not.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1011.c | 14 +++++++++++++-
 sound/soc/codecs/rt1011.h |  2 +-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index b25b4c1127ca..638abcaf52b3 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1225,7 +1225,10 @@ static int rt1011_bq_drc_info(struct snd_kcontrol *kcontrol,
 static int rt1011_r0_cali_get(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	ucontrol->value.integer.value[0] = 0;
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt1011_priv *rt1011 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = rt1011->cali_done;
 
 	return 0;
 }
@@ -1239,6 +1242,7 @@ static int rt1011_r0_cali_put(struct snd_kcontrol *kcontrol,
 	if (!component->card->instantiated)
 		return 0;
 
+	rt1011->cali_done = 0;
 	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF &&
 		ucontrol->value.integer.value[0])
 		rt1011_calibrate(rt1011, 1);
@@ -2135,6 +2139,7 @@ static int rt1011_calibrate(struct rt1011_priv *rt1011, unsigned char cali_flag)
 			r0_factor = ((format / r0[0] * 100) / 128)
 							- (r0_integer * 100);
 			rt1011->r0_reg = r0[0];
+			rt1011->cali_done = 1;
 			dev_info(dev,	"r0 resistance about %d.%02d ohm, reg=0x%X\n",
 				r0_integer, r0_factor, r0[0]);
 		}
@@ -2185,6 +2190,13 @@ static void rt1011_calibration_work(struct work_struct *work)
 
 	rt1011_calibrate(rt1011, 1);
 
+	/*
+	 * This flag should reset after booting.
+	 * The factory test will do calibration again and use this flag to check
+	 * whether the calibration completed
+	 */
+	rt1011->cali_done = 0;
+
 	/* initial */
 	rt1011_reg_init(component);
 }
diff --git a/sound/soc/codecs/rt1011.h b/sound/soc/codecs/rt1011.h
index 5d431d7f1d16..2d65983f3d0f 100644
--- a/sound/soc/codecs/rt1011.h
+++ b/sound/soc/codecs/rt1011.h
@@ -666,7 +666,7 @@ struct rt1011_priv {
 	int pll_out;
 
 	int bq_drc_set;
-	unsigned int r0_reg;
+	unsigned int r0_reg, cali_done;
 	int recv_spk_mode;
 };
 
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
