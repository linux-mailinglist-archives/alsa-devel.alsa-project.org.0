Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DDC27EC90
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 17:29:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E41D185B;
	Wed, 30 Sep 2020 17:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E41D185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601479741;
	bh=rWmnwG80Oh2mbGuuGFAfmRhPOVU4i/yc77WXDa4JZGM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ksEE5ppY/uV5138Y5855RrxDGd4RAkEBBhJrwJEvteCeMZw/AT9hOzIa6ie1z2n3t
	 mGOjf0/F5egjR2AsRWe/xTOCr+RNhUG+j83WSMNrFqdVlOyTRQYYyy06HYY+JB3525
	 4mtNtWgqWpH37CDSOaIFoQW9QQOd8j3op4UxaDHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4F22F800AB;
	Wed, 30 Sep 2020 17:27:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13DAEF801F9; Wed, 30 Sep 2020 17:27:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2ED3BF800DF
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 17:27:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ED3BF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="bnu2AXO9"
Received: by mail-wm1-x343.google.com with SMTP id a9so2241385wmm.2
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 08:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0+ELwapv21GEL6l9w+GEBlH6bPvhJEQ78Iqbr9FNf64=;
 b=bnu2AXO9rs36aRb/7J34MaWoqyLLtn7zSZkuC3mjkJUPnpZ/ubekgTq3T6POhPvzr6
 LsQeXsqfRxkyLwWFwO0z5OY0HnQ0kU08XXRCLsI1ssorbSbnycj5RQq13nsxXnQJrHef
 AOCPhQAUXpyNkBEZ2uk2Plve1/cFpNLg8gP4PZcdryWrFhpdyy7ywFL2vMO17nAJgdfC
 TU2ZxNsmP4NMy9IrDn+9IGpnWEIe1/UcQfA4msy7jnX0S1p2OWFQMVtPu1l/lsSm5msl
 gGNvV6iclq3Yg18Tf5zUoWjyv9gyYnEi+fIXWTLZM+fueqlk7CCXT3uGaOpF5UcCuohX
 SQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0+ELwapv21GEL6l9w+GEBlH6bPvhJEQ78Iqbr9FNf64=;
 b=jwy/RDJyvWUzOe9J2i4GLZgTGJp+29hs1KeEcJkrwUCI5AVW4emLNVfLnwgh2ZYuN2
 s4VkIS2VSE9XZSG4QEFktLCmL61pAvlbeqX7+vqdy+jLiXJ4NrYcXGHhI6FPgSpky+c3
 XhZBDhMQx8Q2s+aWd9pr5iwfoINZumANnwR1y6Hb/mjcqbCTLjLpFDf7U0I4PfS3Pp1v
 roxoMU2sxBGHMoMKDQGdpvs3zVmvRVKM14EkpyVwqPiWfg8OwJIU9fkmELDYyQnZK9Ds
 F0dcKen+ydDLmHxPJRAQZGyU/mHgaGE+PMeT/gI440QBU1wXfw42WFwHOO6CpA3NLg4v
 6GuQ==
X-Gm-Message-State: AOAM5311mmQ+JXnCKKlMi1hzyqDgCR+yfhFHAaekzRr3ygH2i+ii1LX5
 DDB5C1R2YgxNdUy4a4hYP8CUWlicoszkIw==
X-Google-Smtp-Source: ABdhPJxOgE4Haz9/Fvj0UGmKxz7MjaQdNgq625a6MdAAiBCGhMafIvzFOO9vNh10rj0D3WKjRBviNA==
X-Received: by 2002:a05:600c:2118:: with SMTP id
 u24mr3621915wml.59.1601479632810; 
 Wed, 30 Sep 2020 08:27:12 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id n4sm3556018wrp.61.2020.09.30.08.27.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Sep 2020 08:27:11 -0700 (PDT)
Subject: Re: [PATCH v8 5/7] ASoC: qcom: Add support for lpass hdmi driver
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1601447977-18115-1-git-send-email-srivasam@codeaurora.org>
 <1601447977-18115-6-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c94cf74d-03f6-999e-012f-5d9ef2316d61@linaro.org>
Date: Wed, 30 Sep 2020 16:27:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1601447977-18115-6-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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



On 30/09/2020 07:39, Srinivasa Rao Mandadapu wrote:
> +}
> +
> +static bool lpass_hdmi_regmap_volatile(struct device *dev, unsigned int reg)
> +{
> +	return true;
> +}

I did ask this question in multiple reviews, but never got an answer!
Are all the dp/hdmi port register range really volatile!?



--srini
> +
> +struct regmap_config lpass_hdmi_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.writeable_reg = lpass_hdmi_regmap_writeable,
> +	.readable_reg = lpass_hdmi_regmap_readable,
> +	.volatile_reg = lpass_hdmi_regmap_volatile,
