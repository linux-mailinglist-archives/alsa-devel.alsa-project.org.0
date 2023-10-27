Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3457E0647
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:21:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E26684B;
	Fri,  3 Nov 2023 17:20:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E26684B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028487;
	bh=XsboT4HNcQ3ZzHcrswYQ2ksVaBO8+ngBzvAUjrEK0/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MBfhbO33zBOjl/psGIF75yPWGvAGLjYC1FQ2Rm+AN8y+3B0ue23Noywr3zdAwLR8+
	 4nyjPpetydygIN5ZD492tFLW2UPWaiiy9/R3wOxAFipTfsukNERJw4vyekEQLqaA6+
	 Jrh3S03+XknKmTzD6DrhL4IWPaW6+IpbzGUECDK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1305F805DF; Fri,  3 Nov 2023 17:18:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1482CF805D5;
	Fri,  3 Nov 2023 17:18:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D087F8024E; Fri, 27 Oct 2023 16:51:32 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A4C3F8010B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 16:51:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A4C3F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=RhjzaTw1
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 289FE9C2CEB;
	Fri, 27 Oct 2023 10:51:29 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id FrhUlf_yiKeA; Fri, 27 Oct 2023 10:51:28 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id AE7089C32B7;
	Fri, 27 Oct 2023 10:51:28 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com AE7089C32B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1698418288; bh=bKh+j9cXLMKw0jNzwJmWNtMG76B/OuOpmMi6Ul19JWE=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=RhjzaTw17auuih2a2DVycN1PdeDxsi+bbQVwPP7dUbXRbIfJ+rA/3qp6T9yhm8DUS
	 VU7FLMQxw45YKKks9nvb70jHw/bOrUFsS7FjCFh0bQ2Jv2KP6bw07KMdVMKFZR3BGG
	 w0CSGck8I098qzyTxs8BI7Rr2/3YGa3WvETJnb/tp4u25wiNuiGKgOe+4624QGj9DN
	 ZIBCACthQjZx6pZ04pYUovL+4EW6CMp5JwP5Yr/RJzGYC7zpp3gEdvjkajCwv+TVmY
	 M13hDP+r2ymB3qyBaWjHstf7bZy61q3xYkmm2wgXoIBKaxPrp/iKwiSLCc/LRgQmGP
	 1lZRv9QpQ7hvA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id j6QvIyBx4ULb; Fri, 27 Oct 2023 10:51:28 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id C575C9C2CEB;
	Fri, 27 Oct 2023 10:51:27 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	broonie@kernel.org
Cc: elinor.montmasson@savoirfairelinux.com,
	alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com
Subject: [PATCHv2 07/10] ASoC: fsl-asoc-card: add dts property "cpu-slot-num"
Date: Fri, 27 Oct 2023 16:47:32 +0200
Message-Id: <20231027144734.3654829-8-elinor.montmasson@savoirfairelinux.com>
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
Message-ID-Hash: 7223FSSWNWYHQAGXYKABFW6KR4I3WJM5
X-Message-ID-Hash: 7223FSSWNWYHQAGXYKABFW6KR4I3WJM5
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:18:05 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7223FSSWNWYHQAGXYKABFW6KR4I3WJM5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add new optional dts property "cpu-slot-num", which allows to set a
custom number of TDM slots for the CPU DAI when using the generic codec.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index 42aa6ec306ec..110ac20ba699 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -725,6 +725,7 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 		priv->dai_link[2].num_codecs =3D 2;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
 		of_property_read_u32(np, "cpu-slot-width", &priv->cpu_priv.slot_width)=
;
+		of_property_read_u32(np, "cpu-slot-num", &priv->cpu_priv.slot_num);
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
--=20
2.25.1
