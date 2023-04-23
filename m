Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A79A6EBDF1
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Apr 2023 10:23:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62000EF4;
	Sun, 23 Apr 2023 10:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62000EF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682238202;
	bh=V/CSPBHuNbEcq68v2J0hjgxkaIDcT/qj72+y5V8ZfmQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EFvPD1kzWBdNcDg0Ezuw1S+1joAVNXIHrXCTR3/voZiuopQRaIUcTXBd3y0191lxs
	 BvOvao7RRv2IFXQsH1TYknD9AxVJTymZlWvi6oFMLywUeqiurQdwtZrFdX1vTaArZU
	 7gIDh2g/DkK6cl+7LSmjjYaIQsD3bKYjgvVCdQcs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B022EF8018A;
	Sun, 23 Apr 2023 10:22:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 184F5F80236; Sun, 23 Apr 2023 10:22:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C2FCF800AC
	for <alsa-devel@alsa-project.org>; Sun, 23 Apr 2023 10:22:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C2FCF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=es8nQFUn
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-95678d891d6so534636366b.1
        for <alsa-devel@alsa-project.org>;
 Sun, 23 Apr 2023 01:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682238142; x=1684830142;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V/CSPBHuNbEcq68v2J0hjgxkaIDcT/qj72+y5V8ZfmQ=;
        b=es8nQFUnq/i5pRQvnCLiKtMhcD2R+OXvkdJUap3gQnYNLL7jzhb04de5PZ+OhAbtPl
         YEpsrFUc8xRCFlpKDvvYjZePMDZ+UKxTNtGhtVWtR6IKfl4ld/JC5/7reGEvqkfzm3kV
         4BNOTQvccMZWpBkCH8QN7IA91qR1XMVZjVRssCV/gU+B3Ul1euI0Cuo6n+q/dmKzDF1c
         YJHQ3A1Qtn/Yl9pNNdiBUff532id2GJIXS0X9N8hpEROJtPnMkNXaZ1nHhg3SUDPSug7
         yZtEIH1OtfMH++0BmFDrE7EPNeQfauUwIcsNQCBlshqcVQpHWOZXMscTtA8vx0m7ms1W
         2piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682238142; x=1684830142;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/CSPBHuNbEcq68v2J0hjgxkaIDcT/qj72+y5V8ZfmQ=;
        b=lPfpAgwwhtZ9jkO1KeMbfxsoHot85JLkF46JmZt0jCi7nb4cWK2hksxvKJM2X0zFAG
         akyYwkuC8hATdDqURHFrGYJcu+cIXOcjasPFPCOLQSjebt6PXVz6QCMNmGcHT8HQgxt2
         nHEcI8uQPMWfga9R/dyQvZZNs7S1gxAQI/cEQkRzn6Vb8qUqTI/NH77PztlgPM46t895
         77AgX4oW8dkF1ebRO2UulryRW2dc6er6pfL4pvWxQVUOBWP4Hz91qkLsvjQISE0P4gxh
         0u/1FgGg8n7+qiLGaIKOoA3PE2japf6GH/6leIuLOoiQnovH7uzC47T+UlMlCNOlb/XW
         q79Q==
X-Gm-Message-State: AAQBX9csk5Ghy+M9lYBMBjfEE3cTe2J+s0LByPfYaj6tvc5DopAtAuCb
	VPVX1j75OPaszJgrThlpUH+A2g==
X-Google-Smtp-Source: 
 AKy350ZF7I1MOnmb2xhLLqU4sxYXtjxDll7BK1+/KYDZlc1GRJg+/K93ZNDzJCpfDrtqSP3u9os2xg==
X-Received: by 2002:a17:907:2118:b0:931:6921:bdb7 with SMTP id
 qn24-20020a170907211800b009316921bdb7mr6586942ejb.60.1682238142141;
        Sun, 23 Apr 2023 01:22:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5d52:d466:d57f:118c?
 ([2a02:810d:15c0:828:5d52:d466:d57f:118c])
        by smtp.gmail.com with ESMTPSA id
 mh26-20020a170906eb9a00b009591db787a1sm616457ejb.97.2023.04.23.01.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Apr 2023 01:22:21 -0700 (PDT)
Message-ID: <0a2eca07-f266-164c-4a9f-f1000ae4efbc@linaro.org>
Date: Sun, 23 Apr 2023 10:22:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] ASoC: max98090: make it selectable
Content-Language: en-US
To: Maxim Kochetkov <fido_max@inbox.ru>, alsa-devel@alsa-project.org
References: <20230421211950.20972-1-fido_max@inbox.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230421211950.20972-1-fido_max@inbox.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2GFV2J5C652DY6BN44MBU3LRQUPPBQWB
X-Message-ID-Hash: 2GFV2J5C652DY6BN44MBU3LRQUPPBQWB
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, rf@opensource.cirrus.com,
 ckeepax@opensource.cirrus.com, shumingf@realtek.com, ryans.lee@analog.com,
 herve.codina@bootlin.com, wangweidong.a@awinic.com,
 ajye_huang@compal.corp-partner.google.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2GFV2J5C652DY6BN44MBU3LRQUPPBQWB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/04/2023 23:19, Maxim Kochetkov wrote:
> There is no way to select max98090 from menuconfig right now.
> Add a Kconfig menu description to allow building the driver standalone.
> It will allow this codec to be used by any other I2S master without
> adding extra sound card entry in Kconfig.

For your sound card, you need extra sound card entry in Kconfig.

Best regards,
Krzysztof

