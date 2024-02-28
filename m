Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC20686A933
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Feb 2024 08:48:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33276DE5;
	Wed, 28 Feb 2024 08:47:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33276DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709106482;
	bh=Ow0R+FxYoFMnm3YxzVonOfsUL2Ysf3DvLdurSDOiEtI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qkioYpRD3ntlq5KW/v5Ni4X7N6nY6iLgScFf0H14Wf7vmP8hA4p/O6ZRvtl4ZOb1e
	 isBCSUbRZgmGNiRoAFgthLhEwyz0IZn1L+FZhen6ZnpxwFZh11in0FWk5ZCLO2MCMv
	 QvqeCbGuJiNWd/567Pb3wVl/8o8OuQa8H9TpRYkY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2FE3F805CB; Wed, 28 Feb 2024 08:47:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D3AAF805D5;
	Wed, 28 Feb 2024 08:47:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CE18F8024C; Wed, 28 Feb 2024 08:43:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2614F80104
	for <alsa-devel@alsa-project.org>; Wed, 28 Feb 2024 08:40:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2614F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ABA/1BCl
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a26fa294e56so861309466b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Feb 2024 23:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709106042; x=1709710842;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BY3KNQvzdAETd1/Rth7U0NCFxv48x2qleoh4Hm/NO98=;
        b=ABA/1BCl1l1vrrA7SiOLgyDsnPpIpPC07BcC7vPl9YorZp7J6aEo7enPVVp2syBJEL
         aFFPLsFyQQYKDhi7rGPHnxBL8GV+GF5otMCqTWfA5stytiSrx8mRHpjaVCGDldSWOvi+
         6PS9e0NPlJWxrdY0wj/EqWRVQvYaLBHhvB16GoVLATqyPf9dn32J9OstjlStwwCTSw/h
         Hh8XhWLACc+LfABA8Vs5KZGboSNCY4GUjKMGy4NFMzt30YmPjTnZjmFEbSnNSTqX+W3I
         nP5pc9MUQiMG35cuUXmDVaI7c3TT3kZtx0RcIZ2YjPgZ2n6RDVnuDKLz+PEu2wrUs6qv
         YZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709106042; x=1709710842;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BY3KNQvzdAETd1/Rth7U0NCFxv48x2qleoh4Hm/NO98=;
        b=FfNn5g9gyHttRS15V6Ngh1ODBP5SxPVmkMOFFX+w7trdm2BbKrdV95rI+0K+dH9kyI
         GCuc6jAyzbbzv6wrCq4SX980dnhQ2fD8YpSKmBuk9Dnvz/plAO0B5H3SmLoAaa8kDslz
         Z9h6nDOn0kpMCNpNr2Ch/G1/PKhj3ODaKpLmTjrvhfkUpal7CVNLecae0JCJZ84uS6xd
         4B90nSXr5CpeVOD2cx9qNk+J1JAXgfm/JYfsB8CRMYoKnKixdx4tIyN+wuXJbQ+kqovh
         inztj0NImTzZgMJJPARqZcoc7NbKruV0+RHFj7YaWeDIxQN1wVVFE3z+Gg1MQqWPKaJM
         jEMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMgmCyxQv84Or2BWoJNEXTxmttJq0SGjQI0io6KFvoh3t/r14QSY0XYwr68B21KljiekRxSVpoSlt5aZOuwvTwuiY3r22WPY+ZC6I=
X-Gm-Message-State: AOJu0Yw8q4W1YuXfE4wnDzINkxLvs8AvmnS7kJEgWBbIvt9dH5zmkYwq
	vwPuvoKrR4MHdOmB60B4Eu+5hLX0exJHj8cmnULpNm7Pa8jb9RKPgmG88raHeXo=
X-Google-Smtp-Source: 
 AGHT+IHzpshRmwdSa4JhXNqcWsVlGERtlIhNejiFCqCU3gdDcUKYSaij0hlZij6CD7s02EUdyKuuSw==
X-Received: by 2002:a17:906:260d:b0:a3e:d2ea:ff5e with SMTP id
 h13-20020a170906260d00b00a3ed2eaff5emr9034970ejc.58.1709106041898;
        Tue, 27 Feb 2024 23:40:41 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id
 bx11-20020a170906a1cb00b00a3cfe376116sm1546860ejb.57.2024.02.27.23.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 23:40:41 -0800 (PST)
Message-ID: <7107d732-6bee-4c28-b317-c7a3adb909bd@linaro.org>
Date: Wed, 28 Feb 2024 08:40:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: dt-bindings: img,spdif-in: Convert to dtschema
Content-Language: en-US
To: Daniel Baluta <daniel.baluta@gmail.com>,
 =?UTF-8?Q?Javier_Garc=C3=ADa?= <javier.garcia.ta@udima.es>
Cc: daniel.baluta@nxp.com, broonie@kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Damien.Horsley" <Damien.Horsley@imgtec.com>
References: <20240227123602.258190-1-javier.garcia.ta@udima.es>
 <20240227160952.615291-1-javier.garcia.ta@udima.es>
 <CAEnQRZDY5Jfj6d008goccsWwwUuUuryw1s8xJH6EyGXEiqnovw@mail.gmail.com>
 <CAEnQRZAvqHfNYu+dYObJA=T7S_KfQMxB8TJGmdjK9Ea_FPrLOA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: 
 <CAEnQRZAvqHfNYu+dYObJA=T7S_KfQMxB8TJGmdjK9Ea_FPrLOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ALC6ZYVMCBZ77OJHFZAKD53DPNQHTVJY
X-Message-ID-Hash: ALC6ZYVMCBZ77OJHFZAKD53DPNQHTVJY
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ALC6ZYVMCBZ77OJHFZAKD53DPNQHTVJY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/02/2024 17:29, Daniel Baluta wrote:
> On Tue, Feb 27, 2024 at 6:27 PM Daniel Baluta <daniel.baluta@gmail.com> wrote:
>>
>> This looks much better than v1. Make sure you have addressed all
>> comments from the previous version
>> and add a short log under the scissor line explaining what you have changed.
>>
>> Few comments inline:
>>
>>
>> On Tue, Feb 27, 2024 at 6:13 PM Javier García <javier.garcia.ta@udima.es> wrote:
>>>
>>> Convert the Imagination Technologies SPDIF Input Controllerto DT schema.
>>>
>>> Signed-off-by: Javier García <javier.garcia.ta@udima.es>
>>> ---
>> ^ this is the scissor line. Here you add the change log.
>>
>> Changes since v1:
>> - re-written the subject inline to include relevant prefix
>> - removed header file as it is not used
>> - ....etc
>>
>>
>>> +$id: http://devicetree.org/schemas/sound/img,spdif-in.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Imagination Technologies SPDIF Input Controller
>>> +
>>> +maintainers:
>>> +  - Liam Girdwood <lgirdwood@gmail.com>
>>> +  - Mark Brown <broonie@kernel.org>
>>
>> Please do not blindly add people here. The most proper candidate for this
>> is the people who wrote the original file.
>>
>> Using git log we can find Damien.Horsley <Damien.Horsley@imgtec.com>
> 
> Looks like this address bounced back.
> 
> @Krzysztof Kozlowski @Mark Brown is it OK to add a mailing list as
> maintainer for a yml file?

Yeah, works as a last resort, when we cannot find any responsible person.

Best regards,
Krzysztof

