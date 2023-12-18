Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EBD816E30
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 13:44:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4CA8E86;
	Mon, 18 Dec 2023 13:44:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4CA8E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702903491;
	bh=HXCS5StPz/ifq66mFe/Jj3Q65TF3SlpI4W5seWeLOEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=so86rvFxvmQ6eaNjsxKQAFrZmEoA98D7xebixbGeGPPfF8em4l3nM2c0pK3Z8Szkl
	 SxnkvegX1zZ+e4xxu3jvPQUWaUasD6LRXMpqlC8rSsdb428h1wi7wYrvlFkhn/PVen
	 LB3+AQDehVzFKJyHutHeICOuXTI61Xyxmi3k2Ev4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78CC6F80671; Mon, 18 Dec 2023 13:43:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00BCDF805AB;
	Mon, 18 Dec 2023 13:43:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99FD5F805F1; Mon, 18 Dec 2023 13:43:11 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 58AE5F80425
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 13:43:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58AE5F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=pBf68heE
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 17A209C4165;
	Mon, 18 Dec 2023 07:43:07 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id G9PSkS2c9MZe; Mon, 18 Dec 2023 07:43:06 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B883E9C4168;
	Mon, 18 Dec 2023 07:43:06 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com B883E9C4168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702903386; bh=1tWHBsC3u+nkZ6XpND0qMR0c3tv5xGsM8B4rjwBEpB0=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=pBf68heEQMJf59K+RVUbPLH3gUE6OOxkUl3cN2iHU7oTQOeUOcDBsNckdh4T+tAjv
	 p3ZRkl6CL0u2LQx8RKuzTAG6dSey9/3aIN/VilqsU1tIe+nc1KjL9BsERBARAzAvWj
	 nGbnHfQ/+zbZPsa5WUHDSLhJXHlTtfDdW4shOvIqWd1/HFHv7sAE7YqBNErve8mn1h
	 2KmBAiEkmDlQMg2c2Kb0hTun3xak3kgb35Sl3Uvm6TJVud99TurJgpTJ8RdLgv/0+v
	 bOtB5TOZPPYV2uclq8xKHtZPtoZUp607uwrlqPvMoZ/2fST7btxGGrYxRPxftDD0Hk
	 O5Nex/YaT/uQQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 4PbVwN2z-ivl; Mon, 18 Dec 2023 07:43:06 -0500 (EST)
Received: from gerard.rennes.sfl (unknown [192.168.216.3])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id B5D389C4165;
	Mon, 18 Dec 2023 07:43:04 -0500 (EST)
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
Subject: [PATCHv3 RESEND 06/10] ASoC: fsl-asoc-card: add dts property
 "cpu-slot-width"
Date: Mon, 18 Dec 2023 13:40:54 +0100
Message-Id: <20231218124058.2047167-7-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
References: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HV4ATDKIFARERCAXDZAY3VCMHHALBLJP
X-Message-ID-Hash: HV4ATDKIFARERCAXDZAY3VCMHHALBLJP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HV4ATDKIFARERCAXDZAY3VCMHHALBLJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add new optional dts property "cpu-slot-width", which allows setting a
custom TDM slot width in bits for the CPU DAI
when using the generic codec.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index 3a57d9bfbb48..012c8d3666aa 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -745,6 +745,7 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 		priv->dai_link[0].num_codecs =3D 2;
 		priv->dai_link[2].num_codecs =3D 2;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
+		of_property_read_u32(np, "cpu-slot-width", &priv->cpu_priv.slot_width)=
;
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
--=20
2.25.1

