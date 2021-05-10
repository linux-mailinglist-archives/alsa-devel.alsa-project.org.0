Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B0C37829E
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 12:35:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19B4616AF;
	Mon, 10 May 2021 12:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19B4616AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620642937;
	bh=RL/pfl/PboESvVTQmUHOp86SRzM/MrzusJ8bXpCNMqg=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FUtOrTHKBO/MEdJx2O0GcaWLWknJ9JbORYT8KxiI5pa182IljUlTxDBoVJsJ5UULf
	 eUM79BzXa7B4uo1DYzaAF9GWC9a+PLcntI7qYowrF86zMHVsxQZtAnC0IxbCYIp2Ws
	 C25QTRteLM5LAm3ku9NjB4Ghoo5WL/4P53wuX4fY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EC6CF8026B;
	Mon, 10 May 2021 12:34:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CAEFF8026B; Mon, 10 May 2021 12:34:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D15FF8020C
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 12:34:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D15FF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rhAjurvr"
Received: by mail-wm1-x333.google.com with SMTP id
 b11-20020a7bc24b0000b0290148da0694ffso10853349wmj.2
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 03:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=KfBhlxED/z8OAiqCMB0G+udAHqmSGRzT6CR07W8C+DQ=;
 b=rhAjurvrBMlrXW64wFgbm82tI4lJ+SkX65++JBQa29vp7TqbZtVy1dxP8fm3bMWtMU
 5LnLYmfS4gjF88Y1DHRoHqMsQ1Qv5CSizCA/wf/MSwPNXh+uBD6fm3XBJKRHZW5nZg1U
 HtwIlVcsLyK5AbAhQSeZ3BBJc7g/YpgLpoVKgO8SL1bjxzqTEm2HR89U81nLb810HUKm
 0cH6DvGA8tNW+JsazwQ0PmcmY5xn7C8oUa3K+j3whYkOyc1ja1N1KFOYFsRmqL9IN3pv
 leiy03bR7vjVo72VaRwDwJ2SEr2+jzB3LFD7lt53nQ5MIuMkr79QJl2BAx3V/ms5Nj1A
 snYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KfBhlxED/z8OAiqCMB0G+udAHqmSGRzT6CR07W8C+DQ=;
 b=fjZ0qEAH0e3fEdYJGXNsdO0jCQyGgz+A71fMl5wsR9/tjsEAnURr4FwjpvlCNJCbZf
 hFAohI6b5aaAWjyZ42KZycVrpUfa5G2gW0Bym+jyzja9XEul2Oc9xEERWMgUOcUoBuPY
 QWfe1LsKRPMJjwEoR4edEIFQjO9p57pM0WKbEp9/WAAeDsigg6iySkm4X94fbxJUr5IM
 JcmIbd1vrRDp9Sk6wTuYXo+lmx+PNiLs9n8oIN/gW5sop6hc7PAReO9gOc6HIe+VYFZE
 MUATiDpFYC8tJHZMxaEEloXHKrIELTyXSFV5RkNBmzll7FuChyxnHVVL2vIUDdajiRLS
 FmqQ==
X-Gm-Message-State: AOAM5326Dgt/hNJRF/xTrbAiPgxEDVeluLyUJ8ksBFpq5TACj9QVHw10
 lU9cHnaaSqFJeB9JpQOIN+i4NQ==
X-Google-Smtp-Source: ABdhPJzPorWGLmcfj2n+wX3BMD0ncPs53HtRGgvM3tWFfn+JE+mErnP+KoT+Xkv4p7i5L0Bp3yVaQw==
X-Received: by 2002:a05:600c:4f8b:: with SMTP id
 n11mr25018082wmq.11.1620642839569; 
 Mon, 10 May 2021 03:33:59 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id
 m184sm19040458wme.40.2021.05.10.03.33.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 May 2021 03:33:59 -0700 (PDT)
Subject: Re: [PATCH] ASoC:q6dsp:q6afe-dai: Fix a typo in module description
To: Masanari Iida <standby24x7@gmail.com>, linux-kernel@vger.kernel.org,
 dunlap@infradead.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org
References: <20210510102752.40620-1-standby24x7@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <db812ab6-ab13-7f37-68a2-4a3f351fba6b@linaro.org>
Date: Mon, 10 May 2021 11:33:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210510102752.40620-1-standby24x7@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Thanks for the patch,

On 10/05/2021 11:27, Masanari Iida wrote:
> This patch fixes a spelling typo in MODULE_DESCRIPTION
> in q6afe-dai.c
> 
> Signed-off-by: Masanari Iida <standby24x7@gmail.com>


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/qdsp6/q6afe-dai.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
> index b539af86e8f7..2166fc305c8f 100644
> --- a/sound/soc/qcom/qdsp6/q6afe-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
> @@ -1706,5 +1706,5 @@ static struct platform_driver q6afe_dai_platform_driver = {
>   };
>   module_platform_driver(q6afe_dai_platform_driver);
>   
> -MODULE_DESCRIPTION("Q6 Audio Fronend dai driver");
> +MODULE_DESCRIPTION("Q6 Audio Frontend dai driver");
>   MODULE_LICENSE("GPL v2");
> 
