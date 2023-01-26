Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D7C67CF56
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 16:10:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6BB4A4C;
	Thu, 26 Jan 2023 16:09:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6BB4A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674745813;
	bh=mOqBM3UiSivT0tfqT6j3BTaaF2WEjZfMDPsFSh2cMY4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jgAdpSG6SH0w3Vb0ADxJxsfrPVXaaoNTVFLucc/KChAAKaE/Ak4GokqH4Ukg1aUrY
	 d7mKpjQf95f1YehLAAyKcevOohAnUVomVjR/nXzYdMuyvZBsbDCJFbUmdolnTOei/q
	 4JfTTE2UYIjffnhpGGS3B68P9nDtUIqYvkiE92Uw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90050F80224;
	Thu, 26 Jan 2023 16:09:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0A36F8027D; Thu, 26 Jan 2023 16:09:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48D8BF80224
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 16:09:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48D8BF80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FYSBmhD1
Received: by mail-wm1-x32e.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso3422591wmc.4
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 07:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ajpze3MQAtAYvqF9cQldA9cf7OwdmlVDcuG8wHeoRgs=;
 b=FYSBmhD19DPaZ+sYkioR8rvsR1S61pjCm2F6hhPKO9Wx6aQe6lG7AKj6WZ/pbnqifH
 erq7dkFAAnezOLndNVdIhyFxmpWo6gtG/q5n//0JUQe+qPFfFXZXoeKXpcafhfOJO6Rp
 h2OubWFiQ4j7ObP2RFI3WJMzzxY1p+m9zRUhcBSLYVSs7md26wfTJoVJQHyM37kyN6ZP
 WHDuLaKPrO6jqyFNh+I4wf1ZjuqUyn4uto8kBOxptMbq+5kDHkGcKI+N3aFKP3UwOCPk
 R4ujUrAa7WTfU7Yo4RXVGtj4ViBKak1EFBaoTAD1+sE6LStM1qHPI5iZfaYqGbuzH3Y+
 0LjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ajpze3MQAtAYvqF9cQldA9cf7OwdmlVDcuG8wHeoRgs=;
 b=Ey5bnyilF680HBxy/boUnyRZREGgkL+TKmYPJ9HJA/WRK53xQ8r8UeiJEP2mHdZ/YK
 p/H7bMAIhjmnGhfiQB57yIG9xHsIyYOiAenPEX9ayQdxgJ5SSul/L5Za289KZbjvPUws
 jDK8Ti7CysQtopa66IJLHwntNIEmiB75DpP5CWFRQqPdhX9BFM3o6LbsGIzTI0WJ07LV
 v2ECSbnyT7G7RiA/gjMt7GpPfEmaEDnXor77Wup9kXFG8lU8qYeGnD8v+kXwHzwGqQoE
 M3YqUkllCOaZ+EgsKGIjFf6eI2TkchcNZZwHGqutvvGy9HTYRfOomSiaP36753QCJcSL
 lUSA==
X-Gm-Message-State: AFqh2kqBorohukHnLSK/7e6LMltKNCGhJEPjV9qWRnrk4hBTRODWo71n
 e779nEHRvIAoE4mJdf6GBiUYOQ==
X-Google-Smtp-Source: AMrXdXtgFJtcW/CyDSscF5zX4thhHfrzGW2wYzmuzbbfzlkbA0G2ExYJ6Y5m6PB09MYvx9PJPN8JNw==
X-Received: by 2002:a05:600c:3b02:b0:3da:1bb0:4d71 with SMTP id
 m2-20020a05600c3b0200b003da1bb04d71mr43595511wms.11.1674745747349; 
 Thu, 26 Jan 2023 07:09:07 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 ip6-20020a05600ca68600b003d04e4ed873sm4834628wmb.22.2023.01.26.07.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 07:09:06 -0800 (PST)
Message-ID: <c27b5fc4-9153-0682-38d1-65b4adf14082@linaro.org>
Date: Thu, 26 Jan 2023 15:09:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 10/22] ASoC: qdsp6: q6afe: Increase APR timeout
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
 perex@perex.cz, lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, broonie@kernel.org, bgoswami@quicinc.com,
 tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-11-quic_wcheng@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230126031424.14582-11-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 26/01/2023 03:14, Wesley Cheng wrote:
> For USB offloading situations, the AFE port start command will result in a
> QMI handshake between the Q6DSP and the main processor.  Depending on if
> the USB bus is suspended, this routine would require more time to complete,
> as resuming the USB bus has some overhead associated with it.  Increase the
> timeout to 3s to allow for sufficient time for the USB QMI stream enable
> handshake to complete.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
> ---
>   sound/soc/qcom/qdsp6/q6afe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index ca799fc3820e..41b4871e2ca1 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -365,7 +365,7 @@
>   #define AFE_API_VERSION_SLOT_MAPPING_CONFIG	1
>   #define AFE_API_VERSION_CODEC_DMA_CONFIG	1
>   
> -#define TIMEOUT_MS 1000
> +#define TIMEOUT_MS 3000
>   #define AFE_CMD_RESP_AVAIL	0
>   #define AFE_CMD_RESP_NONE	1
>   #define AFE_CLK_TOKEN		1024
