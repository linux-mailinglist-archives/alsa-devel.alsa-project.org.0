Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 955407E0649
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:21:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1617E76;
	Fri,  3 Nov 2023 17:20:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1617E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028498;
	bh=UP/9drExS8fAuscAxAl5GRZmI4xCn7Vu0PFERBpp+W0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vjgSKIdJC6toDy8o3Sy7WJ60nA5d21vfJAQCLq81AJhkbd6pA/IoACdn7XIbowTGg
	 ezZ0+fOLsEsRvki2Ye3sqR2EB4SfWFgexQZYKEbN9pHBZCZ+RQHocZqFnMaOQAQe4i
	 tESRXOiRwbPTDZkrdPYTywARhdhjtWy1OxG1hKK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3250F805D5; Fri,  3 Nov 2023 17:18:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DEF0F805E2;
	Fri,  3 Nov 2023 17:18:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06775F8019B; Fri, 27 Oct 2023 16:51:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E95F0F8012B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 16:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E95F0F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=ZH+4NGBa
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id C01139C3360;
	Fri, 27 Oct 2023 10:51:37 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id WQmEYoUuGfVf; Fri, 27 Oct 2023 10:51:37 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 54CF39C336D;
	Fri, 27 Oct 2023 10:51:37 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 54CF39C336D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1698418297; bh=nl0YulySiATwjTvA0VLz2JxXUBsEu6JEtg/wdtc6mow=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ZH+4NGBa9tctVP8j27i1NLviEVpSUs5Jz9eggW1g4r/MAkCfvmIQ+l/N5z+vt1x1Q
	 R/IMVD7+KTQP4oBptwUyIQOM96tHgUuH69xBbiQgmPJ6i6l/vNQ3YLexD+To2aK9sY
	 W4cPQSwWmqShohD8bQEppufFH0d20ryzNHk1dt2fPy9jSb0rLa/r3v10dqUhzCpW1p
	 4kygC6bX99dosNFgz4yAlp8Nq1gf1vmOqZ3JDpfsqpfUv/TXUo/303F8y+BmkpSioR
	 UKyX7RD2m5MwG+2tAmilWI/4y0mVk2seEeDFT2GoJkvHOVKdYpCUwDY68J92mJ/7rc
	 P9UZvmlC70XDw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Rb96CskQxhYI; Fri, 27 Oct 2023 10:51:37 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 6B65F9C3360;
	Fri, 27 Oct 2023 10:51:36 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	broonie@kernel.org
Cc: elinor.montmasson@savoirfairelinux.com,
	alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com
Subject: [PATCHv2 08/10] ASoC: fsl-asoc-card: add dts properties
 "cpu-sysclk-freq"
Date: Fri, 27 Oct 2023 16:47:33 +0200
Message-Id: <20231027144734.3654829-9-elinor.montmasson@savoirfairelinux.com>
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
Message-ID-Hash: 65A2OV6P5YDYWCO5ZF65AMLGHYYPMARQ
X-Message-ID-Hash: 65A2OV6P5YDYWCO5ZF65AMLGHYYPMARQ
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:18:05 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/65A2OV6P5YDYWCO5ZF65AMLGHYYPMARQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add new optional dts property "cpu-sysclk-freq" to set
custom sysclk frequencies for the CPU DAI with the generic codec.
The way values are used is up to the CPU DAI driver implementation.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index 110ac20ba699..902715d63add 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -726,6 +726,10 @@ static int fsl_asoc_card_probe(struct platform_devic=
e *pdev)
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
 		of_property_read_u32(np, "cpu-slot-width", &priv->cpu_priv.slot_width)=
;
 		of_property_read_u32(np, "cpu-slot-num", &priv->cpu_priv.slot_num);
+		of_property_read_u32(np, "cpu-sysclk-freq-rx",
+					(u32 *)&priv->cpu_priv.sysclk_freq[RX]);
+		of_property_read_u32(np, "cpu-sysclk-freq-tx",
+					(u32 *)&priv->cpu_priv.sysclk_freq[TX]);
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
--=20
2.25.1
