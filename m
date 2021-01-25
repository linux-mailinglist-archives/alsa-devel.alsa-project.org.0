Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1A9302407
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 12:03:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A6BD181B;
	Mon, 25 Jan 2021 12:02:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A6BD181B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611572615;
	bh=N7Y0lCL7Bumzu2FnteHVvC4hzLDfIDGnUM5wL2vDbp8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D+T0X6t80FjKlisre1UXiLxpE0R1oHvTCB/YLrTL3rKGGZ1Tc8yYMnf4P3ny3huTp
	 lcAqrojY8CYoK5TYrEhU+yZHuv0QI7deyOMECht0RC+5tJihcSaIGyWu8ebQMPXnRg
	 9/rtgJ87V2TBx6GO/RKO/W5Jz6RI024hC4z8Sytc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4C77F80218;
	Mon, 25 Jan 2021 12:02:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 746C5F80259; Mon, 25 Jan 2021 12:02:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6366CF8014D
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 12:01:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6366CF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Dx4Or4vA"
Received: by mail-wr1-x42a.google.com with SMTP id p15so5197212wrq.8
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 03:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C5uwwIuTEX0TqttIcvohvRduK9Ojc+XqbY4QdqOoOd4=;
 b=Dx4Or4vAUm4j/2UCdxYqo0NVUQfPiA+9c02Ksxs9VRcyBknv5L42Z24dRsvVyRZ06w
 swZVVqz0ylonQtX19FOgQegOygRykiMKZiZd27ToL38linN92BNQ1an252f3JN1pjKOS
 p2PJHr35fv+Ok6rU85t41RmstaQsF/eSdQ0d43qXBIdky0o/6n1U1gXAn5DmSyFMVXfa
 D+ahRxBVKOOJsxkq+F3EfKzla081hu3AQKqpOHDNNDvoYcp8KwrSypbf6iRVzdBqpc0j
 GaEn6GfnhD6KQKuIceHRnNpYwk+s0RR3XIe3jqpywrf8bl2QZ7qYqToeHr+t47N+oFTg
 0xGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C5uwwIuTEX0TqttIcvohvRduK9Ojc+XqbY4QdqOoOd4=;
 b=nq3oI+BwXWfUvWmVnlk+mdvLU5qtTDDpWK5rZ3uDBm3MUSb4eGDCToPI3i0mDJyER7
 /D1u6cqAEwYryc6IRR+hsFq5Pq/1LNVTzfn+0ln+RbpipjLervPZ/3etjYEOPMJYSZML
 KkcoTan4Bm1PHWFKxbqILk7pmSJXSMSJHVQHJo0yWm7K0+0w4IHxDB7GJT0M24Rfa2+1
 LIjYbug4z30+cwn+l4qXYB5h/wCb/F1ej48YnPtpinXyiH3nmTCu4DMS9fCtRZyXjcYp
 wifnM+Y71y2P2OUHYtIg7QfKoaym2VuERv0kIK6lcgv7yn0I0SjDcdVAMVUepw6dCnoD
 uOcA==
X-Gm-Message-State: AOAM5319vnv4Jc++O3UizbRQ0zeA+T7H3QK4nMmRwqTlySmYW9g2ecI7
 WjuKmh3OxIK+CZ4hTWDx3pDD1w==
X-Google-Smtp-Source: ABdhPJwBAzp6BDysxokvN4vVH3ekRpqKTkzcfog0GO0CsoH3aP9SoOCzPKaS5/SWdAu+tPoF9NuP4A==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr255431wrr.199.1611572512970; 
 Mon, 25 Jan 2021 03:01:52 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id s25sm16194638wmj.24.2021.01.25.03.01.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 03:01:52 -0800 (PST)
Subject: Re: [PATCH v2] ASoC: qcom: lpass: Fix out-of-bounds DAI ID lookup
To: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>
References: <20210125104442.135899-1-stephan@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5839ced8-4dba-398a-6637-139749850819@linaro.org>
Date: Mon, 25 Jan 2021 11:01:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210125104442.135899-1-stephan@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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



On 25/01/2021 10:44, Stephan Gerhold wrote:
> The "dai_id" given into LPAIF_INTFDMA_REG(...) is already the real
> DAI ID, not an index into v->dai_driver. Looking it up again seems
> entirely redundant.
> 
> For IPQ806x (and SC7180 since commit 09a4f6f5d21c
> ("ASoC: dt-bindings: lpass: Fix and common up lpass dai ids") this is
> now often an out-of-bounds read because the indexes in the "dai_driver"
> array no longer match the actual DAI ID.
> 
> Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Fixes: 7cb37b7bd0d3 ("ASoC: qcom: Add support for lpass hdmi driver")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
> Changes in v2:
>    - Extracted from https://lore.kernel.org/alsa-devel/20210114094615.58191-2-stephan@gerhold.net/
>    - Change commit message to clarify that this is usually not just
>      redundant now but actually a broken out-of-bounds lookup.
> ---
>   sound/soc/qcom/lpass-lpaif-reg.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
> index 405542832e99..baf72f124ea9 100644
> --- a/sound/soc/qcom/lpass-lpaif-reg.h
> +++ b/sound/soc/qcom/lpass-lpaif-reg.h
> @@ -133,7 +133,7 @@
>   #define	LPAIF_WRDMAPERCNT_REG(v, chan)	LPAIF_WRDMA_REG_ADDR(v, 0x14, (chan))
>   
>   #define LPAIF_INTFDMA_REG(v, chan, reg, dai_id)  \
> -		((v->dai_driver[dai_id].id ==  LPASS_DP_RX) ? \
> +	((dai_id ==  LPASS_DP_RX) ? \
>   		LPAIF_HDMI_RDMA##reg##_REG(v, chan) : \
>   		 LPAIF_RDMA##reg##_REG(v, chan))
>   
> 
