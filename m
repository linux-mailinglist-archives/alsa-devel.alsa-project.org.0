Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CB1814AC4
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 15:42:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CA1FE93;
	Fri, 15 Dec 2023 15:42:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CA1FE93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702651353;
	bh=4sMjpEWPnxTpFeZtEZi9FJ/TO2equr8HTkptmC/bILs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZdQVAEMF7zjrh/J0FOcQCXoaJgHeXrPWtsyXi0EiukUCCkAMijPY/yhm9ld+/F0yu
	 O9fV6TuPWkjSyXjvqGnVb6f6b8c8MDMWlfdgJ1oktoRSvluOBbLJpSDyhwbeRpLuPF
	 XL4L3kwy8lfo4tm0D8eHPMKPV5DVBIZnXPNZTVXw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B13A1F805B5; Fri, 15 Dec 2023 15:41:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08BD8F805B1;
	Fri, 15 Dec 2023 15:41:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A74CCF8016A; Fri, 15 Dec 2023 15:41:34 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EB598F80114
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 15:41:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB598F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=lfGSds8N
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 95DFF9C34B5;
	Fri, 15 Dec 2023 09:41:29 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 3UoH7cEvh9C5; Fri, 15 Dec 2023 09:41:29 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 3F66D9C40CA;
	Fri, 15 Dec 2023 09:41:29 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 3F66D9C40CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702651289; bh=u9QYi3UK49RvCOM0jwOPRvXLix0O7m+OZA9DnyWKw9g=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=lfGSds8NceELmpDGkIfOdxSVLeAzC359f9r5vPwrH1HB+0KrKb3XZtYSCK/o/s9TU
	 DGwWn6e25pLc4AtUFWIxYCdR54jC9Cnym3uxKsKcbT2Yxsg55tJTiDmHrxGmLU2Xz+
	 1YkAHZeDUGUh9wDcPIpv6uS3UE4lk0guYsfbA/HKMuO04Vt7EP4zgpOv5bgZMzl3Cc
	 v9GY8Ys9LIVMgCaEpflIg+OMt/q5zhSLG09w0X4+zeX0y4lBOHAZxlm7tICkUVfSwH
	 2TibZ1R1dUcq3no2XSrhFIPBqb9TIbG88BwPRuzpjctZsKWtJgsEb/YQ2MQ7186SFJ
	 1ta36btbnzVzg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id TPQJnDtSDriJ; Fri, 15 Dec 2023 09:41:29 -0500 (EST)
Received: from gerard.rennes.sfl (unknown [192.168.216.3])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 560AC9C34B5;
	Fri, 15 Dec 2023 09:41:28 -0500 (EST)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	broonie@kernel.org
Cc: elinor.montmasson@savoirfairelinux.com,
	alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com
Subject: [PATCHv3 01/10] ASoC: fsl-asoc-card: add support for dai links with
 multiple codecs
Date: Fri, 15 Dec 2023 15:39:56 +0100
Message-Id: <20231215144005.934728-2-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231215144005.934728-1-elinor.montmasson@savoirfairelinux.com>
References: <20231215144005.934728-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: WO26NILSRKR2M2BDRJ4HEENYUGP6THDZ
X-Message-ID-Hash: WO26NILSRKR2M2BDRJ4HEENYUGP6THDZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WO26NILSRKR2M2BDRJ4HEENYUGP6THDZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for dai links using multiple codecs for multi-codec
use cases.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index 7518ab9d768e..cde31fd38262 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -809,10 +809,10 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
=20
 	/* Normal DAI Link */
 	priv->dai_link[0].cpus->of_node =3D cpu_np;
-	priv->dai_link[0].codecs->dai_name =3D codec_dai_name;
+	priv->dai_link[0].codecs[0].dai_name =3D codec_dai_name;
=20
 	if (!fsl_asoc_card_is_ac97(priv))
-		priv->dai_link[0].codecs->of_node =3D codec_np;
+		priv->dai_link[0].codecs[0].of_node =3D codec_np;
 	else {
 		u32 idx;
=20
@@ -823,11 +823,11 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
 			goto asrc_fail;
 		}
=20
-		priv->dai_link[0].codecs->name =3D
+		priv->dai_link[0].codecs[0].name =3D
 				devm_kasprintf(&pdev->dev, GFP_KERNEL,
 					       "ac97-codec.%u",
 					       (unsigned int)idx);
-		if (!priv->dai_link[0].codecs->name) {
+		if (!priv->dai_link[0].codecs[0].name) {
 			ret =3D -ENOMEM;
 			goto asrc_fail;
 		}
@@ -838,13 +838,19 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
 	priv->card.num_links =3D 1;
=20
 	if (asrc_pdev) {
+		int i;
+		struct snd_soc_dai_link_component *codec;
+		struct snd_soc_dai_link *link;
+
 		/* DPCM DAI Links only if ASRC exists */
 		priv->dai_link[1].cpus->of_node =3D asrc_np;
 		priv->dai_link[1].platforms->of_node =3D asrc_np;
-		priv->dai_link[2].codecs->dai_name =3D codec_dai_name;
-		priv->dai_link[2].codecs->of_node =3D codec_np;
-		priv->dai_link[2].codecs->name =3D
-				priv->dai_link[0].codecs->name;
+		link =3D &(priv->dai_link[2]);
+		for_each_link_codecs(link, i, codec) {
+			codec->dai_name =3D priv->dai_link[0].codecs[i].dai_name;
+			codec->of_node =3D priv->dai_link[0].codecs[i].of_node;
+			codec->name =3D priv->dai_link[0].codecs[i].name;
+		}
 		priv->dai_link[2].cpus->of_node =3D cpu_np;
 		priv->dai_link[2].dai_fmt =3D priv->dai_fmt;
 		priv->card.num_links =3D 3;
--=20
2.25.1

