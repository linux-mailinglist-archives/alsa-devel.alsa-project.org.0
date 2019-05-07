Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 271F5161CA
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 12:16:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C768C18ED;
	Tue,  7 May 2019 12:15:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C768C18ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557224188;
	bh=7WvQxeh3raWLkzbocyphaB5rU2vmFPB9SSxU4b6t1VI=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tib4s0QY6TohxQmVWsyJ3FRhmjOOFVYw/MPZKbroeiBmPddPqs/Mj4D2psUiEmKA4
	 O30AN/6OC5373nb/xpqgzJgToxu+69BvC1zCfZSj9XV0Py9d08MdbD7Teu++O/7S9m
	 95OMooej2WLvJ2OIpCcvIlUPjSYz/KHAMja9Ff3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1213CF8972A;
	Tue,  7 May 2019 12:13:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8BB2F8972B; Tue,  7 May 2019 12:13:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_PASS, T_DKIMWL_WL_MED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-yw1-xc49.google.com (mail-yw1-xc49.google.com
 [IPv6:2607:f8b0:4864:20::c49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DD81F89727
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 12:13:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DD81F89727
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="iTzwyM2j"
Received: by mail-yw1-xc49.google.com with SMTP id q2so30502773ywd.9
 for <alsa-devel@alsa-project.org>; Tue, 07 May 2019 03:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=/z4fADeK2fLL67CzFV8fJ52P+/KQ/nXPgKIO88Uq6ms=;
 b=iTzwyM2jDB4YZJ2hoHnVjIzwIXPHs5cX9AdyDlt+MOLOxcTfeerWLDpy4942ck9z+y
 NQY2nAMAxlNGEvYeKvv4J8gipxmRwP3QBFD4BRDLYd3Ma8SXZTImQXF1DIljbhOYfERJ
 Re+mPtK5ODjW6xSyYzCfH8T4NiPb199AsKOzkLW/6sjQs1QkJ1whWme3mI1S4D6NJW5U
 sRNfZo8gjt3G44bFTMnS2fvwGJXNX5fnPPXLW3c7rDyePQRYiH7LnyF5cDygoo/1z7tH
 hs5q2R2zh+gQeIAXOIXYz18Kh3QGeBXnFbucUSad2hqd8wzbNRq7WfqTbVly0npQVjZ6
 MrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=/z4fADeK2fLL67CzFV8fJ52P+/KQ/nXPgKIO88Uq6ms=;
 b=d+OCf+gr/luxG6gysI/JPnsZqbUsQW6H6tX9pkBhW8NJyIW42b5ZLOuQDF+MJMWsri
 +BvVpk8eZRq5VYdP7fSWunrA86ahPmKdt44NWSGhJXCNX1RoEf7Kycj7rvyuL7uA82Us
 y/KeQ1lmWdNKGTlu7J36mOwLno6xFj3QVIEHEWL7P0dFhfUvqaz56NTfX9OBg25HLObf
 KmciZc5tRmvCF5R1GGVme3p7YFmbGzPQYjcY+jMR6G32qEMOfiSnpA8LDQFF6kHo3re+
 NqRxIkREU65flYIRdpGpuCK67ILXh7+hps/1ngdqSJq6VMwKEVWGg7iouJcCk9kairve
 DJ8Q==
X-Gm-Message-State: APjAAAXj70h0absuV0DYaLeHKG0auwMes7foljfOy5GjTlA+pr7CYXWh
 oagyv6v76Si48Zg05J5MJ5FHKW70pStN
X-Google-Smtp-Source: APXvYqzNvb0zqPqpmCM1mvRYB6mf7opx4jk0uh09oTV6Kr2iamdljO6Vw0Ia/jUdJeisaldHzcTzBlRY4e5o
X-Received: by 2002:a81:b717:: with SMTP id v23mr21255218ywh.120.1557223984586; 
 Tue, 07 May 2019 03:13:04 -0700 (PDT)
Date: Tue,  7 May 2019 18:12:20 +0800
In-Reply-To: <20190507101220.182466-1-tzungbi@google.com>
Message-Id: <20190507101220.182466-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20190507101220.182466-1-tzungbi@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, tiwai@suse.com
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 3/3] ASoC: mediatek: mt6358: save PGA for mixer
	control
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

mt6358_amic_disable() resets PGA to 0.

Save the gain settings from mixer control and restore them when using
the microphone.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/mt6358.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index 44edbda8afcc..50b3fc5457ea 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -450,6 +450,15 @@ static int mt6358_put_volsw(struct snd_kcontrol *kcontrol,
 		priv->ana_gain[AUDIO_ANALOG_VOLUME_HSOUTR] =
 			(reg >> RG_AUDHSGAIN_SFT) & RG_AUDHSGAIN_MASK;
 		break;
+	case MT6358_AUDENC_ANA_CON0:
+	case MT6358_AUDENC_ANA_CON1:
+		regmap_read(priv->regmap, MT6358_AUDENC_ANA_CON0, &reg);
+		priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP1] =
+			(reg >> RG_AUDPREAMPLGAIN_SFT) & RG_AUDPREAMPLGAIN_MASK;
+		regmap_read(priv->regmap, MT6358_AUDENC_ANA_CON1, &reg);
+		priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP2] =
+			(reg >> RG_AUDPREAMPRGAIN_SFT) & RG_AUDPREAMPRGAIN_MASK;
+		break;
 	}
 
 	return ret;
@@ -470,10 +479,10 @@ static const struct snd_kcontrol_new mt6358_snd_controls[] = {
 			   MT6358_ZCD_CON3, 0, 0x12, 1,
 			   snd_soc_get_volsw, mt6358_put_volsw, playback_tlv),
 	/* ul pga gain */
-	SOC_DOUBLE_R_TLV("PGA Volume",
-			 MT6358_AUDENC_ANA_CON0, MT6358_AUDENC_ANA_CON1,
-			 8, 4, 0,
-			 pga_tlv),
+	SOC_DOUBLE_R_EXT_TLV("PGA Volume",
+			     MT6358_AUDENC_ANA_CON0, MT6358_AUDENC_ANA_CON1,
+			     8, 4, 0,
+			     snd_soc_get_volsw, mt6358_put_volsw, pga_tlv),
 };
 
 /* MUX */
@@ -1750,6 +1759,21 @@ static void mt6358_dmic_disable(struct mt6358_priv *priv)
 	regmap_write(priv->regmap, MT6358_AUDENC_ANA_CON9, 0x0000);
 }
 
+static void mt6358_restore_pga(struct mt6358_priv *priv)
+{
+	unsigned int gain_l, gain_r;
+
+	gain_l = priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP1];
+	gain_r = priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP2];
+
+	regmap_update_bits(priv->regmap, MT6358_AUDENC_ANA_CON0,
+			   RG_AUDPREAMPLGAIN_MASK_SFT,
+			   gain_l << RG_AUDPREAMPLGAIN_SFT);
+	regmap_update_bits(priv->regmap, MT6358_AUDENC_ANA_CON1,
+			   RG_AUDPREAMPRGAIN_MASK_SFT,
+			   gain_r << RG_AUDPREAMPRGAIN_SFT);
+}
+
 static int mt_mic_type_event(struct snd_soc_dapm_widget *w,
 			     struct snd_kcontrol *kcontrol,
 			     int event)
@@ -1774,6 +1798,7 @@ static int mt_mic_type_event(struct snd_soc_dapm_widget *w,
 			mt6358_amic_enable(priv);
 			break;
 		}
+		mt6358_restore_pga(priv);
 
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
