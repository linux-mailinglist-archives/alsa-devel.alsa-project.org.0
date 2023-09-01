Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4036A791784
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:46:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 332AF201;
	Mon,  4 Sep 2023 14:45:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 332AF201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693831593;
	bh=VMTUibu+gKiKaY66dTNVlYqSL6ceQxuh372lCYys67c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WvvzzZn7hqpou2wjaVHNHw/SHn3zBxqATaSLTxxDtESQd1ufQw8Z4GwlYUyCidMhs
	 pCAuJztaDjOiN+qZH7Acpwqn+dKqcFpFXTj1F9lFka+aCwIUSsaMskcLYeDEtumrkz
	 Mw3r6favQ+9BI8PkuLWQLms6fylyclVmTHW1JJo8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E57DFF805A1; Mon,  4 Sep 2023 14:44:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54F89F805A1;
	Mon,  4 Sep 2023 14:44:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADF09F80236; Fri,  1 Sep 2023 16:46:40 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 58D70F80155
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 16:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58D70F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=R8n6L/zN
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B7C379C1115;
	Fri,  1 Sep 2023 10:46:34 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id gqaAkGM3qpyD; Fri,  1 Sep 2023 10:46:34 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 192D19C2A33;
	Fri,  1 Sep 2023 10:46:34 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 192D19C2A33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1693579594; bh=sZYZCW5RuIjbb0QpfTC3P2+IfqLC+ypkXU6dzwhTnl0=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=R8n6L/zNOfeOFXrmvc9ZN1EPm/1hEL7pGFb3cHiw1GjHdQsjPVDAkne+HKcCDCdXz
	 YMWpZgv66ONQ/DmwlklSD2sakTogXn2SL/BAWvf805Rd1Z8rWgezhBJo0U5vH+8hG1
	 YoChclgUqDhbwTHE8P7rStGcLlObrWRefr6yVM0DhFD7gZvGaMfZQ8a6fbjN0QcDO+
	 UnB+FC3omTSMSg9u4P71uE0bsMmNZo8Zh0m9cr2YNdyndGJJiAlnZ3KmKsosdxdEQP
	 hHWjWvp1q10W083/eDJ7/CQ1CPCh7xQ+9tq7YFcMxQxvISy0b62bPRXfL34OBhIrU7
	 ljXZIS9XYxmow==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id nK1BigwVNiBz; Fri,  1 Sep 2023 10:46:34 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 4167C9C2802;
	Fri,  1 Sep 2023 10:46:33 -0400 (EDT)
From: elinor.montmasson@savoirfairelinux.com
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com
Cc: alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: [PATCH 03/10] ASoC: fsl-asoc-card: set dummy codec as clock consumer
Date: Fri,  1 Sep 2023 16:45:43 +0200
Message-Id: <20230901144550.520072-4-elinor.montmasson@savoirfairelinux.com>
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
Message-ID-Hash: 3B76VQEW6NHWVW24MKUDIH6USJ4XKMDE
X-Message-ID-Hash: 3B76VQEW6NHWVW24MKUDIH6USJ4XKMDE
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:44:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3B76VQEW6NHWVW24MKUDIH6USJ4XKMDE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>

The default dai format defined by DAI_FMT_BASE doesn't set if the codec
is consumer or provider of the bit and frame clocks.
As it is set by each existing configuration, set the codec as consumer
of both bit and frame clock by default with the dummy codec.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index d656df0b0eea..d210147aebfe 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -711,6 +711,7 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 			priv->codec_priv.mclk =3D devm_clk_get(codec_dev, NULL);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-dummy-codec")) {
 		codec_dai_name =3D "snd-soc-dummy-dai";
+		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBC_CFC;
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
--=20
2.25.1

