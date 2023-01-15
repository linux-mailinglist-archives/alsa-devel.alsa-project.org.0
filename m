Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BE166B1D4
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Jan 2023 16:06:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 184325241;
	Sun, 15 Jan 2023 16:05:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 184325241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673795172;
	bh=xZFmFJ3U8w/holdVixrYCqVjkEZDrwb0AZbPGx7YhuU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WX16oMVEAnbfu7XvKcqbL/heIr0Omdh9d630afsQmIcuPzp7DpY7H/8PNlLS5l3K7
	 1HAkXFDbGe0NCKmXqV2aZVrdZ+L3K2G7k5WEOJjDcZEDpt7Yoe5uk19N1WS2bRAWuz
	 xwKEbO1QaQQNttPDFoBJdr30M2NvAc9t0NIKKqXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96059F804E6;
	Sun, 15 Jan 2023 16:05:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9EFDF804DE; Sun, 15 Jan 2023 16:05:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06B01F801EB
 for <alsa-devel@alsa-project.org>; Sun, 15 Jan 2023 16:05:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06B01F801EB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=weB02iux
Received: by mail-ed1-x52e.google.com with SMTP id v13so3488118eda.11
 for <alsa-devel@alsa-project.org>; Sun, 15 Jan 2023 07:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NBz7cqiVd9e6aGzJO6sSxgMMp/c0wf7CWjQCjUZnLOc=;
 b=weB02iuxCQuUjR4eMOm06SjJc0Z5vrhFbbAE3stJQdycLx+dcneNAyyAvcBVrv0NKi
 rbOfYnOrZnjoywNVCrdOlpcifs5m3b5LfAfunprejC+QfIkhbn2jP0J4XLqltVfXLxMU
 VOWQHzw8GBkIGUc/zCD7oGEalc5a1FtiR68rXVpbj+3WvO6K/fDtFhvh+wTUjCNgb9T8
 HarYW4HESB2aXafQJM7jfvZsexB3Bf+RyFVyDNOiPhsRx3V3wG7OX+9bou/WXkJl10Ce
 Z/61GHe94sVipTyZmoHoLldfNABGWSPI6WlVKtpIzUN1dTOEhVnt5Fobj32C9F+QLeuW
 3t2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NBz7cqiVd9e6aGzJO6sSxgMMp/c0wf7CWjQCjUZnLOc=;
 b=PIBKjzdkEMA8sJ8HKSQux0MS/07P9ZR9aKNltytNfboM8UFAB2wytHoXYywTv8RJhW
 Jf8G5IkYs0qi8Ls7hbJinczh441iOHYkgVqif9rxZQsJocK8LTC3nZ/EyYQVr4abFNH4
 3673vHNmTRTpjvyGSznOuiLrGa4CTYvTx4rbbrt8CeLYrJKxgK6KAIZGkmq5EH/humGC
 NPJP4TDV/Zbj0qh+uGC66tbGPQOsHE+P/vIvGAoaAVy6uD4mPu7iIpOVDesybmQM3x2K
 lutW63zdYPGE+aocS3flUNOnGT8j/irD96yOCYIQNMsS0hxE/OjLjeTRA1ReSGPsHDQQ
 AuYg==
X-Gm-Message-State: AFqh2kqT/Ed4nCqyRSfcH5G0W9cGvyTXMBe5XjGlSWMBZ5FSygiBQM0c
 BPBnCJRZ1Ze9WNsDcZhonLoNrw==
X-Google-Smtp-Source: AMrXdXtMA5nHafq8S3q65oQm07Cx3buGe5X/vT5EvmcIHYotqgTk9qjfEoOx470xrqgup9PRfNMbsg==
X-Received: by 2002:a05:6402:528f:b0:47e:eaae:9a69 with SMTP id
 en15-20020a056402528f00b0047eeaae9a69mr78754776edb.41.1673795107259; 
 Sun, 15 Jan 2023 07:05:07 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 c39-20020a509faa000000b00483cccdfeaesm10646282edf.38.2023.01.15.07.05.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jan 2023 07:05:06 -0800 (PST)
Message-ID: <55e2d839-1488-c5a9-0ef8-55248554b86a@linaro.org>
Date: Sun, 15 Jan 2023 16:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 3/5] arm64: dts: fsd: Add I2S DAI node for Tesla FSD
Content-Language: en-US
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 s.nawrocki@samsung.com, perex@perex.cz, tiwai@suse.com,
 pankaj.dubey@samsung.com, alim.akhtar@samsung.com, rcsekar@samsung.com,
 aswani.reddy@samsung.com
References: <20230113121749.4657-1-p.rajanbabu@samsung.com>
 <CGME20230113121825epcas5p30053dc48475ee6a8cf33bd5112d9d6ed@epcas5p3.samsung.com>
 <20230113121749.4657-4-p.rajanbabu@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113121749.4657-4-p.rajanbabu@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 13/01/2023 13:17, Padmanabhan Rajanbabu wrote:
> Add device tree node for I2S0 and I2S1 CPU DAI instances for Tesla
> FSD platform.
> 
> FSD SoC has 2 I2S instances driving stereo channel I2S audio playback
> and capture with external DMA support.
> 
> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd-evb.dts      |  8 +++++
>  arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 14 +++++++++
>  arch/arm64/boot/dts/tesla/fsd.dtsi         | 34 ++++++++++++++++++++++
>  3 files changed, 56 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> index 1db6ddf03f01..cf5f2ce4d2a7 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> @@ -38,6 +38,14 @@
>  	status = "okay";
>  };
>  
> +&i2s_0 {
> +	status = "okay";
> +};
> +
> +&i2s_1 {
> +	status = "okay";
> +};
> +

You need to rebase.

>  &ufs {
>  	status = "okay";
>  };

Best regards,
Krzysztof

