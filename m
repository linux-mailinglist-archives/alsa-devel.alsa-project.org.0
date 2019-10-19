Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DBDDD70E
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Oct 2019 09:06:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D998D84C;
	Sat, 19 Oct 2019 09:05:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D998D84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571468794;
	bh=t5DPA2bJh/KQdQ93oxnHxc1Og+mrFmybJu8ySZZUjgw=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oxOPO06noJIdEXDO45On/BVsH3kSoNZvsuOyCpOqdI4BkYkFQ5lck5wqA5skVQUsz
	 lNKd7Mr1QCgElmwNYE7gPV+3YQW3m+BOM8oWy9PPLKnXRqgnWFbzAD5A4wfoatdol9
	 +3Aqn3I7LgMQ4hTVvxkLkoxCGxsMN1MNfWoE0dQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2D4BF80611;
	Sat, 19 Oct 2019 09:03:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E369AF8060F; Sat, 19 Oct 2019 09:03:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EA4BF805FF
 for <alsa-devel@alsa-project.org>; Sat, 19 Oct 2019 09:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EA4BF805FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="TH4bE/Lx"
Received: by mail-qk1-x749.google.com with SMTP id c4so3273350qkg.22
 for <alsa-devel@alsa-project.org>; Sat, 19 Oct 2019 00:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=htGzMvPiVrbkGIh1d5cg48pMMG3bH6fyjNVM5C2zOfk=;
 b=TH4bE/LxskcI1BP4JCBy3GhHcPCyHeSGBxSeyKT+h44uspeUQIulZ+nvdV9VrYAlYP
 TfJnReNW5wM4Z9IKfD2Fp7Y/DcUEjSJEqJ1f1NeWEtr46ciVmfenpzuF8tdApGozAnuN
 oyVejRAPmV32OfAiqNH4JimY27OwoGTmetpCrJY9mkspTXYadmpFTK/cPJo4agAUGxve
 gOK1xEeLcaT7BdTXXGsgF5hD9aUEnuG2kgeuTD1IDrc2ZEzThMk3IKNBozivA+pu15aJ
 galBBMRy3gndauVehvicV3NRS5KxBJUlEzhKxjozcEt8Qj0lLzocLvyx39ZOIhQASM+Z
 TkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=htGzMvPiVrbkGIh1d5cg48pMMG3bH6fyjNVM5C2zOfk=;
 b=gjO7pUzcGFXB9dfdKMHVZLl6GcGlER00G5Es2W8wd3Ah9KAPIgZPJQPEpH6le+SCqa
 Jwipwwk4mGrAauZPJJMa5MocxbZkIjJ9pMY+M6P66XTHMfTs7wYRec2Ji5w9Wp/J7JhZ
 VE/V39X3D+TV0IGKxkc63vS8aaW+q/dmycQQ62knt0M2SmL4JiZ7I6F+OvNaJoUyN4P1
 kLKox+o2X7H5yn3K1IaL5fQ/WjCpoFFbk2jfcytGESJzurwa25j9JFGBlwRcU2liVqnp
 +rgevYasKX/6yBEW1azmhY/yE42tZwFlx7fDmHUL0cCDVj5ObGseEj6p1iOwAOEx6UY1
 ya2w==
X-Gm-Message-State: APjAAAWEWGeKpNywXgxEm6G2B6xu6Dskvu8719nZ88JWTJXHb8va00DJ
 4n2WQLbYY8m0pNJio+p9jwMzc4mIR7eF
X-Google-Smtp-Source: APXvYqy9UTtVEHOTuzpBf1AHupNMRUtPhWctIHcxsT+BD5Ss9AFVZR2FuKkW3WXfnmdpo+9yjrg1zo++34yG
X-Received: by 2002:ad4:504c:: with SMTP id m12mr1362331qvq.52.1571468599231; 
 Sat, 19 Oct 2019 00:03:19 -0700 (PDT)
Date: Sat, 19 Oct 2019 15:02:52 +0800
In-Reply-To: <20191019070254.23870-1-tzungbi@google.com>
Message-Id: <20191019143504.2.I57266d36564f393e9d701c9db648cc2efb0346fc@changeid>
Mime-Version: 1.0
References: <20191019070254.23870-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com
Subject: [alsa-devel] [PATCH v5 2/4] ASoC: mediatek: mt6358: support WoV
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
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
