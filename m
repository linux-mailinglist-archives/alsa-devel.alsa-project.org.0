Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1B068E9AD
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 09:17:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48B117F8;
	Wed,  8 Feb 2023 09:16:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48B117F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675844251;
	bh=NtEjRYilq6VvDilIMKHVShcQsKB1IWBn6tWeb08Kku4=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g9vHsswnmrGQvuv63AyZ3lDgi5ceuVkt0e/myL7y8vQy6U0P3h5h6qAe0suAgK3eS
	 a4xkAmX2ewTx7y4E7t4JAZQYWZbugKZVKplO1I5RRiSeScgGdjomChqOLkHfH8aJG+
	 RJbLNgBjROKrwC/iELyZ5T/0jAZBWPH0nerZf2mY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68BC0F8010B;
	Wed,  8 Feb 2023 09:16:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C58C3F8012B; Wed,  8 Feb 2023 09:16:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F57FF800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 09:16:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F57FF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XZ+YSr1O
Received: by mail-wr1-x42d.google.com with SMTP id r2so15881262wrv.7
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 00:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RIHBZkbNrO62XMNrJJK8z4cLpR4TSFuzo5oIxTwhhE0=;
        b=XZ+YSr1O8bGdAtUUD06C/G0MN+cIjt6SMBMjZJtvGe5f1MFkb0fWa3gLTd3ygER3P3
         jW7svKKXmDDQlT8BNfhh54ouct0fORZPbyM2R61X/e36T8e6Hp0JrV8hjjt6fHEwPpwG
         INYLUcSiZWxI4BU6WcmdrXLN33UAcqRqmZGELZ06VhA5bhP/dcMfUGBU/r7JY6P8YW+j
         YT4rlWmKzc1JikFqd6m1Bl/GUPDrqyga4kZ1JI1F/ZMvwh6X4Zvm5gxNvaeAO2pNdLcm
         Rf7w1oVySK7B9OuC0IpKyg62/G8zPZf8DJuAIvUXCGVdxyksSVbc6sNBaaprG/JzcQAA
         Bmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RIHBZkbNrO62XMNrJJK8z4cLpR4TSFuzo5oIxTwhhE0=;
        b=QQqoF7eW6GCGkzPNeTOv1FVVYXPreGK+43+/WM98LZ0ngJnGbFWjGbpw5cN7WxH2oR
         j/HBxL2pCfYeH8v+E0eJwuCeNOQV0ZgwXZ61STTLhPAQEPKuHbLbkjoRvL6siDKromZl
         IGoCBE8TlKDumb40T0dlLL7FV1h8mZq2KEZ3vdeEZVfCjQpJ10oHfqvjZdyDhy5tZKKk
         /S96f4wKwQ187ZkR0JqFmtC9QYsVHp7vDNDydYrpho/onKpBbGx2oIns4jR7HCr7oeNk
         xo/Jv5c27xoxNKiMt1bP0r0H1QcyWFapZkUP0Hd60br9ZXuCEYG/eGmMT3YKSswLCsyU
         sczQ==
X-Gm-Message-State: AO0yUKUcerRvr/fKXtIL1w6JIB6qV1u4Z3tLsOznDJzlDMLHh6+HJV4D
	jWt+GF/vk4Ee2EuEvqBX0ktBEg==
X-Google-Smtp-Source: 
 AK7set+SVBDj4BO5fl38Hh82paJ/TAHcWytuuayTi6LTqfHjo8burdCkPBlLF/pMYrOvOORLEmOw3A==
X-Received: by 2002:adf:fa10:0:b0:2bf:ad43:8f08 with SMTP id
 m16-20020adffa10000000b002bfad438f08mr5956744wrr.14.1675844187560;
        Wed, 08 Feb 2023 00:16:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a5d504a000000b002c3efca57e1sm5086542wrt.110.2023.02.08.00.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 00:16:27 -0800 (PST)
Message-ID: <a743cc0d-7a6d-d5e2-2c7b-53baaeb87ba0@linaro.org>
Date: Wed, 8 Feb 2023 09:16:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: renesas,rsnd.yaml: tidyup
 reg/reg-name
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
References: <87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com>
 <87pmalt01x.wl-kuninori.morimoto.gx@renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87pmalt01x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: P65BA7FBWEMMBUKSGCT56SWGL7GPQ5N3
X-Message-ID-Hash: P65BA7FBWEMMBUKSGCT56SWGL7GPQ5N3
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P65BA7FBWEMMBUKSGCT56SWGL7GPQ5N3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/02/2023 02:31, Kuninori Morimoto wrote:
> 

All your commits still have this blank line before.

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Tidyup reg/reg-name "maxItems".
> Pointed by Krzysztof, and corrected by Rob.

Drop the sentence, you should instead explain what is here to correct.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

