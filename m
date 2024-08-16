Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB13A954B69
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2024 15:55:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D1472BFF;
	Fri, 16 Aug 2024 15:54:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D1472BFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723816508;
	bh=khItFkdPe6+8AnUWSIBzujIiebw+Nuk9cyt0caKbISM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VvxWkdAePOzXZogEtGbIqL+FBYxc/gKmJSHeqcM3afuNGA/7yjqYtJFnypw1eI3Fq
	 WcpYcTNkdrlQOI6P1QtgUFMK+F4b2f66yz9q06CmbhMy1gFV2AQY0Ont7t71xoX3T/
	 jUVB1Fr/6O/6NhD4fY37LSFcV93PT4Pok5C3zMdQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73349F80588; Fri, 16 Aug 2024 15:54:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD5EEF805AF;
	Fri, 16 Aug 2024 15:54:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5557CF80423; Fri, 16 Aug 2024 15:02:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94893F800B0
	for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2024 15:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94893F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=va4m8Z3r
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-710dc3015bfso1397319b3a.0
        for <alsa-devel@alsa-project.org>;
 Fri, 16 Aug 2024 06:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723813319; x=1724418119;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mPU1rnCHLqIEChVLFEm2mkyxzxBNVaRrpxa3cQaix6w=;
        b=va4m8Z3rluGNhapgyq1VO02amVzERhy1ILlO9a4dLVUIRbh+RMcJmDI/6VLxXEANdn
         SeMSJewCMCaiMWOpmzhu/VM1oWFcWgWfjKvB2vxem+zh/2QrSv6q0LgH+WVNO2J3zmaF
         ox+HgRxwq7LlwiwSFtJq9ER+kM1ZTpPQ5mRFkbxYkBejpdegiqMii8z8YtT4zJpL6aXK
         Afvi87Wum8FWEZstOcMoYAsqMZt+Kp/NZP88hFqAt/T+y9BLHdsjWsJkVcBjG4onRfs8
         Ztz2mte9qSxqLA2db95iHDJV1XSnwgI3pZpNRK7mnS4pCofOnsFO8O4er+ufWb84ZXi8
         W/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723813319; x=1724418119;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mPU1rnCHLqIEChVLFEm2mkyxzxBNVaRrpxa3cQaix6w=;
        b=gsl8hoIjVpqsKCVofsGav8etMvgxC45oeaTrwMOQuSsi/wzzAWlXbkXddk8yNYgAqK
         4cyM/UhtbMojhoSEKgaT93SCH1H/uoimgDfomWRyt5jlSyD9Mo1QQAQo0MHEA0q4jIUD
         fqWLrozsjJ22CNG4saZWDQX87vQyrK1/YgLvdqcalS8ZwZStyUC6wtVlfu99svN37pLK
         4d1/yTp9lRATkOZkvLE6+1jxn+VZbtRERzSz2O/rux3qgdNKF6nmalHa2A7YlP0C+xcG
         diuOLVx0/jjxh5uhHKl2fSPIQr4M05O36yP5XWQbAW438+CNV17/fUZw67rL09irE/az
         xsYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBz/DqI8G3R2x2+z6eXeiGGCwVLpK8WbdF1HsmMKtajNyL+pA88DAMUdtKGgdcxlJC+Mz5x7IP6Mf5M6+cKI0jczwZw6sCPrjB7ow=
X-Gm-Message-State: AOJu0Yygji8ADk6pAkfJh6GsWc0/uCbJbvjvklhaMiFZTTBuVom9vcU9
	buoure7JjxHPhYB2qvh25fgGhp7KtcN3+ud35RpCBQNH9Ur5kut71rKhcCJ4AxI=
X-Google-Smtp-Source: 
 AGHT+IEAzyKCcegktmRWULTqmzWKQOEhfSig6I0+YXOYjRvGYuG38xHEoXFzBN1iG/qYhq6ro+penA==
X-Received: by 2002:a05:6a20:9f0a:b0:1c4:779b:fb02 with SMTP id
 adf61e73a8af0-1c9aacfbbf5mr3850835637.21.1723813319242;
        Fri, 16 Aug 2024 06:01:59 -0700 (PDT)
Received: from [127.0.0.1] ([49.230.136.104])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7127add728bsm2580288b3a.33.2024.08.16.06.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 06:01:58 -0700 (PDT)
Date: Fri, 16 Aug 2024 20:01:52 +0700
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
CC: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, amit.pundir@linaro.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_ASoC=3A_codecs=3A_lpass-va-macro=3A?=
 =?US-ASCII?Q?_set_the_default_codec_version_for_sm8250?=
User-Agent: K-9 Mail for Android
In-Reply-To: <de0a9cf2-c656-430e-8c56-ca2975c73c0e@linaro.org>
References: <20240815164903.18400-1-srinivas.kandagatla@linaro.org>
 <F07BF288-66F4-497A-A581-5FE4B7B432BD@linaro.org>
 <18DCA30B-273D-415A-81EF-EA02CEBDAA94@linaro.org>
 <de0a9cf2-c656-430e-8c56-ca2975c73c0e@linaro.org>
