Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0CB79178A
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:47:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B70ECDF4;
	Mon,  4 Sep 2023 14:46:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B70ECDF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693831663;
	bh=QCEt580HPJfTT2pU+Qq8asdM4TFCQYRTmHKfR/1Zekc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aipeTglQ4JXUvJjCM573WhO8qfN2Moe6DVm5u4QXqUNiADcZFuoGDSbYo96UKFO8H
	 QVc3Xd7vcGosC9YwjHk58P5ia/9xRmBcbYw3pMpwHfeLyoPKUx9Rm97675p91EdGD+
	 FZYq6tPkea+vlYGW2PYsTSerVCOU4d6Tx/j1JizQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DBDEF805EB; Mon,  4 Sep 2023 14:44:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FD92F805E8;
	Mon,  4 Sep 2023 14:44:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95DABF80245; Fri,  1 Sep 2023 16:47:00 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 53CCBF80074
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 16:46:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53CCBF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=JH0GtcVS
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 17DA09C2A63;
	Fri,  1 Sep 2023 10:46:56 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 7P9B9XEYo4Eb; Fri,  1 Sep 2023 10:46:55 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 77A6A9C0919;
	Fri,  1 Sep 2023 10:46:55 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 77A6A9C0919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1693579615; bh=OiEIuZeseXeSH92Wx2GgUa4xt4lJLyKUvcRQlripQqs=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=JH0GtcVShcjVy7EOr60KDJrskOEZ7ne6sjO0u8EzbZ1r9Lue1Ife08TYmpFlRv2tJ
	 e4TLadURvzgJHiM14GkvW5oEY369LH4EoM+IWnawwn5t278Wi/yL69+cfVlOAtUT5v
	 t9JdhYADKJEGzyNxrsEU38ZK6GkbDgO5s67glzRdzvw3icTHE2hOH3rIwaX5s5DIrX
	 Wggzr9RGku/+yKca2gEBBH299U5Qn/ODbygfNYxMs79kK57BU22yjb1OnhyAPdWROg
	 4ddsz9XyBG7022TsMcExzHM1ZJ13Kh1l3pCTedZH2FnDhUQS3H8WeAsOfoZrjmmGmR
	 +NRg14vjh/2+g==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id E6EVarP5bRky; Fri,  1 Sep 2023 10:46:55 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id A09019C2A63;
	Fri,  1 Sep 2023 10:46:54 -0400 (EDT)
From: elinor.montmasson@savoirfairelinux.com
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com
Cc: alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: [PATCH 09/10] ASoC: fsl-asoc-card: add dts properties
 "cpu-sysclk-dir-out"
Date: Fri,  1 Sep 2023 16:45:49 +0200
Message-Id: <20230901144550.520072-10-elinor.montmasson@savoirfairelinux.com>
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
Message-ID-Hash: DJZXJ6NV7OUUY7ILXTCNWHFI7OOTC3TP
X-Message-ID-Hash: DJZXJ6NV7OUUY7ILXTCNWHFI7OOTC3TP
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:44:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DJZXJ6NV7OUUY7ILXTCNWHFI7OOTC3TP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>

Add new optional dts properties "cpu-sysclk-dir-out" to set
sysclk directions as "out" for the CPU DAI when using the dummy codec.
This can be set for Tx and Rx.
If not set, the direction is "in".
The way values are used is up to the CPU DAI driver implementation.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index a60d78374ef3..4beb047de3bf 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -727,6 +727,12 @@ static int fsl_asoc_card_probe(struct platform_devic=
e *pdev)
 					(u32 *)&priv->cpu_priv.sysclk_freq[RX]);
 		of_property_read_u32(np, "cpu-sysclk-freq-tx",
 					(u32 *)&priv->cpu_priv.sysclk_freq[TX]);
+		priv->cpu_priv.sysclk_dir[RX] =3D
+			of_property_read_bool(np, "cpu-sysclk-dir-rx-out") ?
+			SND_SOC_CLOCK_OUT : SND_SOC_CLOCK_IN;
+		priv->cpu_priv.sysclk_dir[TX] =3D
+			of_property_read_bool(np, "cpu-sysclk-dir-tx-out") ?
+			SND_SOC_CLOCK_OUT : SND_SOC_CLOCK_IN;
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
--=20
2.25.1

