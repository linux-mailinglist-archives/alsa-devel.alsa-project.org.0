Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 279A529D042
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 15:22:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 750C7166A;
	Wed, 28 Oct 2020 15:21:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 750C7166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603894920;
	bh=IjAXVP6v+gbArphnQngPfMdNL6BtuUxnMRBX8lG/fuI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r8mdV3eg9U5u+wWJWIObb9y1B/mjjPjvl0HhI7yvLVXSJMva4fHj7viW3Yzx7mvrN
	 jFpdScphzKJHsHln67YcPL5fAhh8nmfXDnD8Ff+0dzbZ8LaZ8UeBo0DlBjvE8VZ0RR
	 QxneRCsfi9SCKsDchbcU+dN+VRrQIPn22oMqdxfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F1C6F80212;
	Wed, 28 Oct 2020 15:21:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E6EBF8025E; Wed, 28 Oct 2020 15:21:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29503F800FF
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 15:20:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29503F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Gy+sIahM"
Received: by mail-wr1-x430.google.com with SMTP id y12so5885828wrp.6
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 07:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=obX9bOfBc5uikoFMarb3dNU1LogIPrbFVnFPCam7D9s=;
 b=Gy+sIahMxUApJBBwADXHtP9oKZmq9WOrAPXB9bJWMCLxyYQl22CBrKvU3OKhA7ZAbN
 Zkxs7rKZ1glFXqBA+nDP4Nh+I/5ypuJhD3PPkuXJEnQZtIuGYGlTTJRgPDayWN2au9pP
 jzYnYewCUQon28ISS19O6pd3uI0qI+KssN494XGBEyybM3KFme8muyi/zmp2C2nt9Ss6
 kubMy6fvOn0nveo72eGyblra0v4VU7CEkEvXl9Ojo3npCwq27G9zV/hdO4krJRR2cOxC
 ti4N9hKS+zs/nWsfP/27lCCATIB4TdK4LHtz1QJ71EoC2X9n/PW1UU23NB1nia6y7sMX
 kDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=obX9bOfBc5uikoFMarb3dNU1LogIPrbFVnFPCam7D9s=;
 b=mzPPBpu1kXanjnQUcmlrLLnLqgW1yQijuQdfvcuyJSCN0Pvr1vM4Cm3kmupFPHubqU
 GEbPfADxgIR9hi3vMJRoQUBZfn4m9JygVIM063Hnr6W06m8D23uBHPoYCXSkUC/QS+4n
 I2P0KJ3EmLRxyC0Z5AvT+uLJcsl/cvOqyiysQNRmsFAN6uJ8EZ5i/zxZaAPKyqxLA6Rr
 Kfxbf58th4ZiLzCknPOuKkmQQunkYClSfDRqa6JJ9d4qTRYt66hbC8CChdBsRoGMfKun
 XaKShxPXk9AXq8SwIoVF3cmH9YGoqGPm2wcV256n1Tvs7ir+5uGV2S2IPJJfvyq9ohzF
 MfpQ==
X-Gm-Message-State: AOAM530Ubudf0NDQcz//iEdo+X+TGzO6UGh8sI+Iah0Az+wcaW/1luTv
 xkXFxnycNeR7YzazVZfIY8atkGBA0jXpBQ==
X-Google-Smtp-Source: ABdhPJwiD7zU2hdGncHxTC//AnN6ATPTo0Cfz9yxiGD7wm0p3+gr8xeT014iGEUOF1AzkWJEcxeoqw==
X-Received: by 2002:adf:9361:: with SMTP id 88mr8873458wro.37.1603894858300;
 Wed, 28 Oct 2020 07:20:58 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id y201sm6549626wmd.27.2020.10.28.07.20.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2020 07:20:57 -0700 (PDT)
Subject: Re: ASoC: qcom: sm8250: add sound card qrb5165-rb5 support
To: Colin Ian King <colin.king@canonical.com>
References: <f441bb6c-12eb-a565-c34d-950da2b045d7@canonical.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <66ba82c4-f08a-2e35-385f-8822934b2c54@linaro.org>
Date: Wed, 28 Oct 2020 14:20:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f441bb6c-12eb-a565-c34d-950da2b045d7@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

Thanks for reporting this,

On 28/10/2020 12:15, Colin Ian King wrote:
> Hi,
> 
> Static analysis on linux-next with Coverity had detected a potential
> array out-of-bounds write issue in the following commit:

Sent out a fix to address this!

--srini
> 
> commit aa2e2785545aab21b6cb2e23f111ae0751cbcca7
> Author: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Date:   Mon Oct 26 17:09:47 2020 +0000
> 
>      ASoC: qcom: sm8250: add sound card qrb5165-rb5 support
> 
