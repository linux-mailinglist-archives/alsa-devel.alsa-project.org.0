Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2350F37A130
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 09:51:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BEB7176C;
	Tue, 11 May 2021 09:50:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BEB7176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620719459;
	bh=WW+vOGiHiJp8TNMi71xAUM7wW6vd4NxAxvFaWdLOM6o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KhFSNNrZCrZcFQj/53JCxXnjsA0J3R2QgyKoaCQCEvX1BwVQf1CVSztPNxhYcsA/9
	 fR4lsTI+YpamcXvFXVupoKB6P+UeLI+eaYx+ozsXDPrcK9pq7PuWz791fl9a+IQ4Dj
	 n7Lqu8Qmw7WbelkbsTB8H4Vo3nyFsTgNCEOUzLxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34FA4F80430;
	Tue, 11 May 2021 09:48:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FA67F8042F; Tue, 11 May 2021 09:48:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4D49F80129
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 09:48:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4D49F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="o2+cx3K/"
Received: by mail-wm1-x334.google.com with SMTP id
 o6-20020a05600c4fc6b029015ec06d5269so696525wmq.0
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 00:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RL5m146+QHuS6iRVfkXUrgZThwGYmN8qLX2jZ6PtJgs=;
 b=o2+cx3K/+/HtbZhWSq8RmPZcQUkXHvdgOq2PYkKyYfnHeyABiEIyjIxf6+7xdxrJVO
 Zh4qJ8ozc3K4qTX2WgoM8srd3oBguFJKKJsYk0RmZQ2ak9mhblGsRruZ4CLcG/VTOCAp
 gIILHqefPl3urOd5yKCdiyF24HBGMyARpl4oP04w1m+cotRRTAm+/W2WMifA5Gd445kv
 MMePrVw/vzWD+md4FRqQMyRRG7Y8m89x4uKRLkoA3vxPyfsSklF3mrCl6+hU28F0HZ8J
 dW2ahvzfr722dE0tj9kM10MOip2yAOHEXMqLxY+AEZHiE41HYEPoNwfcWF/MCqQ82nQL
 iZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RL5m146+QHuS6iRVfkXUrgZThwGYmN8qLX2jZ6PtJgs=;
 b=ZlHplDBH9Mbk1dnkGfjnPkosJfK42Lcom5gNIjPhmki7jVdZROllKJVje8By+E/ctc
 ogQr8V2Nw6C0ZGsRiFgQXtK3UMh8iwJGUNitVMtbjg8vW/xO0+HR/pmB/AD5/EC53URh
 6hO8tAB2tD/m6X4v0slFAun8dC1CSFrPWZI3MZEF3xefrEyjCYQLYkMeehiAA9TRI3/z
 gB1tRkK6MxVRmcVO58SH8Xo2tUpdKThpoEpnL091q4H1iC5ZkjDjqU9V/772Scs4HMtI
 j0f1i4KgubfmStyD2N5DqCTfMvjOWzEsX11pYNRqET5wIlqWZuBxr5uSi3aPtOX5CGUK
 91VQ==
X-Gm-Message-State: AOAM531tY1ShmuVgGzcSC6HoruPUOqIDTENwRriNuOFXXZr4Q+PrCXAS
 BrCR07BTmwuEawNJTFysNDt0pw==
X-Google-Smtp-Source: ABdhPJxOr7LBMZ49i0bwIQ/5ZIJDPKhHzlVc62DD9UqhFLNaZwqgT4EwFvn5NXTNQVoqpB8eRxcJmA==
X-Received: by 2002:a05:600c:47d7:: with SMTP id
 l23mr3760403wmo.95.1620719317929; 
 Tue, 11 May 2021 00:48:37 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:ce08:6145:b4e3:5a23])
 by smtp.gmail.com with ESMTPSA id
 f6sm28371111wru.72.2021.05.11.00.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 00:48:37 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	broonie@kernel.org
Subject: [PATCH v3 2/2] ASoC: meson: g12a-toacodec: add support for SM1
 TOACODEC
