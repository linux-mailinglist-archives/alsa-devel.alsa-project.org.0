Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B46D2814AD4
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 15:43:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2397AA4A;
	Fri, 15 Dec 2023 15:43:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2397AA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702651423;
	bh=MnTxDQ/X0Gu1276RPY1f/BSXX1hXOKOfeOjfCfmzCv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uXMJ50dsjke4SbnFDrO8FVb3x4yh7dig1Uag8CTYMWVzg2pCSR0xP5cYp1pP5mnzv
	 AhwpFn9c6T3zJfdx1+r1elZP6szOxyd966UwuBB4GNMUWQIcr2dnoo951w5hIgt3iJ
	 81jyACdYPKXKA0e2MDNsqnedHe6JgRpZq17GuoqM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52800F8055C; Fri, 15 Dec 2023 15:42:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE0E9F8065D;
	Fri, 15 Dec 2023 15:42:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E06AFF80564; Fri, 15 Dec 2023 15:42:09 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 48447F8065D
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 15:42:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48447F8065D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=geDILowr
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 25F449C094E;
	Fri, 15 Dec 2023 09:42:04 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Fjn4dQGGzuKW; Fri, 15 Dec 2023 09:42:03 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B89109C411A;
	Fri, 15 Dec 2023 09:42:03 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com B89109C411A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702651323; bh=6kRTwfd4Noi281HJPP4aTcZJSr5Bl9jyeAnw8yA/CC0=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=geDILowrKgMXnQK+hOHkf3shzsjjZiZ7wGk2KEacXjLplZZw3Gc9xbIAe83eSsa6v
	 L9JqxjK+ldOnU20DLXRGIIN5eWmr4wDTvEk2Mx1zC9pIvn3nAA5nLAM3MijkOFFyHe
	 aLagTAqX4UZxcvhhxGtcm4H05dtOaSuwJbmnLCT81szRXglFJVLmC+q6bbGPFhUbMh
	 f5n6cc86nW+/ZAqBhqCffuO4KoRidANphTTCzdAICv6HJmTCoSjOPHP2Snf+8mD40V
	 aKjPW1+uLldR7Yd2SBTCL9iZynqOESu3WPI8ex6OnOMnAINCWHTrGwAcfMQUiKFjJB
	 oczSWaV306esw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id rk1H7aOFXHlx; Fri, 15 Dec 2023 09:42:03 -0500 (EST)
Received: from gerard.rennes.sfl (unknown [192.168.216.3])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id CD47E9C40F4;
	Fri, 15 Dec 2023 09:42:02 -0500 (EST)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	broonie@kernel.org
Cc: elinor.montmasson@savoirfairelinux.com,
	alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com
Subject: [PATCHv3 05/10] ASoC: fsl-asoc-card: set generic codec as clock
 provider
Date: Fri, 15 Dec 2023 15:40:00 +0100
Message-Id: <20231215144005.934728-6-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231215144005.934728-1-elinor.montmasson@savoirfairelinux.com>
References: <20231215144005.934728-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: A2UNNJ7GNC3COTS4SL52CJ4DN2IDMWF4
X-Message-ID-Hash: A2UNNJ7GNC3COTS4SL52CJ4DN2IDMWF4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2UNNJ7GNC3COTS4SL52CJ4DN2IDMWF4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The default dai format defined by DAI_FMT_BASE doesn't set if the codec
is consumer or provider of the bit and frame clocks.

S/PDIF DIR usually converts audio signal to an asynchronous I2S/PCM
stream, and doesn't consume a bit or frame clock.

As S/PDIF DIR and DIT are used as codecs for the generic use case,
set codecs as provider of both bit and frame clocks by default.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index 71048c1250ec..3a57d9bfbb48 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -744,6 +744,7 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 		generic_codec_dai_names[1] =3D "dir-hifi";
 		priv->dai_link[0].num_codecs =3D 2;
 		priv->dai_link[2].num_codecs =3D 2;
+		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
--=20
2.25.1

