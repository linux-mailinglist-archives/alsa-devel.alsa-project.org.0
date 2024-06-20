Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B469105ED
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 15:29:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C889E9D;
	Thu, 20 Jun 2024 15:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C889E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718890157;
	bh=sX28xTwOAatiisu/nN0/fHOOZ6IWTNEAD0XN+AruuHo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oM0/ARTdtlgj7PoOHujDu7TKMXTmq1MHvfXJRtGthAd8rE7e4gYI0LdKMJdYQIooO
	 j9YESa80P2mhqYiA9o7PI0n6CdSNlMmEU9AkDD0IqIsj0mxJB+CXC7nsjKwMSRQiHi
	 0ylUGTMI/tyiK64GgWAsiqWgYdIzj/keNJVampG4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85C0CF805E4; Thu, 20 Jun 2024 15:28:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B963F805EB;
	Thu, 20 Jun 2024 15:28:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 050A4F8023A; Thu, 20 Jun 2024 15:28:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B3C5F8023A
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 15:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B3C5F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=EzhMXNbn
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 059AB9C58D7;
	Thu, 20 Jun 2024 09:26:38 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id uebtueqERcrT; Thu, 20 Jun 2024 09:26:35 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id D2B949C5A85;
	Thu, 20 Jun 2024 09:26:35 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com D2B949C5A85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1718889995; bh=9ZWMJVSh1jbl1q70f6h72zUToNmBAyVbiYaTONnvxvA=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=EzhMXNbn1UAhS6LClLQ/twVE/aqMoy/hB4cxNwSUMemClunhyABugsSDpjTsXbaae
	 /AEEIqzOdFwrkyp9quaor4kL4sg6uKFZB/VTe1aUjm13/aAnyuJutt1KxZklPogvl2
	 szyusM2PPnYWb+GVt/sfuiWuX/+e9OFUVFz4YHXtkUCRe1ZJlI9Mdk5rHKQ4pX0x2o
	 Qiqh0TIoxTCXBqjc+OOcHQOSe3oKJCJ+lm2JMYGYubsJESkRYRDVKAtn+KU/evKe74
	 hDaYbXMCEaXEmB3gKvIUaVXhjx4ktndYP2g6rCc4x8kvSF9ncvVNhEFoHWD1Efbwep
	 UMMYNxLnuoRug==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 7z2yIb_uYYtw; Thu, 20 Jun 2024 09:26:35 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 058CE9C5BCC;
	Thu, 20 Jun 2024 09:26:32 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>
Subject: [PATCHv5 5/9] ASoC: fsl-asoc-card: merge spdif support from
 imx-spdif.c
Date: Thu, 20 Jun 2024 15:25:07 +0200
Message-Id: <20240620132511.4291-6-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
References: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: OTLPCGP5W7M3QNHRX3YD6JZ5WAIE3RB4
X-Message-ID-Hash: OTLPCGP5W7M3QNHRX3YD6JZ5WAIE3RB4
X-MailFrom: elinor.montmasson@savoirfairelinux.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OTLPCGP5W7M3QNHRX3YD6JZ5WAIE3RB4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The imx-spdif machine driver creates audio card to directly use an
S/PDIF device. However, it doesn't support interacting with an ASRC.
fsl-asoc-card already has the support to create audio card which can
use the ASRC.

Merge the S/PDIF support from imx-spdif into fsl-asoc-card to extend
the support of S/PDIF audio card with the use of ASRC devices.
It also substitutes the use of the dummy codec in imx-spdif with the
existing spdif_transmitter and spdif_receiver codec drivers.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
---
 arch/arm/configs/imx_v6_v7_defconfig |   1 -
 arch/arm64/configs/defconfig         |   1 -
 sound/soc/fsl/Kconfig                |  10 +--
 sound/soc/fsl/Makefile               |   2 -
 sound/soc/fsl/fsl-asoc-card.c        |  58 +++++++++++++++
 sound/soc/fsl/imx-spdif.c            | 103 ---------------------------
 6 files changed, 59 insertions(+), 116 deletions(-)
 delete mode 100644 sound/soc/fsl/imx-spdif.c

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6=
_v7_defconfig
index cf2480dce285..ac5ae621b2af 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -311,7 +311,6 @@ CONFIG_SND_IMX_SOC=3Dy
 CONFIG_SND_SOC_EUKREA_TLV320=3Dy
 CONFIG_SND_SOC_IMX_ES8328=3Dy
 CONFIG_SND_SOC_IMX_SGTL5000=3Dy
