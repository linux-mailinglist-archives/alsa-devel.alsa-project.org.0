Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F396A94DA
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Mar 2023 11:09:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D63B6868;
	Fri,  3 Mar 2023 11:08:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D63B6868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677838148;
	bh=Brnd7udyDhvq6BWqTkviyeNdEgXNRN2Uv2A6x+MqMqw=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=diUVml4qatbeoRtjUXFKCWFSrAycEL/5cqyLliOAD+nC1dRvFK7XINHXnYQp6u7X7
	 dPb7Xw2WKu8h2P4+ZJz8lw1gCLF4xom5jMm3JFJVeIpJvxyecw8fe55hhSs2liG97h
	 NQZSvAQ1RfQx19gW+1YeqMsKKaJsSCSQHACvxR2k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33403F8025A;
	Fri,  3 Mar 2023 11:08:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D84DF80266; Fri,  3 Mar 2023 11:08:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5060EF800DF
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 11:08:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5060EF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PGRkUs4K
Received: by mail-ed1-x52e.google.com with SMTP id u9so8221615edd.2
        for <alsa-devel@alsa-project.org>;
 Fri, 03 Mar 2023 02:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677838089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ESrclwBCHM69+hLsPL2pqUpQkFKX4EOhHF1Eje8eSI=;
        b=PGRkUs4K5kO9por33thnuXgcO+reDiGastPA2Dp5H/pHJ06Egemrwng4RG4q0GnnzC
         9Ex9M2x04CFgb8fHQm/eYOMkDggcVOvks0DCBoqZxFEBpU87cNN9RGaib7xlccFm7eIm
         9b5/y2MZLL4BKuruSQcTHTfZ/AC8tbuc8YNgENUPD/Q7tdGasN+Ni1KDPnsI2CddUEkN
         Ydj+2QcmGKqeXaXuCtak6YZao2mH0YO19qTpy0ZZfQv084E+271q+PSsPlB777FL1w3S
         47nKilU+OnouEvxEFHNThXBAJetTXiagDNBGC1RWHsMGRrrLqmZJcnn3UtSLh9vLd7Sp
         AfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677838089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ESrclwBCHM69+hLsPL2pqUpQkFKX4EOhHF1Eje8eSI=;
        b=SIgckH4TgHM4C8J+bBTochX+ROOirn4wBnc4hZxeiVwmHbr0DMlwcVbsY5zY+rw76a
         zTS6UU1EZiCDSUYdZWjeP4HJH6iPLgWEgTiju2WIUeeUYvipMWF6dEpKOCO4Olj4ffBm
         OtO2JWtRSOce73ECsnaSMPLQO6FqjIGUFD4J3+LRHQUxVzwfufgThSatua2AFNC9YJWh
         2gGdMCosNfT0+X5pq8zmpmXArVn3lDmeEPSui++Ojd+hUdjyvl+31dBt0t6SMWq36PcW
         ypVU2xiZ7ZQgpxpAxp5lWglAneV0gVX49lEXIGW5pSEsQceeIEshcyRsU1+jTl2VNT88
         RG4g==
X-Gm-Message-State: AO0yUKU/jC3OGTJN+olLglh+OPMsdlk0TVnd97sOdQ7BOukmiJG0TZYg
	qebaeJUuAhpTyVaWqyKmE58FTA==
X-Google-Smtp-Source: 
 AK7set85Koytwyp8k9BMsQvzSBYoh1IytCTgthCWFMdVefdMvJrjVRop+xFCZwSfBoyFqtTTrxnyXw==
X-Received: by 2002:a17:906:1450:b0:8af:ef00:b853 with SMTP id
 q16-20020a170906145000b008afef00b853mr1092169ejc.73.1677838089296;
        Fri, 03 Mar 2023 02:08:09 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 d25-20020a1709064c5900b008b17de96f00sm768389ejw.151.2023.03.03.02.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 02:08:08 -0800 (PST)
Message-ID: <6781aacb-a44b-bff7-214a-3b3b5cee427b@linaro.org>
Date: Fri, 3 Mar 2023 11:08:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: maxim,max9867: convert txt
 bindings to yaml
Content-Language: en-US
To: richard.leitner@linux.dev, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ladislav Michl <ladis@linux-mips.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Benjamin Bara <benjamin.bara@skidata.com>
References: <20230302-max9867-v2-0-fd2036d5e825@skidata.com>
 <20230302-max9867-v2-1-fd2036d5e825@skidata.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230302-max9867-v2-1-fd2036d5e825@skidata.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AKASKQLOOADPSWIHZ2KSMGPJG3EF7S3L
X-Message-ID-Hash: AKASKQLOOADPSWIHZ2KSMGPJG3EF7S3L
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Benjamin Bara <bbara93@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKASKQLOOADPSWIHZ2KSMGPJG3EF7S3L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03/03/2023 11:04, richard.leitner@linux.dev wrote:
> From: Richard Leitner <richard.leitner@skidata.com>
> 
> Convert from max9867.txt to maxim,max9867.yaml and add missing
> '#sound-dai-cells' property.
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  .../devicetree/bindings/sound/max9867.txt          | 17 -------
>  .../devicetree/bindings/sound/maxim,max9867.yaml   | 55 ++++++++++++++++++++++
>  2 files changed, 55 insertions(+), 17 deletions(-)
> 

Looks ok. Need to wait for Rob's bot to check for issues.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

