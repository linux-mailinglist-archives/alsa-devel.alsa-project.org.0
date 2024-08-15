Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D222953C8B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 23:22:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7346D2BE7;
	Thu, 15 Aug 2024 23:22:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7346D2BE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723756969;
	bh=A+vHLOq9NoUqiwGSvDJziU1Zw0ojmmVP59Cd593nEz4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XJ8J2yjaWMssmswPuROtF1wRGXByeW9ILP5rd5BUwSYx8YE7urZC+seHTwmRmdt4I
	 83fU0NZXlwwsk3hStq+w+QiIw6LNGCrw2cqmAz193DyxmDbhAiMcKM74a1AQfl5iQK
	 vUVx383yXjzzbH9zbJRS1k1CPkyt/eF4DEEXriv4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0533F805BA; Thu, 15 Aug 2024 23:22:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7C10F80588;
	Thu, 15 Aug 2024 23:22:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 895F0F80423; Thu, 15 Aug 2024 23:22:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49ED4F80107
	for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2024 23:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49ED4F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=aGApmbKp
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-710d0995e21so1106041b3a.1
        for <alsa-devel@alsa-project.org>;
 Thu, 15 Aug 2024 14:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723756929; x=1724361729;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W+HlRIRUrdjlSp2NYKYzQJ+ulk8IynEJhfTRgCgAyxo=;
        b=aGApmbKpNhbRW9ZSBAjrZhuqop3o8f3Zycbrj/oqFUYBhDgR5JTYbeAWbZBrkLrLuT
         1y/wa+ttI5Jd80x1fwZa2kTj1kHPgaJYIdXA7ZL5oEGxxjgue6jBNSD4K2ye6mkeQJG5
         o0btyUnxlhq++vuPaybVWC2kQLlh1nL1PRV3CA1wE+CV4E2fzb2uh6xjsDKdRV5eNGaN
         mC40fvPVA4wFkfKY4N+0q0fLFfOzLWDtUdoZc+VSx9hEMGP9SHJ/ijOAP8kDOGNAdxlQ
         bgLv1nmMA1UMHGaInENfdnuyHxx6Yyn6/0sIRvGDio85FGfJowxvAhnb7jCDY4knaVHs
         pxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723756929; x=1724361729;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W+HlRIRUrdjlSp2NYKYzQJ+ulk8IynEJhfTRgCgAyxo=;
        b=VZxTu6YWyzJf5qgbYFzF1yQxF2rZLNfz17lzgptdEPV3+CI3dE8AMO63qMxgIb+NLq
         xN1DFzlR48yP02I5+9WXuOKWwfGEkQzaESVm9jZYodNcjJ6tTxWAm35iPte32173+Rw5
         bOYCZdTXo9P2ie0I5lHSB+ufeVs/tjzcel96IXCBk463B55wj6K62ipSpfNJuXRl+D80
         isc83lAF2zRzvwG6CVrtH7b2HRTMTM4MiJ2cVhrcMy7Yw1/8RxPiSlmCf7M0wIdvjKXi
         d+9dtwS09ddEJFWWfiOrWzNfDixAHum00cjrE+FTeKLHuqVwY1Bi3IYEd6CoV/OAkog7
         CFWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaNKNqza8vskg+qN2gEqyca698xXitSgRijUs5jiBVTxD2NH+6uKgnSLG5z5C0jLiE8GGJZRd/o6Oxz4YDPFJkJuOXg1ny8iZK1SE=
X-Gm-Message-State: AOJu0YzDXSq4impbrOE19EaqFHgiFBUrCfm8mefxuhIVa9o/JPzKwpp0
	6T6nnT5ATZqNbSOVAaeL/dmFrkgm9El3AEAqLjd/OrrhTwfvfYyc7/9YbM9po0M=
X-Google-Smtp-Source: 
 AGHT+IEjbRaGmNe3CMocZq1XkueoM1d0mm223c5Hdq++AZRNRWY/2vq38JDRGMS8w3j6PQ63IeN8GQ==
X-Received: by 2002:a05:6a20:8411:b0:1c6:fc9f:eb68 with SMTP id
 adf61e73a8af0-1c9050638c3mr1180764637.50.1723756928725;
        Thu, 15 Aug 2024 14:22:08 -0700 (PDT)
