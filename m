Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE14C9105E2
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 15:28:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02D9CEF2;
	Thu, 20 Jun 2024 15:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02D9CEF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718890105;
	bh=v2AmP712irz/a2zwTe5iFg/xqPO9PSrxI/jgGwEXG4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fPARuHnWXsUlBZ13ox2oxHfil4CW96R6Ka/qVrJP+huMzPLia5bhR4T7Wdf6BvM4T
	 aGTgSI62wP36y6sqZKd//L7vxFLVuUkFo7liujpnde4GOErAugiEwBDXO/I9iUcf8H
	 f4N3L6h6YaaoOq6s2HCRHurfFH8eWrm+TQKt/sLU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 145A1F8067C; Thu, 20 Jun 2024 15:27:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12499F80674;
	Thu, 20 Jun 2024 15:27:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AE60F80607; Thu, 20 Jun 2024 15:26:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F715F80236
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 15:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F715F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=ObaoDSIl
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2AE389C54A9;
	Thu, 20 Jun 2024 09:26:25 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id KPreHJiDSlnz; Thu, 20 Jun 2024 09:26:24 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 217F29C57BB;
	Thu, 20 Jun 2024 09:26:24 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 217F29C57BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1718889984; bh=rnaRa3s5akRHLJlulKRjZ+W7/rijbiGvPNafUncEGkI=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ObaoDSIlT0epq0B4NcO9hgilLQSuTnhJt7X/kuXqXLlI62XcsJzkA1W88qkayLCG9
	 PSMx+vBuBScrqNPekRIXYfzLOEF+SVjseO8LbKpoV0Y9fT/+J6wpmUU/aOCtT0kVL1
	 F7W1VhrjSRWaBJ8IjGwk7CgBrgbGKZvJOavU3fJu4n8OC0X4DD4Y2V/8nnUMTsKx49
	 Qb0/WuawuBiTQCZT7ClSS7J57StL0mkesUtdZMtlwF//KG2ZCeaDk4G8reEpDU6wft
	 FiChKIt+GA3rbr62gLbbZg5GNtvEmVnoEuF+imGGtcbxkOAQSG47jeB+0iahcELlvV
	 UuVGPMokdF7TQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id u3XePFP8GpAB; Thu, 20 Jun 2024 09:26:24 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 3EBA99C54A8;
	Thu, 20 Jun 2024 09:26:21 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>
Subject: [PATCHv5 1/9] ASoC: fsl-asoc-card: set priv->pdev before using it
Date: Thu, 20 Jun 2024 15:25:03 +0200
Message-Id: <20240620132511.4291-2-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
References: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: AD2NASRDVVM62Q3PI7K5YKDDYDNQV6UN
X-Message-ID-Hash: AD2NASRDVVM62Q3PI7K5YKDDYDNQV6UN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AD2NASRDVVM62Q3PI7K5YKDDYDNQV6UN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

priv->pdev pointer was set after being used in
fsl_asoc_card_audmux_init().
Move this assignment at the start of the probe function, so
sub-functions can correctly use pdev through priv.

fsl_asoc_card_audmux_init() dereferences priv->pdev to get access to the
dev struct, used with dev_err macros.
As priv is zero-initialised, there would be a NULL pointer dereference.
Note that if priv->dev is dereferenced before assignment but never used,
for example if there is no error to be printed, the driver won't crash
probably due to compiler optimisations.

Fixes: 708b4351f08c ("ASoC: fsl: Add Freescale Generic ASoC Sound Card with=
 ASRC support")
Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 5ddc0c2fe53f..eb67689dcd6e 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -559,6 +559,8 @@ static int fsl_asoc_card_probe(struct platform_device *=
pdev)
 	if (!priv)
 		return -ENOMEM;
=20
+	priv->pdev =3D pdev;
+
 	cpu_np =3D of_parse_phandle(np, "audio-cpu", 0);
 	/* Give a chance to old DT binding */
 	if (!cpu_np)
@@ -787,7 +789,6 @@ static int fsl_asoc_card_probe(struct platform_device *=
pdev)
 	}
=20
 	/* Initialize sound card */
-	priv->pdev =3D pdev;
 	priv->card.dev =3D &pdev->dev;
 	priv->card.owner =3D THIS_MODULE;
 	ret =3D snd_soc_of_parse_card_name(&priv->card, "model");
--=20
2.34.1

