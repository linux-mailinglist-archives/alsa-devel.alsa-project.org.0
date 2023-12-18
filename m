Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B13816E3B
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 13:45:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93E03E7A;
	Mon, 18 Dec 2023 13:45:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93E03E7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702903539;
	bh=eUKIlchFvAnm5RsuGG/p/fslRn62rv2jSMscgpfvjo8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t7IeBkpwbdcEKq9oVCnqcw/2vwERKheNIf2P4HtGAS3ers402Yy+SiorSZ5s0emcq
	 bFvRq+ceGtYZz3c1Ja7ylk5TkAhQMsBbDV3k9X622LZB7Gf/5iDAAtomPRUR/oUQJk
	 rUH2yClqtCgSzKcu1D9SeeBYe63AHqcj2l1dS+is=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E906BF8057D; Mon, 18 Dec 2023 13:43:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54C31F806D1;
	Mon, 18 Dec 2023 13:43:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03709F806B6; Mon, 18 Dec 2023 13:43:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4448FF80124
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 13:43:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4448FF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=nDiBaC0a
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id DEC219C416F;
	Mon, 18 Dec 2023 07:43:17 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id QejM-XcZBxTU; Mon, 18 Dec 2023 07:43:17 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 88F549C4174;
	Mon, 18 Dec 2023 07:43:17 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 88F549C4174
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702903397; bh=KtxwE8Nf9NfqMzcAEjPfPhN3k9SXvXZrYJX8fn3taU4=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=nDiBaC0av/NAEKfOkNRFR88a7b2Hf8YqFUopYYAmGIh5KWvi8YxshrGtQc20z4EOH
	 18F0LZ6+Q7RpHLslDoLrzFKrIadHQmoMxvpaJBWTHGM+M5AASCzcLWXh2XTPDoT42p
	 sfiElvvSyc/gfiNxl+Kny7n6oatpIg8seUYYjO0/c5UVOgeAU+c3RXkbWOty2S0rQI
	 dgo/TA+d5fbsvI0EWTqDmOQIhJ93VA3kiLDwFkMRAoyM1bDvZr5TJyMTpgy5V1xPcR
	 LKXarcVOAqSSjvmxDzmGCsC1UlbmaMrY7LsWaC3hY020ZkN8lOpFVjHlxPtWf/zaj3
	 6M9O0/oMONPQQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id uct7dIBeWdpD; Mon, 18 Dec 2023 07:43:17 -0500 (EST)
Received: from gerard.rennes.sfl (unknown [192.168.216.3])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 86C709C416F;
	Mon, 18 Dec 2023 07:43:15 -0500 (EST)
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
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>
Subject: [PATCHv3 RESEND 09/10] ASoC: fsl-asoc-card: add dts properties
 "cpu-sysclk-dir-out"
Date: Mon, 18 Dec 2023 13:40:57 +0100
Message-Id: <20231218124058.2047167-10-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
References: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 7AVDBRFVRNI72L22L6J325OKLXSYRIMV
X-Message-ID-Hash: 7AVDBRFVRNI72L22L6J325OKLXSYRIMV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7AVDBRFVRNI72L22L6J325OKLXSYRIMV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add new optional dts properties "cpu-sysclk-dir-out" to set
sysclk directions as "out" for the CPU DAI when using the generic codec.
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
index 7b0d7df7ae27..5f8fb724e29d 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -751,6 +751,12 @@ static int fsl_asoc_card_probe(struct platform_devic=
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