Date: Tue, 11 May 2021 09:48:29 +0200
Message-Id: <20210511074829.4110036-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511074829.4110036-1-narmstrong@baylibre.com>
References: <20210511074829.4110036-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=vFgn4HeF6fYyIrfNSO2XBhPEbABG+KXl/lGRiyykmRg=;
 m=qGwWmF5o4d9qBXb6Klih2uuRcBA5bhVPUwJGlRovDlc=;
 p=o6hiWh4C4SQvoRuJIWWUTHT1h2owx6EhVDRPkT/w0kU=;
 g=657f59579537e84fb82ba27b1e356e028d9bf9bd
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmCaNrIACgkQd9zb2sjISdGuXhAAzhC
 5ygHxZlSszj5dy7wZxzYyX2qY/uVvi4+0ayVrvup5eU7IY6yQVfl3t99dmfvkCPKpUY+bEYecfyhq
 dgVZe1qORcMpC02prr5TCZo/ILeXBpAu7GX4lNYktIL8b+zd3qcHShM4r/vE97YtYQGGtDBw/Dd9/
 KS+dXkK0qv4ZNtM1neMgKcCWprpL3O03HHNIKxRCHyF2d+u/LSn0Uu/wjVS4fk87Zl5L+MdaYFBoG
 Le2Z7qDeFfIY+aANYOrW0IB7V23w6TpurzabwytBJWKB7/N0bn6XnQdtUB0+t1PdFS5CY0Od9O+vi
 icBP5SfAZMDZxxJhk4IXJDi5Q7rFXVVFU8y309IICdXyXKUlHXEQZ6aGyzysXRwzl7eSgTt/DDFsK
 ME8UP96SbXDDp5LgvKyac+u94K4tSn4cAJNwS3aYH7Tufxssr4Cz11t2Grg70rcNHUXMcS8uhKrRt
 dWv1cKqyDfmUXRMD8YZqQBDeTpONjP3CwIGQ2HiA3bToFYebozVW2UNeG7h9FmD4IqIQreAINIlyT
 pyWA6yh5EOI/lEygqSVWJKCi5tv0jPX2sDWoo0S+t0Ti1CvPjf0eVwmsjKbs5MEnwlA04f5KxXEq1
 IJYZFkDnnGAYfCm1fljVB8IKlFKqkh3CyUKQIftbIvUcLpXC5J5Di9qr8vWVT604=
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
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

This adds support for the TOACODEC found in Amlogic SM1 SoCs.

The bits are shifted for more selection of clock sources, so this only
maps the same support for G12A to the SM1 bits.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 sound/soc/meson/g12a-toacodec.c | 63 ++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index 6317bd9c86f4..1dfee1396843 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -21,13 +21,22 @@
 
 #define TOACODEC_CTRL0			0x0
 #define  CTRL0_ENABLE_SHIFT		31
+#define  CTRL0_DAT_SEL_SM1_MSB		19
+#define  CTRL0_DAT_SEL_SM1_LSB		18
 #define  CTRL0_DAT_SEL_MSB		15
 #define  CTRL0_DAT_SEL_LSB		14
+#define  CTRL0_LANE_SEL_SM1		16
 #define  CTRL0_LANE_SEL			12
+#define  CTRL0_LRCLK_SEL_SM1_MSB	14
+#define  CTRL0_LRCLK_SEL_SM1_LSB	12
 #define  CTRL0_LRCLK_SEL_MSB		9
 #define  CTRL0_LRCLK_SEL_LSB		8
+#define  CTRL0_LRCLK_INV_SM1		BIT(10)
+#define  CTRL0_BLK_CAP_INV_SM1		BIT(9)
 #define  CTRL0_BLK_CAP_INV		BIT(7)
+#define  CTRL0_BCLK_O_INV_SM1		BIT(8)
 #define  CTRL0_BCLK_O_INV		BIT(6)
+#define  CTRL0_BCLK_SEL_SM1_MSB		6
 #define  CTRL0_BCLK_SEL_MSB		5
 #define  CTRL0_BCLK_SEL_LSB		4
 #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
@@ -41,6 +50,7 @@ struct g12a_toacodec {
 };
 
 struct g12a_toacodec_match_data {
+	const struct snd_soc_component_driver *component_drv;
 	struct reg_field field_dat_sel;
 	struct reg_field field_lrclk_sel;
 	struct reg_field field_bclk_sel;
@@ -98,11 +108,20 @@ static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
 			    CTRL0_DAT_SEL_LSB,
 			    g12a_toacodec_mux_texts);
 
