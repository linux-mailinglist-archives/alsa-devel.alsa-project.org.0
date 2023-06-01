Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9DD7199C1
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 12:30:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0300D20C;
	Thu,  1 Jun 2023 12:30:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0300D20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685615451;
	bh=Qb6Jaon/ft7XSSxBzb3Av8xvgXZ8XSlBJEDZ4WbQQQ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jVJnCRmWp6201OGyfqNy7OeMzlFCf0Fvbxdyvhk1fhc6iIohQHjYNk4RnAnuXKzkY
	 gIaD8qQsRAIomDSKiuMuwBao+TULH+yfse1PUI/Y9L8HHKSKqHUYmcCRFQxVsHaZUV
	 cEDxzIvXVlvmlBHtUvQ2JV8R4TZNGjt09aUVrLVo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFBC9F80494; Thu,  1 Jun 2023 12:29:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A65F4F80132;
	Thu,  1 Jun 2023 12:29:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89053F80149; Thu,  1 Jun 2023 12:29:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 845ECF800ED
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 12:29:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 845ECF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kP/zj0HA
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f3b314b1d7so713217e87.1
        for <alsa-devel@alsa-project.org>;
 Thu, 01 Jun 2023 03:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685615386; x=1688207386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bp5xxOt20GHMe9x9oOlssfGvZFl/WMiJaJ496BlN+YU=;
        b=kP/zj0HAKnPgUuu7Tgrr++eMwujhAUwYvyrnwCZ/9sgnT+z3G/B9L7afSaX3QAuF8P
         OTVqXxoPZuNQoH3tVYg3GcEoXykvO+m9pSIXC9dc6fIAIgBFju39VCg+nwYFuEyaghAa
         WowicwdIuIuZCFgRVT3glsVxtcr+I6blVFTOjMWrdlQ2auo+WkrX3ll5yCzHnJIUTjpV
         0feMbLTg9/RnvDvZa75U8hZjLJgblauY4ofKLWvvOENre3/Rr2JdodDXLwLkMMxjz7QM
         Jwc2xLW5XnqBplIZRlUS6StIxQO0xDRRhS+JYilIIrao7koEBMod3b6pIgtByUeHTFAg
         QAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685615386; x=1688207386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bp5xxOt20GHMe9x9oOlssfGvZFl/WMiJaJ496BlN+YU=;
        b=gVcNpLVHiGszMlkWQdIL6tcyKumsE0ynC6Jx4tNvoLQyC0y9mP2GNNhK4t8aFctRXg
         7qQjtJJgazTbWcz6bj347N/OCG83gNlIaHLyS2WaPhTfNNyK6SWD1rjn5SB1ujjamFqZ
         a+fdxBmXqBMF6R2o6kPK9Barn+qQPuJI3XekA8LHSsc/f+Tvnzys141CZBg8pZl8Ap2w
         txw7xka6LueobmSEW8Nj2lemvumUXMt2p/dnTT5ubfr+yDLL1MWLMUrC6JH6KRyce70c
         8CXOkD7mNe9aGA1B08v+Z9GVKDy3SNUBCu/xmbSh1rOCL/f9iEYZhcxBmDhVj3cr56X4
         +hYw==
X-Gm-Message-State: AC+VfDymqBqyX0CDiDrHHDyL7PJ8q4xRenNh1t+1RAbBK9TjaIW2hfVz
	n/JGRJxL7/gWsTakilks1qCGWA==
X-Google-Smtp-Source: 
 ACHHUZ4OWftVrfoV87qYQLL4OGbRoiW1uL9XruidkQ3APydLZi5AlKND7uOLjblqaNOABc+5UzXDmQ==
X-Received: by 2002:a05:6512:66:b0:4f4:b3a6:4140 with SMTP id
 i6-20020a056512006600b004f4b3a64140mr1036037lfo.42.1685615385755;
        Thu, 01 Jun 2023 03:29:45 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id
 x28-20020ac25ddc000000b004f4b0493749sm1038511lfq.303.2023.06.01.03.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 03:29:45 -0700 (PDT)
Message-ID: <8e5380cd-2ee4-95be-14df-add5ff440088@linaro.org>
Date: Thu, 1 Jun 2023 12:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] soundwire: qcom: fix storing port config out-of-bounds
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Dan Carpenter <error27@gmail.com>
References: <20230601102525.609627-1-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230601102525.609627-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UYCAG2USAGIJ2OCP6IBQ6QGTHGWHHNGP
X-Message-ID-Hash: UYCAG2USAGIJ2OCP6IBQ6QGTHGWHHNGP
X-MailFrom: konrad.dybcio@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UYCAG2USAGIJ2OCP6IBQ6QGTHGWHHNGP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 1.06.2023 12:25, Krzysztof Kozlowski wrote:
> The 'qcom_swrm_ctrl->pconfig' has size of QCOM_SDW_MAX_PORTS (14),
> however we index it starting from 1, not 0, to match real port numbers.
> This can lead to writing port config past 'pconfig' bounds and
> overwriting next member of 'qcom_swrm_ctrl' struct.  Reported also by
> smatch:
> 
>   drivers/soundwire/qcom.c:1269 qcom_swrm_get_port_config() error: buffer overflow 'ctrl->pconfig' 14 <= 14
> 
> Fixes: 9916c02ccd74 ("soundwire: qcom: cleanup internal port config indexing")
> Cc: <stable@vger.kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://lore.kernel.org/r/202305201301.sCJ8UDKV-lkp@intel.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soundwire/qcom.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 7cb1b7eba814..88a772075907 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -202,7 +202,8 @@ struct qcom_swrm_ctrl {
>  	u32 intr_mask;
>  	u8 rcmd_id;
>  	u8 wcmd_id;
> -	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
> +	/* Port numbers are 1 - 14 */
> +	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS + 1];
>  	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
>  	enum sdw_slave_status status[SDW_MAX_DEVICES + 1];
>  	int (*reg_read)(struct qcom_swrm_ctrl *ctrl, int reg, u32 *val);
