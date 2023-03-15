Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A53216BB559
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 14:57:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 397241268;
	Wed, 15 Mar 2023 14:56:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 397241268
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678888646;
	bh=qNtoDLic0TkCYjkRqPN7gA5kRy45XwnlXlNMSX8zXlo=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=aUszbyjaLMSSg64zNPASweYM+pAgPXewJawajzctF2M54fBVYQpDC+6uewtnld7eT
	 JiNO6fvdk2fy6i4vbpbEbk+x7s4GrHgQIoRRCkwQszTJ1VHaDo0sW4jyXY1EeNQxjw
	 7dhWknIdKeMjfMR1t0nyyyqoghea5JovGhZk4q4c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 810E2F80482;
	Wed, 15 Mar 2023 14:55:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7FB5F804FE; Wed, 15 Mar 2023 14:55:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D4E3F80482
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 14:55:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D4E3F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=n+Ds2o5U
Received: by mail-ed1-x532.google.com with SMTP id y4so46443205edo.2
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Mar 2023 06:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678888549;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUoYKIwbEPLMJlRFY3LZ2Wm9oxFPNDYV/KJElx5l8cg=;
        b=n+Ds2o5UiOD5Bb1wkw+d+0BH1Xt+LooclJ3obAcmNQvyHJNDRnQaa9ObKFBA/QUZco
         VgCzj5mW23Qo7skHlk8A02ZAG5kqLfL5HAgzryXSxDSpfAD5Fyxrr1xb6DUVvsxQqgCX
         sHl1ozZAvyi8A8pc1GbSHZmP18nPuaa5txhJ0QfmmOnbIm8JZZtXRo6pcnry1U5VV4dx
         4a6psRDqfrFgtlWRpzE/7nibrYqhxbd0vOTEtAA+PT/vF9pqQAupwarJEjAiE3vQHamg
         /d03f6uVir1t6ZZde1fV8UaxfgibDJZdqCbDpO7fbcmcP4+E6zM88LeS1atN/RNeJE12
         fC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888549;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUoYKIwbEPLMJlRFY3LZ2Wm9oxFPNDYV/KJElx5l8cg=;
        b=BNuXPmgH4lr8ROkSRmbikD9b5ejFKcMpGfvF0pbZ03Z/Kw3LOLFEa/b6PGAXunRY6C
         YD6mxwS48HP0CJTNW1OuAOWMXI5V1TjUt1T+4cGAtd2kTU9JFVFu5OeDqcF5z9KpovW1
         q1B0svmHyPDuPKqiO3tAfT4mhaFYaBE8RpWr8VkQ8HnCrMv84eFYIloNbJCEy1I8rWc9
         tRkCGbs5BYxq2S+D7V2MoHhO/YM03YDUIkUrKRVsDR6A2FBffYmI7Elf8Nb+NwU/Bewe
         bFzC0sKLukxpDuSUKfHBDWjCmIr7prCeBqVKYYZbupBKriJL98QFfySeJNC5De25XtK0
         XZJg==
X-Gm-Message-State: AO0yUKVEzNRTDjlSrpa0qcCaphXoY1SXuk2O0IbUg+2HWD1wv1yW9oTf
	f054a8wCsGljZBY/pCyn+KPhmw==
X-Google-Smtp-Source: 
 AK7set/VV3mEENBlfApLyk3i4f+WooHjZ4NZODuKZ4puxLYSINeHpz5seEl/fCl0teW03eNhSvVh/w==
X-Received: by 2002:a17:907:1690:b0:86f:64bb:47eb with SMTP id
 hc16-20020a170907169000b0086f64bb47ebmr8168964ejc.3.1678888549459;
        Wed, 15 Mar 2023 06:55:49 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 f7-20020a17090660c700b008d0dbf15b8bsm2540738ejk.212.2023.03.15.06.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 06:55:48 -0700 (PDT)
Message-ID: <109ec760-a139-73b7-81a3-230bb040ca15@linaro.org>
Date: Wed, 15 Mar 2023 13:55:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] soundwire: qcom: gracefully handle too many ports in
 DT
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230222144412.237832-1-krzysztof.kozlowski@linaro.org>
 <20230222144412.237832-2-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230222144412.237832-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 67J2QNXDVSPTYILCUQNZ6KEDFSOE4CZ3
X-Message-ID-Hash: 67J2QNXDVSPTYILCUQNZ6KEDFSOE4CZ3
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/67J2QNXDVSPTYILCUQNZ6KEDFSOE4CZ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 22/02/2023 14:44, Krzysztof Kozlowski wrote:
> There are two issues related to the number of ports coming from
> Devicetree when exceeding in total QCOM_SDW_MAX_PORTS.  Both lead to
> incorrect memory accesses:
> 1. With DTS having too big value of input or output ports, the driver,
>     when copying port parameters from local/stack arrays into 'pconfig'
>     array in 'struct qcom_swrm_ctrl', will iterate over their sizes.
> 
> 2. If DTS also has too many parameters for these ports (e.g.
>     qcom,ports-sinterval-low), the driver will overflow buffers on the
>     stack when reading these properties from DTS.
> 
> Add a sanity check so incorrect DTS will not cause kernel memory
> corruption.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---


Thanks Krzysztof, it make sense.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini
>   drivers/soundwire/qcom.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 79bebcecde6d..c296e0bf897b 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1218,6 +1218,9 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
>   	ctrl->num_dout_ports = val;
>   
>   	nports = ctrl->num_dout_ports + ctrl->num_din_ports;
> +	if (nports > QCOM_SDW_MAX_PORTS)
> +		return -EINVAL;
> +
>   	/* Valid port numbers are from 1-14, so mask out port 0 explicitly */
>   	set_bit(0, &ctrl->dout_port_mask);
>   	set_bit(0, &ctrl->din_port_mask);
