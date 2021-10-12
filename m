Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6703E429DC4
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 08:32:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D921F168C;
	Tue, 12 Oct 2021 08:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D921F168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634020359;
	bh=VCSnpKbF5cdwIyaiUguF0FtDxPrxBiIOxRxLBiGivfE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZxhafnyT1RvMW8Xx7e4CD6gCtbalqSVNm5lpYi/dLpswTHli+OiT8cJjZ75w7MVwN
	 TFQMGW6lnhkMq59PdjTS2uHzCqDY3zooMRVWXHutK14nXFBRyUqxflnMsgmwAskPmn
	 5fAdjpZUFn7KCnR9UTu4hidTQGVQ3G16q+VnVSJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA8A3F80245;
	Tue, 12 Oct 2021 08:31:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11F40F80212; Tue, 12 Oct 2021 08:31:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF549F800CB
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 08:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF549F800CB
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="224476630"
X-IronPort-AV: E=Sophos;i="5.85,366,1624345200"; d="scan'208";a="224476630"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 23:31:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,366,1624345200"; d="scan'208";a="490817049"
Received: from anicol1x-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.40.213])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 23:31:02 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org, jack.yu@realtek.com,
 oder_chiou@realtek.com
Subject: [PATCH] ASoC: rt1011: Fix 'I2S Reference' enum control
Date: Tue, 12 Oct 2021 09:31:13 +0300
Message-Id: <20211012063113.3754-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 seppo.ingalsuo@linux.intel.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There are several things the patch adding the support for 'I2S Reference'
got wrong:
- "None" selection is in fact equals to last selected reference
- The custom put overrides RX/TX len, TDM slot sizes, etc
- the enum is useless in most part for the reference tracking
- there is no need for EXT control as there is a single bit in
  RT1011_TDM1_SET_1 register (bit 7) which selects the reference
- it was using ucontrol->value.integer.value[0] in the put/get callbacks
  which causes access to 'I2S Reference' enum with alsamixer to fail:
$ alsamixer
cannot load mixer controls: Invalid argument

cml_rt1011_rt5682 cml_rt1011_rt5682: control 2:0:0:TL I2S Reference:0: access overflow

It should have used ucontrol->value.enumerated.item[0], but since there is
no need for the custom code, it does not really matter.

Fixes: 87f40af26c262 ("ASoC: rt1011: add i2s reference control for rt1011")
Reported-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi,

This patch is an iteration on
https://lore.kernel.org/alsa-devel/20211011144518.2518-1-peter.ujfalusi@linux.intel.com/

to fix 87f40af26c262 ("ASoC: rt1011: add i2s reference control for rt1011").

In essence it is reverting the original patch to use
SOC_ENUM_SINGLE_DECL/SOC_ENUM to handle the bit to select the I2S reference.

Regards,
Peter

 sound/soc/codecs/rt1011.c | 56 +++++----------------------------------
 sound/soc/codecs/rt1011.h |  7 -----
 2 files changed, 6 insertions(+), 57 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 508597866dff..297af7ff824c 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1311,56 +1311,13 @@ static int rt1011_r0_load_info(struct snd_kcontrol *kcontrol,
 	.put = rt1011_r0_load_mode_put \
 }
 
-static const char * const rt1011_i2s_ref[] = {
-	"None", "Left Channel", "Right Channel"
+static const char * const rt1011_i2s_ref_texts[] = {
+	"Left Channel", "Right Channel"
 };
 
-static SOC_ENUM_SINGLE_DECL(rt1011_i2s_ref_enum, 0, 0,
-	rt1011_i2s_ref);
-
-static int rt1011_i2s_ref_put(struct snd_kcontrol *kcontrol,
-		struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct rt1011_priv *rt1011 =
-		snd_soc_component_get_drvdata(component);
-	int i2s_ref_ch = ucontrol->value.integer.value[0];
-
-	switch (i2s_ref_ch) {
-	case RT1011_I2S_REF_LEFT_CH:
-		regmap_write(rt1011->regmap, RT1011_TDM_TOTAL_SET, 0x0240);
-		regmap_write(rt1011->regmap, RT1011_TDM1_SET_2, 0x8);
-		regmap_write(rt1011->regmap, RT1011_TDM1_SET_1, 0x1022);
-		regmap_write(rt1011->regmap, RT1011_ADCDAT_OUT_SOURCE, 0x4);
-		break;
-	case RT1011_I2S_REF_RIGHT_CH:
-		regmap_write(rt1011->regmap, RT1011_TDM_TOTAL_SET, 0x0240);
-		regmap_write(rt1011->regmap, RT1011_TDM1_SET_2, 0x8);
-		regmap_write(rt1011->regmap, RT1011_TDM1_SET_1, 0x10a2);
-		regmap_write(rt1011->regmap, RT1011_ADCDAT_OUT_SOURCE, 0x4);
-		break;
-	default:
-		dev_info(component->dev, "I2S Reference: Do nothing\n");
-	}
-
-	rt1011->i2s_ref = ucontrol->value.integer.value[0];
-
-	return 0;
-}
-
-static int rt1011_i2s_ref_get(struct snd_kcontrol *kcontrol,
-		struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct rt1011_priv *rt1011 =
-		snd_soc_component_get_drvdata(component);
-
-	ucontrol->value.integer.value[0] = rt1011->i2s_ref;
-
-	return 0;
-}
+static SOC_ENUM_SINGLE_DECL(rt1011_i2s_ref_enum,
+			    RT1011_TDM1_SET_1, 7,
+			    rt1011_i2s_ref_texts);
 
 static const struct snd_kcontrol_new rt1011_snd_controls[] = {
 	/* I2S Data In Selection */
@@ -1401,8 +1358,7 @@ static const struct snd_kcontrol_new rt1011_snd_controls[] = {
 	SOC_SINGLE("R0 Temperature", RT1011_STP_INITIAL_RESISTANCE_TEMP,
 		2, 255, 0),
 	/* I2S Reference */
-	SOC_ENUM_EXT("I2S Reference", rt1011_i2s_ref_enum,
-		rt1011_i2s_ref_get, rt1011_i2s_ref_put),
+	SOC_ENUM("I2S Reference", rt1011_i2s_ref_enum),
 };
 
 static int rt1011_is_sys_clk_from_pll(struct snd_soc_dapm_widget *source,
diff --git a/sound/soc/codecs/rt1011.h b/sound/soc/codecs/rt1011.h
index afb2fad94216..68fadc15fa8c 100644
--- a/sound/soc/codecs/rt1011.h
+++ b/sound/soc/codecs/rt1011.h
@@ -654,12 +654,6 @@ enum {
 	RT1011_AIFS
 };
 
-enum {
-	RT1011_I2S_REF_NONE,
-	RT1011_I2S_REF_LEFT_CH,
-	RT1011_I2S_REF_RIGHT_CH,
-};
-
 /* BiQual & DRC related settings */
 #define RT1011_BQ_DRC_NUM 128
 struct rt1011_bq_drc_params {
@@ -698,7 +692,6 @@ struct rt1011_priv {
 	unsigned int r0_reg, cali_done;
 	unsigned int r0_calib, temperature_calib;
 	int recv_spk_mode;
-	unsigned int i2s_ref;
 };
 
 #endif		/* end of _RT1011_H_ */
-- 
2.33.0

