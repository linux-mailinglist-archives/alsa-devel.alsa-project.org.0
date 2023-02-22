Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6B069F72B
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 15:54:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91071EA6;
	Wed, 22 Feb 2023 15:53:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91071EA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677077670;
	bh=1ZxM1DIUyrIzDf+fi/7zIyQdW4rQKjFnUFhOGlIkpJ0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=c2WB8+B8MJow98HP2Ud+BHrXHY+s5PvjG4VclqhBXsYq00hHCLZpxD5kOVn4Y2fUb
	 XEi5Jyh1+6hH5rVEp4KPo0Mpxcn7JjgPQHx+ksxByiAERn0xLbnz6Mdo911/ljg+st
	 RmYElmMDeoPUVX93LHs/yxdDMOqdRf+s1aENpLw4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A9E8F8025A;
	Wed, 22 Feb 2023 15:53:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D10B7F80266; Wed, 22 Feb 2023 15:53:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89D4DF80083
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 15:53:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89D4DF80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yIaGRZdf
Received: by mail-lf1-x12e.google.com with SMTP id x24so10475817lfr.1
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Feb 2023 06:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XtiAUhBRnV1kzRpqeljMlrgfEP8oapNbELdUiPr+q0Q=;
        b=yIaGRZdfGhPRxB1k8ow9epTiEE1W20A8grO7TCejcTJ9sWi1bZHAds5FbSz221ZTgc
         XY+qfPUtt4sp+Rr8533QuRnBFRfyC9e5t70/Z86qx+VK2ILclkW2XWvn9kZ/+UyFKuoa
         X28QYxXXtkuaave1dYN9Fiuv/jZYY4Lom0dKo3852iGBIY8af9JqyXVGLJVvSd41ym6O
         Wy/obk73XRE8S4v5Qlf3i3KQ02UEZhazuGUXtNSrUU+P6P05EbCPh8aIG+hwdMCc5Qx7
         0pXwcTR1KpkXeIg/BgUex7/RhJZJwkDYuOas/jUlZqbPv7dWUyC5ZHgBt6zYJ9V/kAMd
         EVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XtiAUhBRnV1kzRpqeljMlrgfEP8oapNbELdUiPr+q0Q=;
        b=P7Ivb1OlwVAY42GInewuWQd3D42h6Xf9bXRHWMbHEIPBMmwmR8CN98swWyqx41rSJK
         +jvXVlDifSXJhXwmMoKNcWlZjqs0aEhGLzcMI1HDIapbAEiyfjlxFkjJD4I3H7a+SQDV
         pBTmllgAooGI01LR7rMaOoFDZHY6oiaW5r1UWyc5T0yDDyeI/FAONbAPhp1+YRd5szs3
         haRd3wGhcMV5kDaH0Cvey8uwbglo1nj2UOBGMaxHUKHeai2RzZNyyj7gnk/1FkpGxx0P
         +uMQjy023KF3AGwJkyX9wwAEQSKWXcnsbieqi67CCsrLO8+Oav4HHEqV1FI4FyYLolY+
         R4WQ==
X-Gm-Message-State: AO0yUKWp6omb8aWTjpk+CKI6OhKqsHTk7m0ecuKuhAgCERj3wCtl/uez
	Z9UWShv+NYndEH5oavVh//jgL4cKxrneI82d
X-Google-Smtp-Source: 
 AK7set8GZAysuh1vxytnbgEUxlKPIUmiScd1FKQtLfvEvrgSqsAGqT845Dtx9NeLeTWFSw7AwRcICQ==
X-Received: by 2002:ac2:5282:0:b0:4d5:a689:7580 with SMTP id
 q2-20020ac25282000000b004d5a6897580mr2678118lfm.47.1677077611335;
        Wed, 22 Feb 2023 06:53:31 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id
 w26-20020a05651204da00b004d39af98af6sm646836lfq.81.2023.02.22.06.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 06:53:31 -0800 (PST)
Message-ID: <64c80ca9-2317-8225-2345-146e41f3c251@linaro.org>
Date: Wed, 22 Feb 2023 15:53:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] soundwire: qcom: gracefully handle too many ports in
 DT
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230222144412.237832-1-krzysztof.kozlowski@linaro.org>
 <20230222144412.237832-2-krzysztof.kozlowski@linaro.org>
 <dc544641-b9f1-96b4-95a1-30fafc0712e5@linaro.org>
 <80339c7f-1cea-3c97-7dc4-5efb4597cb69@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <80339c7f-1cea-3c97-7dc4-5efb4597cb69@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PUUFUKY2AVQ72NCVXZEWADW2SFGZCN5M
X-Message-ID-Hash: PUUFUKY2AVQ72NCVXZEWADW2SFGZCN5M
X-MailFrom: konrad.dybcio@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PUUFUKY2AVQ72NCVXZEWADW2SFGZCN5M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 22.02.2023 15:50, Krzysztof Kozlowski wrote:
> On 22/02/2023 15:47, Konrad Dybcio wrote:
>>
>>
>> On 22.02.2023 15:44, Krzysztof Kozlowski wrote:
>>> There are two issues related to the number of ports coming from
>>> Devicetree when exceeding in total QCOM_SDW_MAX_PORTS.  Both lead to
>>> incorrect memory accesses:
>>> 1. With DTS having too big value of input or output ports, the driver,
>>>    when copying port parameters from local/stack arrays into 'pconfig'
>>>    array in 'struct qcom_swrm_ctrl', will iterate over their sizes.
>>>
>>> 2. If DTS also has too many parameters for these ports (e.g.
>>>    qcom,ports-sinterval-low), the driver will overflow buffers on the
>>>    stack when reading these properties from DTS.
>>>
>>> Add a sanity check so incorrect DTS will not cause kernel memory
>>> corruption.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>> Fixes: 02efb49aa805 ("soundwire: qcom: add support for SoundWire controller")
> 
> Can be... but is it really a bug of the kernel? Issue is visible with
> incorrect DTS and it's not the kernel's job to fix it. If DTS has
> incorrect values (e.g. IO addresses) system won't work anyway and that's
> the same type of bug.
I'm not sure to what extent the kernel should be responsible for
checking DT sanity, but in case of a buffer overflow, I really
think it definitely deserves a fixes tag.

Konrad

> 
> Best regards,
> Krzysztof
> 
