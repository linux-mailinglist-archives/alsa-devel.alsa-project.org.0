Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA7C7AF599
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 23:00:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9E331F4;
	Tue, 26 Sep 2023 22:59:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9E331F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695762025;
	bh=stWk+PPXs6zaEry+CqoLE5/odTOVPhxt3WzG9SeEj10=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gUpkFKvSH8soO06XhX5mnzfXLjk0hBzqyaeRQELqVlGwoM2b3JzUlhdSiGuFZdIpU
	 PApmhNEUMNRId5fT5yVXUxc1Ux3jZfNcdRyz5g8jyI3SgCtDvqnCyBJ4th+85492ZR
	 gYeGckZczPW6TqzBWO5anS4Ptc/EgsilBJHmK2mc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45A3CF80130; Tue, 26 Sep 2023 22:59:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4659CF80166;
	Tue, 26 Sep 2023 22:59:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD62CF8016A; Tue, 26 Sep 2023 22:59:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08736F80130
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 22:59:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08736F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qOnJZVhx
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9a6190af24aso1193723666b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 26 Sep 2023 13:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695761958; x=1696366758;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nbm0fl6t7js3aniuoVoiV7uhTyT8SoKhMhmvTfEHKF0=;
        b=qOnJZVhx9nqOKwwogKZBZXBJ8OkViVxrPl67srprwFGVelrvI2eBFsGnSaljK0V4e/
         0sHATs0PPgpMKD48J0yei6zMe9+4GBB8J3UNjMcIOjMyMQf7GM901E0cvruDtIsRUuEk
         GrZEFcu15WKlqbA8XqsD/qgRH1YSbpBm3/WfhYLOPXY62v1Jh+kRD2U3EksdDKpO+ABr
         Ojbt7nxQQBIth87tPydGmU33ZivmhBVjDiHl0atR15UZiOFFRq0GnuEKkWwMLsTUmNfy
         H0DthEGWsnFmG82njRGE2A4ytNyy4kdWdxSupZao4CDkgK4/bvfkaVQ52AzHYG1ZNFKD
         QIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695761958; x=1696366758;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nbm0fl6t7js3aniuoVoiV7uhTyT8SoKhMhmvTfEHKF0=;
        b=oK4XUJRY4m6Gko0TgSDQj7oJwCcFGdINyIzV66Jd/G51ByOfgPhfXSZXBoUCCFh3NN
         RqcJi2sDxto3Py98JvmugCVknLqyp4l7HytpFQ7ONmB98duWJZOMdAzeoZaNZHu0BDvT
         3g1RHnlTjPwsRNQDXb4cMegb1ENeHobL5xNaFP9M17TreIeKnUSUJtYKBNlyvoGPduYe
         puow/tKADaLg2BqXlWwRugB/aa52sGMtSukj8kRqFN97W0TWchxY4gAD7jE1vbwmKbOV
         Eq1xInqfiDLv/LaniAib06N67jPmPTIDskOFWN7n4ROSdoHf4EHb/FUw/GdVzBfsuF2n
         InPg==
X-Gm-Message-State: AOJu0YzrFKl5gJi/wpItufsiQB2WBMtYnfFiH26/3UnEIN1BOASN2dof
	ohF+k0xV1YxTY96U67Mm/U/Nnw==
X-Google-Smtp-Source: 
 AGHT+IENJ0xPYi4uzaeTJwwedZ+8tWUxG3QlM6olVDYu5bRBD5Pc+AxjzgEP0mdOv30vPgdF5uo+og==
X-Received: by 2002:a17:906:8457:b0:9b2:89ec:7fca with SMTP id
 e23-20020a170906845700b009b289ec7fcamr5558979ejy.34.1695761957945;
        Tue, 26 Sep 2023 13:59:17 -0700 (PDT)
