Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF84625F4E3
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 10:19:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69C7217A3;
	Mon,  7 Sep 2020 10:18:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69C7217A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599466757;
	bh=S/aXjIfdp+Vd70S45RbVZ/aK3Az2SGMxqSNsF8eO7Cw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yq5jljeE2w/S1D2YoksCKD57SvV16Gpg1MDsewgNOXGr+1oXy7s4xaaKVbCLyPIoC
	 ZEkLa5a7eU7AIrmHxKFYTNRiXiUjGi9MipqbIcIUvvvlOQPVbvN+K/7gOukYFZMWS7
	 xpZ/k3aHE5+jRPXLnmZN9epFZbPKtmW9zUkR6xKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F97DF80240;
	Mon,  7 Sep 2020 10:17:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63CC0F80227; Mon,  7 Sep 2020 10:17:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FC3DF800B9
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 10:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FC3DF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="N60YE/qv"
Received: by mail-wm1-x341.google.com with SMTP id a9so13292613wmm.2
 for <alsa-devel@alsa-project.org>; Mon, 07 Sep 2020 01:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e3Ta+K0mK8PpGvlCwRAXKhWKCtC3zo1Ck8yWJNQiAbc=;
 b=N60YE/qv46tYYNcmpPR8FroUI42HP4mXIwHEKFuWaGPimLjJ9X3TifejU9aqxqqk8B
 aE2FD/IljOK8O1Py57X18zSa7Q5k211I0qCnq7Urb7sSDcd8kX4aPn6DY1luVHtH4eHD
 FAw4gW7HXAtpTkTtBGw/V3hgmAypm+uug7M1ttHV6PbBictZ/TGCrnAjHm6QCAKIrnNc
 YMMVxDv5HKOtnlgM/RUdgkfSEnwOdBR1bOozmHY9Zhu3cpQ+uxZh5/Owv+Im8bBCJs0P
 CRhUs+rjqD+24Cxv7SEUdOnAcSz9GbvwH0Sz85YrrMl/O21+QjRNM2D9LTm+AfdpDxz/
 nHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e3Ta+K0mK8PpGvlCwRAXKhWKCtC3zo1Ck8yWJNQiAbc=;
 b=ASL2zqKM6Ofbre5EN7HibanIVYR8DqQI2PAZk0Fpm/2USoPlbVL3SqZ+BvLaG52uga
 VareGY4pgmiwWpJJbgP+J9Ovi9cTioFoyD2Pc8sXV22XKHB94xeXeSuz7066L7QPb3V2
 WQij8m8jbz8N22dR3lVfVpo7REmHvoqtQSoUOGNo6EoAuLt1xFzgDfVTq/CDUe4evCiL
 evuM79E+JbcwQ2TkRDKdm1ar2Funwvj74fqJzi6ReinE+Zav5yoksBQVn+vwqfzdjmcf
 9P7Yqlo40tFFYjbXI8+ybbfhg/y2Yf4R0S935JQHopMfm1jgwnnRaF2yg9DaazXMzTS9
 sCIg==
X-Gm-Message-State: AOAM533O2PNdsKaIIPTecd+HyHnihlgWQH3DmipbPvm7gM4iSH+oLdmh
 zHK4RZranllNDEty5QSTl9dNAQ==
X-Google-Smtp-Source: ABdhPJzqlqQ/xXSxZ0lbww5TZ6AZTnF7NA2XnTh1An/jnwbvuMzqoK0s9KMICLsQ2iJA4xPkNvSEbg==
X-Received: by 2002:a1c:3bd7:: with SMTP id
 i206mr19701901wma.162.1599466643283; 
 Mon, 07 Sep 2020 01:17:23 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id u17sm25259954wmm.4.2020.09.07.01.17.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 01:17:22 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] soundwire: qcom: add support for mmio soundwire
 master
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
References: <20200905173905.16541-1-jonathan@marek.ca>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ec241abf-c1e1-8b2d-a0bb-93a60241330c@linaro.org>
Date: Mon, 7 Sep 2020 09:17:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200905173905.16541-1-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 05/09/2020 18:39, Jonathan Marek wrote:
> This adds initial support for soundwire device on sm8250.
> 
> Tested with the "wsa" sdw device, which is simpler than the others.
> 
> v2 addresses some feedback, but I kept this series as simple as possible.
> In particular, I didn't implement CMD_NACKED from FIFO_STATUS, because
> the downstream driver doesn't define this bit, so I can't implement it.
> Soundwire works without it and It shouldn't be difficult to implement later.
> 
> Jonathan Marek (4):
>    soundwire: qcom: fix abh/ahb typo
>    soundwire: qcom: avoid dependency on CONFIG_SLIMBUS
>    soundwire: qcom: add support for mmio soundwire master devices
>    soundwire: qcom: add v1.5.1 compatible
> 
Hi Jonathan,
I have tested these patches on RB5 with WSA8810 and they work fine.

I can try to add support to command ignored in future, but for now these 
look good to me!


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


Thanks,
srini

>   .../bindings/soundwire/qcom,sdw.txt           |  1 +
>   drivers/soundwire/Kconfig                     |  2 +-
>   drivers/soundwire/qcom.c                      | 38 +++++++++++++++++--
>   3 files changed, 36 insertions(+), 5 deletions(-)
> 