+static SOC_ENUM_SINGLE_DECL(sm1_toacodec_mux_enum, TOACODEC_CTRL0,
+			    CTRL0_DAT_SEL_SM1_LSB,
+			    g12a_toacodec_mux_texts);
+
 static const struct snd_kcontrol_new g12a_toacodec_mux =
 	SOC_DAPM_ENUM_EXT("Source", g12a_toacodec_mux_enum,
 			  snd_soc_dapm_get_enum_double,
 			  g12a_toacodec_mux_put_enum);
 
+static const struct snd_kcontrol_new sm1_toacodec_mux =
+	SOC_DAPM_ENUM_EXT("Source", sm1_toacodec_mux_enum,
+			  snd_soc_dapm_get_enum_double,
+			  g12a_toacodec_mux_put_enum);
+
 static const struct snd_kcontrol_new g12a_toacodec_out_enable =
 	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
 				    CTRL0_ENABLE_SHIFT, 1, 0);
@@ -114,6 +133,13 @@ static const struct snd_soc_dapm_widget g12a_toacodec_widgets[] = {
 			    &g12a_toacodec_out_enable),
 };
 
+static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
+	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
+			 &sm1_toacodec_mux),
+	SND_SOC_DAPM_SWITCH("OUT EN", SND_SOC_NOPM, 0, 0,
+			    &g12a_toacodec_out_enable),
+};
+
 static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
 					 struct snd_pcm_hw_params *params,
 					 struct snd_soc_dai *dai)
@@ -184,6 +210,13 @@ static int g12a_toacodec_component_probe(struct snd_soc_component *c)
 				       CTRL0_BLK_CAP_INV);
 }
 
+static int sm1_toacodec_component_probe(struct snd_soc_component *c)
+{
+	/* Initialize the static clock parameters */
+	return snd_soc_component_write(c, TOACODEC_CTRL0,
+				       CTRL0_BLK_CAP_INV_SM1);
+}
+
 static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
 	{ "SRC", "I2S A", "IN A Playback" },
 	{ "SRC", "I2S B", "IN B Playback" },
@@ -196,6 +229,10 @@ static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
 	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
 };
 
+static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
+	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
+};
+
 static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
 	.probe			= g12a_toacodec_component_probe,
 	.controls		= g12a_toacodec_controls,
@@ -208,6 +245,18 @@ static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
 	.non_legacy_dai_naming	= 1,
 };
 
+static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
+	.probe			= sm1_toacodec_component_probe,
+	.controls		= sm1_toacodec_controls,
+	.num_controls		= ARRAY_SIZE(sm1_toacodec_controls),
+	.dapm_widgets		= sm1_toacodec_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(sm1_toacodec_widgets),
+	.dapm_routes		= g12a_toacodec_routes,
+	.num_dapm_routes	= ARRAY_SIZE(g12a_toacodec_routes),
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
 static const struct regmap_config g12a_toacodec_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
@@ -215,16 +264,28 @@ static const struct regmap_config g12a_toacodec_regmap_cfg = {
 };
 
 static const struct g12a_toacodec_match_data g12a_toacodec_match_data = {
+	.component_drv	= &g12a_toacodec_component_drv,
 	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 14, 15),
 	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 8, 9),
 	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 5),
 };
 
+static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
+	.component_drv	= &sm1_toacodec_component_drv,
+	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 18, 19),
+	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
+	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
+};
+
 static const struct of_device_id g12a_toacodec_of_match[] = {
 	{
 		.compatible = "amlogic,g12a-toacodec",
 		.data = &g12a_toacodec_match_data,
 	},
+	{
+		.compatible = "amlogic,sm1-toacodec",
+		.data = &sm1_toacodec_match_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, g12a_toacodec_of_match);
@@ -278,7 +339,7 @@ static int g12a_toacodec_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->field_bclk_sel);
 
 	return devm_snd_soc_register_component(dev,
-			&g12a_toacodec_component_drv, g12a_toacodec_dai_drv,
+			data->component_drv, g12a_toacodec_dai_drv,
 			ARRAY_SIZE(g12a_toacodec_dai_drv));
 }
 
-- 
2.25.1

