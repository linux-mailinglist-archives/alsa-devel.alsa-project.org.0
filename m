Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C958E658A90
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Dec 2022 09:34:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DFD39540;
	Thu, 29 Dec 2022 09:33:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DFD39540
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672302880;
	bh=sO9WkAk/OOXRpyqBLPjASGV+6ltb+ZhpTUjgw8wVqNM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=maop7pMZenblb6akKm0HCsCn2qj6/JoVpwHNR7XXVB8TfawGZrAZfSOnKeC9dt+HJ
	 n5Ump5HnU4OEPQiW3EZpbgSTFbcIMYNX5FCw0thtMzAl0OA1PUK/QB6yMwMFit0L+W
	 gs0zB3g1yGy/boXGLYjxoL3zSm5yPbBXBbkNEjmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B703F8023B;
	Thu, 29 Dec 2022 09:33:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EFBDF804E4; Thu, 29 Dec 2022 09:33:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DF62F802A0
 for <alsa-devel@alsa-project.org>; Thu, 29 Dec 2022 09:33:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DF62F802A0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TM3kkB2j
Received: by mail-lj1-x22a.google.com with SMTP id z7so13121418ljq.12
 for <alsa-devel@alsa-project.org>; Thu, 29 Dec 2022 00:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2DbYkte6+L+Cr8TE5Lz9IdM41YLyTWgT3D+LkTXTvZc=;
 b=TM3kkB2j9ZQ0cQ2arKZaxphmUkIs22Q9WkBAIkTuiKaDBevRBs8R1Y1J25gLpxCBO3
 9RoNxVQfx0Wf6mQoCb2rYpc24Y3e0SeHC/2WniaZ2sXKKGa/jepvCZPF2pu5FvmJpruA
 0si/6FqDOiHl0NgPrVl7VvHE/2MyVFjn9RxahsIY4SZXkWbcsuSv/jpQJmfEuWKB70NJ
 KkQso0FRKJ0k9RjSm581fLNzNccCy5dz5XIsWtHaFCMb1WxsEAYW1v1Ypou92BV4XZ3s
 ZdZG3QOxBHGPq4lNsSBqKgEc4+Ugdrq+QXCN9C43WgVQgMUc/VQFjiXr2ow3gTHHR705
 Nabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2DbYkte6+L+Cr8TE5Lz9IdM41YLyTWgT3D+LkTXTvZc=;
 b=0vtzVK7qi33slcU5boZhqGOzCOvodGpL3c50wOyGudTMeiRrOiWVQp0qa7CpYNB8B4
 nUHEI1gxa15DYQZTHZ4+Ascb6dB8/Nr45+A+x+aHJQsYOR0AHrj3qnT+BSWrSkd1KgUw
 SEJ2RUPTzJqSVxc4l5jJo7qfYdq2dtfPYvlFtko0cuaItyzR6QMxy1tz3Dm6B3hHRTZs
 htORG4FWulyTCdDFveoRfXeAGyrwX7ldA98XYt0UtD0PtV3msLBWHCRPQyUhicxV4pRs
 yNivnSGuGYn5jsXu4hFiHVu1fONr1R0nlPhrb9gr7XaGTL5q+fmrxFTmFkTWKNC7gdRA
 1MaQ==
X-Gm-Message-State: AFqh2kp171a+JOQd7nYNO9TRAzmOPVfQOSbUAh9KxifmBgirlf+82PHh
 12WhC3JDbACjdCS8izwuDpmilA==
X-Google-Smtp-Source: AMrXdXtlKNE7qMglk70f1cqT2C2029qOJIrB/AnaeaV/ZtmCr4Qj8LKT0y3U9qFMd56bJL2UbmZyyw==
X-Received: by 2002:a2e:934c:0:b0:27f:b265:d6c3 with SMTP id
 m12-20020a2e934c000000b0027fb265d6c3mr5390937ljh.29.1672302813136; 
 Thu, 29 Dec 2022 00:33:33 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a2eb7d6000000b002796fb63dbdsm2267177ljo.13.2022.12.29.00.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 00:33:32 -0800 (PST)
Message-ID: <2aae081d-25bb-4e93-da31-d19d51d0b4fc@linaro.org>
Date: Thu, 29 Dec 2022 09:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: fsl, xcvr: Add compatible string
 for i.MX93 platform
Content-Language: en-US
To: Chancel Liu <chancel.liu@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20221229063009.2396716-1-chancel.liu@nxp.com>
 <20221229063009.2396716-2-chancel.liu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221229063009.2396716-2-chancel.liu@nxp.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 29/12/2022 07:30, Chancel Liu wrote:
> Add compatible string "fsl,imx93-xcvr" for i.MX93 platform.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof

