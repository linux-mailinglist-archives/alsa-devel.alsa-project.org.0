Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F876E28D8
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 18:59:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36E27A4E;
	Fri, 14 Apr 2023 18:58:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36E27A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681491540;
	bh=e74ww3jVi/werVdV5g4ASKYAekZI6VhN/4ESgHA86xw=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EehE5a1Icw0mdAOw6l26oaS6Jud5p4KXV1KAGvxH3yq5sOxju379beFR+tK5+8Bzf
	 4DFp+AmQcYnSVgKEpLs8Zokhj0JkOPtLn2JAeUOkvt0np01ZlNi8TBrPKHvEgJKFu+
	 wX6hewxlQxkFLOTGzKt8exXU7YnieuPwuQTQx5Mc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ECF7F8025E;
	Fri, 14 Apr 2023 18:58:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E342F8032B; Fri, 14 Apr 2023 18:58:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7600FF80100
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 18:58:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7600FF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=p9jcxsu5
Received: by mail-ej1-x630.google.com with SMTP id xi5so47188957ejb.13
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Apr 2023 09:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681491478; x=1684083478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cLuHyW+oToWSMJF/7yNdvhI6vBh6/Geuch2BcgJwQ+s=;
        b=p9jcxsu5QbhKFz/zEToMWOzWt4NlQFv/ocvksXuo79xWMN9r4zmYmzFuOuaGZxcPBz
         Bn9tdeRrraErGBUFG9HDf0ubFG+vlvtmtZ0TY4JgT6Bq7pyiOdUmLt3yTwyceZJsdzSr
         5yOlGNO46IkUnpG2VxOblDidTidYX75Jk80/Em/p3D4iJ50Ue5KWUhRlBDCWbwRHLUUT
         amskfEa6yTYjo40P3pvzl35iHmSyJ0PkK6UTzuRQL76sUGxYL5hA7734a8+6JuVan/q6
         l5jE7RvaHDQ73AsP0fQ5sruExM0suuYGq5Ir7UgDjty9tThT3wcnzhYgrmczrb2vpjHP
         xASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681491478; x=1684083478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cLuHyW+oToWSMJF/7yNdvhI6vBh6/Geuch2BcgJwQ+s=;
        b=V1z/BNedoj9Y348N8qCGAo4Up4ihSWWbjAYPofNMJWPHz23V0rpmTXjBcQVs26wgx5
         Whf+DD6ve6d7avO2JXLEqwCJOO4i7DuCBpB7pgJdiVI9rCLCd9AGXhneIXfVQ0rw/Jm9
         R6UhATIzIEZZOFvJQqltz62SQJye9ZwIlA4qwdmEC8eUQGR7lWMD8TjbE9JgPtx2KdB1
         d4x2RlGmhz9xX9/iXWC0QjyvX+5wV7Vm6jcmrcedQymMcEMmt0xYassBHx7qghdhap7Y
         1IxdUnabg677AsiZ7WDpOsWHqilNKeuIRckppR5ImP5bZZwx+HbX1RyAtUMLPSFDrm6b
         sHHw==
X-Gm-Message-State: AAQBX9fSzpgznCpLRJqH35Qd8r/Z2CF3HSCGI60yB3pFAxszfeQdnbp/
	5IptrRip4XsH31r7G/t/dDXmsw==
X-Google-Smtp-Source: 
 AKy350YQ1HKGT+ViKDuqS5nsV9zqTPyR2y8jAfhlwKBUAhpwzMu5YdZluLXysFoxFAEZSZMgaTQwww==
X-Received: by 2002:a17:907:9873:b0:94e:887f:a083 with SMTP id
 ko19-20020a170907987300b0094e887fa083mr6847292ejc.57.1681491478620;
        Fri, 14 Apr 2023 09:57:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:39b7:81a0:bd41:17b1?
 ([2a02:810d:15c0:828:39b7:81a0:bd41:17b1])
        by smtp.gmail.com with ESMTPSA id
 i7-20020a170906698700b0094a9eb7598esm2620895ejr.120.2023.04.14.09.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 09:57:58 -0700 (PDT)
Message-ID: <b12f305e-ba53-bbab-1d0d-121b76d8b5f6@linaro.org>
Date: Fri, 14 Apr 2023 18:57:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/9] ASoC: Add Chameleon v3 audio
To: =?UTF-8?Q?Pawe=c5=82_Anikiel?= <pan@semihalf.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org
References: <20230414140203.707729-1-pan@semihalf.com>
 <20230414140203.707729-2-pan@semihalf.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230414140203.707729-2-pan@semihalf.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AIBOY3ABO7KJQIO6AZ76PEZIMWTIY7UY
X-Message-ID-Hash: AIBOY3ABO7KJQIO6AZ76PEZIMWTIY7UY
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AIBOY3ABO7KJQIO6AZ76PEZIMWTIY7UY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 14/04/2023 16:01, Paweł Anikiel wrote:
> Add machine and platform drivers for ASoC audio on Chameleon v3.
> 
> The board has two audio sources: HDMI audio from the it68051 chip
> (RX only), and analog audio from the ssm2603 chip (RX and TX).
> 
> Signed-off-by: Paweł Anikiel <pan@semihalf.com>
> ---
>  .../boot/dts/socfpga_arria10_chameleonv3.dts  |  28 ++

No way. DTS is always, always separate.

Best regards,
Krzysztof

