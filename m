Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBC2CC8EC
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Oct 2019 11:02:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D47C1690;
	Sat,  5 Oct 2019 11:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D47C1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570266157;
	bh=6eWYki9xHrUbqgEpjJp63sI+i3zMaFVCVx3y+dP24Ac=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HG90lndp+dvLXYGll2pKO9scCIFZ3XdZoeed0I0XwEtwMHo7PQxu2vi6kcX8KK6s0
	 iFhEMop5bj1Sga10bWQPN7b+AiLPGUU603ZLZhrT8g6COhekp1Abe9eIlS2/zPvzgA
	 qPE9DjqtDmCudOeYg4TWfUGf1fghPxOvb0XYUw3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D40EFF8068A;
	Sat,  5 Oct 2019 10:56:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2638F8067B; Sat,  5 Oct 2019 10:56:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AD77F80676
 for <alsa-devel@alsa-project.org>; Sat,  5 Oct 2019 10:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AD77F80676
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="CHYNqCc1"
Received: by mail-yb1-xb4a.google.com with SMTP id x4so488234ybk.10
 for <alsa-devel@alsa-project.org>; Sat, 05 Oct 2019 01:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=K+dnMsm9RETMWR/Ic3MlJaLBL0zg9YMOTI1WVgS/WPk=;
 b=CHYNqCc1SgM4T03Miig87natAt4gOhWWS6ZeqFm+S/WsBjyzwH/flWk/fbXhozAviE
 +6EqlnHOpIXBEM6AcNtJS2JVbx4f0z8D0mdQkKFoWKaFc5mpC0EV+10LXxEnK3sApy6z
 jNjcHZ1SLA9jS/rFJzmLwycd96td7GTARmMMAq03A2uTs5JAI5UYTz/eJ+UljrLHOUVA
 pzGVRB2B/fI7phPEm4klsS69EndyIgkTitraPpkrBR7OsRsKIMUfydawx8oFIMR0mZaP
 UEYGRcTp4AeSKoGBOWGqrD9GD5dvo33BN+HhYojzg474kGYe/2mLNtb+XMDRN52zLgun
 9mPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=K+dnMsm9RETMWR/Ic3MlJaLBL0zg9YMOTI1WVgS/WPk=;
 b=be8hrrrsnnH0huGvhgPPNBBZ62NWVW3r/F8D/aeOKNEPAAiVhvgk2UkLdpaWiW54Xf
 pdNUMn0CWtiK5qeAFuplFieFY6RqJ3F3tj3Z8wNPYxisb4dw6d44MZQkPxQuw1iRQo/i
 5ccZaibDPTzYflWqz5PunyfmdLBSelUpUKPEdVG914ES3UuOKYly9lyCG/OW5N1D1cgO
 IjFwxEEbm9evSQSCSCuAbYlGsmne5f47n35VCjKXPV3u33dqK9Q1h87A26XnJJsavD69
 rTpBzRVqdAasELyZTkIFol6VKNPmZDc1SC2VDAvm6TQtzQL9WAlvGmE2sDMxutwpBCG7
 zMpA==
X-Gm-Message-State: APjAAAX7hFxyi3mfY4MFiZcKmhfcN662Pp7dr1NsSXwG8jw927NZg7z7
 TvK7pU4c2y00jC/K/ZFkivmgOzQ7Grre
X-Google-Smtp-Source: APXvYqy7TSDG9MFdg0VyzgcJgT50gBBDAO1RCTDH50XBmkRova/jztMlge2TIcgxFwrEqMmfI6+Ubr84N8e8
X-Received: by 2002:a25:3c86:: with SMTP id j128mr4371489yba.225.1570265765587; 
 Sat, 05 Oct 2019 01:56:05 -0700 (PDT)
Date: Sat,  5 Oct 2019 16:55:07 +0800
In-Reply-To: <20191005085509.187179-1-tzungbi@google.com>
Message-Id: <20191005164320.08.I57266d36564f393e9d701c9db648cc2efb0346fc@changeid>
Mime-Version: 1.0
References: <20191005085509.187179-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com
Subject: [alsa-devel] [PATCH v2 08/10] ASoC: mediatek: mt6358: support WoV
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

