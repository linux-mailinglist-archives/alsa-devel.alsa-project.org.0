Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B04D613D5E
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 19:30:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1BF41658;
	Mon, 31 Oct 2022 19:29:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1BF41658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667241023;
	bh=rd4aH5yKQg9ZWV1iLp8KmMOfmUzPUEvXpEimyXAK4hY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fOFtO/2yJQyQg6soIIgFC7O8la+bA/xAm8mDxa9sTimofK5l1uBt1vBnrjNHLYAvI
	 R4wK0vy6IaIGrL/GVfBFkOp++giFSuZtPZttRB8gQcciDUOjvS6t0yO5pwFxo8bOPW
	 Y5AV7VaWnKz3zqhV50vvOsqjrnUvK5b5lTJqlYQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84067F800F3;
	Mon, 31 Oct 2022 19:28:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6322DF800F3; Mon, 31 Oct 2022 19:28:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27D0CF800F3
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 19:28:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27D0CF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uucY1kmE"
Received: by mail-wr1-x435.google.com with SMTP id k8so17209337wrh.1
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 11:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h35T5Hic3J51sigkp5EEtU4mlYTV/OS/n5zLOUZsiBY=;
 b=uucY1kmELif0QSAUGxuI8Yjx3mwszezx/Fennu3ZAWQiSGO2sHVyH/YvYxKgMmS6h7
 vPH8+bvyZ+Vc09UECMLNNkIz2KpJg1uWrgxOKgFzMPMB4WS6uqM0krDsoNQla/CtbrhC
 9j9wkTcgRgW2KE1wqTakIVtQL50ztUnocTifn5/A0yZU+nW+GKQ7oaBts1Vkp9sSze3V
 qG189t6fzdmurZrrlIM9u6E2lxKJPWSCw9wMovOeXBAvmujdyhq/UoJnRoGwnHGFGqCa
 6FFmEK8E/68XCk5obB8iewNKLRXx77unWVcwRJdJzuqfD1vGoplhk3X4cCptRpcNJPpt
 q/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h35T5Hic3J51sigkp5EEtU4mlYTV/OS/n5zLOUZsiBY=;
 b=oLfQvRkNe0R2ppnRjpbfUl1zv2o3mI+BwbLQw0MOnV/r684bL9sv1AwY8fCrPOnuTy
 0ILto57EJkxLqcs5Tk+uGun/MuCs+Ft4+iW/UgawCzvzXZj4f4dEG4qd5VgZH3S2g7y6
 0dBiQu/twheM5k0jddF3FqTHS+AsvVNCzrAwNx1LMyq6jZd43WUj8Bu9s/kFzSRjfNBB
 ocO3W0/mCLQGfRD6m20St+qQLBl3SAgp+D4b+W/zRkBrnAQYo2QVJXMAGyViU42d+/Y+
 WO/uV39105guW6vEg1onynmqrghNEvIFc7Z2faR9JsvWWNzo64fIBs1Wrogqj9NmwZcR
 Uh3g==
X-Gm-Message-State: ACrzQf1VFoG/HByFzrGyj0m8CJdP+hm4eck1pBb/VmAqrjPoHTlvjiwl
 hdtqjmWQC8BkLwhPku7/l6CKFg==
X-Google-Smtp-Source: AMsMyM7JAFvWx7qbxwPIobW+LKAz0wDyr7j6fO5Z1wVLD/dNkgD//E6e01YKgWoDNyb/xA4agSqrHA==
X-Received: by 2002:adf:f447:0:b0:236:5840:1c72 with SMTP id
 f7-20020adff447000000b0023658401c72mr8685031wrp.686.1667240928422; 
 Mon, 31 Oct 2022 11:28:48 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 j3-20020a05600c1c0300b003b4ff30e566sm26812630wms.3.2022.10.31.11.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 11:28:47 -0700 (PDT)
Message-ID: <35a3097e-ecb6-78ff-5a34-ed89a1fed362@linaro.org>
Date: Mon, 31 Oct 2022 18:28:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] slimbus: stream: correct presence rate frequencies
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20220929165202.410937-1-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220929165202.410937-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: stable@vger.kernel.org
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



On 29/09/2022 17:52, Krzysztof Kozlowski wrote:
> Correct few frequencies in presence rate table - multiplied by 10
> (110250 instead of 11025 Hz).
> 
Good catch,

Applied thanks,
-srini
> Fixes: abb9c9b8b51b ("slimbus: stream: add stream support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/slimbus/stream.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
> index f7da72ab504c..a476fa6549cc 100644
> --- a/drivers/slimbus/stream.c
> +++ b/drivers/slimbus/stream.c
> @@ -67,10 +67,10 @@ static const int slim_presence_rate_table[] = {
>   	384000,
>   	768000,
>   	0, /* Reserved */
> -	110250,
> -	220500,
> -	441000,
> -	882000,
> +	11025,
> +	22050,
> +	44100,
> +	88200,
>   	176400,
>   	352800,
>   	705600,