-CONFIG_SND_SOC_IMX_SPDIF=3Dy
 CONFIG_SND_SOC_FSL_ASOC_CARD=3Dy
 CONFIG_SND_SOC_AC97_CODEC=3Dy
 CONFIG_SND_SOC_CS42XX8_I2C=3Dy
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 57a9abe78ee4..a6c9688fee0e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -940,7 +940,6 @@ CONFIG_SND_SOC_FSL_MICFIL=3Dm
 CONFIG_SND_SOC_FSL_EASRC=3Dm
 CONFIG_SND_IMX_SOC=3Dm
 CONFIG_SND_SOC_IMX_SGTL5000=3Dm
-CONFIG_SND_SOC_IMX_SPDIF=3Dm
 CONFIG_SND_SOC_FSL_ASOC_CARD=3Dm
 CONFIG_SND_SOC_IMX_AUDMIX=3Dm
 CONFIG_SND_SOC_MT8183=3Dm
diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 9a371d4496c2..e3b2bfb016c8 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -296,15 +296,6 @@ config SND_SOC_IMX_SGTL5000
 	  SND_SOC_FSL_ASOC_CARD and SND_SOC_SGTL5000 to use the newer
 	  driver.
=20
-config SND_SOC_IMX_SPDIF
-	tristate "SoC Audio support for i.MX boards with S/PDIF"
-	select SND_SOC_IMX_PCM_DMA
-	select SND_SOC_FSL_SPDIF
-	help
-	  SoC Audio support for i.MX boards with S/PDIF
-	  Say Y if you want to add support for SoC audio on an i.MX board with
-	  a S/DPDIF.
-
 config SND_SOC_FSL_ASOC_CARD
 	tristate "Generic ASoC Sound Card with ASRC support"
 	depends on OF && I2C
@@ -316,6 +307,7 @@ config SND_SOC_FSL_ASOC_CARD
 	select SND_SOC_FSL_ESAI
 	select SND_SOC_FSL_SAI
 	select SND_SOC_FSL_SSI
+	select SND_SOC_FSL_SPDIF
 	select SND_SOC_TLV320AIC31XX
 	select SND_SOC_WM8994
 	select MFD_WM8994
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index 2fe78eed3a48..1ae181b24a88 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -65,7 +65,6 @@ obj-$(CONFIG_SND_SOC_IMX_PCM_RPMSG) +=3D imx-pcm-rpmsg.o
 snd-soc-eukrea-tlv320-y :=3D eukrea-tlv320.o
 snd-soc-imx-es8328-y :=3D imx-es8328.o
 snd-soc-imx-sgtl5000-y :=3D imx-sgtl5000.o
-snd-soc-imx-spdif-y :=3D imx-spdif.o
 snd-soc-imx-audmix-y :=3D imx-audmix.o
 snd-soc-imx-hdmi-y :=3D imx-hdmi.o
 snd-soc-imx-rpmsg-y :=3D imx-rpmsg.o
@@ -74,7 +73,6 @@ snd-soc-imx-card-y :=3D imx-card.o
 obj-$(CONFIG_SND_SOC_EUKREA_TLV320) +=3D snd-soc-eukrea-tlv320.o
 obj-$(CONFIG_SND_SOC_IMX_ES8328) +=3D snd-soc-imx-es8328.o
 obj-$(CONFIG_SND_SOC_IMX_SGTL5000) +=3D snd-soc-imx-sgtl5000.o
