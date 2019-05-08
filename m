Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD6A174A6
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 11:09:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40A0A1AA4;
	Wed,  8 May 2019 11:08:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40A0A1AA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557306569;
	bh=VvLVOm9su+arzTM62RdVP7jfrEZLt9hs8YEa7BoZwsA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=R9DOyJel7vkKYTQo3s4Z1i6ih802kTQNpT5ADGB46I/e8LH0NWfYNLFGsxDKQAgKj
	 lYfkOOlXUe3YeJydb8mCBSIIDPTLRrjh3iF4GBRRoajE+fL6iVvteaTbx56a/sfL9N
	 mBPuRLhAFRg87rJ173ho0XkjLL32MC8d4rfhXrOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AAAAF89758;
	Wed,  8 May 2019 11:02:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 004C7F8973C; Wed,  8 May 2019 11:01:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 553A5F8973A
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 11:01:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 553A5F8973A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="uMZygjis"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=bBkrEgPSq8hc5aCHjilUOXB34a6TFD7nFVTZOLwQsrY=; b=uMZygjisX7W+
 EyGsIYJFHqMbpKkgfNTBiPKXKESI5QrIXCoMe8VJQcZd3sgAsbdcAElgMZj5zDsdVIFQPcgG0O65F
 h4pD//6ydumCq19q5Usgwf/GS3X3+EoJhaSsJIYq6UP+x6JMilwbhGHSKPsSScXMfJytJPJ+iaEVv
 SL2Zo=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOISP-0007ds-G9; Wed, 08 May 2019 09:01:49 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id CB8F044000C; Wed,  8 May 2019 10:01:31 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20190507101220.182466-3-tzungbi@google.com>
X-Patchwork-Hint: ignore
Message-Id: <20190508090131.CB8F044000C@finisterre.sirena.org.uk>
Date: Wed,  8 May 2019 10:01:31 +0100 (BST)
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tiwai@suse.com,
 tzungbi@google.com, Mark Brown <broonie@kernel.org>, dgreid@google.com
Subject: [alsa-devel] Applied "ASoC: mediatek: mt6358: save output volume
	for mixer controls" to the asoc tree
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

   ASoC: mediatek: mt6358: save output volume for mixer controls

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From bbb56537a3279f7221e253afc29e834a3d99662f Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 7 May 2019 18:12:19 +0800
Subject: [PATCH] ASoC: mediatek: mt6358: save output volume for mixer controls

Output volume settings from mixer controls would be lost.

Imagine that "Headphone Volume" has set to -10dB via amixer:
- in mtk_hp_enable()
  - hp_store_gain() saves the volume setting -10dB from regmap_read()
    to ana_gain[AUDIO_ANALOG_VOLUME_HPOUTL]
  - headset_volume_ramp() ramps up from -10dB to -10dB
- in mtk_hp_disable()
  - headset_volume_ramp() ramps down from -10dB to -40dB

Next time in mtk_hp_enable(), hp_store_gain() would save -40dB but
not -10dB.  As a result, headset_volume_ramp() would ramp from -10dB to
-40dB (which is mute).

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/mt6358.c | 91 ++++++++++++++++++++++-----------------
 1 file changed, 51 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index 96547ae50a5d..44edbda8afcc 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -320,32 +320,6 @@ enum {
 #define DL_GAIN_N_40DB_REG (DL_GAIN_N_40DB << 7 | DL_GAIN_N_40DB)
 #define DL_GAIN_REG_MASK 0x0f9f
 
-static void lo_store_gain(struct mt6358_priv *priv)
-{
-	unsigned int reg;
-	unsigned int gain_l, gain_r;
-
-	regmap_read(priv->regmap, MT6358_ZCD_CON1, &reg);
-	gain_l = (reg >> RG_AUDLOLGAIN_SFT) & RG_AUDLOLGAIN_MASK;
-	gain_r = (reg >> RG_AUDLORGAIN_SFT) & RG_AUDLORGAIN_MASK;
-
-	priv->ana_gain[AUDIO_ANALOG_VOLUME_LINEOUTL] = gain_l;
-	priv->ana_gain[AUDIO_ANALOG_VOLUME_LINEOUTR] = gain_r;
-}
-
-static void hp_store_gain(struct mt6358_priv *priv)
-{
-	unsigned int reg;
-	unsigned int gain_l, gain_r;
-
-	regmap_read(priv->regmap, MT6358_ZCD_CON2, &reg);
-	gain_l = (reg >> RG_AUDHPLGAIN_SFT) & RG_AUDHPLGAIN_MASK;
-	gain_r = (reg >> RG_AUDHPRGAIN_SFT) & RG_AUDHPRGAIN_MASK;
-
-	priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTL] = gain_l;
-	priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTR] = gain_r;
-}
-
 static void hp_zcd_disable(struct mt6358_priv *priv)
 {
 	regmap_write(priv->regmap, MT6358_ZCD_CON0, 0x0000);
@@ -439,20 +413,62 @@ static void headset_volume_ramp(struct mt6358_priv *priv, int from, int to)
 	}
 }
 