Received: from [127.0.0.1] ([182.232.48.216])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7127add444dsm1479680b3a.15.2024.08.15.14.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 14:22:08 -0700 (PDT)
Date: Fri, 16 Aug 2024 04:22:03 +0700
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org, broonie@kernel.org
CC: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, amit.pundir@linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_ASoC=3A_codecs=3A_lpass-va-macro=3A?=
 =?US-ASCII?Q?_set_the_default_codec_version_for_sm8250?=
User-Agent: K-9 Mail for Android
In-Reply-To: <F07BF288-66F4-497A-A581-5FE4B7B432BD@linaro.org>
References: <20240815164903.18400-1-srinivas.kandagatla@linaro.org>
 <F07BF288-66F4-497A-A581-5FE4B7B432BD@linaro.org>
Message-ID: <18DCA30B-273D-415A-81EF-EA02CEBDAA94@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: K3V3HX7HXWYVFHCCPVRSZJS4OXUIYHCV
X-Message-ID-Hash: K3V3HX7HXWYVFHCCPVRSZJS4OXUIYHCV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K3V3HX7HXWYVFHCCPVRSZJS4OXUIYHCV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On August 16, 2024 4:07:10 AM GMT+07:00, Dmitry Baryshkov <dmitry=2Ebaryshk=
ov@linaro=2Eorg> wrote:
>On August 15, 2024 11:49:03 PM GMT+07:00, srinivas=2Ekandagatla@linaro=2E=
org wrote:
>>From: Srinivas Kandagatla <srinivas=2Ekandagatla@linaro=2Eorg>
>>
>>sm8250 and sc7280 have lpass codec version 1=2E0, as these are very old
>>platforms, they do not have a reliable way to get the codec version
>>from core_id registers=2E

I wrote that it looked good, but maybe you can also describe, why core_id =
registers are not reliable? Are they just not present on those platforms or=
 is there any other issue?


>>
>>Add the version info into of_data, so that it does not need to use
>>core_id registers to get version number=2E
>>
>>Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get code=
c version")
>>Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to acc=
omdate new codec versions")
>>Fixes: 727de4fbc546 ("ASoC: codecs: lpass-wsa-macro: Correct support for=
 newer v2=2E5 version")
>
>Which commit introduced the issue? I think having just the first tag is e=
nough=2E
>
>LGTM otherwise=2E
>
>>Signed-off-by: Srinivas Kandagatla <srinivas=2Ekandagatla@linaro=2Eorg>
>>---
>> sound/soc/codecs/lpass-va-macro=2Ec | 11 ++++++++++-
>> 1 file changed, 10 insertions(+), 1 deletion(-)
>>
>>diff --git a/sound/soc/codecs/lpass-va-macro=2Ec b/sound/soc/codecs/lpas=
s-va-macro=2Ec
>>index 8454193ed22a=2E=2Ee95d1f29ef18 100644
>>--- a/sound/soc/codecs/lpass-va-macro=2Ec
>>+++ b/sound/soc/codecs/lpass-va-macro=2Ec
>>@@ -228,11 +228,13 @@ struct va_macro {
>> struct va_macro_data {
>> 	bool has_swr_master;
>> 	bool has_npl_clk;
>>+	int version;
>> };
>>=20
>> static const struct va_macro_data sm8250_va_data =3D {
>> 	=2Ehas_swr_master =3D false,
>> 	=2Ehas_npl_clk =3D false,
>>+	=2Eversion =3D LPASS_CODEC_VERSION_1_0,
>> };
>>=20
>> static const struct va_macro_data sm8450_va_data =3D {
>>@@ -1587,7 +1589,14 @@ static int va_macro_probe(struct platform_device =
*pdev)
>> 			goto err_npl;
>> 	}
>>=20
>>-	va_macro_set_lpass_codec_version(va);
>>+	/**
>>+	 * old version of codecs do not have a reliable way to determine the
>>+	 * version from registers, get them from soc specific data
>>+	 */
>>+	if (data->version)
>>+		lpass_macro_set_codec_version(data->version);
>>+	else /* read version from register */
>>+		va_macro_set_lpass_codec_version(va);
>>=20
>> 	if (va->has_swr_master) {
>> 		/* Set default CLK div to 1 */
>
>


--=20
With best wishes
Dmitry
