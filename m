Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5291387C088
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Mar 2024 16:40:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C0C11919;
	Thu, 14 Mar 2024 16:40:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C0C11919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710430815;
	bh=xCDgpHSzPYN7+5RfPDIivMyRKjRh1fwlgoWqlwjvqjI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=erCaPUdGUNSoraepKEfj/2x6DbVRBw6y4EKjt2f/Up65HMQPmfTRuiwIa8OwwaRKH
	 vQC6ugCJkmFgY3SiOqUQst/EGOp4eLtsfuvhl30YIRr4528fTQLfabbKIf1BtInL5K
	 ZhKCFa23yeUMhJQdWqlnhewZKkEvDaTZqlUv/Wj0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEFE3F80587; Thu, 14 Mar 2024 16:39:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB155F80588;
	Thu, 14 Mar 2024 16:39:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58448F8028D; Thu, 14 Mar 2024 16:39:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D319F80088
	for <alsa-devel@alsa-project.org>; Thu, 14 Mar 2024 16:39:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D319F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mCBjQqs2
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6e6cafb2954so783559b3a.0
        for <alsa-devel@alsa-project.org>;
 Thu, 14 Mar 2024 08:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710430762; x=1711035562;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IckUjOzGVOoR8xI7X+V33fEjGofxi6Lw3ExKVi2nyOg=;
        b=mCBjQqs2mnEjeB26C11vDGBRd6OgiBfkzYgYsIpsHwp6IlFhYJ8HnJA/yHTmyz8FD9
         VqSxbohiRKzYzbnGbCs2Mzwfqad9+B9KtBQrn4B8UYGRnWeYDs/kKtohBGvtGqETxdq4
         pvgUuwkGZok7jE+xh66xHSPvd7nZodyP50PuDc+t8gapypSeJrcu6FIZa5NtNToRyuSd
         /xugFGIo7N8LE/vQ7qxG3WbSHhBw05rYs9skWQKK/hZdMy8uVudoG8rhkgEZO+51PM12
         vVtse2otg601uF9Z95RLX13tokIWbb8cdn7jCqakXhK3gfHJ7KeadzXd/QvU2+6K9wmC
         GQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710430762; x=1711035562;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IckUjOzGVOoR8xI7X+V33fEjGofxi6Lw3ExKVi2nyOg=;
        b=cmC58ztI4I8AXWmgLUWbwvjL8vik44mvXpWY6AYm/l+FjeaxPGBPyNzrjv7f5GOQvq
         BUcwn5eKiP0Saklor3zHDEYiTxx84jVlt62aIsLAqMvg6gLtUPgzyM2qMoyBhvp1i9JU
         gV2zXV2fnbXIWpOUFaDWhaCAcjBDRsEtcJ0nShBnDT3Nwlxu6AhFdXz/QiBims8ZPVcW
         Sw/4rxQlGDgDVOfZNfIUqzoux8eRRkRYbLBdmvlPXbbaYHDQCBgJoeJkZ+OlGq3pAAVH
         pc2DxH1XsC/MqgwwX8AMeo6A/RYn3ueFMcf5Fw8Z1MlGhpD0E2TP+0cmpX0vekIil68r
         NSPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWQe1C8ARq6oZLiDTZiy6vvcW2l9/QFPJqgIBay748TBJFSEUewogG8lC10tiUynaGqcNHcFFxzNO1wwzRwT0bvMdnU5RIXxJ2TKA=
X-Gm-Message-State: AOJu0YxFY6OyNCNkco9t6qWFb4cTwKOer0PV00AVI6ZjPIkdORLiPrmT
	zs1F4oL4tWbHsKGux/KmnPS8qHXITyC4m3IifBW/CSezzvidh9yN
X-Google-Smtp-Source: 
 AGHT+IG+cFMIJ0mwrAnNQeQ19dYICYv5jzaC6OD8PkldbqMNOwnoigR+C+nVKrxCtIdHGl6KSmULKQ==
X-Received: by 2002:a05:6a21:9998:b0:1a3:48c8:6858 with SMTP id
 ve24-20020a056a21999800b001a348c86858mr556664pzb.2.1710430762185;
        Thu, 14 Mar 2024 08:39:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id
 fn15-20020a056a002fcf00b006e091a254adsm1620884pfb.30.2024.03.14.08.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 08:39:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <68c86ed9-e0db-4c90-be4c-8d1c5f102a51@roeck-us.net>
Date: Thu, 14 Mar 2024 08:39:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/27] net: wan: Add support for QMC HDLC
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>
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
 Nicolin Chen <nicoleotsuka@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Simon Horman <horms@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231115144007.478111-1-herve.codina@bootlin.com>
 <20231115144007.478111-8-herve.codina@bootlin.com>
 <bd7b7714-1e73-444a-a175-675039d4f6e4@roeck-us.net>
 <42504939-e423-4128-bb86-a40e7b7ae845@csgroup.eu>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <42504939-e423-4128-bb86-a40e7b7ae845@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5D33FNAV5ZORZZGNVUJIF3JRNJ23AA5Y
X-Message-ID-Hash: 5D33FNAV5ZORZZGNVUJIF3JRNJ23AA5Y
X-MailFrom: groeck7@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5D33FNAV5ZORZZGNVUJIF3JRNJ23AA5Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 3/14/24 08:31, Christophe Leroy wrote:
> 
> 
> Le 14/03/2024 à 16:21, Guenter Roeck a écrit :
>> On Wed, Nov 15, 2023 at 03:39:43PM +0100, Herve Codina wrote:
>>> The QMC HDLC driver provides support for HDLC using the QMC (QUICC
>>> Multichannel Controller) to transfer the HDLC data.
>>>
>>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>>> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> Acked-by: Jakub Kicinski <kuba@kernel.org>
>>> ---
>> [ ... ]
>>
>>> +
>>> +static const struct of_device_id qmc_hdlc_id_table[] = {
>>> +	{ .compatible = "fsl,qmc-hdlc" },
>>> +	{} /* sentinel */
>>> +};
>>> +MODULE_DEVICE_TABLE(of, qmc_hdlc_driver);
>>
>> I am a bit puzzled. How does this even compile ?
> 
> Because
> 
> #else  /* !MODULE */
> #define MODULE_DEVICE_TABLE(type, name)
> #endif
> 

Ah, makes sense. We live and learn.

> 
> We should probably try to catch those errors when CONFIG_MODULE is not set.
> 
> By the way, a fix is available at
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20240314123346.461350-1-herve.codina@bootlin.com/
> 

Great, I'll add that to my testing branch for the time being.

Thanks!
Guenter

