Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3378F41AAF3
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 10:48:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 833E916AF;
	Tue, 28 Sep 2021 10:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 833E916AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632818915;
	bh=YKS9wXgavjYrD2k1xqrS8ggxPox6+jIiO3z7nWDiFNM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JTXRGKygtjvJ8S/t91gjgRh9/7zqYf1NTXHAEpeYQfe0vlxZLdgfyQR4Y/yQZTlLb
	 UUENSIaHZCxRqmQ56JTEvVVoW5YMW+naEe4ZR0QMBnPCf6JltBbYTyauN1RHMVe5+9
	 NRKOftvxcLjnXxN2i2SwZ7VlWerQBy9wlNRw7Ks0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F7FCF80161;
	Tue, 28 Sep 2021 10:47:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B44DBF8032C; Tue, 28 Sep 2021 10:47:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F877F80105
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 10:47:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F877F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XD4/CFuE"
Received: by mail-wr1-x429.google.com with SMTP id x20so11961391wrg.10
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 01:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q8rK5Dzb/jMqPaX3ORZJ7Av9oZsLsOp10vNNKPPKavE=;
 b=XD4/CFuELn/pGviHeMZrg8f6WwcT+vcqpMlExj9sWsdhMMldH3+DpuN/9v0/nf3cvM
 graq3mXm/LtQrdwKccXXRN5yXRT1b8c2XwiAapUS9pe8FzZGgBX/ng9uxpn/FMcew6yD
 5sBMcmQuLCZN+01awN06tuPC7j/g73j/UlD7YhnjcZcwxAXDXbXMno60iPm4sNlJik8J
 +upVS/lMTguZn5QQ/vxloORLXflgJHQ9rkMN9UxnN5F59PPx+LxADbKHHo18GB+0fQ+V
 LiL1yQZPn84JPqRHn9k9AFNxReq1uWtyM7bQJjv171oIiGKNBTUkOPNPre3jUeo7SqJN
 6xLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q8rK5Dzb/jMqPaX3ORZJ7Av9oZsLsOp10vNNKPPKavE=;
 b=yWHUXPsNLtTygiggxLxBTCwBnuHrIaIGGup4t9RvZ3V+KDgWi34dgSPLdD1swiXUqb
 3cBZmODX0qtCvWdvqPB3JaWFL6LPHVjx8zI/B/YfoA1bnTqlbY+3adT1/C0e5koLa36i
 qCbB5KM5yIWOVRM2ptcbyVkodoIsWKMCbMV8+Gc7YCgHQpULydm7ZpDG3KGPwYihkvDN
 Pr5prQAmCtfP6Ww1S27hSGj4nRxc9xxAcwbVq3YcL3hFOSRQat75BUyLqVRnvReCgd2X
 +PUqhQR+Lu9KNNXoufytorgKrbNMSwnO8EkeSY0nZ618DjHN4Pk7Jy8fP03hoxEzABf8
 P9og==
X-Gm-Message-State: AOAM530Z8AJYY1hbW/KFmNQmS4Rlv64cOaAbCFpsD3RQ8/Jl2+/Z9q1M
 jEynPoiFfSLKSpfgmEo6ePaKb4Dmd76GHQ==
X-Google-Smtp-Source: ABdhPJxKnmR/HAxZsSb7dX5Tvj9qxkte5BVwAOsfFoeXcWJLtn7wmSjh9ilmVUjnW/uWoa0Y3zkqHQ==
X-Received: by 2002:a05:6000:1562:: with SMTP id
 2mr5029099wrz.36.1632818857757; 
 Tue, 28 Sep 2021 01:47:37 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id e5sm18973300wrd.1.2021.09.28.01.47.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 01:47:37 -0700 (PDT)
Subject: Re: (subset) [PATCH v8 00/22] ASoC: qcom: Add AudioReach support
To: Bjorn Andersson <bjorn.andersson@linaro.org>, robh@kernel.org,
 broonie@kernel.org
References: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
 <163279918313.1542640.4435970499489136227.b4-ty@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <56734892-26f8-dd29-ac87-5f270332c399@linaro.org>
Date: Tue, 28 Sep 2021 09:47:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <163279918313.1542640.4435970499489136227.b4-ty@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com
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

Hi Bjorn,

On 28/09/2021 04:20, Bjorn Andersson wrote:
> On Mon, 27 Sep 2021 14:55:37 +0100, Srinivas Kandagatla wrote:
>> Many thanks for reviewing v7 This version addresses all the comments
>> raised as part of v8 review.
>>
>> This patchset adds ASoC driver support to configure signal processing
>> framework ("AudioReach") which is integral part of Qualcomm next
>> generation audio SDK and will be deployed on upcoming Qualcomm chipsets.
>> It makes use of ASoC Topology to load graphs on to the DSP which is then
>> managed by APM (Audio Processing Manager) service to prepare/start/stop.
>>
>> [...]
> 
> Applied, thanks!
> 
> [01/22] soc: dt-bindings: qcom: apr: convert to yaml
>          commit: 985f62a9a13175217978a797cd8f1f26216b2c87
> [02/22] soc: dt-bindings: qcom: apr: deprecate qcom,apr-domain property
>          commit: 1ff63d5465d0b0bf4e69562096b2d3ec9ff1a116
> [03/22] soc: qcom: apr: make code more reuseable
>          commit: 99139b80c1b3d73026ed8be2de42c52e2976ab64
> [04/22] soc: dt-bindings: qcom: add gpr bindings
>          commit: 974c6faf7667e551d202712470ca210c14ca249d
> [05/22] soc: qcom: apr: Add GPR support
>          commit: ec1471a898cca38af6b8956a83ebc1297214546f
> 
Just in case you missed, rest of the series depend on some of the GRP 
apis in these patches.

Am not sure how Mark would prefer to take the rest of series.

--srini

> Best regards,
> 
