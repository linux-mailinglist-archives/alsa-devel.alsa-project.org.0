Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E4F624334
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 14:29:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAF741651;
	Thu, 10 Nov 2022 14:28:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAF741651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668086946;
	bh=sGHPYI7ah52WXFpoDvVQ9cTA5rRPEDNR2BqJ93xrLzA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kv7hCAfsF+y+OM02/f6wbSOWEmC6QdkW6+9Ki+Hy6SqvBUqQ8ecfYDUJhEqqfI3ib
	 WEv6YbG05S2oeBL76IfkcRCCCYD0w+JTWA5erbAjdehg//CCtP3aptHt7gAXtg/3u7
	 FYGjzk/UOQFMFHOaRP41kmjj3bTCbqoOlr0gzc38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37DF4F802E8;
	Thu, 10 Nov 2022 14:28:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB17AF8021D; Thu, 10 Nov 2022 14:28:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8DECF80162
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 14:27:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8DECF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="b04L+Z+d"
Received: by mail-lf1-x12b.google.com with SMTP id a29so3194639lfj.9
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 05:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f5DcG84whpNkZMgdPanLq5gCZ/VBXiFyiq+gALEmIjw=;
 b=b04L+Z+dTjKbIloGzP2Fg1AgBpMzy5kQm0+vPdQfYxFVyATqSkJnlowkLYJNVlQj/k
 qH6GN/F5zz6EODYFHlF5z7kQBroyoo+4QPwqUlrVXsjjYfVGezs1rBbZVwnvSRP5z869
 YFjPbAgSzDMyu68mZba7BA1RWa2SGx2IMoyE7a6SBKo1vVry3Pako+kXuWOiHXn6i5gD
 1mQ7+UPMDRxwG0KxZa3BRpMFnCyFi/ZIjdETCvodRzQXuxlacDtbvwQMi+PkDyxut3rd
 p7827C7n+2okHeEmQsRBknnY3DfZWKVDS7mvyX7QyOblZF556bg4f1n4XugqygHPv/OJ
 dnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f5DcG84whpNkZMgdPanLq5gCZ/VBXiFyiq+gALEmIjw=;
 b=vgkm9JfeVxhYYR/oYz1sxszXZmm59IeVzGYoW8+rkLvMT734ZHVpj/Q50TvjQ59DiU
 rYLzg/qxfCD8hNfpboqCHHG6DSQfk4SSdJnjxTlBVCVkGTILEUdpUuTTGC2xvxWA0rHa
 eaiuAxch4gsnMdbYQFnJrzkRcVVrg+d5nqXp6ykIwiatLAqnhoYy6us8x8hgqN2Z0lM1
 Wgr/QPAeNJdk/L0dxzZqEC2Ip85vSllV7nJlOTe1x2UQCwwsge8oMJvmL0lovHEPsjCr
 4mIEp64ztR3ooQj4r4UKGhJpGTUsK9IhVmgjTRIXkVTkjwvKnGu3TXrMVoEJkTVOmxg9
 cApQ==
X-Gm-Message-State: ACrzQf3reG0vrzcwYxoGMDzMSe8a0F1q6i7ojfcF01iBOYfc+Gw4dRci
 8kLOdghYiY64e06hDZE+ZryINw==
X-Google-Smtp-Source: AMsMyM5NwYvLDvN5XweF7hs6r6xhzV8Wnbyva8godKXWoixzDuP64x+tEFiHlDzGwPBXbaJBsh9Abw==
X-Received: by 2002:a05:6512:3411:b0:4a2:3087:cebd with SMTP id
 i17-20020a056512341100b004a23087cebdmr1347322lfr.66.1668086876977; 
 Thu, 10 Nov 2022 05:27:56 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 d36-20020a0565123d2400b004947555dbc2sm2749406lfv.100.2022.11.10.05.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 05:27:56 -0800 (PST)
Message-ID: <c7a4d63e-9a85-93c7-a5a9-435f85740393@linaro.org>
Date: Thu, 10 Nov 2022 14:27:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] ASoC: codecs: wsa883x: Use proper shutdown GPIO values
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20221109163740.1158785-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109163740.1158785-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 09/11/2022 17:37, Krzysztof Kozlowski wrote:
> The shutdown GPIO is active_low (sd_n), but this depends on actual board
> layout.  Linux drivers should only care about logical state, where high
> (1) means shutdown and low (0) means do not shutdown.
> 
> Invert the GPIO to match logical value.
> 
> Fixes: 43b8c7dc85a1 ("ASoC: codecs: add wsa883x amplifier support")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

I will also update the example in bindings. Not a blocker for this
patch, but better to keep these together, so there will be a v2.

Best regards,
Krzysztof