Received: from [192.168.1.145] (host-87-4-82-94.retail.telecomitalia.it.
 [87.4.82.94])
        by smtp.gmail.com with ESMTPSA id
 gu20-20020a170906f29400b009ad8796a6aesm8202912ejb.56.2023.09.26.13.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 13:59:17 -0700 (PDT)
Message-ID: <e8ee6529-b194-4588-96c0-1459f214d005@linaro.org>
Date: Tue, 26 Sep 2023 22:59:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/30] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc: Add
 support for QMC HDLC
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 Simon Horman <horms@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230922075913.422435-1-herve.codina@bootlin.com>
 <20230922075913.422435-9-herve.codina@bootlin.com>
 <5efae150-3d92-81b8-5c25-68846d27132e@linaro.org>
 <20230925101703.1bf083f1@bootlin.com>
 <5b804a1a-6bfd-429d-ad84-696b7ecef72d@linaro.org>
 <20230925122758.43963736@bootlin.com>
 <e02ebde7-f208-40a4-bb10-aa5962ee9864@linaro.org>
 <20230925154929.2b6a9cab@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20230925154929.2b6a9cab@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5Z63QJIQRBPTSYW4BQUYY4I4W7MUNEIT
X-Message-ID-Hash: 5Z63QJIQRBPTSYW4BQUYY4I4W7MUNEIT
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5Z63QJIQRBPTSYW4BQUYY4I4W7MUNEIT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25/09/2023 15:50, Herve Codina wrote:
>>>>> With these details, do you still think I need to change the child (channel)
>>>>> compatible ?    
>>>>
>>>> From OS point of view, you have a driver binding to this child-level
>>>> compatible. How do you enforce Linux driver binding based on parent
>>>> compatible? I looked at your next patch and I did not see it.  
>>>
>>> We do not need to have the child driver binding based on parent.  
>>
>> Exactly, that's what I said.
>>
>>> We have to ensure that the child handles a QMC channel and the parent provides
>>> a QMC channel.
>>>
>>> A QMC controller (parent) has to implement the QMC API (include/soc/fsl/qe/qmc.h)
>>> and a QMC channel driver (child) has to use the QMC API.  
>>
>> How does this solve my concerns? Sorry, I do not understand. Your driver
>> is a platform driver and binds to the generic compatible. How do you
>> solve regular compatibility issues (need for quirks) if parent
>> compatible is not used?
>>
>> How does being QMC compliant affects driver binding and
>> compatibility/quirks?
>>
>> We are back to my original question and I don't think you answered to
>> any of the concerns.
> 
> Well, to be sure that I understand correctly, do you mean that I should
> provide a compatible for the child (HDLC) with something like this:
> --- 8< ---
>   compatible:
>     items:
>       - enum:
>           - fsl,mpc885-qmc-hdlc
>           - fsl,mpc866-qmc-hdlc
>       - const: fsl,cpm1-qmc-hdlc
>       - const: fsl,qmc-hdlc
> --- 8< ---

Yes, more or less, depending on actual compatibility and SoC-family.
Maybe "fsl,cpm1-qmc-hdlc" item in the middle is not needed.

> 
> If so, I didn't do that because a QMC channel consumer (driver matching
> fsl,qmc-hdlc) doesn't contains any SoC specific part.

Just like hundreds of other drivers. :)

There is a paragraph about specific compatibles here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/writing-schema.html


> It uses the channel as a communication channel to send/receive HDLC frames
> to/from this communication channel.
> All the specific SoC part is handled by the QMC controller (parent) itself and
> not by any consumer (child).

OK, so you guarantee in 100% for this hardware and all future (including
designs unknown currently), that they will be 100% compatible with
existing QMC channel consumer (child, matching fsl,qmc-hdlc) driver,
thus there will be no need for any quirk. Specifically, there will be no
chances that it would be reasonable to re-use the same driver for child
(currently fsl,qmc-hdlc) in different parent.

P.S. If you received this email twice, apologies, I have here troubles
with internet.

Best regards,
Krzysztof

