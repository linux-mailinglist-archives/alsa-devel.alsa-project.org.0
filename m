Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C478953C55
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 23:07:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CBE12BD5;
	Thu, 15 Aug 2024 23:07:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CBE12BD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723756074;
	bh=BF3urCbPeBeol0sYlYbUZi+Jf8OHyrb/Wi3RqCTay40=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o8hJ8nIofa8ndfEHcb05b1jmoYBHr5aC/X9ZJGWEvSavmtLQMUI42LJKZ2vn5P+Ov
	 hWXgr1b6s211bZgncOwWCsKzU+4pTwQZMgR5Djm1iHPBQOJsjwjdiMoaP5bLjz4MrH
	 lyEVIjNxz/tlfTRelrFiynxZTlm8yPg3Nx6Kqvus=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4387F80423; Thu, 15 Aug 2024 23:07:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F046F8057A;
	Thu, 15 Aug 2024 23:07:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB700F80423; Thu, 15 Aug 2024 23:07:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0546F800BF
	for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2024 23:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0546F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rLvMRfMN
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1fc569440e1so13056815ad.3
        for <alsa-devel@alsa-project.org>;
 Thu, 15 Aug 2024 14:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723756037; x=1724360837;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GU3FEI8r9WUvRV8pU1u7iapspQEbMTOJxe92B2n9rDo=;
        b=rLvMRfMNSaAnpgBOHY/FOBZtUCJzIsNfsbuy9ny3AAwKEZNnTjc6C0btVSDLRGqX61
         1V2TLnFrhFomaTGgZCjcO/wk4Di0uL86cnjdGcw3SlCoqJ1TWNfG9h04LKCmzzoTG6MP
         v76HDi97C2VwV78kcIr3KNuBHKOPCsKUvr2U38s6NtSM/+hRY2lBdOFMDWuFBIInak9a
         E7kskYmfROy74p9C3zdLiwyv8gpW1JtS/dA+I2sqo1TVsNsKFvkdKcdDRBOYNtgiWkHm
         8rpRVxpYS1SLDZZwmuTpnty1mkUnVZpnLKduAd1T3lAlL4A9UyO2IG97tKOn0pt/y+KY
         J3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723756037; x=1724360837;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GU3FEI8r9WUvRV8pU1u7iapspQEbMTOJxe92B2n9rDo=;
        b=W26Z6hg0ROFs1zEQvpYPAvnpJXrKIJg3B0UA4W4E9/UTFvhyyQzSxx3iPIttoUwHaI
         gGHir+fWR+gNVZ2dulHX2wqlJy+vQR6GsOy6fFtY+Q37a605Lz3Z4QnRqZeiOixoSuyA
         fzSfObddMmCydLkxg1JSV5ywAYpah00bvIq/yqbB7k1T2IXArmIDz3acvmni5T8naXiZ
         B6xSdXQ/V+GRGdbXh23Lkm9PSEv+AJ4yfp32NCF/avIi/rlSCD0qzygy573xiG0kt4bJ
         ICEYkIoDKYYZSZQ4169J/D17Kyr3Sp7Wj+eZlTPnzcCpHrNsHllOo/u0+yxwlw1Dx4Ra
         CPiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdU8A3Kxp32Klcj1Ufu7IGJnLtfPy5zoVFYsKiC6GCg4vld1F5aUQw9m8YIzzhGoT/VZe6mAkHqHMY0GC7nT8VqR8rhKeYJ0tXzV4=
X-Gm-Message-State: AOJu0YxlIO7T0vyeahBx6naHG0On/2EyIA7mD4ImUZmG+uZxR+d8R2mD
	c0AS+OZ6ZGchD+c+5MUQH6ArWJC7/dE/EJiO2shdaabPkc9sd7FI0PZ2LxMm9yg=
X-Google-Smtp-Source: 
 AGHT+IE7DC0PuZyrMxZiu7Je33kd+MzL7ueLlGL4l0yPHkA9u6HXMbV9O7yPJEcgT1AyBP5zqIVCbA==
