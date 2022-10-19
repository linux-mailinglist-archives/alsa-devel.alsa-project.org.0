Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F067605D5D
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 12:38:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 018E578C3;
	Thu, 20 Oct 2022 12:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 018E578C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666262331;
	bh=q9nRsZCoAOewUqC0OKRozLS20h7EdqWHrpW7IUo/JLg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VgUdKGdaDMh1oJg0bAVFCwBSxPsDEriwH21rdhvkdjAzJqHBkYMaEaaEoEFF0LnfU
	 nVXSBfxAmFsmtmmpHu7kgizr2elOBzS1NSvCqH5bBuOu8ncZLfMG02/Jr/RYd1d1Nw
	 VY4vDOUQmNjj2R8meffTBZcEruT5hhhruxok6ypI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9422BF805BF;
	Thu, 20 Oct 2022 12:33:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBFC9F804CB; Wed, 19 Oct 2022 10:04:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B8AAF80166
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 10:04:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B8AAF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZrTqVkqV"
Received: by mail-wm1-x32b.google.com with SMTP id
 az22-20020a05600c601600b003c6b72797fdso13987667wmb.5
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 01:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mD8mi2JszaH1k33/UBfhukYZCATUxC9PacHcwmGKqNc=;
 b=ZrTqVkqVhFY4DL/Q15eyshVUWDd/XM5Z3ihENePjEPRfOuGyyYvXapCYD9o+EIf4lq
 P+TmmFUKcu9hYx+rY3pQrIS8i6YwPTJTvqdjRSsOtZNaDYTNu4DbWnOzq7rkb9MsxQpj
 SmErrUDdc/8sat+hM/0bUBhoGS6z/mUaYdD5uy0RYNo7MiGIqe+i56GRHMwDY/d06jlj
 o2sdD1IMei0gY9cwGvlkTJANRy862e4JgUjBK8b/r5SKN8rnydTxYXKAi93N21QiUpFq
 7mPtc6wplHmbxijqcDU1rf+M2dUNoQ+NXJckz6srLMJqVVSBTQelCTMUI8lERNR6Tnxc
 I+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mD8mi2JszaH1k33/UBfhukYZCATUxC9PacHcwmGKqNc=;
 b=UE7IW2GUoGk2FTRZ4gOGGXAS1hzp8JIo7x0vY80DivIDEHCraAkSbl7y36AjY2NAea
 UCVJFspZ7uRlFsNWIQR7ZeYBBgz6vXTQOUeS2BwZXLHsFEoX8LBz1itlVXFAbnPQXCYe
 ATRA6NtqE9HEnCr+4uG8/zHAhEJywz8yQcZ1yujmXpbIHhT8eBnXN/EidtFGIjCFplPG
 wyzU61Vs6/89cSmli5NYF6tE73Dat1gLb1c792ER4dikbJ44ik+ucBZW8zh7s0JKWqiU
 tBowkeB3MSY0hcDwFUjV9rgkmI5f3j1XpluD267unoQw7Q1DZYRDutoY9FPca1ksNtAz
 dQbw==
X-Gm-Message-State: ACrzQf3YvdKtuP+diqReG4kzw1oJey6T3e0Sti9tnyWwQrxBqUM4/xA7
 8PwRkliayj+j3dKDhVpII1Midw==
X-Google-Smtp-Source: AMsMyM54GYff3yCiXQvFC+AHAJzd3YnisbrSiEZIoubPBlylWsDjFtWcR3Lbj5qC5P1aK0srzw9oGw==
X-Received: by 2002:a7b:c00d:0:b0:3b4:6331:2fc5 with SMTP id
 c13-20020a7bc00d000000b003b463312fc5mr24864643wmb.11.1666166651714; 
 Wed, 19 Oct 2022 01:04:11 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n4-20020adf8b04000000b00231893bfdc7sm14030545wra.2.2022.10.19.01.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 01:04:11 -0700 (PDT)
Message-ID: <ae6c7966-2838-2e43-0455-30c69ad303b7@linaro.org>
Date: Wed, 19 Oct 2022 10:04:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH][next][V2] ASoC: codecs: jz4725b: Fix spelling mistake
 "Sourc" -> "Source", "Routee" -> "Route"
To: Colin Ian King <colin.i.king@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-mips@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20221019071639.1003730-1-colin.i.king@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221019071639.1003730-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Oct 2022 12:33:17 +0200
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On 19/10/22 09:16, Colin Ian King wrote:
> There are two spelling mistakes in codec routing description. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
> V2: Fix "Routee" -> "Route" too
> ---
>   sound/soc/codecs/jz4725b.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


