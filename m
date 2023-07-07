Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F88974AB8A
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 09:04:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8060A20C;
	Fri,  7 Jul 2023 09:03:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8060A20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688713483;
	bh=SGE2pWkNOF/Epu8M0SNAfaG3Q5uRGPaGMAb32KIlicA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=J9vMX7AVd5u117HanrA8JFrOo6AzycFPb0zWjZpF2WaHl85zu25B+EbOQQosRTtDs
	 P+wAS6JGJlZLszXeOs+hQNfHIzU6hpnPeaf+wuozhpHI6JR5YJWA0mRSjrYA2lELfN
	 9LjjuGnI3WvCP6WWrSNg2WYomHaFBBGkQLYLAOzs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0910F80093; Fri,  7 Jul 2023 09:03:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B606F80124;
	Fri,  7 Jul 2023 09:03:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33B1FF80125; Fri,  7 Jul 2023 09:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94F61F80093
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 09:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94F61F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vhwbcG4K
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fb73ba3b5dso2420476e87.1
        for <alsa-devel@alsa-project.org>;
 Fri, 07 Jul 2023 00:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688713349; x=1691305349;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AO1EV4DB9mmXIuKbzqs+B0XTIHsZhaa6Bi4nPPvJMnI=;
        b=vhwbcG4KqnclCRSzjjpJ1T7h0FDVpSVcOk6oufyhiNo7GNRtea0mBdKbdDmaP6Fapd
         3vB3Nf5zv9fBOGPz33lSrpOUN3E1NIgahBty+zMmLIHl6zdXUfjLwyD5pOoHQqFJvZ7p
         g5OYewMjz5KaGHoluDNnQ18nxJBYFlSp/GbO/he/JPH7Rk4cX3i7zy1XrWXVcn3hANcc
         T0UO3u6rgQQGLQPGSHfe2YDO2z7O/2Tx/CAScRCG14wKVhLLDXVCNi2ZNsxalcC6AHEU
         tGGbToHKIvvCNxOfW+MBNawkEFsMi4Wck38lLK6FilfO4msHdnH8IdAT7khBhpGQaPjI
         9oxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688713349; x=1691305349;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AO1EV4DB9mmXIuKbzqs+B0XTIHsZhaa6Bi4nPPvJMnI=;
        b=PJmtSxVQ6fCLdBHks+MqhnKwiP+otSJ9c7VY0XWNf+N9EHsnSL6vQy22G9A9J2tMSV
         9jmTbjhFEg4ElOkknWvzH4a37h2klq0X9FySR7TgrjZJjWuTuWnjsc77XlI8sVRkEnbb
         8wd8TFkFtEWgy/A9X6nq5um5jf1F56t738llL4OmqiJlfE5hs/UNxyug8egGYe1IRlnG
         GjW1V97iKYjsHq2BMaQfuxg4qMHJCzCtEYNExIF1InoXC26fgofiyiKY+96Rb7UV7mM/
         R/Akb5YIYD7//3pqfRwJSVH3ps1IAHznTHtGjHfBpAURegJSUfvl5UNpVrbD/uQIs81k
         6AvA==
X-Gm-Message-State: ABy/qLZjSG2ikGo9LVEq/SI13rZQsYCqRRFN7mumpVoMb0s56VxeYSeI
	yRERv5cZFfo3TFhJbp2qOPs3ZA==
X-Google-Smtp-Source: 
 APBJJlE9taobwIfrQlPCx9nte3vZZOvtAvcAIAuF7ehQfbCcQfO8v4STi1qLh78PqwLoEOBtTQQ90A==
X-Received: by 2002:a05:6512:3d28:b0:4fb:8802:9554 with SMTP id
 d40-20020a0565123d2800b004fb88029554mr4116891lfv.6.1688713349008;
        Fri, 07 Jul 2023 00:02:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 n6-20020a05640206c600b0051dd4daf13fsm1649065edy.30.2023.07.07.00.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 00:02:28 -0700 (PDT)
Message-ID: <4cba2af3-e011-bcaa-7ecd-bc35b8f07e72@linaro.org>
Date: Fri, 7 Jul 2023 09:02:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] dt-bindings: sound: Update maintainer email id
Content-Language: en-US
To: Rohit kumar <quic_rohkumar@quicinc.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 cychiang@chromium.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20230707065259.3099569-1-quic_rohkumar@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230707065259.3099569-1-quic_rohkumar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3RZ52AQ2I3F3USEB3M3XIZURXI6STUAW
X-Message-ID-Hash: 3RZ52AQ2I3F3USEB3M3XIZURXI6STUAW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3RZ52AQ2I3F3USEB3M3XIZURXI6STUAW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07/07/2023 08:52, Rohit kumar wrote:
> Updated my mail id to latest quicinc id.
> 
> Signed-off-by: Rohit kumar <quic_rohkumar@quicinc.com>
> ---


The subject prefix should be different for ASoC:

ASoC: dt-bindings: Update....

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