Switch mono DMIC on to support wake-on-voice.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/mt6358.c | 105 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index bb737fd678cc..1b830ea4f6ed 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -93,6 +93,8 @@ struct mt6358_priv {
 	int mtkaif_protocol;
 
 	struct regulator *avdd_reg;
+
+	int wov_enabled;
 };
 
 int mt6358_set_mtkaif_protocol(struct snd_soc_component *cmpnt,
@@ -464,6 +466,106 @@ static int mt6358_put_volsw(struct snd_kcontrol *kcontrol,
 	return ret;
 }
 
+static void mt6358_restore_pga(struct mt6358_priv *priv);
+
+static int mt6358_enable_wov_phase2(struct mt6358_priv *priv)
+{
+	/* analog */
+	regmap_update_bits(priv->regmap, MT6358_AUDDEC_ANA_CON13,
+			   0xffff, 0x0000);
+	regmap_update_bits(priv->regmap, MT6358_DCXO_CW14, 0xffff, 0xa2b5);
+	regmap_update_bits(priv->regmap, MT6358_AUDENC_ANA_CON1,
+			   0xffff, 0x0800);
+	mt6358_restore_pga(priv);
+
+	regmap_update_bits(priv->regmap, MT6358_DCXO_CW13, 0xffff, 0x9929);
+	regmap_update_bits(priv->regmap, MT6358_AUDENC_ANA_CON9,
+			   0xffff, 0x0025);
+	regmap_update_bits(priv->regmap, MT6358_AUDENC_ANA_CON8,
+			   0xffff, 0x0005);
+
+	/* digital */
+	regmap_update_bits(priv->regmap, MT6358_AUD_TOP_CKPDN_CON0,
+			   0xffff, 0x0000);
+	regmap_update_bits(priv->regmap, MT6358_GPIO_MODE3, 0xffff, 0x0120);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG0, 0xffff, 0xffff);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG1, 0xffff, 0x0200);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG2, 0xffff, 0x2424);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG3, 0xffff, 0xdbac);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG4, 0xffff, 0x029e);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG5, 0xffff, 0x0000);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_POSDIV_CFG0,
+			   0xffff, 0x0000);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_HPF_CFG0,
+			   0xffff, 0x0451);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_TOP, 0xffff, 0x68d1);
+
+	return 0;
+}
+
+static int mt6358_disable_wov_phase2(struct mt6358_priv *priv)
+{
+	/* digital */
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_TOP, 0xffff, 0xc000);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_HPF_CFG0,
+			   0xffff, 0x0450);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_POSDIV_CFG0,
+			   0xffff, 0x0c00);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG5, 0xffff, 0x0100);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG4, 0xffff, 0x006c);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG3, 0xffff, 0xa879);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG2, 0xffff, 0x2323);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG1, 0xffff, 0x0400);
+	regmap_update_bits(priv->regmap, MT6358_AFE_VOW_CFG0, 0xffff, 0x0000);
+	regmap_update_bits(priv->regmap, MT6358_GPIO_MODE3, 0xffff, 0x02d8);
+	regmap_update_bits(priv->regmap, MT6358_AUD_TOP_CKPDN_CON0,
+			   0xffff, 0x0000);
+
+	/* analog */
+	regmap_update_bits(priv->regmap, MT6358_AUDENC_ANA_CON8,
+			   0xffff, 0x0004);
+	regmap_update_bits(priv->regmap, MT6358_AUDENC_ANA_CON9,
+			   0xffff, 0x0000);
+	regmap_update_bits(priv->regmap, MT6358_DCXO_CW13, 0xffff, 0x9829);
+	regmap_update_bits(priv->regmap, MT6358_AUDENC_ANA_CON1,
+			   0xffff, 0x0000);
+	mt6358_restore_pga(priv);
+	regmap_update_bits(priv->regmap, MT6358_DCXO_CW14, 0xffff, 0xa2b5);
+	regmap_update_bits(priv->regmap, MT6358_AUDDEC_ANA_CON13,
+			   0xffff, 0x0010);
+
+	return 0;
+}
+
+static int mt6358_get_wov(struct snd_kcontrol *kcontrol,
+			  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct mt6358_priv *priv = snd_soc_component_get_drvdata(c);
+
+	ucontrol->value.integer.value[0] = priv->wov_enabled;
+	return 0;
+}
+
+static int mt6358_put_wov(struct snd_kcontrol *kcontrol,
+			  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct mt6358_priv *priv = snd_soc_component_get_drvdata(c);
+	int enabled = ucontrol->value.integer.value[0];
+
+	if (priv->wov_enabled != enabled) {
+		if (enabled)
+			mt6358_enable_wov_phase2(priv);
+		else
+			mt6358_disable_wov_phase2(priv);
+
+		priv->wov_enabled = enabled;
+	}
+
+	return 0;
+}
+
 static const DECLARE_TLV_DB_SCALE(playback_tlv, -1000, 100, 0);
 static const DECLARE_TLV_DB_SCALE(pga_tlv, 0, 600, 0);
 
@@ -483,6 +585,9 @@ static const struct snd_kcontrol_new mt6358_snd_controls[] = {
 			     MT6358_AUDENC_ANA_CON0, MT6358_AUDENC_ANA_CON1,
 			     8, 4, 0,
 			     snd_soc_get_volsw, mt6358_put_volsw, pga_tlv),
+
+	SOC_SINGLE_BOOL_EXT("Wake-on-Voice Phase2 Switch", 0,
+			    mt6358_get_wov, mt6358_put_wov),
 };
 
 /* MUX */
-- 
2.23.0.581.g78d2f28ef7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
