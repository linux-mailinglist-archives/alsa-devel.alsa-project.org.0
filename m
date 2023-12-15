Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DCC814AD0
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 15:43:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBA23E0F;
	Fri, 15 Dec 2023 15:43:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBA23E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702651396;
	bh=A8MfXhmO0cUZAjyAbKT8qOjXN4eGyDGnvWLqKievLDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gtvXhVoh3Yo/KdbEIzUBHG6ghToLfgSUTMxptWNjLpBhLg+a823qW3uojKxc2oTrk
	 mVwKGmpGazxi4HyXMU89clSzuA8UurkjE+nnRC5u0neA/Li6XdMRWLGYTOFIVFkiN+
	 wP8Cbo7t7G/6MOq0bK6F/e5cF6P/zdRKCTYXhUEo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5CF6F80640; Fri, 15 Dec 2023 15:42:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39EA2F8062F;
	Fri, 15 Dec 2023 15:42:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6229F80166; Fri, 15 Dec 2023 15:41:59 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F1FDF805C7
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 15:41:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F1FDF805C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=fvoXpfG8
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 39D0E9C284E;
	Fri, 15 Dec 2023 09:41:55 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 4iRhmJzQO8LN; Fri, 15 Dec 2023 09:41:54 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id C79929C40E8;
	Fri, 15 Dec 2023 09:41:54 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com C79929C40E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702651314; bh=UiaPRtB78O/TxKdZ0KogRi45bm5TmsI0TncGDAFUtsc=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=fvoXpfG8NMlTtDJ1lAMXRXEuoX/HRUnFqRxRmn9NDqKM4yP47XebKslkVHqOer6eO
	 cWBlPQMTNih/zHH6UlH/8kDquXFBKBMs5xa/yWq41SIJCtvEoIWtWLDjz15YnrZk6B
	 btjPI/1xBQPF7WjOsFqST563H2czdjURVs0iJDSbPfUTjVw5/pMr/5zdL0qMSdfMS5
	 DCBUWyRHOOwTM6DAGE9uICeYSuUsgF2VsobEUjS34q/t02y5VGvI+ZU8N2Ibi7qnxr
	 ZjNK6nh1JnO7Gi7/pLeMHUSO9qojK0koqNzI6CLDkGB3nlcPK80iF2sB9OrgmvGKvV
	 hHZr4uBbdTBMw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id ZSzFvIElhNmm; Fri, 15 Dec 2023 09:41:54 -0500 (EST)
Received: from gerard.rennes.sfl (unknown [192.168.216.3])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id DA0E59C284E;
	Fri, 15 Dec 2023 09:41:53 -0500 (EST)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	broonie@kernel.org
Cc: elinor.montmasson@savoirfairelinux.com,
	alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com
Subject: [PATCHv3 04/10] ASoC: fsl-asoc-card: add new compatible for a generic
 codec use case
Date: Fri, 15 Dec 2023 15:39:59 +0100
Message-Id: <20231215144005.934728-5-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231215144005.934728-1-elinor.montmasson@savoirfairelinux.com>
References: <20231215144005.934728-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5TVFCRSHOZQ4W45D63C2ZDBJDRSAFHNJ
X-Message-ID-Hash: 5TVFCRSHOZQ4W45D63C2ZDBJDRSAFHNJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5TVFCRSHOZQ4W45D63C2ZDBJDRSAFHNJ/>
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