X-Received: by 2002:a17:903:2342:b0:1fc:6c23:8a3b with SMTP id
 d9443c01a7336-20203e8d400mr10089755ad.17.1723756036599;
        Thu, 15 Aug 2024 14:07:16 -0700 (PDT)
Received: from [127.0.0.1] ([182.232.48.216])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f039fa16sm14112125ad.257.2024.08.15.14.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 14:07:16 -0700 (PDT)
Date: Fri, 16 Aug 2024 04:07:10 +0700
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org, broonie@kernel.org
CC: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, amit.pundir@linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_ASoC=3A_codecs=3A_lpass-va-macro=3A?=
 =?US-ASCII?Q?_set_the_default_codec_version_for_sm8250?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20240815164903.18400-1-srinivas.kandagatla@linaro.org>
References: <20240815164903.18400-1-srinivas.kandagatla@linaro.org>
Message-ID: <F07BF288-66F4-497A-A581-5FE4B7B432BD@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: WDP54LLFFM64QBKYR423NDGUWLRM33RY
X-Message-ID-Hash: WDP54LLFFM64QBKYR423NDGUWLRM33RY
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WDP54LLFFM64QBKYR423NDGUWLRM33RY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On August 15, 2024 11:49:03 PM GMT+07:00, srinivas=2Ekandagatla@linaro=2Eor=
g wrote:
>From: Srinivas Kandagatla <srinivas=2Ekandagatla@linaro=2Eorg>
>
>sm8250 and sc7280 have lpass codec version 1=2E0, as these are very old
>platforms, they do not have a reliable way to get the codec version
>from core_id registers=2E
>
>Add the version info into of_data, so that it does not need to use
>core_id registers to get version number=2E
>
>Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec=
 version")
>Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to acco=
mdate new codec versions")
>Fixes: 727de4fbc546 ("ASoC: codecs: lpass-wsa-macro: Correct support for =
newer v2=2E5 version")

Which commit introduced the issue? I think having just the first tag is en=
ough=2E

LGTM otherwise=2E

>Signed-off-by: Srinivas Kandagatla <srinivas=2Ekandagatla@linaro=2Eorg>
>---
> sound/soc/codecs/lpass-va-macro=2Ec | 11 ++++++++++-
> 1 file changed, 10 insertions(+), 1 deletion(-)
>
>diff --git a/sound/soc/codecs/lpass-va-macro=2Ec b/sound/soc/codecs/lpass=
-va-macro=2Ec
>index 8454193ed22a=2E=2Ee95d1f29ef18 100644
>--- a/sound/soc/codecs/lpass-va-macro=2Ec
>+++ b/sound/soc/codecs/lpass-va-macro=2Ec
>@@ -228,11 +228,13 @@ struct va_macro {
> struct va_macro_data {
> 	bool has_swr_master;
> 	bool has_npl_clk;
>+	int version;
> };
>=20
> static const struct va_macro_data sm8250_va_data =3D {
> 	=2Ehas_swr_master =3D false,
> 	=2Ehas_npl_clk =3D false,
>+	=2Eversion =3D LPASS_CODEC_VERSION_1_0,
> };
>=20
> static const struct va_macro_data sm8450_va_data =3D {
>@@ -1587,7 +1589,14 @@ static int va_macro_probe(struct platform_device *=
pdev)
> 			goto err_npl;
> 	}
>=20
>-	va_macro_set_lpass_codec_version(va);
>+	/**
>+	 * old version of codecs do not have a reliable way to determine the
>+	 * version from registers, get them from soc specific data
>+	 */
>+	if (data->version)
>+		lpass_macro_set_codec_version(data->version);
>+	else /* read version from register */
>+		va_macro_set_lpass_codec_version(va);
>=20
> 	if (va->has_swr_master) {
> 		/* Set default CLK div to 1 */


--=20
With best wishes
Dmitry
