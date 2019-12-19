Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3813212603A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 12:00:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FDA785D;
	Thu, 19 Dec 2019 11:59:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FDA785D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576753220;
	bh=pEQA8We7HEptWMOnvg1sYMkQIautbQxBeCIFO/uZQVw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TBs/0UCk73ytvJFkGUsl31Xq/Y0ilQIgVujF8Ma7a44HLZ5ekSZyu2AQqcMO/f0Eo
	 JgGFnCarckUT0ljjhwDeSnHsaE3MNnYyfMesdOrs6Xft3Uy/+0QxMwXdONNoFQE41P
	 JQiIQHiHEU9hN6PBZKSBsLZHTs00MoJCEfGEhy+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A2F2F80234;
	Thu, 19 Dec 2019 11:58:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33D0EF80234; Thu, 19 Dec 2019 11:58:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48EEBF8013E
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 11:58:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48EEBF8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yhr1ZjMO"
Received: by mail-wr1-x441.google.com with SMTP id c9so5499987wrw.8
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 02:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LOOsEyvuasBLr3yvzRlpYBFKNpQOIsg2Ax8aja0jnrY=;
 b=yhr1ZjMOsQqXqHsILFXcqatMCvF/ZDmFxSvKD1L8H+K8GLS+/5QDFqfRvsc2CXQFe7
 MN9rTxDI7kZaM92BKsGytik2Y7UK5f3AsWw8X/lT24REN4JmS9ZrVaTq6Sr7rRDyeQo9
 1gRCJr20NNQpcxkUYo+hTc7aaGMnuHswv93eeBwusOHhT8j9cLzegTFmaH9A1hLvflb/
 IWAn7+xHWcvTVZWIQJg8U44AEWRsEmMIAY5pjl5xmkA82sLgMqme0acOXG3PTELobbVv
 KHbO/IEHiTmABkV/YUpa22EsG2ta671r+1bkEMvRzXbwK7PoT+l/N/Bf76YOxeJiZyBT
 MQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LOOsEyvuasBLr3yvzRlpYBFKNpQOIsg2Ax8aja0jnrY=;
 b=pMDv1uc+fIvL64l6NE4zu4Vm/wOu8jQ5Gx9o8qPAxmF24ijRcTC5sZ10JzMlBzbxkv
 cBsiIwsYyzJa4rgFhnuzElOZrvO3nV8lkeaUJbznIWVjb58T6dY4P/6vHwByThyoS0i8
 QlCQgAHGYSG1WLBQKTFR6A6/1dVn7W3QYQ+5zyIdnaAEfW/f7LPYqmjR3wRPn7CHaruA
 UAO0fK4SXehpeu7upvzAp62CKqFf5dIfu78AZu5eGt8sBMiOTRNiTlR4oOGdvtKH9PrE
 jjXO8qZXZL4JIBpxn7DE74hlLIAZkyzNBDb6/pNzTkPfMIRIvJsJoG1kT1sZpKtQpLzz
 67kw==
X-Gm-Message-State: APjAAAVL84RbSepgvu5Njlf3ArDpy7Zj78XnqaSJCbB92rBPFtY/JMvW
 eYQHOHBhOlPgQi/aQH1nZaWh8A==
X-Google-Smtp-Source: APXvYqwUw4nBzvJG6W7Ot6OE7z+N85JhMh19YIzO5YKGLoeCcKnDhKV5FIeSRUYPB8ceaij4DGeyoQ==
X-Received: by 2002:adf:e683:: with SMTP id r3mr8690894wrm.38.1576753111420;
 Thu, 19 Dec 2019 02:58:31 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id v22sm5504084wml.11.2019.12.19.02.58.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Dec 2019 02:58:30 -0800 (PST)
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <20191217104629.24590-1-peter.ujfalusi@ti.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <2a2c444a-178b-b813-d329-49abbf099381@linaro.org>
Date: Thu, 19 Dec 2019 10:58:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191217104629.24590-1-peter.ujfalusi@ti.com>
Content-Language: en-US
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] slimbus: qcom-ngd-ctrl: Use
 dma_request_chan() instead dma_request_slave_channel()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 17/12/2019 10:46, Peter Ujfalusi wrote:
> dma_request_slave_channel() is a wrapper on top of dma_request_chan()
> eating up the error code.
> 
> By using dma_request_chan() directly the driver can support deferred
> probing against DMA.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>   drivers/slimbus/qcom-ngd-ctrl.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)


Applied thanks,
srini
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
