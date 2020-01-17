Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD8C140E45
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 16:49:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8936B17EC;
	Fri, 17 Jan 2020 16:48:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8936B17EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579276187;
	bh=KQrKEDktVnzBhKQZutSA8K+YbTYTw2ExSLFFrIVIND8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=AbjHRkUeFP5+5t0Wa6gJ/EkS/SNa3FKzxGciwqFqwjBGY55DxhzUkibM+sH9woeuA
	 I/R7CCAPIrxP8blBi0fXN8YAni8Qf9TPahfs+k6QUFDyQd6a0UR+oGNzXoabz0OdrG
	 VSkJAxc/7N4qTcmprHEvXUy3fNeCrxaS7/HN0ulw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A959BF8028D;
	Fri, 17 Jan 2020 16:45:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 089BAF80274; Fri, 17 Jan 2020 16:44:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98D6DF800AA
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 16:44:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98D6DF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="BMXXUnIR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=8JbL/qXmZ0lzqykGcRECrxItwlIMHg9Qasw691Y7IFE=; b=BMXXUnIR2DLq
 pkhy1gWc6m3J7TaBQP5jW+sYm4fZnGYwePqrp0E6xTazsTnEgutNnYBWVAOLjMbsWteHoR3SbIQeD
 G2rkz3UMJ0fhviU+WmHCnBi9Yjh+pWi+VlTKvngaVVGJHB6VMuhGtBpIyh7pQ10kPmwhKV9vxzV4E
 kJO6I=;
Received: from fw-tnat-cam4.arm.com ([217.140.106.52]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1isTnA-0006sJ-Lj; Fri, 17 Jan 2020 15:44:12 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 5BC91D02A2A; Fri, 17 Jan 2020 15:44:12 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
In-Reply-To: <20200116091854.18095-1-shumingf@realtek.com>
Message-Id: <applied-20200116091854.18095-1-shumingf@realtek.com>
X-Patchwork-Hint: ignore
Date: Fri, 17 Jan 2020 15:44:12 +0000 (GMT)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 derek.fang@realtek.com, sathya.prakash.m.r@intel.com, flove@realtek.com
Subject: [alsa-devel] Applied "ASoC: rt1011: set the different setting for
	QFN/WLCSP package" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: rt1011: set the different setting for QFN/WLCSP package

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 0e4ba0290e5851833f17b2b56deab6a28827bb07 Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Thu, 16 Jan 2020 17:18:54 +0800
Subject: [PATCH] ASoC: rt1011: set the different setting for QFN/WLCSP package

The QFN package is a new one.
There is a different initial setting to the chip of QFN and WLCSP package.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20200116091854.18095-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
