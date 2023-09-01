Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE8C791785
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:46:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89ACBDF0;
	Mon,  4 Sep 2023 14:45:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89ACBDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693831604;
	bh=wx5/L+oVOfEM6+bniNs5p/C2P/XtjHBfOMhCUPIBv4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ovu3otTraPeQE3cqOx8gvumYLnvCxE4wFOUC5vF0ZEuyJWEI2crs3PUUFRQGKJkp5
	 pzt0iLvSgPg80Fmg6p7PhQIHOHIjv3qbUeoFJFGoavzBbhwSc8JbumX7IUt6FJUF7D
	 Au+91qRxe1bJ5Uj4/HNwsPTiljJK1mmIGKykQVWo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EC9EF805B1; Mon,  4 Sep 2023 14:44:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82CABF805B1;
	Mon,  4 Sep 2023 14:44:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65AF3F804F3; Fri,  1 Sep 2023 16:46:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A378F80074
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 16:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A378F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=bBRqCa+a
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id D8B8C9C1115;
	Fri,  1 Sep 2023 10:46:39 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id yvCsJ29sc4RE; Fri,  1 Sep 2023 10:46:39 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2EAC09C2A3B;
	Fri,  1 Sep 2023 10:46:39 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 2EAC09C2A3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1693579599; bh=2mqPnS4zOMOWA1vGoev9cJYScs80xweEhFQwU5Mo+ts=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=bBRqCa+au22aCbiN5fSPvGS2vCuLGt9XpiS9CZQh15Wc8IyiNImhNTJ6MCssbH1h7
	 3fBfpYU/MTb1FphwbiILDK9sTEP4LbwFp8UPAG+Swz9YhQJ7f/UnOnzYVYyjBP8C5Q
	 6233gGr8x3FOrw2Dx2tDig2GppGCAXyBrRKg4/JbqUldH2ftnhYR4zUjDTg/NYTJts
	 Z/HKkvgtB7JhRjZ700iGdSLXArxlh/RichDNVVIaenjCIngXOuvo3gnQNJxS36K+wn
	 b+89b7AzM+b50YkvrXhaWTl7MuBl1Zemalf1k5uUsDdbU0o4qgNKTeNwxouL8z+ooK
	 d+LDaW7VQ+0Zw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id rGvHNaPLQp5X; Fri,  1 Sep 2023 10:46:39 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 3C58F9C1115;
	Fri,  1 Sep 2023 10:46:38 -0400 (EDT)
From: elinor.montmasson@savoirfairelinux.com
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com
Cc: alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: [PATCH 04/10] ASoC: fsl-asoc-card: unset DAPM routes with dummy codec
Date: Fri,  1 Sep 2023 16:45:44 +0200
Message-Id: <20230901144550.520072-5-elinor.montmasson@savoirfairelinux.com>
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
Message-ID-Hash: YNYNVCIX5JSFINAI55R3E46QFBBUNIML
X-Message-ID-Hash: YNYNVCIX5JSFINAI55R3E46QFBBUNIML
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:44:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YNYNVCIX5JSFINAI55R3E46QFBBUNIML/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>

Unset DAPM routes when using the dummy codec.
The dummy codec doesn't provide DAPM widgets per design, as it doesn't
represent any real hardware. Thus the default DAPM audio routes do not
work because there is no Playback or Capture DAPM widget.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index d210147aebfe..5ef26ae512de 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -712,6 +712,8 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-dummy-codec")) {
 		codec_dai_name =3D "snd-soc-dummy-dai";
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBC_CFC;
+		priv->card.dapm_routes =3D NULL;
+		priv->card.num_dapm_routes =3D 0;
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
--=20
2.25.1

