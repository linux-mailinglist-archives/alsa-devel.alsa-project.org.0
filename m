Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BED3768761
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Jul 2023 21:21:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3965E827;
	Sun, 30 Jul 2023 21:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3965E827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690744895;
	bh=stw7dfHd2kc0Qv4CzHzL2eHteJGeyClti6NC/jjQ/Q4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fqfTBriZay40xuIhvqV4Kjh0ULpMisU3ukqDe/gOyrYFYITb5IoV+Hr4SXD0MvjIN
	 EjyH71fyunesLWXCp6w59YSaoqZRZcSOCoRYxhz9IKy3Lt3xlp4xV1gcfZYHRvF0Ic
	 NuMjQX7VEHrzKj37FQoOgB56UZhK7SXcV6ioVloY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA5DFF8053B; Sun, 30 Jul 2023 21:20:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36DBBF80163;
	Sun, 30 Jul 2023 21:20:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F140FF8016D; Sun, 30 Jul 2023 21:20:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D90CAF80153
	for <alsa-devel@alsa-project.org>; Sun, 30 Jul 2023 21:20:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D90CAF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DYozmKFW
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-99bcf2de59cso606820266b.0
        for <alsa-devel@alsa-project.org>;
 Sun, 30 Jul 2023 12:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690744837; x=1691349637;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DEjl0pvg9/j+6XvVJyhaHyc6KXkv2+mncGB6CY2cqjs=;
        b=DYozmKFWKJ242QP+Gyd1w5ixhTzmsRESaKU7tsKWuLc1S3XKsLdDDad4TXj+YQOhcs
         zLuU3oooEtmgLdpEHwBi0cfjmc/dW2/YMuzhUdUyRqrey9OQMXNcXh8MgufNg/g3IIjX
         YXrl7HwJ5mbUm3G8P6Udu7si07Gekyx9jwo/U7b8lr+2QURoxrFbgPwTr7lAR5PbRE5b
         7w/hoI1O8ZFptAz8X61TbBEKXNT07I+XLDrvxcLCeWtEYSS3gKv9uV5tYJN4tqHnETy7
         WA3atvRTG/oXlt9TGtr+1meqWGwc0IEpXZBGSg59ZJIOaczo0UMIlF3Ezj/rjkArFesp
         2g4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690744837; x=1691349637;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DEjl0pvg9/j+6XvVJyhaHyc6KXkv2+mncGB6CY2cqjs=;
        b=aDj/4TTkCaJkkByIzT2CofoxRqjt9cdZDOKhx7h0+inry0KItXEyuNai88/6Ufxlcx
         2Hq9Dps5aofAg3z6ykuGE1E0tKVd2mL+1+CDioDLXLw9yumyliA70CaqxOK3rFkO+ofz
         sEXqLGcMBj93gIfY0UIQ+VG5aOofZBCaIE1A4i2zXh5emHbUIjOf7xATZcd1NSWq1FlW
         rrAl79aIn/e+ulXJnkRtQ+EHNyQSOBXU6EYTPFt0d+udnhwanpQkY3vlJf4s0Irx/MtD
         GQ+r46ia7GCrnuBvSh0ie4vhxD+/g36brOkzeVCw8AozX1W5TObw7hTzXt5SiBcurutP
         4Gfw==
X-Gm-Message-State: ABy/qLbYPTyAv04Xw5IJH0HzbXtHmfh4oMCZ0Eq50HkKtJPBQYkfZ932
	DYrhXCXKyOS8GGjeeIgaY9GCKA==
X-Google-Smtp-Source: 
 APBJJlEs4mVjSoe+3Mo2MTnCJ0aJDjyLdwEIsQ6IxzyYIt+bXokocaJTWvjGA7+d88yJS3nfM+FGRA==
X-Received: by 2002:a17:907:7709:b0:98d:5ae2:f1c with SMTP id
 kw9-20020a170907770900b0098d5ae20f1cmr5322932ejc.34.1690744837685;
        Sun, 30 Jul 2023 12:20:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 f23-20020a170906495700b0098748422178sm5028108ejt.56.2023.07.30.12.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 12:20:37 -0700 (PDT)
Message-ID: <ab35b80f-68d7-af96-315d-c4e2b76a609a@linaro.org>
Date: Sun, 30 Jul 2023 21:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v4] dt-bindings: sound: gtm601: convert to YAML
Content-Language: en-US
To: David Heidelberg <david@ixit.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, - <kernel@puri.sm>
Cc: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230730191742.117013-1-david@ixit.cz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230730191742.117013-1-david@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YTRH7FNQ4JTWP2OBSATTXLMIPINVCJH4
X-Message-ID-Hash: YTRH7FNQ4JTWP2OBSATTXLMIPINVCJH4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YTRH7FNQ4JTWP2OBSATTXLMIPINVCJH4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 30/07/2023 21:17, David Heidelberg wrote:
> Convert GTM601 binding to the YAML format.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> v4:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

