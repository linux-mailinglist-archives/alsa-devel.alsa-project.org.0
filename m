Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C71BF2C3D18
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 10:59:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 466EE171C;
	Wed, 25 Nov 2020 10:59:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 466EE171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606298392;
	bh=r55GRKztIc+pm27XxppS3VwMeqvETVg1Zo1KuD90sE0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AfBdsCkyoWLPC9blJQelvem4q7+qTM5ns465g4YwYBM3tAmX8MRmKxMpIeAfCr02U
	 Xi3xc3FcvPPUQQa2Im9DLbMl6pJvzDNqTGRervFI/QIOF1jSfwOPErTpIRUANZ0pjN
	 oI1qiDYkGjmTPwz75qVhTu8xGxufRi+Uzk6LVut8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFCFDF80218;
	Wed, 25 Nov 2020 10:58:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D7BFF8019D; Wed, 25 Nov 2020 10:58:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E1F0F8015A
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 10:58:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E1F0F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Uj5LRdof"
Received: by mail-wr1-x441.google.com with SMTP id r3so1283837wrt.2
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 01:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IGoyXBsorWkLQoXFObTVk+nYQCTZv7J02NxoMaKjTAY=;
 b=Uj5LRdofKuT8+5FuGdVIteQYraSKJiu7/YfKp8bInFXi+d70QuXk1UUvcs117qs9DF
 xpgv8U4MZw5rAFBG438njOVGOeDntbEyDls/bx+XrHV5ULhNCDI4UgkwmdFDrIk8s9vj
 Owabze74c/NFpNRl7Etx2ax2UQEpeYmoTzfHGPzhipelcb2qTEhTWYRCC3UwDSIn2dOJ
 ooxPjoN5/UBk4M1gPlKVDfX7Ncfb9rhsEdeXpSx8MKMWsAO1ygyClyaC1FjEK5DpiHBJ
 Jrgbc375NF22Ti0GBpdVS6+g6n68qV2dKZBW9xws7yVXSvD+lC9zyH10RxCT5SezhjMS
 8G5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IGoyXBsorWkLQoXFObTVk+nYQCTZv7J02NxoMaKjTAY=;
 b=PGIECmptil1MRrJEaL4owS0WEh5uI613QkmNaE8FSRjS2Id49CdN7XTLoSZLnm5vps
 a+AWp+jZ82Kok+WJMcZZb39ecKmMDPJ9nu1aketNOrqAi8bwnRSYgeHzCBk3giPz4Di8
 HiFfIDWh1+PR4Vb/cGQzZvqEmpJsJzwA17uS4Q9YTiYWXsbCCzpMfCEuCNulFhKq6ZkH
 q90CrXzOn2+fMTQR36OkBfSgrqll5ChUbRfe0HZdyIkD8urFVluVemdv3e4hpNfp9N3I
 ZKvRSiGHimxzSMhVXnGnNsU6CVn1irfV6MY5laY7ZuNivCi38DD+8b53EoD0MSWJiH32
 ezxg==
X-Gm-Message-State: AOAM533pytCZnFElE2YIViev1p6tyUIav8oqltcAXZjbxByZkEKDPuJd
 h1axl11tTa7QDU+dlO8hrJ2wXg==
X-Google-Smtp-Source: ABdhPJwwJEoDVfiJEDcAdp12hLdqEk12t7E2J/3yeyUwAU16zYFlKjqpQdsIf/Z0BjD+fAhAB5dELA==
X-Received: by 2002:adf:e5d0:: with SMTP id a16mr3269628wrn.340.1606298287868; 
 Wed, 25 Nov 2020 01:58:07 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id b4sm4153093wmc.1.2020.11.25.01.58.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Nov 2020 01:58:07 -0800 (PST)
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Avoid sending power requests
 without QMI
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>
References: <20201125054255.137067-1-bjorn.andersson@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a92ba901-283f-e0fb-54e0-af6c87bbd44a@linaro.org>
Date: Wed, 25 Nov 2020 09:58:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201125054255.137067-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
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



On 25/11/2020 05:42, Bjorn Andersson wrote:
> Attempting to send a power request during PM operations, when the QMI
> handle isn't initialized results in a NULL pointer dereference. So check
> if the QMI handle has been initialized before attempting to post the
> power requests.
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>


Applied thanks,

--srini
