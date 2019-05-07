Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AF2161C9
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 12:16:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13EA31830;
	Tue,  7 May 2019 12:15:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13EA31830
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557224162;
	bh=SVJPf+TNobkF0bOj0ZWm3jIXY9gsU9h3LNlGA0wUeMg=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L4VdvvHXngzEhgbhryFYiIGW+2AqL303W46GwCzfdM/mi4sJKwhLosz7sqsMJRfdR
	 YGnj9R6jDj8YmgQk9I0h74hNvdg23tFGhwmoC7KJwAbXZZBFMlobcX01/nUdiYTu19
	 Nrq+9Ar3bHY4aHEuQZp6t6ChenI8oEK52BYEWgPM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7585F89728;
	Tue,  7 May 2019 12:13:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6E3FF89726; Tue,  7 May 2019 12:13:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_PASS, T_DKIMWL_WL_MED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BA5DF89724
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 12:13:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BA5DF89724
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="pzdr+DQG"
Received: by mail-vk1-xa4a.google.com with SMTP id r14so7177739vkd.18
 for <alsa-devel@alsa-project.org>; Tue, 07 May 2019 03:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=luodapv6xiETVaKZ1KJ6xc1kmnnmoklRcPYvajqLPZg=;
 b=pzdr+DQGeQu/8/ekH+t6LiJYQVxSAyYa0/DmtP4zs1kZr9CFWFRSpnYGdViw2h5rEN
 fk0RR6d4o+xoa7oQ4LFT/KRCznxk8oF4eQTwHatc42G3DZrpfK2+//JGWgI1tb2MAAMJ
 szJrO4zt02OYdG8s7ptUJkQgz+Iyq8V4Tt+i6lqzu3gxbg+WvEZRtQU6JvfSJT1N1net
 VK/ElQC69VAOxgfNtOYBEIV/XrWjFRjji+3CgveNwTdty++JWgCvmetrRHsJGvold6LU
 AWO3M6TyJtrhGfTjbu4K+v2DKkbJUarRa1MwQSl87CR3BnmlmzmJ8wpc9OOFVfqGIOzL
 u15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=luodapv6xiETVaKZ1KJ6xc1kmnnmoklRcPYvajqLPZg=;
 b=oZt+7zVYjXwjk3/PExZ7zA+qtR8sAIgb1k9xxxNhO1mE3YQWWa1GOseqFvizTD0tGX
 0o25s5mQIfktE5NtAMLKvBaSkcuoV3B4C3izDBB+JZegQ99jd+cwuA9iW0IhkUl6x6eX
 WT9FZtJSdn9bmNRHg5NYLlE41MOIveqyvlnMPr4jvAHQ2OWqxm5pWu8ip0Vh+tDoo1Sm
 ut+qifg6Kw3zQn+VHQ9Dr+/EC90LxRtq0bztyhUnH9XFYjLXQ6FGwB1l1atLe2pbINej
 ToEcQ/4UKFrL6GQedOMvJ1FUhue4X/ErgM2W5y+fgcJNfwIgi+d68oS4dQL1evx15NF0
 LGwg==
X-Gm-Message-State: APjAAAW7o65eN3Vz7UobkGm4p0ylp3/MRciVpC53JXY/u0GYEMpDzTlc
 Pm5jhKWSZjT8c6fFCnWcp5e+GdCL4OAW
X-Google-Smtp-Source: APXvYqyhLWc24NN7aEFyK27zt+XdE56uORXJYQSvTbf+2cC+fgWc9VIi5LZYeXvDAYNOdDar5J9xQQKRZoEy
X-Received: by 2002:a67:ce91:: with SMTP id c17mr8740909vse.33.1557223979911; 
 Tue, 07 May 2019 03:12:59 -0700 (PDT)
Date: Tue,  7 May 2019 18:12:19 +0800
In-Reply-To: <20190507101220.182466-1-tzungbi@google.com>
Message-Id: <20190507101220.182466-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20190507101220.182466-1-tzungbi@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, tiwai@suse.com
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 2/3] ASoC: mediatek: mt6358: save output volume
	for mixer controls
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
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
