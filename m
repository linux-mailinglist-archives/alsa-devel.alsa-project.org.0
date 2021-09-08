Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 721DC403D5D
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 18:08:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0667B16C2;
	Wed,  8 Sep 2021 18:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0667B16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631117325;
	bh=c4sOGNyOzJPohQ7vV5GgrzEs78gyenutKKMp+TI+X0Q=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tkn4fiJyAl6n7jywcvfdVnH/CkBgye6pOL1uVLznbIbQzHeBrDPv2T0Al6P0lPXcw
	 moHic1lizU1Tyu3Ypx9YUlCjsqkwonhsDI55ZxDUFUOznUq5Gj5nlUFwsnTSo867DH
	 Tsczum7Cog18Sj0s7CueSzewGtQ6/bDzVV5DnsB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A04FF8049C;
	Wed,  8 Sep 2021 18:07:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25A9DF802E7; Wed,  8 Sep 2021 18:07:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F360FF800C7
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 18:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F360FF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="dB7G61cB"
Received: by mail-wm1-x331.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so2041852wmq.1
 for <alsa-devel@alsa-project.org>; Wed, 08 Sep 2021 09:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=GYpi6gE4nzN8o+CwjqakTN6E/NlmqkQ97rUaOk/UWX4=;
 b=dB7G61cBrEEZi4ZBM15sM0lRlQhSceRMs2j8VpUdowxIq7I+EV/O6tHzIlRKCQYMhb
 sqKtTBuda7JR29GXYY6wtlEPEmOdXuyI7/eQcNvuWD7Cd6m0WoBprusLR/6QX1edwqZP
 AEgnDtPlQkFvRAK8tJMfKHKW/BuNDC7p19BUYyqoOnFk34twoyiM63BUtq5fRNLxyUQu
 FhAQzzeo+b1ZVFvMKe/gu1jnlA1YwVlBXGS9QfgyV+mFfgc7UHcQHhb7OM4+wcj/jdTy
 QwVDcjJcgrc4vPhQrTFrGQYRbWhLz6d4x5VBLtaw1qcQwCtxkRx90tYfvdAdCEyJBoh5
 VguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GYpi6gE4nzN8o+CwjqakTN6E/NlmqkQ97rUaOk/UWX4=;
 b=sOk+8/t2z9WEGaGi0qSEJQFproz8/lZoy0Ozzf3gTRMr/XHvOX1Dn0UYIxth5fZI4h
 Kml9EniBve/Dd8GiZakhXi493IhDk8Sdd4m2dj84VS2pTzpZ9JKitoJCsotteAP6zl7y
 MjrSbTqkPGvt4uVOyFamuREEc0RXvyk+jgql2YilfKbKRcgMSX5IpfTtMbWWKImRoay4
 wbdtRjD6cmLeiH2PKHxRo96VuZtgnZgv+TqVQrY95HPI5A2VZNNgrNGUhnfZh0zByavF
 SI7z2F0iiOkc9TZ8gn3PhSuHWX6Ve9qpVuLK76BUQaAbpNM0P2qzhTppAP5syFHbboni
 zGtA==
X-Gm-Message-State: AOAM533auFS5wQ2U1OxXb16TXKAcvwinUAQHBXdRheCpJTjNu2/vKh7W
 zvARH5Zis7YKNoLhwQt6hhRBgQ==
X-Google-Smtp-Source: ABdhPJxayYYiB4BOAaE9G9T0xgs/ruopGjv/M4dqlYrqylq981dWEmgdngr8ZqrrDDkmypDvw7WByA==
X-Received: by 2002:a7b:c4cb:: with SMTP id g11mr4377562wmk.80.1631117235971; 
 Wed, 08 Sep 2021 09:07:15 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id o7sm2359684wmq.36.2021.09.08.09.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 09:07:15 -0700 (PDT)
Subject: Re: [PATCH v2] ASoC: qcom: lpass-platform: Reset irq clear reg post
 handling interrupts
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <20210908142535.31106-1-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c29802c9-4577-87bd-b843-8540588c6d06@linaro.org>
Date: Wed, 8 Sep 2021 17:07:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908142535.31106-1-srivasam@codeaurora.org>
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



On 08/09/2021 15:25, Srinivasa Rao Mandadapu wrote:
> Update interrupt clear register with reset value after addressing
> all interrupts. This is to fix playback or capture hanging issue in
> simultaneous playback and capture usecase.

Could explain bit more about the issue.
Specifically which interrupt and which ports is this issue seen.

> 
> Fixes: 4f629e4b8705f ("ASoC: qcom: Add ability to handle interrupts per dma channel")
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
> Changes since v1:
>      -- Update comments Header information with fixes tag
> 
>   sound/soc/qcom/lpass-platform.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index f9df76d37858..1a0a4b0b1a03 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -749,6 +749,12 @@ static irqreturn_t lpass_platform_lpaif_irq(int irq, void *data)
>   		}
>   	}
>   
> +	rv = regmap_write(drvdata->lpaif_map, LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST), 0x0);

Writing 1 to a bit of this register will clear the corresponding latched 
interrupt. So I don't really understand how writing 0 is really helping 
here?

Do you have this patch in your tree?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/sound/soc/qcom/lpass-cpu.c?h=v5.14&id=6a7f5bd6185e1c86256d5e52c3bb7a4d390d6e19


--srini

> +	if (rv) {
> +		pr_err("error writing to irqstat reg: %d\n", rv);
> +		return IRQ_NONE;
> +	}
> +
>   	return IRQ_HANDLED;
>   }
>   
> 
