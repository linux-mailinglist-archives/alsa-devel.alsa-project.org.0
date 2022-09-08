Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 925075B1F4F
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 15:34:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4392B171C;
	Thu,  8 Sep 2022 15:34:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4392B171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662644091;
	bh=odTm4tfJNIL8aKQRdt9uBaIW0CvhE7WKe2BkIeMjnUE=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=raqEbUy/ZwZJL/FoLkwysAjESo4EHBLzaYLUyndwJdWB2V2C30LsQfc8OF+xTXA94
	 3pUvYS/AyZUvRCNcTWkS1d5eckyKKKVsxgjUN6SsmbMkZhaKkCQGUkm+iQn3rUeK9u
	 2jvcKUp7H7Eh4eHM15AiAuSNbmA4GPyhpR3MziIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8A0CF80527;
	Thu,  8 Sep 2022 15:33:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51118F80527; Thu,  8 Sep 2022 15:33:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1E7EF803DC
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 15:33:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1E7EF803DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="eovUKAtp"
Received: by mail-lf1-x12c.google.com with SMTP id k10so13138211lfm.4
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 06:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=e8wSZ6/ARvfoxWmxi51W3Fwm24Kdxtc42HcCeMYjHNo=;
 b=eovUKAtpE41UQW7qGW3eBcEEErnGOyTG65Qhl07fuirqov42GeV/tS7+eyubIuQ41D
 9C8X5jIjRhUlA8dLUNTnUJRdm+Ww98oWWUrwe4WjSbF1BjqlPT2AsxQRhgSvYMYlVWFG
 /iz6/heE0L2L3W7hVpOUGZLVcSopQHgXR71p9BCE8HlAaYMK8P2Dn2hl347pMQIBs0GM
 k4hydZJaSqyzxwu5971dlm3YTqqSFpzhkCfC0d+y13Xv+OSjSp0046zhYQCXZ3ouEozI
 1MCl4ABoP8vsvhb7OSY2AYjkRvg7DOttzZAye35pRA48tjCOb4nRNrxeWSCtucEAHT4z
 Dilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=e8wSZ6/ARvfoxWmxi51W3Fwm24Kdxtc42HcCeMYjHNo=;
 b=b8rHp+aQJ3h6Kff7vGr0eM/ok9U1tI18soB3IF4rh3d9AoHE+h4+t/36yqQj32ci7Y
 1OLGIfgrcqBPlGXnPFTyVfIiVQSKDqq+p1ZJIPQrG2DlSlVzNittwpD4c2zSu3LK5OZ0
 oBQFtN5nqU5pCbxxUswjVEL4f18vqHFQ8bctTS+tGzmUygC4/pvK9rF8tbCQdxg0PaII
 LMX4PZ+pqcRFlxpSYFV5sK2tFPkBd7+elbT2fmQkLIhy2cvRVbcGV6OBASo+gusc1sld
 WKXjJ48Kg9hv2gWUILjglqjVR8xqpwn2vDQYKeqb4tWrYvjToqeMcBFPvKyyWLZlVBcH
 QFUw==
X-Gm-Message-State: ACgBeo2Wk8Fpwwgl8vmr76Ay0UzuyYC8vOLcOWAWGeWgSY06spUNQy9Z
 DzXtLAB2NkPIa6nVAZEyH+vH/g==
X-Google-Smtp-Source: AA6agR6/6BS21FEgKD1GoLv4nnZaenZ5VuuECe+4AmpJvmNHsdtsf2joiv/84fftEPb3wab40df7/w==
X-Received: by 2002:a05:6512:2605:b0:492:dbb3:9b85 with SMTP id
 bt5-20020a056512260500b00492dbb39b85mr2544346lfb.669.1662644027956; 
 Thu, 08 Sep 2022 06:33:47 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 i22-20020a056512341600b00497a123d8b7sm1451870lfr.172.2022.09.08.06.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 06:33:47 -0700 (PDT)
Message-ID: <b70236b8-acae-05b8-1344-47db082f60ba@linaro.org>
Date: Thu, 8 Sep 2022 15:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 3/4] ASoC: qcom: sm8250: move some code to common
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20220908063448.27102-1-srinivas.kandagatla@linaro.org>
 <20220908063448.27102-4-srinivas.kandagatla@linaro.org>
 <6e6b12aa-f516-6ea1-58e5-f46033b84985@linaro.org>
In-Reply-To: <6e6b12aa-f516-6ea1-58e5-f46033b84985@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, bgoswami@quicinc.com,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 08/09/2022 15:31, Krzysztof Kozlowski wrote:
> On 08/09/2022 08:34, Srinivas Kandagatla wrote:
>> SM8450 machine driver code can be reused across multiple Qualcomm SoCs,
>> Atleast another 2 of them for now (SM8450 and SM8250XP).
> 
> s/Atleast/At least/
> 
>>
>> Move some of the common SoundWire stream specific code to common file
>> so that other drivers can use it instead of duplicating.
>>
>> This patch is to prepare the common driver to be able to add new SoCs support
>> with less dupication.
> 
> s/dupication/duplication/
> 
> 
>>
> 
> Assuming there were no changes against v2:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I see now ifdefs. Seems ok, so only the typos above.

Best regards,
Krzysztof
