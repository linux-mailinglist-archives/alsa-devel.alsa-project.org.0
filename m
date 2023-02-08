Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2DB68F63D
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 18:58:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C457082C;
	Wed,  8 Feb 2023 18:57:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C457082C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675879090;
	bh=QGR8J4XPPV02vmDlCySrZMgGHUOsHtqZNcasIp895dY=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WnmJ7tnh6DQJixgX7q2V3KA6/9sd7H1G9p5zOiDJQltTwqzYXtJ7ch7X32ncuXfJm
	 h8WzH4+h93BoAhlcSI8oWKln6D9DcgaPCnPC2kUv4hgtFuPuKsIIF+7Ie6X3XSYscE
	 0Xa5PibqKx6jZuXCXblqqP7EZ9x+LV9FPbfTKBAY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29EBBF8010B;
	Wed,  8 Feb 2023 18:57:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE1C3F8012B; Wed,  8 Feb 2023 18:57:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A403DF8001E
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 18:57:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A403DF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dCopafmx
Received: by mail-wm1-x334.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so2102516wmb.5
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 09:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bIbh91yDi3hjRSK7EFgWT8DXPfU5NF3sKbYrP5BUi94=;
        b=dCopafmxD7OpCvsat1jY+V1MqgKO1ql0h/53QmoG71/cdD946DJ9co+DwFNWTOJR9U
         FWNaGvHCnYkCLTWEPRqQUMPlOWXl2b0PnyQiJnyYwc9H5EYOErZrd7vKBGgNNIAfGl0+
         rmZnvz1zUXttPEYTRahBL0uvBqus+vZ96RkiE5erVsdxVoMWG/1CWUxvkmaix1NkMs54
         7Njd2GKZckFjlrjDen4MQUmvO+q8m7q05LXkRAd0a69LVibnsw4Q8+4SdLig8G6NWaCl
         ZeL9ogJ/GnSZjn2bvQiZdIGGdtB/XFclNiH/JRgCPuL+G3zDZuG60oqZok4spnNT+Hnm
         Ghwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bIbh91yDi3hjRSK7EFgWT8DXPfU5NF3sKbYrP5BUi94=;
        b=u/afSNUl9+McLFuC/Wap1FI1sWKmqpBaEk2RGFkK2ndjjEyo6wktAXgEbbawUjywJE
         D6AJzr7QGsy3tOy7LhAV+f0en39v9kEQPJ+DUPyGPqfWMqWIAx5kddQw2PKLX8NzZLG3
         kYQzrTzLbWvVThk39WNOEZiNPoNgpYS8XpsIidkLtE2w5iP7EpGFsqRiBLKjJwZMHXsg
         m62A41CGlVF7FGickruQYp8EwF8QLd2buCsMhSzMcEuchmQEvCsv3R2YpMYHtcogtdXl
         C11zwOcaSKrP36XeyId9LwScCZGF5RCe1Fnsu3l+YlyyS7au++gzuZFI00DnKi5ZluBa
         rHOQ==
X-Gm-Message-State: AO0yUKUoue8AVAkErhPDS8PkPBe3t80zgxTJ9aOW40iX9sTPoQbsjJtZ
	wKOEL3YI+X7AZa4hTi765nnPlg==
X-Google-Smtp-Source: 
 AK7set/agXvUr8o1RIcasdIWPQxgRIVGIS6wQ4uZ6pkHa3ZW0neyWPF4V2VmwO8dkPy+UxxjygeJ4A==
X-Received: by 2002:a05:600c:491c:b0:3dc:1687:9ba2 with SMTP id
 f28-20020a05600c491c00b003dc16879ba2mr7082656wmp.35.1675879029806;
        Wed, 08 Feb 2023 09:57:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 n16-20020a1c7210000000b003dc1d668866sm2519023wmc.10.2023.02.08.09.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 09:57:09 -0800 (PST)
Message-ID: <313a6c91-e4d1-98da-9c77-fdafa66c0744@linaro.org>
Date: Wed, 8 Feb 2023 18:57:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ASoC: dt-bindings: wlf,wm8994: Convert to dtschema
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20230208172552.404324-1-krzysztof.kozlowski@linaro.org>
 <Y+PeR4EFfcVDbUfV@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y+PeR4EFfcVDbUfV@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LF6PZYVPTDIGMJALTE67ASG6HECSA4OV
X-Message-ID-Hash: LF6PZYVPTDIGMJALTE67ASG6HECSA4OV
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 - <patches@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LF6PZYVPTDIGMJALTE67ASG6HECSA4OV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/02/2023 18:39, Mark Brown wrote:
> On Wed, Feb 08, 2023 at 06:25:52PM +0100, Krzysztof Kozlowski wrote:
>> Convert the Wolfson WM1811/WM8994/WM8958 audio codecs bindings to DT
>> schema.
> 
>> Changes against original binding:
>> 1. Add missing LDO1VDD-supply for WM1811.
> 
> Both LDOs are present on all variants.

I see LDO2VDD on WM8994 but not on WM1811 and WM8958.

Best regards,
Krzysztof

