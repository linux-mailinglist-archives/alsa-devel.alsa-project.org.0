Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B41946C60CC
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 08:31:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9555EC7;
	Thu, 23 Mar 2023 08:30:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9555EC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679556700;
	bh=Kg0YQ/2PUo2UKMpk/HqnWC7IbGh6hq5SfGzJoik2feQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uBQg1uWhWJRbjBCAVFlkCt6kDpTTdHNRkjQQePyWfOpCmzRkpcPfWH7sL/f9Ampos
	 eevlbPhujd3aTdT6lJGqIrU6tyFod/l8479Fwxp0uJ7vV2B7Oc3Xjyq6wG1Ko4kmMP
	 NCgN/6fwLH7mKXvSxiSj171IlWmmZVJ51hUg9WCQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 484CDF8027B;
	Thu, 23 Mar 2023 08:30:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01B9BF802E8; Thu, 23 Mar 2023 08:30:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1277F80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 08:30:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1277F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=I8cwpoxv
Received: by mail-ed1-x536.google.com with SMTP id y4so82691669edo.2
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Mar 2023 00:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679556641;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kek16teXdLvu7dLTJUflPG5QCIq4J7BlyhkE4cbXZKE=;
        b=I8cwpoxv6YTUsd6ERdnQg6OVW1f0LD50VeDAPcBiQ+5rzFODIOEeQ540UR2wbPBYBn
         3eKaDih2WA30MZ2ndOt/29DowKZ7PCtJyooBJCF0WZmdSDBz3AOWoPFoIQeeHewg2bEK
         6xsrnfjUMH51tmh2cDddfIus/IwcXWkkzlpebpdafdnF7zDeueGePhjCwpLKqSrK90l2
         5hIJeQ3EGGxJsc9egwvbs1RWj7kOlxj8A5ApWhcp8Zqlx7/Q5AzI1/TFRTVdnfWLJN90
         kY6ijlGnCZpdZkCj6VMszJ6F+oiy2mAxRzmiZoFFHP9oblAsdXQ7e7f7JKX3aodN6KCA
         c1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679556641;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kek16teXdLvu7dLTJUflPG5QCIq4J7BlyhkE4cbXZKE=;
        b=SgIeuTrx4fiPdh63NwxQJke6Sm17SgpxUO3sDfv4jdaogzbdgJJHzZ8HEitXNpg/CX
         fT3zwGL07Lq9+FSqqBF60jYTKdrAdnuDeCzouTjbKamZnJ7ee2txP8ECoNnFDPpaNjeK
         PFVkHHEHZs+NRPI+jKm8KDZTJAt3uWGNM4Paujn2hhxGPHHHoFNFo3mYUzoF9QyodHNz
         LtpiORXuNFVp8qv4Lee0szl2oN84DU7NjzGY8ztTNZhoTVKxcNQhEIrX0KpvLwC+4NhZ
         v5j07MsJKkL9z8lxCeiilCOO45X0dea3rSxpm9OAqN8pCDmxhqArcjl3kOvvn+iOprCK
         dmZg==
X-Gm-Message-State: AO0yUKWkopzhDH+v7sl1fbreyhXRxk+0UKWlfPhm1CvAJlDTq3dFQD7W
	Vo02RyC0zP7jj5N79w+WYn1hWt4EdHPYHNeqFaM=
X-Google-Smtp-Source: 
 AK7set9uA8J9hPnS0vlnWcwMtRf84KkJwOekMNfol8X6Euuzn58Q7rv2E10do12tJ2sD8nehQPselQ==
X-Received: by 2002:a17:907:b9da:b0:920:254c:1e2d with SMTP id
 xa26-20020a170907b9da00b00920254c1e2dmr8972903ejc.39.1679556641524;
        Thu, 23 Mar 2023 00:30:41 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991?
 ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
        by smtp.gmail.com with ESMTPSA id
 hy16-20020a1709068a7000b00931d3509af1sm8156064ejc.222.2023.03.23.00.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 00:30:41 -0700 (PDT)
Message-ID: <551fe9b4-4c99-74b8-af44-9f431c488af8@linaro.org>
Date: Thu, 23 Mar 2023 08:30:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/6] mfd: Add support for the Lantiq PEF2256 framer
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230322134654.219957-1-herve.codina@bootlin.com>
 <20230322134654.219957-3-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322134654.219957-3-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IEM5NOGE54B4OJ2DALNGAHAEY4SLL5BO
X-Message-ID-Hash: IEM5NOGE54B4OJ2DALNGAHAEY4SLL5BO
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IEM5NOGE54B4OJ2DALNGAHAEY4SLL5BO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22/03/2023 14:46, Herve Codina wrote:
> The Lantiq PEF2256 is a framer and line interface component designed to
> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>


> +static const struct of_device_id pef2256_id_table[] = {
> +	{ .compatible = "lantiq,pef2256" },
> +	{} /* sentinel */
> +};
> +MODULE_DEVICE_TABLE(of, pef2256_id_table);
> +
> +static struct platform_driver pef2256_driver = {
> +	.driver = {
> +		.name = "lantiq-pef2256",
> +		.of_match_table = of_match_ptr(pef2256_id_table),

Drop of_match_ptr. This will case warnings with W=1 and !OF.

Best regards,
Krzysztof