-obj-$(CONFIG_SND_SOC_IMX_SPDIF) +=3D snd-soc-imx-spdif.o
 obj-$(CONFIG_SND_SOC_IMX_AUDMIX) +=3D snd-soc-imx-audmix.o
 obj-$(CONFIG_SND_SOC_IMX_HDMI) +=3D snd-soc-imx-hdmi.o
 obj-$(CONFIG_SND_SOC_IMX_RPMSG) +=3D snd-soc-imx-rpmsg.o
diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 87329731e02d..c0e600525680 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -477,6 +477,59 @@ static int fsl_asoc_card_audmux_init(struct device_nod=
e *np,
 	return 0;
 }
=20
+static int fsl_asoc_card_spdif_init(struct device_node *codec_np[],
+				    struct device_node *cpu_np,
+				    const char *codec_dai_name[],
+				    struct fsl_asoc_card_priv *priv)
+{
+	struct device *dev =3D &priv->pdev->dev;
+
+	if (!of_node_name_eq(cpu_np, "spdif")) {
+		dev_err(dev, "CPU phandle invalid, should be an SPDIF device\n");
+		return -EINVAL;
+	}
+
+	priv->dai_link[0].playback_only =3D true;
+	priv->dai_link[0].capture_only =3D true;
+
+	for (int i =3D 0; i < 2; i++) {
+		if (!codec_np[i])
+			break;
+
+		if (of_device_is_compatible(codec_np[i], "linux,spdif-dit")) {
+			priv->dai_link[0].capture_only =3D false;
+			codec_dai_name[i] =3D "dit-hifi";
+		} else if (of_device_is_compatible(codec_np[i], "linux,spdif-dir")) {
+			priv->dai_link[0].playback_only =3D false;
+			codec_dai_name[i] =3D "dir-hifi";
+		}
+	}
+
+	if (priv->dai_link[0].playback_only && priv->dai_link[0].capture_only) {
+		dev_err(dev, "no enabled S/PDIF DAI link\n");
+		return -EINVAL;
+	}
+
+	if (priv->dai_link[0].playback_only) {
+		priv->dai_link[1].dpcm_capture =3D false;
+		priv->dai_link[2].dpcm_capture =3D false;
+		priv->card.dapm_routes =3D audio_map_tx;
+		priv->card.num_dapm_routes =3D ARRAY_SIZE(audio_map_tx);
+	} else if (priv->dai_link[0].capture_only) {
+		priv->dai_link[1].dpcm_playback =3D false;
+		priv->dai_link[2].dpcm_playback =3D false;
+		priv->card.dapm_routes =3D audio_map_rx;
+		priv->card.num_dapm_routes =3D ARRAY_SIZE(audio_map_rx);
+	}
+
+	if (codec_np[0] && codec_np[1]) {
+		priv->dai_link[0].num_codecs =3D 2;
+		priv->dai_link[2].num_codecs =3D 2;
+	}
+
+	return 0;
+}
+
 static int hp_jack_event(struct notifier_block *nb, unsigned long event,
 			 void *data)
 {
@@ -748,6 +801,10 @@ static int fsl_asoc_card_probe(struct platform_device =
*pdev)
 		priv->codec_priv[0].fll_id =3D WM8904_CLK_FLL;
 		priv->codec_priv[0].pll_id =3D WM8904_FLL_MCLK;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
+	} else if (of_device_is_compatible(np, "fsl,imx-audio-spdif")) {
+		ret =3D fsl_asoc_card_spdif_init(codec_np, cpu_np, codec_dai_name, priv);
+		if (ret)
+			goto asrc_fail;
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
@@ -992,6 +1049,7 @@ static const struct of_device_id fsl_asoc_card_dt_ids[=
] =3D {
 	{ .compatible =3D "fsl,imx-audio-wm8958", },
 	{ .compatible =3D "fsl,imx-audio-nau8822", },
 	{ .compatible =3D "fsl,imx-audio-wm8904", },
+	{ .compatible =3D "fsl,imx-audio-spdif", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asoc_card_dt_ids);
diff --git a/sound/soc/fsl/imx-spdif.c b/sound/soc/fsl/imx-spdif.c
deleted file mode 100644
index 1e57939a7e29..000000000000
--- a/sound/soc/fsl/imx-spdif.c
+++ /dev/null
@@ -1,103 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-//
-// Copyright (C) 2013 Freescale Semiconductor, Inc.
-
-#include <linux/module.h>
-#include <linux/of_platform.h>
-#include <sound/soc.h>
-
-struct imx_spdif_data {
-	struct snd_soc_dai_link dai;
-	struct snd_soc_card card;
-};
-
-static int imx_spdif_audio_probe(struct platform_device *pdev)
-{
-	struct device_node *spdif_np, *np =3D pdev->dev.of_node;
-	struct imx_spdif_data *data;
-	struct snd_soc_dai_link_component *comp;
-	int ret =3D 0;
-
-	spdif_np =3D of_parse_phandle(np, "spdif-controller", 0);
-	if (!spdif_np) {
-		dev_err(&pdev->dev, "failed to find spdif-controller\n");
-		ret =3D -EINVAL;
-		goto end;
-	}
-
-	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	comp =3D devm_kzalloc(&pdev->dev, sizeof(*comp), GFP_KERNEL);
-	if (!data || !comp) {
-		ret =3D -ENOMEM;
-		goto end;
-	}
-
-	/*
-	 * CPU =3D=3D Platform
-	 * platform is using soc-generic-dmaengine-pcm
-	 */
-	data->dai.cpus		=3D
-	data->dai.platforms	=3D comp;
-	data->dai.codecs	=3D &snd_soc_dummy_dlc;
-
-	data->dai.num_cpus	=3D 1;
-	data->dai.num_codecs	=3D 1;
-	data->dai.num_platforms	=3D 1;
-
-	data->dai.name =3D "S/PDIF PCM";
-	data->dai.stream_name =3D "S/PDIF PCM";
-	data->dai.cpus->of_node =3D spdif_np;
-	data->dai.playback_only =3D true;
-	data->dai.capture_only =3D true;
-
-	if (of_property_read_bool(np, "spdif-out"))
-		data->dai.capture_only =3D false;
-
-	if (of_property_read_bool(np, "spdif-in"))
-		data->dai.playback_only =3D false;
-
-	if (data->dai.playback_only && data->dai.capture_only) {
-		dev_err(&pdev->dev, "no enabled S/PDIF DAI link\n");
-		goto end;
-	}
-
-	data->card.dev =3D &pdev->dev;
-	data->card.dai_link =3D &data->dai;
-	data->card.num_links =3D 1;
-	data->card.owner =3D THIS_MODULE;
-
-	ret =3D snd_soc_of_parse_card_name(&data->card, "model");
-	if (ret)
-		goto end;
-
-	ret =3D devm_snd_soc_register_card(&pdev->dev, &data->card);
-	if (ret)
-		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
-
-end:
-	of_node_put(spdif_np);
-
-	return ret;
-}
-
-static const struct of_device_id imx_spdif_dt_ids[] =3D {
-	{ .compatible =3D "fsl,imx-audio-spdif", },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, imx_spdif_dt_ids);
-
-static struct platform_driver imx_spdif_driver =3D {
-	.driver =3D {
-		.name =3D "imx-spdif",
-		.pm =3D &snd_soc_pm_ops,
-		.of_match_table =3D imx_spdif_dt_ids,
-	},
-	.probe =3D imx_spdif_audio_probe,
-};
-
-module_platform_driver(imx_spdif_driver);
-
-MODULE_AUTHOR("Freescale Semiconductor, Inc.");
-MODULE_DESCRIPTION("Freescale i.MX S/PDIF machine driver");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:imx-spdif");
--=20
2.34.1