Message-ID: <632B6187-5CB7-45E3-8EB1-3C4C932834E1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: KYPGBEAQJDYLSFR3IVENR4BURROMYA5T
X-Message-ID-Hash: KYPGBEAQJDYLSFR3IVENR4BURROMYA5T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KYPGBEAQJDYLSFR3IVENR4BURROMYA5T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On August 16, 2024 3:59:18 PM GMT+07:00, Srinivas Kandagatla <srinivas=2Eka=
ndagatla@linaro=2Eorg> wrote:
>
>
>On 15/08/2024 22:22, Dmitry Baryshkov wrote:
>> On August 16, 2024 4:07:10 AM GMT+07:00, Dmitry Baryshkov <dmitry=2Ebar=
yshkov@linaro=2Eorg> wrote:
>>> On August 15, 2024 11:49:03 PM GMT+07:00, srinivas=2Ekandagatla@linaro=
=2Eorg wrote:
>>>> From: Srinivas Kandagatla <srinivas=2Ekandagatla@linaro=2Eorg>
>>>>=20
>>>> sm8250 and sc7280 have lpass codec version 1=2E0, as these are very o=
ld
>>>> platforms, they do not have a reliable way to get the codec version
>>> >from core_id registers=2E
>>=20
>> I wrote that it looked good, but maybe you can also describe, why core_=
id registers are not reliable? Are they just not present on those platforms=
 or is there any other issue?
>>=20
>Sure, the comment is correct because the registers are available to read =
however the values of those registers are not fit for dynamically detecting=
 the version, like what we do in the driver=2E

If I remember correctly, on sm8250 these registers read 0x0 /0xf /0x0=2E A=
re you saying that there are several revision that will have these values? =
Do we need to know that it is exactly 1=2E0 or 1=2Ex is going to be enough?

>
>one of the reasons is that the codec evolved over time, I think starting =
from v2 it has values made more sense to determine the version info from th=
ese registers=2E This is also evident in the current code=2E
>
>
>Let me add this detail the commit log and send a v2=2E
>
>--srini
>>=20
>>>>=20
>>>> Add the version info into of_data, so that it does not need to use
>>>> core_id registers to get version number=2E
>>>>=20
>>>> Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get c=
odec version")
>>>> Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to =
accomdate new codec versions")
>>>> Fixes: 727de4fbc546 ("ASoC: codecs: lpass-wsa-macro: Correct support =
for newer v2=2E5 version")
>>>=20
>>> Which commit introduced the issue? I think having just the first tag i=
s enough=2E
>>>=20
>>> LGTM otherwise=2E
>>>=20
>>>> Signed-off-by: Srinivas Kandagatla <srinivas=2Ekandagatla@linaro=2Eor=
g>
>>>> ---
>>>> sound/soc/codecs/lpass-va-macro=2Ec | 11 ++++++++++-
>>>> 1 file changed, 10 insertions(+), 1 deletion(-)
>>>>=20
>>>> diff --git a/sound/soc/codecs/lpass-va-macro=2Ec b/sound/soc/codecs/l=
pass-va-macro=2Ec
>>>> index 8454193ed22a=2E=2Ee95d1f29ef18 100644
>>>> --- a/sound/soc/codecs/lpass-va-macro=2Ec
>>>> +++ b/sound/soc/codecs/lpass-va-macro=2Ec
>>>> @@ -228,11 +228,13 @@ struct va_macro {
>>>> struct va_macro_data {
>>>> 	bool has_swr_master;
>>>> 	bool has_npl_clk;
>>>> +	int version;
>>>> };
>>>>=20
>>>> static const struct va_macro_data sm8250_va_data =3D {
>>>> 	=2Ehas_swr_master =3D false,
>>>> 	=2Ehas_npl_clk =3D false,
>>>> +	=2Eversion =3D LPASS_CODEC_VERSION_1_0,
>>>> };
>>>>=20
>>>> static const struct va_macro_data sm8450_va_data =3D {
>>>> @@ -1587,7 +1589,14 @@ static int va_macro_probe(struct platform_devi=
ce *pdev)
>>>> 			goto err_npl;
>>>> 	}
>>>>=20
>>>> -	va_macro_set_lpass_codec_version(va);
>>>> +	/**
>>>> +	 * old version of codecs do not have a reliable way to determine th=
e
>>>> +	 * version from registers, get them from soc specific data
>>>> +	 */
>>>> +	if (data->version)
>>>> +		lpass_macro_set_codec_version(data->version);
>>>> +	else /* read version from register */
>>>> +		va_macro_set_lpass_codec_version(va);
>>>>=20
>>>> 	if (va->has_swr_master) {
>>>> 		/* Set default CLK div to 1 */
>>>=20
>>>=20
>>=20
>>=20


--=20
With best wishes
Dmitry
