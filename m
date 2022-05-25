Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C20D533D28
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 15:03:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 123FF167F;
	Wed, 25 May 2022 15:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 123FF167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653483818;
	bh=lp3retmxFgxL/vxo9iAbTpFRo2pjR0cqKW2CT4kzrnQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PHBLVYWE/SxqR/vDtpfzsXFyLXDa8TNGDsW7CCxxOknMHTlo3UvMmQZGmhXKfs0SQ
	 OTydgiGTSb32zFbCdC27QoF3rB3mHmaTnl7xRNpWsCBue3FNiVr7O3RZyE350fl7Tt
	 l731FBQHgNVxJpzNfqVjwutb2SwXQXmEfBtXfJD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70EFDF800D0;
	Wed, 25 May 2022 15:02:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BC06F80116; Wed, 25 May 2022 15:02:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C65BEF80116
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 15:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C65BEF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DC523R3K"
Received: by mail-wm1-x335.google.com with SMTP id
 r82-20020a1c4455000000b003975cedb52bso491273wma.1
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 06:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ShM29w/vVaGDNZH6SQ+elqm5Fkj2T/cmtp459+NdGvY=;
 b=DC523R3Kj5+sEGuWNh0elaMU5MaxCnPKBd/OHbWaN64EkhSuxDVvbE27zNOMV9uqEF
 Ay5hZDcXuDe6mfQRenZFBXOXW0FZNQc+CXfNxnO7xAdIZ3jBzGd62GI5mhUTo4l1d4CT
 REhZ8VDI2Cb1yggAbpyLTkedMuNypupWyl30tfmgsGvLF6DH9QXcYl+5wsem5rjDqUvf
 I7QWyKBnPoMOHwpsxbfxUSf/rTVB4LtkAUEMTvvgwLLRCy/xxwIE/D8BZifvtLZ4MpqK
 Fg7B2b2xoJ2plau+y/IDB4lputdpmI7TwUaBr1Lh05ljTT5zSVr+SVcClR9qcSHvZGrO
 hE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ShM29w/vVaGDNZH6SQ+elqm5Fkj2T/cmtp459+NdGvY=;
 b=coUY44/Lle7mPhi0EJ5vp4XoUy7vIdYvJEoneQsiwCjkfHosuAWXN2cyRozk18dxzD
 powqy3KnF4174ep5GdoEo/Jd/ntw+E8wJdlkTuZgDg/Zd54jGSQvd/ZSJd0ag6yh7p1e
 OlvvX2gHLkgPZoC3vOZLxqYqnWTVRWwDQ1KDOa/nMQ58tG3Hhh+S9LbdbP1mcOb7N2S8
 xC4KuIq49sIyzWoDfRFFZxKSmdhr/QhBdesteuRw0LjwtD0wB51dw8zqKMAIaBF1mtdi
 JijF9fE6GpYNkZU0dn1yQ24oqWE5J+MSgTcbGi3UiojoatQxPM1yrvH8MKhM8ZcZIkJK
 SvOw==
X-Gm-Message-State: AOAM532JdOFEmo6+fMROgMNf1Nn8Yw8ytp3bOLUJcuTujCUYkoiiDKL1
 XYGMHAKbEv4rVsj+ssUlJMtCbA==
X-Google-Smtp-Source: ABdhPJyCU/WlGbiJ23Bg2bLlydBnQBDzhQyihPGzenV0sdMKEc3WN0iFkXg2CK+J1+ZQtgJOfb4NQw==
X-Received: by 2002:a05:600c:1f0e:b0:397:707f:5a60 with SMTP id
 bd14-20020a05600c1f0e00b00397707f5a60mr1904691wmb.3.1653483750750; 
 Wed, 25 May 2022 06:02:30 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c1d0400b0039751bb8c62sm1869799wms.24.2022.05.25.06.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 06:02:30 -0700 (PDT)
Message-ID: <78da8864-eb65-8dd5-cde5-0c0fc63b9ebf@linaro.org>
Date: Wed, 25 May 2022 14:02:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 0/2] Fix apq8016 compat string
Content-Language: en-US
To: srinivas.kandagatla@linaro.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, krzk+dt@kernel.org
References: <20220429220349.1142759-1-bryan.odonoghue@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20220429220349.1142759-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
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

On 29/04/2022 23:03, Bryan O'Donoghue wrote:
> V3:
> - Marks qcom,lpass-cpu-apq8016 as deprecated instead of removing - Bjorn
> 
> V2:
> - Adds Reviewed-by: - Srini
> - Adds Fixes - Srini
> 
> V1:
> Reusing the apq8016 on msm8939 I found running checkpatch that the compat
> string for the LPASS was throwing a warning.
> 
> This is easily fixed by alinging the YAML, DTS and driver to the documented
> compat string
> 
> -			compatible = "qcom,lpass-cpu-apq8016";
> +			compatible = "qcom,apq8016-lpass-cpu";
> 
> 
> Bryan O'Donoghue (2):
>    ASoC: qcom: lpass: Fix apq8016 compat string to match yaml
>    arm64: dts: qcom: Fix apq8016 compat string to match yaml
> 
>   arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
>   sound/soc/qcom/lpass-apq8016.c        | 1 +
>   sound/soc/qcom/lpass-cpu.c            | 5 +++++
>   3 files changed, 7 insertions(+), 1 deletion(-)
> 
ping
