Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C61E155B902
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 11:50:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E0D8E12;
	Mon, 27 Jun 2022 11:50:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E0D8E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656323456;
	bh=7wIGKd0iWaqdg+4oKsF1Jbo0sR8k+KFHy/BVwsSdtP4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pj79JB/1CBu2ghNJjxsx8/Mu2y57EL5xCeIi9oqAC8/OFdy4N3OG3chU87CGmG0wE
	 qiIgaFhzO7ANP93eF1XyCZiPGHx25XqeSIV/fdcs2aK+k1byfogcFuO4RHbU82LQkS
	 pLxnRiigzOccrvGGFQBxCb5QaLNPqwpIx+DUEWj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4606F8028D;
	Mon, 27 Jun 2022 11:49:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D885F8028B; Mon, 27 Jun 2022 11:49:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6BA3F80128
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 11:49:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6BA3F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RgORuYQJ"
Received: by mail-ej1-x62b.google.com with SMTP id u12so17918081eja.8
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 02:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ql1APVfZd2Lo+GYFdN0rZXs3VSU+UTL0bs7ioEmeviY=;
 b=RgORuYQJWVOAf9jFc6YuQNX9I75pP1tWgFUCQ2jVynSlJk8qBELir3nObGyYwqCfi2
 CjiNH4Mo7GKFukpzZxdb5uM6WITxuBYc3PVm2ZeMCzhfWxL4Epei6fnJUR5w+kir5N9o
 dBcfMbTmplc/onKzMhXESLqay0d7M6Kx5i8UiphW/4V/llRhrPuAp/VerKxmOpSFcf0U
 7UrUzacWK5HvAyEAhP0629DZhVmvpZfE3Y3rXmvIygo5adnKsYv3jy/RYALNzAy97P83
 5NJSKcdOiXqP0KMYSWoX0p/Co+AoZOt/tKEDij8aSYIw55Rnwy7uggkzUVFv9A3tKTDD
 A7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ql1APVfZd2Lo+GYFdN0rZXs3VSU+UTL0bs7ioEmeviY=;
 b=o8+0io/Vv2uBqpqwfS/k+k8H8GZkSDcJlJeFsifxuYYN9EX2F6sttrpVLzNHRUqr/f
 1jf1BxJhvWnnUbHGFh+r55Nt+juxoM+wVY3VZxhql6OsIYdUS6+AxtzK0b44SAhOyLCV
 fvNHz8vP0XRMWfeOFbFdZ/lPSUE5Cb+aY4Oo51euQ0vdn7xDeLDHx/HRdGgOLg4QuwU1
 PKJKjP+m9HANDQsrsZ6MMl4HPnZn6H7t0jyug1YwikyNhIJ4yqZfCu/ALof3gvIHYUDk
 r9pngRLlhKogsg66dPcjx+G1isR8BOEHCZoSeLUAbaqffNaDEK41FutA7k6c2KRseKjz
 5oQw==
X-Gm-Message-State: AJIora8JZdUpKqUHz9NX6WXuv1wWEwvNqUEmwmtt6X1dJnnbzLmJpI1D
 eC9ngub2oduLTrPTUy6+s434TA==
X-Google-Smtp-Source: AGRyM1sHB77PAiN8CrKv7RFaOd3YlADqGW0XSj5poP0fTywWrKfS7m3vXVhchxnG1OhVfpXG/CZQ5w==
X-Received: by 2002:a17:907:3e01:b0:722:c339:bde7 with SMTP id
 hp1-20020a1709073e0100b00722c339bde7mr12071901ejc.285.1656323388038; 
 Mon, 27 Jun 2022 02:49:48 -0700 (PDT)
Received: from [192.168.0.247] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 s10-20020a1709060c0a00b0070beb9401d9sm4860306ejf.171.2022.06.27.02.49.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 02:49:47 -0700 (PDT)
Message-ID: <803785ef-42b7-647c-9653-702067439ae9@linaro.org>
Date: Mon, 27 Jun 2022 11:49:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: samsung: s3c24xx-i2s: Fix typo in DAIFMT handling
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
References: <20220627094335.3051210-1-ckeepax@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220627094335.3051210-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, jrdr.linux@gmail.com
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

On 27/06/2022 11:43, Charles Keepax wrote:
> The conversion of the set_fmt callback to direct clock specification
> included a small typo, correct the affected code.
> 
> Fixes: 91c49199e6d6 ("ASoC: samsung: Update to use set_fmt_new callback")

Where is this commit from? It's not in next.

> Reported-by: kernel test robot <lkp@intel.com>

You should put such big patchsets in your own repo (e.g. on
Github/Gitlab) and feed it to linux-next or at least to LKP.

This way you would get build coverage... because it seems the build was
missing in your case.

If you prefer not to include it in LKP or linux-next, no problem, but
then you need to build it.

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
