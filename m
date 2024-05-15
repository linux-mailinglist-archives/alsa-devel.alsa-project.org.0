Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD9B8C67E9
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2024 15:56:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A19C63E8;
	Wed, 15 May 2024 15:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A19C63E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715781393;
	bh=HmsWWVn+apswWOsWnEuqVhg36ana28bxKeAc7zcNNjU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YzyZwKNfQzlqOgyrUF2kvIv6XDt/LKxQDtmuLMMbYTHQHTK9NGZTYTMntc/KEwYHZ
	 1TzHhODFRsnrNqwsaFp6r4W3V5f9080MDEQytuHcpwybC9DTWJRgg/mWnKnJbsbMKE
	 GwZzTdNu8jMnLW4xyjfQIO/UwCQ3U/+4N8hysnA8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2721CF80680; Wed, 15 May 2024 15:54:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76465F80642;
	Wed, 15 May 2024 15:54:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82DE2F805BA; Wed, 15 May 2024 15:54:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3EFA8F80224
	for <alsa-devel@alsa-project.org>; Wed, 15 May 2024 15:54:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EFA8F80224
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=ljzj71Wp
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 31B0A9C5916;
	Wed, 15 May 2024 09:54:37 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Ltc_Mz9nNuLl; Wed, 15 May 2024 09:54:36 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 891C49C5910;
	Wed, 15 May 2024 09:54:36 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 891C49C5910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1715781276; bh=kEAPwirqd+qGDyNkKpHZSAdDGASOPIMCVpuG1z7ksok=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ljzj71WpQJVCnTp/Nd/xB9vO2PbBLev6GAlZqnK9EYKQnJ1+Y62SyuquGLNeYvjy9
	 5bVXQPnMU/DojTpq60jwSQIEEX9FFhoBST7H13YqZnLFnmIr66U9FKRGTW8SyuK5+g
	 uOip+gf13WOy5G8lA/030WNHlAVfm18u4vPIju7AWDb2ke0K/fRBoU4MuAaIlM5Vby
	 AiUwzIpP+8InnYsBVf9/nN74nNEowV6xjpuQ34l4g04kUgy5vOlkFGk8rasC4ePCN6
	 kW2dDPyDaBRvHGtBY4iI4D5G0xiDRwjdBEVHpdTNfK6CejUcr4lMFZrRzR99SfKXCQ
	 1WzgVpggDyRuQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Mw-6FlqT01jj; Wed, 15 May 2024 09:54:36 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 8DAF09C5911;
	Wed, 15 May 2024 09:54:34 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: [PATCHv4 8/9] ASoC: fsl-asoc-card: add DT property
 "cpu-system-clock-direction-out"
Date: Wed, 15 May 2024 15:54:10 +0200
Message-Id: <20240515135411.343333-9-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: O6IMCHI6SFLUSVW5KB44NVIGJBZ3OZGS
X-Message-ID-Hash: O6IMCHI6SFLUSVW5KB44NVIGJBZ3OZGS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O6IMCHI6SFLUSVW5KB44NVIGJBZ3OZGS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add new optional DT property "cpu-system-clock-direction-out" to set
sysclk direction as "out" for the CPU DAI when using the generic codec.
It is set for both Tx and Rx.
If not set, the direction is "in".
The way the direction value is used is up to the CPU DAI driver
implementation.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index c7fc9c16f761..f3fc2b29c92f 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -760,6 +760,10 @@ static int fsl_asoc_card_probe(struct platform_device =
*pdev)
 			priv->cpu_priv.sysclk_freq[RX] =3D priv->cpu_priv.sysclk_freq[TX];
 			clk_put(cpu_sysclk);
 		}
+		priv->cpu_priv.sysclk_dir[TX] =3D
+			of_property_read_bool(np, "cpu-system-clock-direction-out") ?
+			SND_SOC_CLOCK_OUT : SND_SOC_CLOCK_IN;
+		priv->cpu_priv.sysclk_dir[RX] =3D priv->cpu_priv.sysclk_dir[TX];
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
--=20
2.34.1

