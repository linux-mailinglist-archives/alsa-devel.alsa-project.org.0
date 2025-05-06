Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9269BAB7FB8
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:05:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B633628E7;
	Thu, 15 May 2025 09:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B633628E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747295931;
	bh=SeRmzyMcT6JX37/ImDnhvHk8HNSqfqzsFYexZDstrTc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oJbZ44IamCd/f8l3Vt6rQTi0eL6frD3AQR2TQrwtrSMrCjp/XW7ze/qEDF+dhKP58
	 Yz83O8CYsea4ZVBW9yIEKI668KzgxZMseiXdlIH9ICcOwEDtwL0g4lLgjSrDaNXeQ4
	 jCSD+5/WtP5T7ez5bJ2f0wPDTcquriMK3/Y75thY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC23DF8982F; Sun, 11 May 2025 16:33:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0DCFF89845;
	Sun, 11 May 2025 16:33:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D55BCF8A298; Tue,  6 May 2025 14:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 166B1F8A125
	for <alsa-devel@alsa-project.org>; Tue,  6 May 2025 14:07:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 166B1F8A125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=cCEGaF7v
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e6f4b3ebe5so9758013a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 06 May 2025 05:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746533252; x=1747138052;
 darn=alsa-project.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7v7vpdvOuhIP8be0gZZCUIgIPmqxbVGMYXTijnoryU=;
        b=cCEGaF7vlNB966qLshwAjdRLklPtVgaohJ87GL0Ec6uJVZKls/VUmDyiXFhdRowIzF
         mHD2B2q45C40jza8tYMA+OKxV89vlkWpFdVmTnz9lpPFTEOubbWo/B+R3fLTbbnrgTvd
         HR0rPUK3N/AKQp4mcD75XW1dkoaadfyfruh8LTc/h0Y7xyA153BTzJB9w1I8Ai1P1Rgh
         rGWGF9zso/E5HE0/Lk7EaGc2kS5Ldv0JXuLBPS8OnEPFiv7wQjBuXow5eXb9JGMgZHUT
         2D/el0BomiCD5176V49BW4VQxzq77luFbHJEnsHhBpC+IfyOUgpN5AMP4r9FZDd2hTsQ
         s65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746533252; x=1747138052;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M7v7vpdvOuhIP8be0gZZCUIgIPmqxbVGMYXTijnoryU=;
        b=PwhJZJzO2IZ3DyIt+GRPAjgOYwtbh1GzT+AuidOBZLvqznp52oUfT5z+X4Q837FWCE
         YJPevav5oWPuO1vU0x2GvPuygEss0/HDrEqfizCN/q0bILdfJmpKU6geLzzwGeNrXSLx
         icmyXyBHshpw0/uCJ8uOENzEQ2ezJv1PPisPvRFSCo2Ec+8N1Rc1CqBTuKdCmipsf9CF
         XmoQOOhfqZWkJ/thZZIV1sctsScs/ojjflveJWkgE8vI2MgYG/SFcGYeYMv59b0txmh6
         O1F+Dh7GkGDiVoIEaWReNN2jaKOYKXKm5oQzEEHySQ74QfnStRvAsR7BEePEBS7UfAhR
         yBzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmqe/Ks6MeeWFPsId23Knc6q84t9n+Ix2oY9f6QKz8PSAxEKEfZ8KPQnRwZt9v903Ly4mG70fgEVSO@alsa-project.org
X-Gm-Message-State: AOJu0YxTWSTonoWWd88322wSJruk+KwJtTTlW2dJAl8FJTjZsUXMQLXh
	B0ZtIJX0MyWHWeO5oRWzRvmkPnJ5ZxqXTm+kzgWc8/OMakrWP/hUMrhDYaQLJSA=
X-Gm-Gg: ASbGnctQ3dwM/Ajh173g7vpl7nhgUpfrw4bPPsAon5eYqNQA8ggPr5ae/fKNCTgSkrP
	zNdSXOJL9O8wtQNnznyPDggWqVgB4VDjPtG//fEIuH3dIuF0aUyYa0DMVnfyS84j1KYtwHKc/6g
	jKGLliHyNB7XURm78KSaIFjsWeN3rghSxJ2iLmIB1fXTSL+vOP78AOoP5u1vCOti0GlCmUeUJqd
	iGeetiKzAYaFsECwLBUKpS5uC5jOnkMPzid5Q7N6D9NjmXOCKVaZ5gGPksPffW09bAq4prNAcpE
	zyNyrPZF1WzdGermTK+j1wErvQLmxP84PrgQ0khZicKwFXRdqWzJRR+XRiQf6aZl18GwCptp4UQ
	ncOmka9/0fsDUysG8b+f/4Xh4vB7Qu6l4Z+b+07iiFfdK8Ed8qQ==
X-Google-Smtp-Source: 
 AGHT+IFBdvqmi68ta2wRWiT+FRzasDJ5pBCULv7R/+BuR+Ax+JNv4/CaLyds47/kxsM107rKwn7PFw==
