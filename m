Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55370219C39
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 11:29:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8FEF86F;
	Thu,  9 Jul 2020 11:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8FEF86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594286967;
	bh=J9MmMc3Q+dTaBRsor8i0a+UAF33fb3dfeyy4bczKzM8=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DpB+LLAH8GVaGqFXZZ8La7Fgb/hxpBLIxqh/UAgQztmGj5VjjQ5dAQcZfYkxsVWsa
	 LjySlPj0srmDqYggBB1v8m4yTAofoGOIDbEQ27ZapwZJT0zxG/KuhNm3BYysgU2Ix9
	 7b00l5IDwTZSYEYHL3zvC3iiyCm+i79JwxhzX95M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC1C1F802BC;
	Thu,  9 Jul 2020 11:27:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56829F80216; Thu,  9 Jul 2020 11:26:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21181F801F9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 11:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21181F801F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="r+8IA1u2"
Received: by mail-wr1-x443.google.com with SMTP id q5so1575712wru.6
 for <alsa-devel@alsa-project.org>; Thu, 09 Jul 2020 02:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+1I4jxbnB9+pwYCD3ssRtU/qs6gk1hVZpkfZD/YCMGc=;
 b=r+8IA1u2+7fPZ1dedoERCi3QiSAfaM0+gRSpXR+DH/UDV6OckrN2sWpeiLyd8JDPQq
 Lcv1iefAnqZpljE+b4p/oZgBEof86DD2FyIGQrl4s51ElJiaOrvhe1UauDNrp7dxaozw
 LZTF5M+pwN3OCCHFzZ5Jp7Hkcl3mDQrCXNmSRh2FEM1/GY7y6ijkoEucQ+h1WwV8oVvR
 heeBhuJnyWJMrze7v5lJ2yTMQC+DR8gAd1I94EPDyjuzNL+PpYhElDCqYJLn/c09YyIu
 UGC+AhRNBrtLpBfCJpZCyI77IpfKV83GFNLQh9XTwstaNNLX8iCWSFPWUof/lbg7JB1Y
 jU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+1I4jxbnB9+pwYCD3ssRtU/qs6gk1hVZpkfZD/YCMGc=;
 b=r4oM9HjDvoMRMsIi9TFnBsa5MpAL0rY9XVLkixPxd+YQBE58AyBHamgWFF2sWsEgnD
 0PoPbS0rZWJNdFeVNjBqkGc+jhn/MvSVMGVSLrFXXinJ+mWRGEfn+0sHdFMg83edJezb
 axZtwH595eU/sNwDH9R15eBIAwgjMiYZDPbrdly/aoQoYMR9eHROqsZkPZdVAw7wwCss
 R6DnlIRK3Ekup2KSjwjbkcUZvaj5Ip2pPrawFwPeDqhX0gARUtCcohFxb9ffnJvwLAkW
 prf+dDe5G8SIjf9u3kkKo1vh1MrL2GYAyrmptjqjprmJLS2SaDDTxntAtiavWqaAdeNM
 AoPQ==
X-Gm-Message-State: AOAM532bz6FxQP4XBTdoXSKjhKRqkxbeku9H7k6X4xPbVXaGo4ePcDcJ
 9jpVcsRjs5AdNPFm1gvLLwWpxg==
X-Google-Smtp-Source: ABdhPJwjQruNF0J+1UG47VW6l2CSzlcWt5uo3fjSlpR7URmTB6krRcG4ZUyPGnTaYu3dCAsJO60xmg==
X-Received: by 2002:a5d:5651:: with SMTP id j17mr59680045wrw.145.1594286810655; 
 Thu, 09 Jul 2020 02:26:50 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id c15sm3888495wme.23.2020.07.09.02.26.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Jul 2020 02:26:50 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 1/8] ASoC: qcom: Add common array to initialize soc
 based core clocks
To: Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-2-git-send-email-rohitkr@codeaurora.org>
Message-ID: <ee41f6f5-8677-5342-166d-1a71471dc178@linaro.org>
Date: Thu, 9 Jul 2020 10:26:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1594184896-10629-2-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Ajit Pandey <ajitp@codeaurora.org>
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



On 08/07/2020 06:08, Rohit kumar wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> LPASS variants have their own soc specific clocks that needs to be
> enabled for MI2S audio support. Added a common variable in drvdata to
> initialize such clocks using bulk clk api. Such clock names is
> defined in variants specific data and needs to fetched during init.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>   sound/soc/qcom/lpass-apq8016.c | 39 +++++++++++++++++++--------------------
>   sound/soc/qcom/lpass.h         | 10 +++++++---
>   2 files changed, 26 insertions(+), 23 deletions(-)

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
