Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 059472C2344
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 11:49:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CD97168C;
	Tue, 24 Nov 2020 11:48:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CD97168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606214951;
	bh=UB4WYva54c8A3fUdlwPR26VKL20vmarve6hMBOWzg/A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fvGMdqMHdX0M2MfiOyC7IXX9egb5eVXoNz3F3GpZmG79vsALCJaxwaS++50LbaH40
	 9RAogW5s0tVgM91R++xsb9G0ZeGHBtG+una7y4BiHcgJUF9tVzBHl10Q4QaF0dLYKL
	 SlFq01Hkz9Hgi43jBPfRcAB5uBU6FHqxp9P5uGzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2101FF80128;
	Tue, 24 Nov 2020 11:48:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 662E5F8016A; Tue, 24 Nov 2020 11:48:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E7E0F800C1
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 11:48:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E7E0F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="o+OCt6pP"
Received: by mail-wm1-x342.google.com with SMTP id 1so2357654wme.3
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 02:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EKUHQucYeb31HOoREAkeI7Xr3ONZ6GpyN2wdl6mhvTE=;
 b=o+OCt6pPEtBp5sG9QBlJlxOlGwBf9AHPWZYEk4c7X6VYcrTixfHQQJ4Wu9kfNihKoD
 6q/QauNDpLX48kzcTChcZJ9dQt/QMcRuoWv3xKg/Pkto2sbkNiAOUuA7ImAncN6Z1r/Z
 Q0qGW2sLi8rYUnpPrXaLc8uV2UnpsRg3qhU6oushflRiEuJQX/+D4g8bpNEjxb7ViBQK
 imQoXnExp88Bid1lhoSl5EQfYPnlkGp+nXSKCKH5roJ7eq2rwjyFZMA/8ApqCFhSJXok
 V5I4qMlVt65Mnv89o1ATv1H6JF97Lv3/QZ82AUYYdZjVqgyvpbVVazFS4CfP/MSmw27t
 BCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EKUHQucYeb31HOoREAkeI7Xr3ONZ6GpyN2wdl6mhvTE=;
 b=HPA0tL7cWm4WXP3xqr1AKsu3mTKM3G35lIxff2JJvFcf3nfPnW6htYCNcQiMQ7Et+T
 pKZ3mAXyfQf8WNUXRrTIazZJZWwfz1YtNWkbF0PMO9K2i2UJZLpmo6tOfIjC9jwTmVKL
 lAKZsWAnlrwFi4olHHOg5GyNyZKrYZn+k0eS2FQJJQxkQmdn7pOr+2vsEBDTkyP88Wd4
 xK6kk39KUhEiBVjabXAZMLGKTMg0sVXcgNgGCca5wNABvpHNTvbwujo/kIgWnS/0KY0X
 sF97NmsVEBdFnByFl62uBCu3wfJlqiycQM3qnGEBrKmbkfOFQJ5s1vlNJ/jozqitmMkD
 Er2Q==
X-Gm-Message-State: AOAM531c9tGp+G6JbG+y6PEIE0c3HY0kXhkDasVjbKqiDI0BTqHgyj7L
 I77zqMgeC8uCuCElzWjx06Tc+Q==
X-Google-Smtp-Source: ABdhPJxW9BitmnI8OPwhFe6AWn0n6S/KopfpYJQ+7H/0nejHyup9DFlc3ZwLIY+7GWtngQ1AqVs7lw==
X-Received: by 2002:a05:600c:2886:: with SMTP id
 g6mr3790149wmd.110.1606214885516; 
 Tue, 24 Nov 2020 02:48:05 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id e6sm4810310wme.27.2020.11.24.02.48.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Nov 2020 02:48:04 -0800 (PST)
Subject: Re: [PATCH 126/141] slimbus: messaging: Fix fall-through warnings for
 Clang
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <08a882fa7a3145bc33bc02392df8319e95092dcf.1605896060.git.gustavoars@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <794916c9-30fb-1202-ec26-9abf750886dc@linaro.org>
Date: Tue, 24 Nov 2020 10:48:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <08a882fa7a3145bc33bc02392df8319e95092dcf.1605896060.git.gustavoars@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
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



On 20/11/2020 18:39, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a break statement instead of letting the code fall
> through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---


Applied thanks,

srini

>   drivers/slimbus/messaging.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
> index d5879142dbef..f2b5d347d227 100644
> --- a/drivers/slimbus/messaging.c
> +++ b/drivers/slimbus/messaging.c
> @@ -258,6 +258,7 @@ int slim_xfer_msg(struct slim_device *sbdev, struct slim_val_inf *msg,
>   	case SLIM_MSG_MC_REQUEST_CLEAR_INFORMATION:
>   	case SLIM_MSG_MC_CLEAR_INFORMATION:
>   		txn->rl += msg->num_bytes;
> +		break;
>   	default:
>   		break;
>   	}
> 
