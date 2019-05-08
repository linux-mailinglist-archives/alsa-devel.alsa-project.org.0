Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7633E17486
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 11:05:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CAFC1904;
	Wed,  8 May 2019 11:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CAFC1904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557306331;
	bh=IAsn92e9RPvE8TrQ6plPCOzPSaumPLiAfrTtZdS9az0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jVN+xeczKJKwe8x6S+iUMskSWTLLoKruKEti36tWX5IZDxdMK303anUjWf/pHf7i+
	 wnOMcGXqbrlKA+1xGCf1L4qbe+tOHY4Xs0g0pZ9pQWAi8TfTwIvplPCg5PGVADV7/E
	 ZnLJmmTqb+IXS/K25Vtz0fI1gez78TwRrE8LGfsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5194F89739;
	Wed,  8 May 2019 11:01:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B13A7F89739; Wed,  8 May 2019 11:01:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA463F89726
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 11:01:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA463F89726
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jGZWk9Dj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Q7DwZRHdJHt87MlpuWoH7grW8GSi6P8GMst92mpsgGY=; b=jGZWk9DjlCLz
 CIM/UNX8O6nxYj6UJs54sHE7vfbmfqf8CWazdVCEGw1Hl0V2fQeffiz/1718HhfEbhv0TV8ru77Or
 vscvHWi4UbzSKzkpWNbEQk6FZBoHlhQyF4WsP80HiRxwYT/fY5+fUkocUsLhc8Ga0cL15Cwc97dmt
 y8Uq0=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOISM-0007dp-T3; Wed, 08 May 2019 09:01:43 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 41E6044003F; Wed,  8 May 2019 10:01:31 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20190507101220.182466-4-tzungbi@google.com>
X-Patchwork-Hint: ignore
Message-Id: <20190508090131.41E6044003F@finisterre.sirena.org.uk>
Date: Wed,  8 May 2019 10:01:31 +0100 (BST)
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tiwai@suse.com,
 tzungbi@google.com, Mark Brown <broonie@kernel.org>, dgreid@google.com
Subject: [alsa-devel] Applied "ASoC: mediatek: mt6358: save PGA for mixer
	control" to the asoc tree
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

   ASoC: mediatek: mt6358: save PGA for mixer control

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

From ec0574a6ce31f2d6640bb8a5edf98973356dd3b4 Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 7 May 2019 18:12:20 +0800
Subject: [PATCH] ASoC: mediatek: mt6358: save PGA for mixer control

mt6358_amic_disable() resets PGA to 0.

Save the gain settings from mixer control and restore them when using
the microphone.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
