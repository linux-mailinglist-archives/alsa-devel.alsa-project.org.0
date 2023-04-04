Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9096D5998
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 09:27:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF05D1FE;
	Tue,  4 Apr 2023 09:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF05D1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680593249;
	bh=aGUyBl2CNdBlhIxKj54emVlc5baU5rvzZ1FI5MPAuws=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jOnMb2nvEp1badMAgNf+8OIr/7cd8nZ/io2/1iBe6/Lyaubh47tbCWAS+B+QLQqU3
	 WcYzv5U8USGkjfc1Dsstayqd1YA6AyI/PBHjC5tLmhShD7+IXB5K4diyzCcKXZCJdH
	 WMj+mPorPhl64wP+E8DUEd5mi+/ypNgxO9uA3dMg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84760F80423;
	Tue,  4 Apr 2023 09:25:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D64FF8024C; Tue,  4 Apr 2023 09:23:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0FECF8015B
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 09:23:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0FECF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KCPZ9WIU
Received: by mail-ed1-x536.google.com with SMTP id ew6so126595185edb.7
        for <alsa-devel@alsa-project.org>;
 Tue, 04 Apr 2023 00:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680593018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IUK8JD+uRunCT3us0+K96/PDNUuY5k90r+of18dK1CI=;
        b=KCPZ9WIUFrgOLZZoO18bDAzfQXIE31N4UEwLOBJqtVyBmVZ5IhG9R2K94tYRAiBGpp
         IdSKoXkP62cwmTIhro2iU98BxSyvrPehTjyKg13FZBIjpIW/UyA42tXQ0+fcT9c2cuKf
         ihEJH/e/nWljXyt5aEdBX5ZaMPgm/NH9/MyctEHEgLlg2T0jv2ePuiPoNzhU92pVU5tE
         WIDOu3WhuHCk3hXS/8KcHxBLwQjs6ngC7QcfwNOodqu3gXae0SDMSnQaUckyAb3f7bKE
         CKtLlle/F0UmWjBa1qIzjgRX8UmZhEk78al2zA/q0CH0CWTqa0koDAH48Zt+wjjYaure
         73Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680593018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IUK8JD+uRunCT3us0+K96/PDNUuY5k90r+of18dK1CI=;
        b=OJl9IJEH2tf4e1jPAqPlpJIIaK+wM9XT0CYKtI7Qd6nJnR3B3ZGrxIujh4WYI/va6A
         C+2a4RqMjS9reDnSUYn2B4KdQWmpv4YY+Dyfa7fOUiZDWkK25FVyXuOuxufh4N8rjGS1
         cWsVI9nFDYsp6FUqozm5/NlHemaKjDGNgqZCK4pAmDen/VFsMB/Gn0hSi2fYIbrRhuTy
         7wp087LKwtg59Yu/SocvBUTKh8CwfrUnRCzEFB6/OueoaF+W7kIhX3CUjLtW3r+AIlzu
         9ulYqh6rjBTOh9t9kdiuBkuZaPiLCuO89WpK+PWJmyaDzMsom/cMavUfNk4R/+g1NpFO
         yTxQ==
X-Gm-Message-State: AAQBX9cpwmygp1VcNu0SOIpiX4hGrfiYLtl21zjxHITfQ5QAwQ9z9oRA
	tpONSJcfbsMUbRj2/JAtFxWGSA==
X-Google-Smtp-Source: 
 AKy350bQiKhSapVjYuj1KeJAFbzScHjNUhn44Hy1bYd9SIbkCHzCikODwygDV7z7aWdHWVFHFKuvcQ==
X-Received: by 2002:a17:906:f284:b0:878:7189:a457 with SMTP id
 gu4-20020a170906f28400b008787189a457mr1212000ejb.51.1680593017797;
        Tue, 04 Apr 2023 00:23:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:233a:5c18:b527:381e?
 ([2a02:810d:15c0:828:233a:5c18:b527:381e])
        by smtp.gmail.com with ESMTPSA id
 tp24-20020a170907c49800b00948c320fcfdsm1664413ejc.202.2023.04.04.00.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 00:23:37 -0700 (PDT)
Message-ID: <f7ab2fcc-93fc-ce87-8767-579d33907225@linaro.org>
Date: Tue, 4 Apr 2023 09:23:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Lee Jones <lee@kernel.org>
References: <20230328092645.634375-1-herve.codina@bootlin.com>
 <20230328092645.634375-3-herve.codina@bootlin.com>
 <20230330160510.GB489249@google.com> <20230331094208.41ab4420@bootlin.com>
 <6d39e9c3-fb6a-4b2a-9889-8fe8d86716d5@linaro.org>
 <20230331141104.42445da9@bootlin.com>
 <a642e653-e3e2-c3d2-68cb-1efc92be05bb@linaro.org>
 <20230331165904.4e7f46a1@bootlin.com> <20230403142822.GA8371@google.com>
 <20230404092036.2d1cd5d9@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230404092036.2d1cd5d9@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KB4GSZYYQQIXAJWT7IA3N2DXFAGCCLBT
X-Message-ID-Hash: KB4GSZYYQQIXAJWT7IA3N2DXFAGCCLBT
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KB4GSZYYQQIXAJWT7IA3N2DXFAGCCLBT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04/04/2023 09:20, Herve Codina wrote:
>> I suggest that none of this (besides the child registration, which is
>> achieved by a simple OF API call in this case) has anything to do with
>> MFD.  We are not requesting and initialising shared resources and we are
>> not using the MFD API to register children.  The pin control
>> functionality clearly needs moving to Pinctrl and the rest, if you
>> cannot find a suitable home for it *may be* suitable for Misc.
>>
> 
> I am confused and I am not really sure to understand where to put my driver.
> 
> The core pef2256.c needs to:
> 1) setup the pef2256
> 2) add the children
> 
> To add the children it calls  devm_of_platform_populate() to add the audio
> parts as several audio children can be available with the same compatible
> string.
> 
> I plan to move the pinctrl part to the pinctrl subsystem. With this done,
> the core pef2256.c will probably add the children using:
> - a mfd_cell for the pinctrl part
> - devm_of_platform_populate() for the audio children
> 
> The setup (E1 lines and TDM configuration) still needs to be done by the
> core pef2256.c. Moving this part only to Misc will break the hierarchy.
> The audio children depends on the core pef2256.c as this one do the setup.
> Having in the audio children and the part that do the setup in same hierarchy
> level is not correct. Audio children should be children of the part that do
> the setup.
> 
> So, the structure I have in mind:
> - pef2256.c (MFD)
>   implement and do the setup at probe()
>   Add the children at probe():
>     - pef2256-pinctrl (pinctrl) added using mfd_add_devices()
>     - pef2256-codec (ASoC codec) added using devm_of_platform_populate()
> 
> Lee, with this in mind, can the core pef2256.c be a MFD driver ?

You do not use MFD here, so why do you want to keep it in MFD? If you
disagree, please tell me where is the MFD code in your patch?

Best regards,
Krzysztof

