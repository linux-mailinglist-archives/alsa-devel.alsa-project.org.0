Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5D2658A29
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Dec 2022 09:05:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7181D9481;
	Thu, 29 Dec 2022 09:04:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7181D9481
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672301133;
	bh=PWAtXQxMVvNRNNr74JJovXtuBz522gu8U3OAfSwa3mw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jZvm8xKPaPnWPYgIqPqGLp2hpfRHsG8968wcMyYRowslQy5KumN6G6PirE4fomg5s
	 5teCwF9rgwLECwHr/AjZ4WKYWMJMmidI7Bx1S7N90bLc1hD0gn5s9+vYrertItiReW
	 9Y19ETMZ74jnpt0wUKV/K9otrPG8l4a6pQqECBLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 281EBF804FF;
	Thu, 29 Dec 2022 09:04:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5408F804FF; Thu, 29 Dec 2022 09:04:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67154F804E4
 for <alsa-devel@alsa-project.org>; Thu, 29 Dec 2022 09:04:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67154F804E4
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PBZ+vnE4
Received: by mail-lf1-x12e.google.com with SMTP id b3so26579798lfv.2
 for <alsa-devel@alsa-project.org>; Thu, 29 Dec 2022 00:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0DYLiElYQgv4EGpAL4uv9JD+TX+jA5euJMoTh7FRrC8=;
 b=PBZ+vnE4/SqRWBbQf/R6Bu3YpqzM3EBlm1qj8DgHKEx1Zpc1IzWcqcLMmR1jU22Ypa
 BXfRxNdWJHUeUN3+wQ3XMj1iP0VK6uNXCWlNAxoN2PnXUH2jMd0PmarK2gDF09rgRDOd
 bBwVCQ2XKkRawy+coeJb6rZdiXeEqtgwAAo4wygIeo+RzO6z+hW5HTlr/APoWtyQDNJi
 fCvuIXATG5i+PBDDsL5juXSe2L9OR1qvVWimKMo7IgFhjj3Ay6Sloos9fC8D6F8kG15n
 Jk8Iy/daslBdQ2/xDhqFeLW6JMINvvZKBl4EFmCU/K6vy/N0Xge6+gUmridkWSHgCi/e
 f01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0DYLiElYQgv4EGpAL4uv9JD+TX+jA5euJMoTh7FRrC8=;
 b=XdQ8RVosoKWRveovBmo7L+/5tC4kkjKvxgLbZmp6ztswKQM3uesiq+fV4hszSUmZWE
 QQRYSQypDBmrr9dSWy6JexM9zr15aY19APjn3f9Be34sF1d99hmj7dtT/4YzMntEpBWi
 gfWOXUoWBiD/+W97FrEcD9Y3BQetJmzcYnKImf+7bEZUnBnC1LRnbMT7c113/DkgQO4B
 Dj92l5u1UzLRyBnY7hqwq7IFOMQQbT0YbKBre8rVHTzHtnC8bWyQdmlMxgBK7heMSIYl
 m30FXmwMBiWFxmtRWgfw6KnvOZR9y51HYdcr2h338QlxaMe+lUtUHkFMXqEKcltJ9bYz
 kwqw==
X-Gm-Message-State: AFqh2kpNi7w8L98zzHgweqr4U0/9IxJhx5g3Zdo8LdlVZzU/J4wUNJdu
 sMgByiCCK22lnPIoOKBD1zJEGA==
X-Google-Smtp-Source: AMrXdXsBM/+5SkTv2g2UOivb3O+hOArlgmPvXOxeIWL0XdAQwTEvZjoR3USSVK3GX7IJ5Jgc1VuWqA==
X-Received: by 2002:a05:6512:31c5:b0:4a4:68b9:66f1 with SMTP id
 j5-20020a05651231c500b004a468b966f1mr8800288lfe.60.1672301061752; 
 Thu, 29 Dec 2022 00:04:21 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a056512208c00b004b551505c29sm2980736lfr.218.2022.12.29.00.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 00:04:21 -0800 (PST)
Message-ID: <ba935a94-ccd6-e062-a9f4-2431cc69f097@linaro.org>
Date: Thu, 29 Dec 2022 09:04:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8186: support rt5682s_max98360
To: Jian Tong <tongjian@huaqin.corp-partner.google.com>
References: <20221228122230.3818533-1-tongjian@huaqin.corp-partner.google.com>
 <20221228122230.3818533-2-tongjian@huaqin.corp-partner.google.com>
 <cae5273e-aac5-0c4c-6686-fb2cbc5379e3@linaro.org>
 <CAKKM_AVxcSW+ZaTbMuR-+=Fbkr64Arm2-3-MPWmoYV9Dpxkqdw@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAKKM_AVxcSW+ZaTbMuR-+=Fbkr64Arm2-3-MPWmoYV9Dpxkqdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 chunxu.li@mediatek.com, nfraprado@collabora.com, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, jiaxin.yu@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 ajye_huang@compal.corp-partner.google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 29/12/2022 02:57, Jian Tong wrote:
> Hi,
> Yes, this is my full name.

Here you use different, so that's confusing...

> 
> Best regards,
> tongjian
> 
> 
> On Wed, Dec 28, 2022 at 8:37 PM Krzysztof Kozlowski <
> krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 28/12/2022 13:22, tongjian wrote:
>>> Add support for using the rt5682s codec together with max98360a on
>>> MT8186-MT6366-RT1019-RT5682S machines.
>>>
>>> Signed-off-by: tongjian <tongjian@huaqin.corp-partner.google.com>
>>
>> The author and SoB should be full name. Is this correct (full)
>> transliteration of your name?
>>
>>
>> Best regards,
>> Krzysztof
>>
>>
> 

Best regards,
Krzysztof

