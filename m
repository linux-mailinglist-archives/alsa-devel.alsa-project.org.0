Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61614439CB8
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 19:03:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6374016E3;
	Mon, 25 Oct 2021 19:02:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6374016E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635181390;
	bh=wA0i9IYcOKcu4CkBgTuLX/qFg6NZ/GJmbAF00esJM6g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tqMcGDbb97o9vj/MsaZO4JszuaKUPe+rApHDlGX2xJkGqAZPifblnL/LDAt85Dp1i
	 gQ+E64mnkXwr80ooOrZazGbeBh3LQfN+jKAKPoRAtQMTNTtO6Mtf19v3pMsI8ojXmT
	 H6sicshWumFCoRj1ZVFrumMsUB+KRbZbAmQg9bVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7D8CF8032B;
	Mon, 25 Oct 2021 19:02:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02D5BF8027B; Mon, 25 Oct 2021 19:02:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C80CF80086
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 19:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C80CF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SHeJYP3N"
Received: by mail-wm1-x32e.google.com with SMTP id 5so1651050wmb.1
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 10:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zhWVNgXFzYIwi+xlrMpHOToyn0X2X7tNzr/emG5rE0A=;
 b=SHeJYP3NU0yZsCRPoP4gnPGxPNuXXzc1WFJl8TcMMjD4K4seLMAZ1iyXZxazbCc9Sx
 75MRRaF7AaauzD4Bkk1MTKAfmQcUE5R8p0m4sPzjf7Bn05ENQccP4lBigrKOtv61NuQ1
 zkcWYTnb5k2xyC64PBuPOsi4x9Wl/smJ2tLJzvGOTI5kXHuxhnro1PCwMorssy/yMJ6+
 ptYYjgFMxdBMtZ8/WTTLZ5GlH+zXWBV7e99Li/ytkVcRkzH1z2rbg9BcoTkxMsRsCrA8
 keyTKIEerp0TOaPrGFh8tH1dNYoMlASsm1p1Jt2+CsDjN47i98hawuIdnG1t7870AL0i
 Fk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zhWVNgXFzYIwi+xlrMpHOToyn0X2X7tNzr/emG5rE0A=;
 b=CT/6qXrX7zBf92H6n3V/EeEuyUJ6ekquqYxW0RB48Zp8kMR5zZ089SCE649cLpS+rH
 9uK/baYndvQpZBuhFHlQhWCrim1aAJYmIcCbIhsbYOBA+elcMYFuMKEwWQpep8a3TA6O
 B9uMa2DinTA4R6cECG2PhlQgG9/R9H0S+9BbxMloD3ZGjXrXE5zO0jpugB342keOCWDg
 G29DDMkWqxGz7TBfC0MNcgVpYvQXvN4sQIL2Vt2VzQ59IoTO74EvS8+vaO0uY0W6sTlp
 XFFaYo2T8yRZtHxl69IWEJuEwjNJT3yTLdQP9C2jh5uRhPy/SXghcVgvfFQXB9ELh+Bs
 oR9Q==
X-Gm-Message-State: AOAM531y/FnU+akgQt1QqXDM8hCz52cEESKhuf0qQh+4gx3fzPLwVBof
 QpafH9uGKdHtwHyEYVApOfBZO5mTmo1MQA==
X-Google-Smtp-Source: ABdhPJxkIF2GK+nUNNFvKfJ/di1huy/9I9tcRlcFhc8uSkdbTpMLxBPaHKlj2gsxpqTh9dSW2+ST8w==
X-Received: by 2002:a7b:c5cc:: with SMTP id n12mr21588846wmk.43.1635181332906; 
 Mon, 25 Oct 2021 10:02:12 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id y5sm6913973wrd.75.2021.10.25.10.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 10:01:55 -0700 (PDT)
Subject: Re: [PATCH v9 12/17] ASoC: qdsp6: audioreach: add Kconfig and Makefile
To: Mark Brown <broonie@kernel.org>
References: <20211006113950.10782-1-srinivas.kandagatla@linaro.org>
 <20211006113950.10782-13-srinivas.kandagatla@linaro.org>
 <YXbdQkAkRq0ntpLk@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <24890938-f2a6-f1d4-871a-f8a13557f725@linaro.org>
Date: Mon, 25 Oct 2021 18:01:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YXbdQkAkRq0ntpLk@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, lgirdwood@gmail.com,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com,
 bjorn.andersson@linaro.org
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



On 25/10/2021 17:37, Mark Brown wrote:
> On Wed, Oct 06, 2021 at 12:39:45PM +0100, Srinivas Kandagatla wrote:
>> Now that all the code for audioreach and q6apm are in at this point to be
>> able to compile, start adding Kconfig and Makefile changes.
> 
> With the previous issue fixed this continues to break the build for
> arm64 defconfig:
> 
> ERROR: modpost: "audioreach_tplg_init" [sound/soc/qcom/qdsp6/snd-q6apm.ko] undefined!
> 
Sorry Mark, This symbol is in in 13/17 Patch.
I will resend v10 fixing this issue.

--srini
