Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E4653E405
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 12:12:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 362D31836;
	Mon,  6 Jun 2022 12:11:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 362D31836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654510362;
	bh=J9RMPohsKjKpuiDFBD58vWgPEP90gasWYqlFO5XeOI4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iq+Vp47Ua/OAgOzjdzFxZsGaqKeJ4baMlmLZnUlTYNU8ONjtwVVmyRpOQF8o7PvQh
	 /tlRHt2eEfp6KUClVt4p7/TUqWQab1p967RdJRZY9dOZw5rnBwlSSriZq/qgv4xPL9
	 MUhl58uK18X7V1q2ivUDUwTr7PcMK9+gYAWfQKLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC890F80310;
	Mon,  6 Jun 2022 12:11:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E47FFF80116; Mon,  6 Jun 2022 12:11:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9787F80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 12:11:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9787F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mlMaVVVH"
Received: by mail-wr1-x42c.google.com with SMTP id h5so19228491wrb.0
 for <alsa-devel@alsa-project.org>; Mon, 06 Jun 2022 03:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SKMeYqCcEfGfSDa+Q181OzEqniNNtYhyJ3KyTSBEY4Y=;
 b=mlMaVVVH5V5IY6V+cat825TU8tvhR1u2cHimuFiap7iVJSe+XE7uHWFrzj6EnLuQK3
 mp5evB7Qw3HfmlN8DiU25Fwjf8mORJShAPBg2F8fezIWajhtssceeO53VhlUFNdkmS2U
 hF/W87/wUfMFCih1tfMiT2RyxlbdwYxdrP9vsKV2QH8fayGpS4/N3h2Y0FF0ORFnFXFd
 pkdQuCpbMoeY7NTPdPdZgmdF27l9Gm+VSf9fs+hMCjI+oshigc7CoNLaKrYWYvK3x7CK
 3+fu0fkhw/OmjX9A+TC+O975l7FA3Jz1KvzbcUpkxolykDnEfdH0Y4vvBv5/NPhXnD6X
 tuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SKMeYqCcEfGfSDa+Q181OzEqniNNtYhyJ3KyTSBEY4Y=;
 b=7GTDfVuFRT6Gy7b1NzfYKFOUlGQAuv8FiMshbD/afcHgbcEwN6ISR78EfoH1RKYge0
 yBslHOjdYHdGhKhupKpvPOKAaImbU/Ydt4HdoR3+o5GIEstDdM8uo/Hq+7QLhNPDc+a0
 OjbsMvzluWMDvnnPpxJ8Hawf5bKuwWtHjsDgPSviXJ19d+XJko/DkD3qT1aGi8yKsyXg
 Q0Zi7fEUw7moglwoTxc5DBsr60XzAfVO3N3BWRyWWCRDnhiC+kjElt76puD8/b8zM5fU
 q85RFGKFRdQsG+siGPxMtGrCWAw4rA4/vDirFulxlF632f4jmaoxyWIKc63LDbctT94T
 pVcg==
X-Gm-Message-State: AOAM533v/1No7LFkEGlsF6EmMfIcXCHSi5jZyms/bK0TZMsiF3m0T2/e
 IgCLf6MGYha+nHLElicTHO4Oag4y91iCYy7w
X-Google-Smtp-Source: ABdhPJzuTMoyD/Jp/baSYmSwhReRg4JOV5WbVbl4L+tU9o+doSR2QFiSxN2MEG6WtjZLPQNyUse1ng==
X-Received: by 2002:a05:6000:1a88:b0:20e:6eb4:124e with SMTP id
 f8-20020a0560001a8800b0020e6eb4124emr21566830wry.8.1654510294109; 
 Mon, 06 Jun 2022 03:11:34 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 186-20020a1c19c3000000b0039c4ec6fdacsm3027736wmz.40.2022.06.06.03.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 03:11:33 -0700 (PDT)
Message-ID: <a8fdaff6-396c-5450-74a8-65acb660de5d@linaro.org>
Date: Mon, 6 Jun 2022 11:11:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] slimbus: messaging: fix typos in comments
Content-Language: en-US
To: Julia Lawall <Julia.Lawall@inria.fr>
References: <20220521111145.81697-88-Julia.Lawall@inria.fr>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220521111145.81697-88-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
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



On 21/05/2022 12:11, Julia Lawall wrote:
> Spelling mistakes (triple letters) in comments.
> Detected with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 

Applied thanks,

--srini
> ---
>   drivers/slimbus/messaging.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
> index e5ae26227bdb..4ce0cb61e481 100644
> --- a/drivers/slimbus/messaging.c
> +++ b/drivers/slimbus/messaging.c
> @@ -79,7 +79,7 @@ int slim_alloc_txn_tid(struct slim_controller *ctrl, struct slim_msg_txn *txn)
>   EXPORT_SYMBOL_GPL(slim_alloc_txn_tid);
>   
>   /**
> - * slim_free_txn_tid() - Freee tid of txn
> + * slim_free_txn_tid() - Free tid of txn
>    *
>    * @ctrl: Controller handle
>    * @txn: transaction whose tid should be freed
> @@ -101,7 +101,7 @@ EXPORT_SYMBOL_GPL(slim_free_txn_tid);
>    * @txn: Transaction to be sent over SLIMbus
>    *
>    * Called by controller to transmit messaging transactions not dealing with
> - * Interface/Value elements. (e.g. transmittting a message to assign logical
> + * Interface/Value elements. (e.g. transmitting a message to assign logical
>    * address to a slave device
>    *
>    * Return: -ETIMEDOUT: If transmission of this message timed out
> 
