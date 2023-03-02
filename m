Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D546A8349
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Mar 2023 14:11:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 944F91FA;
	Thu,  2 Mar 2023 14:10:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 944F91FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677762692;
	bh=2azW0FPDD1s11292BzAocYdZUw9EDxNjZSvw+x+Qrkw=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=luriuNAw5RXhIVsrg5hfr5ArjkSXKpuvzoDSYgOLDL8+lj2mhtohYvPUvbDUfsscj
	 JRurZrModN2Exja8fDSl2W+z3lsUxEW+eDG+ua/37e3CaG/eTZhv0JjoMnub5lzIIu
	 8CRneEmxgwsRQEu2N3DLgxAQjXbLonB7rOUU33Ac=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED473F8025A;
	Thu,  2 Mar 2023 14:10:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67ACBF80266; Thu,  2 Mar 2023 14:10:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A50BDF800DF
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 14:10:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A50BDF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RQh0pRw3
Received: by mail-wr1-x430.google.com with SMTP id t15so16469696wrz.7
        for <alsa-devel@alsa-project.org>;
 Thu, 02 Mar 2023 05:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677762634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LTMb2uiAKQy8zkbJrBkzpMbRkO+dwt0YiEEiYQBT8oM=;
        b=RQh0pRw3GZQXbuvLXDlP/waEUyZWHkYkc0rlKmxYZpkshO94bQ7StbBQ1MtI3m2kDU
         KzH1v7ZpIiP6QCzqx4vsx2CV8F9WfIPKzeFrYTe7sCiXIVlHgAuLatKo0cjH+Oy3g927
         PmrQkT9MQv12j2neob8toCo4kW/kb+xG/bQAbNNIDLAlN2jCDZ3Ag3ILQYl8ynlogXXO
         kjLhWz4Z00knAmyth4KuQYshKND2D1o4hOaJw4KnALM7ucc1PjbfA0GKF9JRljTSuZZe
         UrV4v7degPV2NP3gxGd/BRB3oGSoGZqYEn4i7kFx/cPiVwbvyuDCaOtZLtXJcM3BY3Eq
         po9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677762634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LTMb2uiAKQy8zkbJrBkzpMbRkO+dwt0YiEEiYQBT8oM=;
        b=JzXvc/pQbVYxqLPXqPthW55XCE9LqDBXEjdqUxodsVjouq14krH2pHge3KKKdVpHCG
         1KOIC/YTIjCRPfVcOGRjKNcOW5gVII20wktmGr0uH3QVp0nqkmF3zUnrvhz5jXuW6MK9
         xi9Yad+kZ+QvQmLerYYm6ryrf9E40CAAn1/aLCVebzQ/hqtBXduYr9TC3BiH+1b1/t0f
         Yxawp7hD1kdDcUa5QjcG771tp5+gHlxknM7nZW6O1aSmD6N6GDbipk2VdetrFSdPwf8S
         t886XWMmZbMqIGkqyPNzoSf3WD1WH4wJKqHZbiY6eomaGKVg+zdz94zUX+64e0HqwCC0
         4exQ==
X-Gm-Message-State: AO0yUKUfgME2p7n5gTc4L2CLY5+kCTPyKBmnsUprauNDWU7rsdZgOFDU
	L6xN2Xw/NWQrF8RegDfazAHW8g==
X-Google-Smtp-Source: 
 AK7set/UY2mu+bVvyesOlReohTFVfVRqwfeXA8qbg0d09zP+0hh61PBsHLM+AjPQwB0/GuENcMxemw==
X-Received: by 2002:a5d:4dd2:0:b0:2cb:c66d:6ac1 with SMTP id
 f18-20020a5d4dd2000000b002cbc66d6ac1mr7025325wru.3.1677762633759;
        Thu, 02 Mar 2023 05:10:33 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 t14-20020adfe44e000000b002c5503a8d21sm15622256wrm.70.2023.03.02.05.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 05:10:33 -0800 (PST)
Message-ID: <ee0a09bd-831b-9ac4-7b9c-d584497cd7a0@linaro.org>
Date: Thu, 2 Mar 2023 13:10:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ASoC: qcom: q6prm: fix incorrect clk_root passed to ADSP
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20230302122908.221398-1-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230302122908.221398-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IUDBLN5YKOEBC3DCIPLWHHIM3LOBANTL
X-Message-ID-Hash: IUDBLN5YKOEBC3DCIPLWHHIM3LOBANTL
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IUDBLN5YKOEBC3DCIPLWHHIM3LOBANTL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 02/03/2023 12:29, Krzysztof Kozlowski wrote:
> The second to last argument is clk_root (root of the clock), however the
> code called q6prm_request_lpass_clock() with clk_attr instead
> (copy-paste error).  This effectively was passing value of 1 as root
> clock which worked on some of the SoCs (e.g. SM8450) but fails on
> others, depending on the ADSP.  For example on SM8550 this "1" as root
> clock is not accepted and results in errors coming from ADSP.
> 
> Fixes: 2f20640491ed ("ASoC: qdsp6: qdsp6: q6prm: handle clk disable correctly")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Nice Find, Tested on sc8280xp

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini
> ---
>   sound/soc/qcom/qdsp6/q6prm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
> index 8aa1a213bfb7..c1dc5bae715a 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.c
> +++ b/sound/soc/qcom/qdsp6/q6prm.c
> @@ -183,9 +183,9 @@ int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr, int clk_
>   			  unsigned int freq)
>   {
>   	if (freq)
> -		return q6prm_request_lpass_clock(dev, clk_id, clk_attr, clk_attr, freq);
> +		return q6prm_request_lpass_clock(dev, clk_id, clk_attr, clk_root, freq);
>   
> -	return q6prm_release_lpass_clock(dev, clk_id, clk_attr, clk_attr, freq);
> +	return q6prm_release_lpass_clock(dev, clk_id, clk_attr, clk_root, freq);
>   }
>   EXPORT_SYMBOL_GPL(q6prm_set_lpass_clock);
>   
