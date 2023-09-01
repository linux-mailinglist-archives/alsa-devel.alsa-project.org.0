Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB0679176E
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:45:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F249FA4D;
	Mon,  4 Sep 2023 14:45:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F249FA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693831554;
	bh=cOSRTtxerFltyzX9sjv8zONfz8Eb13gOdN301tbZTlE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=REp6rJ6pNhcVfH+Juj7aRUO7f8OOxG2ovqGWOW10JQwnz1cgDOwycvBWvxYTrQs5T
	 ZyDOlvw0LDuO6jSndLKUpRxjroJ8Dk72BAl1YfS0k0TQckeyACmGAnVHsc1Hv0MabI
	 fjVWRQPzvIkDy6xnpCJrpA5TlXT+5E/+HFoYhziw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F6F9F8057B; Mon,  4 Sep 2023 14:44:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3967F80570;
	Mon,  4 Sep 2023 14:44:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EC92F80236; Fri,  1 Sep 2023 16:46:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2ED78F80074
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 16:46:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ED78F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=IaOxiW6R
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id C9BB39C1115;
	Fri,  1 Sep 2023 10:46:27 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id FeMSPVehX3d5; Fri,  1 Sep 2023 10:46:27 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E481A9C28B5;
	Fri,  1 Sep 2023 10:46:26 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com E481A9C28B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1693579586; bh=cqRocUh+hN2gzQVzyFD6F/wLcSVPZ0dNm/yHaFAK+WE=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=IaOxiW6RQNxNRbdyou/YC2FQ854ijS1Lj5VPX60JKMLlowsmCbd5DLWh3se/pys/Y
	 pX4TeHxT5Dtqke/lHfKLSGOjSe6XTvvbfK3uMXiD+BZeJUDlq4RsMV0/XQLQGyumKx
	 QCSYbS1e4kPAo4I8vt+GPg/jvLrM6Em8h/oSZIDx0JUIOHHbKfpZ+wtnWIR7h27QyX
	 SA3vY7BtI9Mx42A0mDmR4fZpfLbL9zLOJxgoH9UMdBq43t0GNYVYRsiSWEyy0hUqns
	 qGSx6xQT7soRBJmlaszepNGDceTftSRzXz3CE4FQLgAqvMtMcNET9RcTublhruyFob
	 uwyn4hq4hIgzQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id ZGQOzTyWeuK7; Fri,  1 Sep 2023 10:46:26 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 164389C1115;
	Fri,  1 Sep 2023 10:46:25 -0400 (EDT)
From: elinor.montmasson@savoirfairelinux.com
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com
Cc: alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: [PATCH 01/10] ASoC: fsl-asoc-card: add new compatible for dummy codec
Date: Fri,  1 Sep 2023 16:45:41 +0200
Message-Id: <20230901144550.520072-2-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230901144550.520072-1-elinor.montmasson@savoirfairelinux.com>
References: <20230901144550.520072-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MailFrom: elinor.montmasson@savoirfairelinux.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LN4FDCA7YQPBZVZWLNWXUVCZFKA3VE2C
X-Message-ID-Hash: LN4FDCA7YQPBZVZWLNWXUVCZFKA3VE2C
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:44:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LN4FDCA7YQPBZVZWLNWXUVCZFKA3VE2C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>

Add support for the new compatible fsl,imx-audio-dummy-codec.
It allows using the fsl-asoc-card driver with the dummy codec provided
by the kernel utilities instead of a real codec.
For now the compatible is recognised and the codec driver names are set,
but a sound card with this compatible will still be deferred during
initialisation.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index 76b5bfc288fd..c12a356a86d5 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -575,7 +575,11 @@ static int fsl_asoc_card_probe(struct platform_devic=
e *pdev)
 		goto fail;
 	}
=20
-	codec_np =3D of_parse_phandle(np, "audio-codec", 0);
+	if (of_device_is_compatible(np, "fsl,imx-audio-dummy-codec"))
+		codec_np =3D NULL;
+	else
+		codec_np =3D of_parse_phandle(np, "audio-codec", 0);
+
 	if (codec_np) {
 		struct platform_device *codec_pdev;
 		struct i2c_client *codec_i2c;
@@ -705,6 +709,8 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBM_CFM;
 		if (codec_dev)
 			priv->codec_priv.mclk =3D devm_clk_get(codec_dev, NULL);
+	} else if (of_device_is_compatible(np, "fsl,imx-audio-dummy-codec")) {
+		codec_dai_name =3D "snd-soc-dummy-dai";
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
@@ -806,7 +812,9 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 	priv->dai_link[0].cpus->of_node =3D cpu_np;
 	priv->dai_link[0].codecs->dai_name =3D codec_dai_name;
=20
-	if (!fsl_asoc_card_is_ac97(priv))
+	if (of_device_is_compatible(np, "fsl,imx-audio-dummy-codec"))
+		priv->dai_link[0].codecs->name =3D "snd-soc-dummy";
+	else if (!fsl_asoc_card_is_ac97(priv))
 		priv->dai_link[0].codecs->of_node =3D codec_np;
 	else {
 		u32 idx;
@@ -931,6 +939,7 @@ static const struct of_device_id fsl_asoc_card_dt_ids=
[] =3D {
 	{ .compatible =3D "fsl,imx-audio-si476x", },
 	{ .compatible =3D "fsl,imx-audio-wm8958", },
 	{ .compatible =3D "fsl,imx-audio-nau8822", },
+	{ .compatible =3D "fsl,imx-audio-dummy-codec", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asoc_card_dt_ids);
--=20
2.25.1