+static int mt6358_put_volsw(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+			snd_soc_kcontrol_component(kcontrol);
+	struct mt6358_priv *priv = snd_soc_component_get_drvdata(component);
+	struct soc_mixer_control *mc =
+			(struct soc_mixer_control *)kcontrol->private_value;
+	unsigned int reg;
+	int ret;
+
+	ret = snd_soc_put_volsw(kcontrol, ucontrol);
+	if (ret < 0)
+		return ret;
+
+	switch (mc->reg) {
+	case MT6358_ZCD_CON2:
+		regmap_read(priv->regmap, MT6358_ZCD_CON2, &reg);
+		priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTL] =
+			(reg >> RG_AUDHPLGAIN_SFT) & RG_AUDHPLGAIN_MASK;
+		priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTR] =
+			(reg >> RG_AUDHPRGAIN_SFT) & RG_AUDHPRGAIN_MASK;
+		break;
+	case MT6358_ZCD_CON1:
+		regmap_read(priv->regmap, MT6358_ZCD_CON1, &reg);
+		priv->ana_gain[AUDIO_ANALOG_VOLUME_LINEOUTL] =
+			(reg >> RG_AUDLOLGAIN_SFT) & RG_AUDLOLGAIN_MASK;
+		priv->ana_gain[AUDIO_ANALOG_VOLUME_LINEOUTR] =
+			(reg >> RG_AUDLORGAIN_SFT) & RG_AUDLORGAIN_MASK;
+		break;
+	case MT6358_ZCD_CON3:
+		regmap_read(priv->regmap, MT6358_ZCD_CON3, &reg);
+		priv->ana_gain[AUDIO_ANALOG_VOLUME_HSOUTL] =
+			(reg >> RG_AUDHSGAIN_SFT) & RG_AUDHSGAIN_MASK;
+		priv->ana_gain[AUDIO_ANALOG_VOLUME_HSOUTR] =
+			(reg >> RG_AUDHSGAIN_SFT) & RG_AUDHSGAIN_MASK;
+		break;
+	}
+
+	return ret;
+}
+
 static const DECLARE_TLV_DB_SCALE(playback_tlv, -1000, 100, 0);
 static const DECLARE_TLV_DB_SCALE(pga_tlv, 0, 600, 0);
 
 static const struct snd_kcontrol_new mt6358_snd_controls[] = {
 	/* dl pga gain */
-	SOC_DOUBLE_TLV("Headphone Volume",
-		       MT6358_ZCD_CON2, 0, 7, 0x12, 1,
-		       playback_tlv),
-	SOC_DOUBLE_TLV("Lineout Volume",
-		       MT6358_ZCD_CON1, 0, 7, 0x12, 1,
-		       playback_tlv),
-	SOC_SINGLE_TLV("Handset Volume",
-		       MT6358_ZCD_CON3, 0, 0x12, 1,
-		       playback_tlv),
+	SOC_DOUBLE_EXT_TLV("Headphone Volume",
+			   MT6358_ZCD_CON2, 0, 7, 0x12, 1,
+			   snd_soc_get_volsw, mt6358_put_volsw, playback_tlv),
+	SOC_DOUBLE_EXT_TLV("Lineout Volume",
+			   MT6358_ZCD_CON1, 0, 7, 0x12, 1,
+			   snd_soc_get_volsw, mt6358_put_volsw, playback_tlv),
+	SOC_SINGLE_EXT_TLV("Handset Volume",
+			   MT6358_ZCD_CON3, 0, 0x12, 1,
+			   snd_soc_get_volsw, mt6358_put_volsw, playback_tlv),
 	/* ul pga gain */
 	SOC_DOUBLE_R_TLV("PGA Volume",
 			 MT6358_AUDENC_ANA_CON0, MT6358_AUDENC_ANA_CON1,
@@ -831,8 +847,6 @@ static int mtk_hp_enable(struct mt6358_priv *priv)
 	/* Reduce ESD resistance of AU_REFN */
 	regmap_write(priv->regmap, MT6358_AUDDEC_ANA_CON2, 0x4000);
 
-	/* save target gain to restore after hardware open complete */
-	hp_store_gain(priv);
 	/* Set HPR/HPL gain as minimum (~ -40dB) */
 	regmap_write(priv->regmap, MT6358_ZCD_CON2, DL_GAIN_N_40DB_REG);
 
@@ -1042,8 +1056,6 @@ static int mtk_hp_spk_enable(struct mt6358_priv *priv)
 	/* Reduce ESD resistance of AU_REFN */
 	regmap_write(priv->regmap, MT6358_AUDDEC_ANA_CON2, 0x4000);
 
-	/* save target gain to restore after hardware open complete */
-	hp_store_gain(priv);
 	/* Set HPR/HPL gain to -10dB */
 	regmap_write(priv->regmap, MT6358_ZCD_CON2, DL_GAIN_N_10DB_REG);
 
@@ -1103,7 +1115,6 @@ static int mtk_hp_spk_enable(struct mt6358_priv *priv)
 	hp_main_output_ramp(priv, true);
 
 	/* Set LO gain as minimum (~ -40dB) */
-	lo_store_gain(priv);
 	regmap_write(priv->regmap, MT6358_ZCD_CON1, DL_GAIN_N_40DB_REG);
 	/* apply volume setting */
 	headset_volume_ramp(priv,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
