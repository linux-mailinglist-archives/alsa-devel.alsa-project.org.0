Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46229816E37
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 13:45:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8998E84;
	Mon, 18 Dec 2023 13:45:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8998E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702903524;
	bh=dc1LCqLuSPTEP4ibWpGKxG3/cyTLReiW3GApgwj4T4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tLX6ZJuqig3jIb1hYZ+H+v+8stFgPykvqqlr1YUKEOtXSD+w8kOAvtlKZqXb2s5Z5
	 YI/eIv+ONX4IeomIMebsJVvt9m5AnPfofMy8p88q9jOyZ4bqUnYijEjEUCEUDmLyPr
	 cpRHFhca5SBwedhseLYyxeXEYDw7v+OoFlLflZg8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4931BF8069E; Mon, 18 Dec 2023 13:43:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8F70F806A0;
	Mon, 18 Dec 2023 13:43:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E79C2F8063A; Mon, 18 Dec 2023 13:43:19 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E73B5F8061E
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 13:43:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E73B5F8061E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=A1cKtatz
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A68539C31CC;
	Mon, 18 Dec 2023 07:43:14 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Z2HT4vLoBD6V; Mon, 18 Dec 2023 07:43:14 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 53F209C335A;
	Mon, 18 Dec 2023 07:43:14 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 53F209C335A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702903394; bh=3qPcaZHdj1kfz+pc5ad/l6BFAvniuOuBLv61aSrT+ic=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=A1cKtatzptEFyfbWxiNdgAOzT9yvvqzzrNPrmrSTSxM3esRuzRv0V5jwwCWwNuV1Z
	 zhBrUKFEGIjHw3Q3UZ5TYXztgjMcecpfLuCWnBJrjyJCTfkMCU4JxXG8TjNwhv+SJ3
	 aHKUyket3qK42sN6weGZ8soRQKPjPhfU/fweFWqFVBop1zeA0BmCtiGx1WeCep4tfo
	 xDFfQ33H5kKo/e9g3azCcAnKpq4oZFpKTHlN3WtO1OB8Unlpj64PKJ+KiUDvHAmPfg
	 kWF6CEOCH/xEGSB8XJZ2m6L1sgnId/LSJOHE8MkAADTQYh1z0GTnszgID/KaZbdwlQ
	 1lSogOMlAWpLw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id kx59VGcxw8Q3; Mon, 18 Dec 2023 07:43:14 -0500 (EST)
Received: from gerard.rennes.sfl (unknown [192.168.216.3])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 51EA89C31CC;
	Mon, 18 Dec 2023 07:43:12 -0500 (EST)
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
Subject: [PATCHv3 RESEND 08/10] ASoC: fsl-asoc-card: add dts properties
 "cpu-sysclk-freq"
Date: Mon, 18 Dec 2023 13:40:56 +0100
Message-Id: <20231218124058.2047167-9-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
References: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: AJO7UE2YEMT5SI4IO4NIA33OVPJKYEIE
X-Message-ID-Hash: AJO7UE2YEMT5SI4IO4NIA33OVPJKYEIE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AJO7UE2YEMT5SI4IO4NIA33OVPJKYEIE/>
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
index 6f6cc8bd3acd..7b0d7df7ae27 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -747,6 +747,10 @@ static int fsl_asoc_card_probe(struct platform_devic=
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

