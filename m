Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF1D6E0E39
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 15:12:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 926AEF04;
	Thu, 13 Apr 2023 15:12:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 926AEF04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681391577;
	bh=YnSHS6i+I1rD3M8afon29i3HsRA4D4JOxzgpDOapIRg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eBD0NlPkxS/Y2cNScuSMkZxR5Zytw3Of8JOks0A6og3aHLT/4cZJ1UtYkSmILXAyF
	 XrwQCNbs8Hxv58X9mKJtgeUxX5irkpamI3JRDofb/rTkdORM6A6+lYf+gldlXi6jt6
	 OXdbQ0BWToh/roCULej2y0JW3SlhaUs0EHUQj79A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF79EF8025E;
	Thu, 13 Apr 2023 15:12:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55A70F8032B; Thu, 13 Apr 2023 15:12:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C8D4F8023A
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 15:11:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C8D4F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gOE0ushq
Received: by mail-ej1-x62e.google.com with SMTP id ga37so37651560ejc.0
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Apr 2023 06:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681391511; x=1683983511;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XCWUaiaWVnGIwMXJ072+drdEdGoVEQpMTGC5dkuhkzs=;
        b=gOE0ushqz0Cf8TvKuw85UEHNM+zO9/7/DBFwDl4ukRzgE2P/+QWipzXCoxv5Pu0P52
         Q63G/7jfgm/4l+6XJywI04qJPLCXIrbpRKpwGaC/6UyZOadVRT9ohA3AfZerRm2v08S+
         ki1As17D4K8Mudlkv6SgPeq0FzDra/okKDXdhJs9wR6TifjNyY1n2yMU43ubZjmqW1l8
         fDML3le/6xGOjHwTqDuyTTShNOUtGih4oWjEGlkNlzu/5NWS5/OJYFpFh6/rUZnxZs6D
         bxj63uHIG4/ynQm0znyw4ulGSnUCGJVojYZbKIxDsguFZejgys6CJInNZwyfxh1/vJ31
         hjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681391511; x=1683983511;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCWUaiaWVnGIwMXJ072+drdEdGoVEQpMTGC5dkuhkzs=;
        b=FiqCUx1NrvNImJDLK7k+kdUkBSR3d6DPLoDY5mvQnHDbJ9q/zTB0ull7qhZnzoGhkp
         8VZE2CEVPhmaoCW0jftyjcvcEOmOhaDPpTswRyfhd/Mx9dMi23IcvR7iIwCEgDkofy+o
         nTn75m8FCWV96E3pICV9vgOckg7sVkCjFTJOw24TubBUfehryWer69OrVDD0OcOPAOE2
         9udBJA9znCtA50RY17qKKGxWSC86DOBgHXKSM9GX+fJueCthw7CTWrnQfoV3InLx2xlA
         Omws2jf9ziq6nwdUvLmIhKV5Auoz4qjSoZOJA2UhDL6m6vA8p59XKHdtqqWFjW2u4yh+
         WGzA==
X-Gm-Message-State: AAQBX9cliuu+uUOk61oz7/C253fi+4dNSGquqlI8bBmyBqCFq8LECx8Z
	NApYJUg/YO90MFrIaDxW/sHJSw==
X-Google-Smtp-Source: 
 AKy350YJ3uLaEKYbCc3ihWijhwZDDaFIcsFka/6gnLknW+fWV2K5RQUvLCR1fAH6/lNXlxY0M+dGPA==
X-Received: by 2002:a17:907:d042:b0:94e:c40d:18f4 with SMTP id
 vb2-20020a170907d04200b0094ec40d18f4mr382489ejc.1.1681391510693;
        Thu, 13 Apr 2023 06:11:50 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 s24-20020a170906961800b0094dde59ad39sm969889ejx.79.2023.04.13.06.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 06:11:49 -0700 (PDT)
Message-ID: <541e2684-9df6-b875-df2e-a33ceee7c780@linaro.org>
Date: Thu, 13 Apr 2023 14:11:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 7/7] soundwire: qcom: use tabs for indentation in
 defines
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Rao Mandadapu <quic_srivasam@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
 <20230403132503.62090-8-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230403132503.62090-8-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KRHXD4WOJLW6CVBL4E65Y3R7N6HJ5WJR
X-Message-ID-Hash: KRHXD4WOJLW6CVBL4E65Y3R7N6HJ5WJR
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KRHXD4WOJLW6CVBL4E65Y3R7N6HJ5WJR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 03/04/2023 14:25, Krzysztof Kozlowski wrote:
> Use consistently only tabs to indent the value in defines.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini
>   drivers/soundwire/qcom.c | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index f2e1135ef113..77a5e4cbbe9b 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -58,9 +58,9 @@
>   #define SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED		BIT(10)
>   #define SWRM_INTERRUPT_STATUS_AUTO_ENUM_FAILED			BIT(11)
>   #define SWRM_INTERRUPT_STATUS_AUTO_ENUM_TABLE_IS_FULL		BIT(12)
> -#define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2             BIT(13)
> -#define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2              BIT(14)
> -#define SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP               BIT(16)
> +#define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2		BIT(13)
> +#define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2		BIT(14)
> +#define SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP		BIT(16)
>   #define SWRM_INTERRUPT_MAX					17
>   #define SWRM_V1_3_INTERRUPT_MASK_ADDR				0x204
>   #define SWRM_V1_3_INTERRUPT_CLEAR				0x208
> @@ -125,20 +125,20 @@
>   #define SWRM_REG_VAL_PACK(data, dev, id, reg)	\
>   			((reg) | ((id) << 16) | ((dev) << 20) | ((data) << 24))
>   
> -#define MAX_FREQ_NUM		1
> -#define TIMEOUT_MS		100
> -#define QCOM_SWRM_MAX_RD_LEN	0x1
> -#define QCOM_SDW_MAX_PORTS	14
> -#define DEFAULT_CLK_FREQ	9600000
> -#define SWRM_MAX_DAIS		0xF
> -#define SWR_INVALID_PARAM 0xFF
> -#define SWR_HSTOP_MAX_VAL 0xF
> -#define SWR_HSTART_MIN_VAL 0x0
> -#define SWR_BROADCAST_CMD_ID    0x0F
> -#define SWR_MAX_CMD_ID	14
> -#define MAX_FIFO_RD_RETRY 3
> -#define SWR_OVERFLOW_RETRY_COUNT 30
> -#define SWRM_LINK_STATUS_RETRY_CNT 100
> +#define MAX_FREQ_NUM						1
> +#define TIMEOUT_MS						100
> +#define QCOM_SWRM_MAX_RD_LEN					0x1
> +#define QCOM_SDW_MAX_PORTS					14
> +#define DEFAULT_CLK_FREQ					9600000
> +#define SWRM_MAX_DAIS						0xF
> +#define SWR_INVALID_PARAM					0xFF
> +#define SWR_HSTOP_MAX_VAL					0xF
> +#define SWR_HSTART_MIN_VAL					0x0
> +#define SWR_BROADCAST_CMD_ID					0x0F
> +#define SWR_MAX_CMD_ID						14
> +#define MAX_FIFO_RD_RETRY					3
> +#define SWR_OVERFLOW_RETRY_COUNT				30
> +#define SWRM_LINK_STATUS_RETRY_CNT				100
>   
>   enum {
>   	MASTER_ID_WSA = 1,
