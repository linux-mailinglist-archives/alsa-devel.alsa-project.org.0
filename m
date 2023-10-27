Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5FD7E0644
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:20:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC91CA4A;
	Fri,  3 Nov 2023 17:19:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC91CA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028439;
	bh=nmZvfvCQmJIQuYBkRuW+ZIBoal81Kp5gh3EFWgVBhoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eEkV36Hkd6xnAnuoAoxDSpTlRYJZC5ooM77tyCy1o2g+ChrRm+KECiOTrYY6LqPwh
	 /1wCKvQ6AaIK+vX3Q4ptcqGARmghDs6j2NQWHwk73vbI9CbUJndSduQHKDB3w8g6HS
	 EiOrHtjknJT9JgiNKFrWN1XV86sxTv7Qw5PjxJOw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9631F805B6; Fri,  3 Nov 2023 17:18:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01CE8F805B0;
	Fri,  3 Nov 2023 17:18:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89022F8019B; Fri, 27 Oct 2023 16:51:17 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C851BF8010B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 16:51:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C851BF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=R+qOkPs7
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A1DAD9C3343;
	Fri, 27 Oct 2023 10:51:13 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id H06j7mID1RmI; Fri, 27 Oct 2023 10:51:13 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 08F2F9C335E;
	Fri, 27 Oct 2023 10:51:13 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 08F2F9C335E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1698418273; bh=OyCTsIq50BuUIz5Rk08kH3HreKtUkex4dOgSEou+5JE=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=R+qOkPs7XXFZaxDLbx7TxQO37BXqysJe5mNsAUy+5WeVFq3W3u/RHLXGSNep0P3Oj
	 o2zYiJmU8s9dAAZp4/3gK2hS/c+k/IP2rbtSgBKS96o+rzuIthxG0e0OsaINYolnPD
	 qRbo/TeislCb15/xdtihB+aI1PzwaSoFx5+tmpnJgnFsFAmPsMCRY4Kmr4ExEXCgRK
	 c++CRd7433laJDYPHALO4j4kiuLoAOrPSB06A1jXUlhqNnMo9B+ZxwJWgy0DhVsY39
	 rjjouYcEhRlpGFRzkYck2Ya6SiiPmVsYUP5USW3hUu1bV+DD1PY1MIhLRw+bl6rOIw
	 P1qU0stX55gUg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id yG-0o4FiOVON; Fri, 27 Oct 2023 10:51:12 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 1D8159C3343;
	Fri, 27 Oct 2023 10:51:12 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	broonie@kernel.org
Cc: elinor.montmasson@savoirfairelinux.com,
	alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com
Subject: [PATCHv2 04/10] ASoC: fsl-asoc-card: add new compatible for a generic
 codec use case
Date: Fri, 27 Oct 2023 16:47:29 +0200
Message-Id: <20231027144734.3654829-5-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231027144734.3654829-1-elinor.montmasson@savoirfairelinux.com>
References: <20231027144734.3654829-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MailFrom: elinor.montmasson@savoirfairelinux.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2Q5S64HAM3MI4KJHTZDYIU5V3MSCGKA2
X-Message-ID-Hash: 2Q5S64HAM3MI4KJHTZDYIU5V3MSCGKA2
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:18:04 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2Q5S64HAM3MI4KJHTZDYIU5V3MSCGKA2/>
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
index 55052da60ccc..64f6bcf04720 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -550,6 +550,7 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 	struct platform_device *cpu_pdev;
 	struct fsl_asoc_card_priv *priv;
 	struct device *codec_dev[2] =3D { NULL, NULL };
+	const char *generic_codec_dai_names[2];
 	const char *codec_dai_name;
 	const char *codec_dev_name[2];
 	u32 asrc_fmt =3D 0;
@@ -717,6 +718,11 @@ static int fsl_asoc_card_probe(struct platform_devic=
e *pdev)
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBM_CFM;
 		if (codec_dev[0])
 			priv->codec_priv.mclk =3D devm_clk_get(codec_dev[0], NULL);
+	} else if (of_device_is_compatible(np, "fsl,imx-audio-generic")) {
+		generic_codec_dai_names[0] =3D "dit-hifi";
+		generic_codec_dai_names[1] =3D "dir-hifi";
+		priv->dai_link[0].num_codecs =3D 2;
+		priv->dai_link[2].num_codecs =3D 2;
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
@@ -759,6 +765,12 @@ static int fsl_asoc_card_probe(struct platform_devic=
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
@@ -816,11 +828,21 @@ static int fsl_asoc_card_probe(struct platform_devi=
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
@@ -950,6 +972,7 @@ static const struct of_device_id fsl_asoc_card_dt_ids=
[] =3D {
 	{ .compatible =3D "fsl,imx-audio-si476x", },
 	{ .compatible =3D "fsl,imx-audio-wm8958", },
 	{ .compatible =3D "fsl,imx-audio-nau8822", },
+	{ .compatible =3D "fsl,imx-audio-generic", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asoc_card_dt_ids);
--=20
2.25.1
