Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4C972DCEA
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 10:44:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA9D274C;
	Tue, 13 Jun 2023 10:43:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA9D274C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686645884;
	bh=cNo1d6ZresNvNmIaPzVo7cWr9AXCEfeaTQjWAB7f2IY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qid/HYgjcm6vUeEsaVs90aAWzlssQaOscHBA2NcmQywdx8PiotV09lBnEs26lIhAF
	 s9L2WvVlhOVcpBn8bEqQATnKWElwVJR8SDHyvCcogvZjbEN5TYYMp9kDeEm7A7ei2f
	 5T5gQXsknfvux8DTWk+ejoMAPuylAgk7zhlOojrU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65171F80246; Tue, 13 Jun 2023 10:43:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0143BF80132;
	Tue, 13 Jun 2023 10:43:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB55DF80149; Tue, 13 Jun 2023 10:43:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0970F800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 10:43:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0970F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LloKSIEh
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-977d02931d1so775357866b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Jun 2023 01:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686645805; x=1689237805;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m5Dbs9odIHVvkEWBqHHqfLFf7lgHuWeM0uugMrIB5UY=;
        b=LloKSIEhAMpnEpsYPW39b6O6NUjbZ2ljy2hcRAYG21medhu4KyE2ePRR0r+zVHeL64
         pDEzzdxroHyDIdqlykc6iTGhhQ/UrKnN6XR0uqNzz0t4o6x1sBiEovQY2eFH6QAkK/By
         KYHuM6dKnJTpkoJBbs4k5cM/iEgCYHccdow6ZBBOOFHFHLgGvim7eG8pld4Obs74ufJH
         7Xd5U1H0U5Fzu4S7Oe/sTghVUA52cIJ2Ada8qz7OtkpqHpt/IBTmUUkuKmqXrKbrPipf
         Eo/ydGkWScNOYzLsari49zXzfz9lAyhQbbPUEW58HQf2Bq9+eLHVVBei067BxG2OqapH
         miGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686645805; x=1689237805;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m5Dbs9odIHVvkEWBqHHqfLFf7lgHuWeM0uugMrIB5UY=;
        b=RmiLy9cZxZwBM84UGWbY9shpL9/ptk4z5My0kVxrvcovD0Q+7Wst4XYK6a48pYqlSf
         +JZl+oXe+xFNZcHqXL40ZgplpZrjrpghs9EeQ/7lyZoLHvTDhiCKT0EmJ0na3ZYHzhcj
         gYxnDz9ZTvYAgAm7K9ehnKTb8xsQYir0VY6eA7L842cbbWqqjoeepOGosoQqg2LgxKdp
         ruIow2BETVkH55juX7rn94GlI6mCXHggMjt///WZprLVtV8Qcs24oZBkhECUhbnvddvd
         3EOQaOU8P6Yky8bzYsGsEjFAWLJdldZencL6ZiXqIY6PzcnwlYvMpsXv+rYHNTBuFTQc
         WFVw==
X-Gm-Message-State: AC+VfDxCNc2MRdoGK4It2Ue/ToYJShRbbAkgRpCw8Wg6ucA5f0mFeX57
	MWF1KFAXvyWBLodObNvug5FS5A==
X-Google-Smtp-Source: 
 ACHHUZ4/ztJz5BfPpk5ZLSM0RLuAYAVgxSU3DPpJe1GRo73HUHvkUMgS3aOL4f8QyySrPKsiYIeIjA==
X-Received: by 2002:a17:907:320a:b0:974:52e6:93cb with SMTP id
 xg10-20020a170907320a00b0097452e693cbmr12720907ejb.50.1686645805697;
        Tue, 13 Jun 2023 01:43:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 y9-20020a17090668c900b0098242730348sm218185ejr.72.2023.06.13.01.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 01:43:25 -0700 (PDT)
Message-ID: <9e0ac1da-9064-5a0a-0365-d5e00cefd1c0@linaro.org>
Date: Tue, 13 Jun 2023 10:43:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [ PATCH v2 3/3] ASoC: dt-bindings: Add support for Loongson audio
 card
Content-Language: en-US
To: YingKun Meng <mengyingkun@loongson.cn>,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
References: <20230612090058.3039546-1-mengyingkun@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230612090058.3039546-1-mengyingkun@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VWJXWO7TIZLULVEOAZPFVENCLHCEB6YX
X-Message-ID-Hash: VWJXWO7TIZLULVEOAZPFVENCLHCEB6YX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VWJXWO7TIZLULVEOAZPFVENCLHCEB6YX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/06/2023 11:00, YingKun Meng wrote:
> From: Yingkun Meng <mengyingkun@loongson.cn>
> 
> The audio card uses loongson I2S controller present in
> 7axxx/2kxxx chips to transfer audio data.
> 
> On loongson platform, the chip has only one I2S controller.
> 
> Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>

Where is the changelog? It's second v2 I got.

Best regards,
Krzysztof

