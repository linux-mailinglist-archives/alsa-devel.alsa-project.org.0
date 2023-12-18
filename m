Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBBC816E2D
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 13:44:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78871E73;
	Mon, 18 Dec 2023 13:44:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78871E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702903475;
	bh=A8MfXhmO0cUZAjyAbKT8qOjXN4eGyDGnvWLqKievLDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UL1hUTKHHFHToGGTOF6dYnPb6PVCifu+De0NSJscTz+LRx197WN0H/x5aCcYouEUZ
	 HV32JNNpcwaovRKG93I2SsyjyZ6mxkneGQrOn0/j62VihwNmhVvhCVup5ojnHLtYLR
	 vHIik+2Qz76t/GEXLOEBGG4dixSpfKA9VjTWSruQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52724F8062D; Mon, 18 Dec 2023 13:43:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19D82F80635;
	Mon, 18 Dec 2023 13:43:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F11C3F8055C; Mon, 18 Dec 2023 13:43:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CDD2F805E4
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 13:42:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CDD2F805E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=METad6L9
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 6E4BA9C3FCC;
	Mon, 18 Dec 2023 07:42:57 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id h0mG4bj41yIX; Mon, 18 Dec 2023 07:42:57 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E89589C411B;
	Mon, 18 Dec 2023 07:42:56 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com E89589C411B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702903376; bh=UiaPRtB78O/TxKdZ0KogRi45bm5TmsI0TncGDAFUtsc=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=METad6L94kc7G4Eakrs0kqCcancv7EvJVq+4UDcclNXM4EE0TtSg5Kpw/ztDRqj5t
	 y/u5VCZHj5FOWfHHTXXGGA5RA9toRPr+ZdwG7BETSsojT5KWdEOn88rQRqpA+qtNax
	 1RBSp9VjjAS7V/bnPzNYqjD9juaLCg3Jo/XvEOrtbnBj5DRUjzD5sjM4Xq1TpclDsF
	 HGwJsT5YpXTK5qtKvlMNoaBG+yL2GT5CPyUe1J/aueeNAfZJ3ItPuRi5Onowy2AmZx
	 AvTiLvRD5C7dl+6W8tDw5eCBSbYx20WED0In+QDnCLw7NTgouY/F1T/uTE8xAU37pP
	 G5h2To+2yu3gw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id XTv8GG-jZ0WP; Mon, 18 Dec 2023 07:42:56 -0500 (EST)
Received: from gerard.rennes.sfl (unknown [192.168.216.3])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id E2AC99C3FCC;
	Mon, 18 Dec 2023 07:42:54 -0500 (EST)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>
Subject: [PATCHv3 RESEND 04/10] ASoC: fsl-asoc-card: add new compatible for a
 generic codec use case
Date: Mon, 18 Dec 2023 13:40:52 +0100
Message-Id: <20231218124058.2047167-5-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
References: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: JUEN75XVPIBTNEYREY4FMJXBFJEBKFOQ
X-Message-ID-Hash: JUEN75XVPIBTNEYREY4FMJXBFJEBKFOQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JUEN75XVPIBTNEYREY4FMJXBFJEBKFOQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the new compatible "fsl,imx-audio-generic" for a generic codec
use case. It allows using the fsl-asoc-card driver with the
spdif_receiver and spdif_transmitter codec drivers used as dummy codecs.
It can be used for cases where there is no real codec or codecs which do
not require declaring controls.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index 5dd5493cb931..71048c1250ec 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -567,6 +567,7 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 	struct platform_device *cpu_pdev;
 	struct fsl_asoc_card_priv *priv;
 	struct device *codec_dev[2] =3D { NULL, NULL };
+	const char *generic_codec_dai_names[2];
 	const char *codec_dai_name;
 	const char *codec_dev_name[2];
 	u32 asrc_fmt =3D 0;
@@ -738,6 +739,11 @@ static int fsl_asoc_card_probe(struct platform_devic=
e *pdev)
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBM_CFM;
 		if (codec_dev[0])
 			priv->codec_priv[0].mclk =3D devm_clk_get(codec_dev[0], NULL);
+	} else if (of_device_is_compatible(np, "fsl,imx-audio-generic")) {
+		generic_codec_dai_names[0] =3D "dit-hifi";
+		generic_codec_dai_names[1] =3D "dir-hifi";
+		priv->dai_link[0].num_codecs =3D 2;
+		priv->dai_link[2].num_codecs =3D 2;
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
@@ -792,6 +798,12 @@ static int fsl_asoc_card_probe(struct platform_devic=
e *pdev)
 		ret =3D -EPROBE_DEFER;
 		goto asrc_fail;
 	}
+	if (of_device_is_compatible(np, "fsl,imx-audio-generic")
+	  && !codec_dev[1]) {
+		dev_dbg(&pdev->dev, "failed to find second codec device\n");
+		ret =3D -EPROBE_DEFER;
+		goto asrc_fail;
+	}
=20
 	/* Common settings for corresponding Freescale CPU DAI driver */
 	if (of_node_name_eq(cpu_np, "ssi")) {
@@ -849,11 +861,21 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
=20
 	/* Normal DAI Link */
 	priv->dai_link[0].cpus->of_node =3D cpu_np;
-	priv->dai_link[0].codecs[0].dai_name =3D codec_dai_name;
=20
-	if (!fsl_asoc_card_is_ac97(priv))
+	if (of_device_is_compatible(np, "fsl,imx-audio-generic")) {
+		priv->dai_link[0].codecs[0].dai_name =3D
+			generic_codec_dai_names[0];
+		priv->dai_link[0].codecs[1].dai_name =3D
+			generic_codec_dai_names[1];
+	} else {
+		priv->dai_link[0].codecs[0].dai_name =3D codec_dai_name;
+	}
+
+	if (!fsl_asoc_card_is_ac97(priv)) {
 		priv->dai_link[0].codecs[0].of_node =3D codec_np[0];
-	else {
+		if (of_device_is_compatible(np, "fsl,imx-audio-generic"))
+			priv->dai_link[0].codecs[1].of_node =3D codec_np[1];
+	} else {
 		u32 idx;
=20
 		ret =3D of_property_read_u32(cpu_np, "cell-index", &idx);
@@ -983,6 +1005,7 @@ static const struct of_device_id fsl_asoc_card_dt_id=
s[] =3D {
 	{ .compatible =3D "fsl,imx-audio-si476x", },
 	{ .compatible =3D "fsl,imx-audio-wm8958", },
 	{ .compatible =3D "fsl,imx-audio-nau8822", },
+	{ .compatible =3D "fsl,imx-audio-generic", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asoc_card_dt_ids);
--=20
2.25.1

