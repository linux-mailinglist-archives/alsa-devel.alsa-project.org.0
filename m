Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E650960F8D9
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 15:17:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B3B3297B;
	Thu, 27 Oct 2022 15:16:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B3B3297B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666876642;
	bh=Y9kf4sgYLYctjceMipEeXrXgVdvQ2w4HNu5T150d+HY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N//j5/2oDBOQE1ZPg/I9NWRSy6pZHSGPUyS29p/YRf0CB2oXHBJh8URRFzokE00ez
	 Rx0WWN5BLZ5FEZ/TXFZaAAwSGuLKOlj6vvzuncdtWURw8H1jwoPrL3akyPTEQ0q1go
	 ErLbgEBTqGexn/EImNyUET4ae9IMWmmS3sJiaMMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3719F8016C;
	Thu, 27 Oct 2022 15:16:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94203F8025E; Thu, 27 Oct 2022 15:16:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62F6FF8025E
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 15:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62F6FF8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xD8rYMu8"
Received: by mail-qt1-x829.google.com with SMTP id w29so1031785qtv.9
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 06:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E+oq3QsRUsNah3XNCHZp7kka0MIAB/dhO+Ih97e/MD0=;
 b=xD8rYMu8m+5/wsoqIdFawJVrZfZkOO4NKuKtEhVBAtjEOPNKDNvhaVggJnjZBnKDs/
 GeF69dUImt0Tu2AkCuSmE+d7QY7eUsoXJx1u6434BS7a4PxDurfCMHA8HHbpsAqDzOx0
 vdsljc4789NfeXJAxLrO/Q2F4YZ9c+WFtjEj98LyxFglSzTs8p1y6pqYqZ9J77qCcS8W
 KP6agAgByGqV7MtjtsOcCZCePgoPgvxKJ2Tpf6U7q8kv6N7gsisyEoRndpu+yTHHZ4rI
 3eZATjuhuRgWI/WzEVfloxBJs07fnKmK1IVgsh6aWhzDMnlQk10+mYGnwAXbvBHWFZv0
 /RUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E+oq3QsRUsNah3XNCHZp7kka0MIAB/dhO+Ih97e/MD0=;
 b=pD2kRxnxX+gR51lHq5K0J2wOI7TqJEXxuyMD9wEKJAhuTK3vqsdchAzy/k75+SW1kv
 LtTKUsWejC9MB1yRYP90WKjj6tonxBzLZAEBPUx0/e05ugUYtUBpQ7xoBurbuFggnC5N
 /wI/U95hgd23Wi/oNXWzIeq0BIyPRKyh6nQYfhFDGbw6JLo/msunH40AnS78coYYmsBy
 9x4tHv/LVu/2D++KyvU4zyu4Z1TsrdSsHcjY6wbcr352XM1jIB/uK9WIffKotkP9QReE
 l6a3qISMOeSj2WXeEa51YKVC7zbowjCsUQUaeA72DOShlGwgekehaHiltY9B6Yogi33W
 XIZg==
X-Gm-Message-State: ACrzQf2f2kq/xgRk/UqOzZUk/D+V0rV75cTmmfCyTL24OTlkxX+uCrXQ
 xSmnWE27L/+4g9sP+pKUIv64givq6la/IA==
X-Google-Smtp-Source: AMsMyM56sXvFcb/k1mCEILThX5/x4D0drnzJ+/8BM1VtGEtyAsbveifKToQvA2R8bMaLtRGnk0ahHg==
X-Received: by 2002:ac8:5e06:0:b0:399:880c:28eb with SMTP id
 h6-20020ac85e06000000b00399880c28ebmr41599233qtx.222.1666876578379; 
 Thu, 27 Oct 2022 06:16:18 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05620a405000b006eeb25369e9sm965612qko.25.2022.10.27.06.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 06:16:17 -0700 (PDT)
Message-ID: <453cf370-4b59-967e-b7da-9b3a6eebbc48@linaro.org>
Date: Thu, 27 Oct 2022 09:16:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH -next] slimbus: qcom-ngd: Fix build error when
 CONFIG_SLIM_QCOM_NGD_CTRL=y && CONFIG_QCOM_RPROC_COMMON=m
Content-Language: en-US
To: Zheng Bin <zhengbin13@huawei.com>, srinivas.kandagatla@linaro.org,
 gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20221027095904.3388959-1-zhengbin13@huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027095904.3388959-1-zhengbin13@huawei.com>
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

On 27/10/2022 05:59, Zheng Bin wrote:
> If CONFIG_SLIM_QCOM_NGD_CTRL=y, CONFIG_QCOM_RPROC_COMMON=m, COMPILE_TEST=y,
> bulding fails:
> 
> drivers/slimbus/qcom-ngd-ctrl.o: In function `qcom_slim_ngd_ctrl_probe':
> qcom-ngd-ctrl.c:(.text+0x330): undefined reference to `qcom_register_ssr_notifier'
> qcom-ngd-ctrl.c:(.text+0x5fc): undefined reference to `qcom_unregister_ssr_notifier'
> drivers/slimbus/qcom-ngd-ctrl.o: In function `qcom_slim_ngd_remove':
> qcom-ngd-ctrl.c:(.text+0x90c): undefined reference to `qcom_unregister_ssr_notifier'
> 
> Make SLIM_QCOM_NGD_CTRL depends on QCOM_RPROC_COMMON || (COMPILE_TEST && !QCOM_RPROC_COMMON) to fix this.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