X-Received: by 2002:a17:907:868e:b0:ac2:49b1:166f with SMTP id
 a640c23a62f3a-ad1a4b36f20mr1047373266b.52.1746533251536;
        Tue, 06 May 2025 05:07:31 -0700 (PDT)
Received: from localhost
 (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a5e1dsm704170466b.55.2025.05.06.05.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 05:07:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 May 2025 14:07:30 +0200
Message-Id: <D9P2D6PG7420.N4T2UBGAOFMR@fairphone.com>
Cc: "Banajit Goswami" <bgoswami@quicinc.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, <phone-devel@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>, "Luca
 Weiss" <luca@lucaweiss.eu>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Srinivas Kandagatla" <srini@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
 <aBNdCRk_fP2q1vxQ@srini-hackbase>
 <91110CA9-6E83-4811-AA04-C0312B99B95E@lucaweiss.eu>
 <0d094cec-0a2e-4e21-845f-977f3a77993d@oss.qualcomm.com>
In-Reply-To: <0d094cec-0a2e-4e21-845f-977f3a77993d@oss.qualcomm.com>
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HEVNFYPHLXD5P6C53BNFWCAGPXXJCNHQ
X-Message-ID-Hash: HEVNFYPHLXD5P6C53BNFWCAGPXXJCNHQ
X-Mailman-Approved-At: Sun, 11 May 2025 14:33:06 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HEVNFYPHLXD5P6C53BNFWCAGPXXJCNHQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Srini,

On Fri May 2, 2025 at 1:06 PM CEST, Srinivas Kandagatla wrote:
> On 5/1/25 15:13, Luca Weiss wrote:
>> Hi Srini,
>>=20
>> Srinivas Kandagatla <srini@kernel.org> schreef op 1 mei 2025 13:37:45 CE=
ST:
>>> On Fri, Apr 25, 2025 at 10:07:26AM +0200, Luca Weiss wrote:
>>>> Sound machine drivers for Qualcomm SoCs can be reused across multiple
>>>> SoCs. But user space ALSA UCM files depend on the card driver name whi=
ch
>>>> should be set per board/SoC.
>>>>
>>>> Allow such customization by using driver match data as sound card driv=
er
>>>> name.
>>>>
>>>> Also while we're already touching these lines, sort the compatibles
>>>> alphabetically.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  sound/soc/qcom/sm8250.c | 9 ++++-----
>>>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
>>>> index b70b2a5031dfbf69024666f8a1049c263efcde0a..e920b413b762c803cfcc40=
49f35deba828275478 100644
>>>> --- a/sound/soc/qcom/sm8250.c
>>>> +++ b/sound/soc/qcom/sm8250.c
>>>> @@ -16,7 +16,6 @@
>>>>  #include "usb_offload_utils.h"
>>>>  #include "sdw.h"
>>>> =20
>>>> -#define DRIVER_NAME		"sm8250"
>>>>  #define MI2S_BCLK_RATE		1536000
>>>> =20
>>>>  struct sm8250_snd_data {
>>>> @@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform=
_device *pdev)
>>>>  	if (ret)
>>>>  		return ret;
>>>> =20
>>>> -	card->driver_name =3D DRIVER_NAME;
>>>> +	card->driver_name =3D of_device_get_match_data(dev);
>>>>  	sm8250_add_be_ops(card);
>>>>  	return devm_snd_soc_register_card(dev, card);
>>>>  }
>>>> =20
>>>>  static const struct of_device_id snd_sm8250_dt_match[] =3D {
>>>> -	{.compatible =3D "qcom,sm8250-sndcard"},
>>>> -	{.compatible =3D "qcom,qrb4210-rb2-sndcard"},
>>>> -	{.compatible =3D "qcom,qrb5165-rb5-sndcard"},
>>>> +	{ .compatible =3D "qcom,qrb4210-rb2-sndcard", .data =3D "sm8250" },
>>>
>>> sm4250 for rb2?
>>=20
>> Since this name is visible to user space and used for picking the UCM co=
nfig, I don't think it's a good idea to change it.
>>=20
> It is not correct to pretend that rb2 is sm8250 for ucm cases, I agree pr=
evious code was
> already doing this, Good thing is that we do not have a ucm written yet f=
or RB2.
>
> Lets fix this as you are already doing this for other compatibles.

Okay, will change this in v4.

Regards
Luca

>
> --srini
>
>> Regards
>> Luca
>>=20
>>>
>>>> +	{ .compatible =3D "qcom,qrb5165-rb5-sndcard", .data =3D "sm8250" },
>>>> +	{ .compatible =3D "qcom,sm8250-sndcard", .data =3D "sm8250" },
>>>>  	{}
>>>>  };
>>>> =20
>>>>
>>>> --=20
>>>> 2.49.0
>>>>

