Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AD6689103
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 08:37:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0449A82C;
	Fri,  3 Feb 2023 08:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0449A82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675409856;
	bh=FRwGyqVEzeRX5BVeEAtwnqHgQhB7+w2vqe3AuQOzxCw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HEsrDwb04xXvzr1+hz1MKpVzQ9I93t7cTuHPGg6BmTlpHnM3RG666xWdCuvGrMj+V
	 MLoOmtWuq3GdcRFPoKoY7fqNSKwmxIwSqUZevqyhqJtc3+1Ffs9+hC65rJPs2u/KA0
	 KXF6cEhH0RyeA3qWTGyJdqO4faRb5uQ2zzY1JcsM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85D82F800E3;
	Fri,  3 Feb 2023 08:36:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18C2DF80169; Fri,  3 Feb 2023 08:36:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E45BAF80169
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 08:36:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E45BAF80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uiwZkzp5
Received: by mail-wm1-x32d.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so3183980wms.1
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 23:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7TD/Y1Z4kQCwtHaIXKA9HLPOTgnBZyyqnprCD/yaXHA=;
 b=uiwZkzp5xVFNVdm8EAf5D+spaU9OwcjU7b4ygg4U69H1x/6oG/7g+4q4xw4FXiKyaC
 Xkmd9hfbtLFOjf0279AgKuqm8etCU9AcTnJ6mn94Bgzc5uWnaEmLYTMImrgszX/RIHyO
 06PeaQoS1ZASXm87EjTPpUaVg5pJalyz/Pl4PHs7TZpKBx02vcVr+30a+OA1BcNzcO8F
 92eaqO7YZeQvk+Jo4AGRF09qND7lQq9TXsm39nmhtlvpouQKw2lXcfTb9jguhjKr+ptP
 qFjHLpOxe8JrtPMQbajZiFHnHV1TcPq4nZriQxAnoJ0TE6Q20OFK+WYo/+xULH4R/v8e
 oRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7TD/Y1Z4kQCwtHaIXKA9HLPOTgnBZyyqnprCD/yaXHA=;
 b=eIa3Y8MHifWHAcf59FcCyanaSNSkuBS0NhAIOCI32VG/KAinfkxY1OukRWiikyqpte
 ZcH/44uqstIbzPm0mWd/tADfdSfPaV4DxlMZ5ykahjALZP9BCCrALkgpC8wehX3ZsFTb
 u7bGc6X4daQjWPr/FseuXBHnw5cxTzzriGnkcTNIZXUobycCeHDW3avXi7XW+qZoFK35
 FXsLRVr3C2BnR93uKHe2vUgwfpJio8clYroBGQ4X/nue76EjMZtBRMtCuVsSTwPQ4D5d
 +sHn58WoAUBY1v1bmM6qgxFY99xnXi1u6b9a4dQDMp9b1zS8ILcmsgF+lT3BEGBnnf9o
 GESg==
X-Gm-Message-State: AO0yUKXftIVrNsA9/2wfqSWfjL/0BjCqFhIHIHSE4ca+UAZrBpmCdDp3
 KrKgAZ5PoGBKT7jWS5+PIoS1ZQ==
X-Google-Smtp-Source: AK7set+RACG0nVav8h/xTUVinpm1e32UZqGS9HumhnkoNb+yg7MXeGZzYZvZLGWh3xNNSy5OcpswXQ==
X-Received: by 2002:a05:600c:3d92:b0:3df:e468:17dc with SMTP id
 bi18-20020a05600c3d9200b003dfe46817dcmr2717883wmb.40.1675409789177; 
 Thu, 02 Feb 2023 23:36:29 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c3b8900b003d9aa76dc6asm7598116wms.0.2023.02.02.23.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 23:36:28 -0800 (PST)
Message-ID: <8f356b9c-7e85-3e33-4f2d-d27ce52de13d@linaro.org>
Date: Fri, 3 Feb 2023 08:36:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5] ASoC: dt-bindings: Add tas2781 amplifier
Content-Language: en-US
To: Shenghao Ding <13916275206@139.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, broonie@kernel.org, lgirdwood@gmail.com
References: <20230203040115.27321-1-13916275206@139.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230203040115.27321-1-13916275206@139.com>
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
Cc: kevin-lu@ti.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, shenghao-ding@ti.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 03/02/2023 05:01, Shenghao Ding wrote:
> Create tas2781.yaml for tas2781 driver.
> 
> Signed-off-by: Shenghao Ding <13916275206@139.com>

You got four times my comment that your threading is wrong. You never
replied to that comment that something is not clear. Threading is still
wrong - there is no user of this binding here.

Best regards,
Krzysztof

