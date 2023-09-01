Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF1A791790
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:50:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2F87827;
	Mon,  4 Sep 2023 14:49:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2F87827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693831833;
	bh=2B/FnJeGg7K3NAHuRu7Pgjl+hLySoixxolFmsv+9Bao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gAXpnIkEEXPNnITqDPFYHiAlgBUfzGAVMSXhYRrP88IbU8UP7V5FZi1qOJ2IJBAIT
	 NfPBWKRqKeTReQsYPmSS2eOKn7b7eYYfFrkWUFCH/8IBJgkmVrr0KzQp/2bekCHo7c
	 bk1wQhkfDrgUMNp0hR9dcIMt1nr/rNhXRebHHqtk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70D11F80563; Mon,  4 Sep 2023 14:48:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF236F80558;
	Mon,  4 Sep 2023 14:48:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68986F80158; Fri,  1 Sep 2023 16:47:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C136F80155
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 16:46:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C136F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=jneEN2qE
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 137529C2A61;
	Fri,  1 Sep 2023 10:46:53 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id B8ekbhEVA18W; Fri,  1 Sep 2023 10:46:52 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 76DC49C2A62;
	Fri,  1 Sep 2023 10:46:52 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 76DC49C2A62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1693579612; bh=axuXg0xyUTBkHymSv+mK5SQ0Rh9l5TBxWpiykyllR94=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=jneEN2qEoy03Y/yxhI5YrU9oHrJSUiPgjrTlklcBUkrLLFBycg9NqXlRIBi/zmsVP
	 NEPIhyY8iBn9KYkSdw/SbC71qT336C2OjUbaakfUDiadhqmY8rubbtTkMM1aYPzssN
	 e2ggCVHyp9U+4AoEBAf1uKef5v5EpubQIbQBdeT0DuvGwDN+VhqD0k5UEvcyCcEfB3
	 /Pmis5BB1wRm8PgezcXdp9c1SXaETr9ssGMw3FU5B4Zg8ucUV9yNNLcl3Nzqyi3vd5
	 oR2k3vsuD7rmmXDJ0zlkLSLT6uMPV83FLlMkyGWu5BPgpNQW2vwf+ljym9D4u7eJjO
	 Dbww4GhzMHTJA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id M0FGtu6eauQA; Fri,  1 Sep 2023 10:46:52 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id A23F69C2A61;
	Fri,  1 Sep 2023 10:46:51 -0400 (EDT)
From: elinor.montmasson@savoirfairelinux.com
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com
Cc: alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: [PATCH 08/10] ASoC: fsl-asoc-card: add dts properties
 "cpu-sysclk-freq"
Date: Fri,  1 Sep 2023 16:45:48 +0200
Message-Id: <20230901144550.520072-9-elinor.montmasson@savoirfairelinux.com>
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
Message-ID-Hash: 3GVR5JDVWYVL6PWRYR6UF5VPDACNUJIU
X-Message-ID-Hash: 3GVR5JDVWYVL6PWRYR6UF5VPDACNUJIU
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:48:48 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3GVR5JDVWYVL6PWRYR6UF5VPDACNUJIU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>

Add new optional dts property "cpu-sysclk-freq" to set
custom sysclk frequencies for the CPU DAI with the dummy codec.
The way values are used is up to the CPU DAI driver implementation.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index 66bcb6aa498a..a60d78374ef3 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -723,6 +723,10 @@ static int fsl_asoc_card_probe(struct platform_devic=
e *pdev)
 		priv->card.num_dapm_routes =3D 0;
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

