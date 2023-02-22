Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FB769F70C
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 15:48:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66859E9C;
	Wed, 22 Feb 2023 15:47:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66859E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677077307;
	bh=9Qi3Slb1K37lBnZBX9Lm/kX4CeZyGeJ48HRJps8rd7U=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Ez2j2XJP/ckwOb3Zn4V698PeQM0TkGSdDTUEm3ulhNEh0znclbMoZYgA/etJvsHHZ
	 xT5AVSC5QEM8F8fVnTQmxwyljt9d3ERFd9H9DFVRXLahm2o8GBM83QzG60FHGh4XOp
	 ZhPKjrTHSi8CmKw2ES79WU5d8K7U6hj8bVHXZCXI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28541F8025A;
	Wed, 22 Feb 2023 15:47:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8553F80266; Wed, 22 Feb 2023 15:47:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA2F4F80083
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 15:47:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA2F4F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wDz3kMMj
Received: by mail-lj1-x231.google.com with SMTP id z5so8063791ljc.8
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Feb 2023 06:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JsfYZbZTcH3AGBn/UIvjg51JaY99ziTDUPxRNM8kMPg=;
        b=wDz3kMMjHapiCiaEAYT158xP5zG/O4p5xL09bvgPuTGB1Y/myR5GXZfwdgWBc/LMQc
         Rwby7x9GxRr/0DpzzFJE4xqU4GC5IiWD4dEQhG+MnP3o5yPbUyrSUv3a7giW6/YC5itX
         99aJnQ51VGiftf84jFkU5vB9VRuk7xhMAER6+qpv0pb163LVK43xIK2W0T5sokrpwhhn
         c5agMKwlAubSEHP+jX64M9Vt9QVnfPcooQ9Zgi/CfzI45l6OjjEcYdA/3z+lAXDRMsNu
         DPGhxMr2zv/xhfjlvlh4jshqqZSXkvVdIoliWr4eiJ+ZqeGeD9yBP8WOyDWSoBgY+EQ8
         EKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JsfYZbZTcH3AGBn/UIvjg51JaY99ziTDUPxRNM8kMPg=;
        b=RpzSU5nJIcaZoEB6iuQ+VCY1Oa13aWaAC+xniQCcTgFUF0hYpvzg0JhJbKvJw1uO4X
         fjpO4nzcSYRAFuxckcXIRwKeJyXiUU1wKBbZc/DWyjzBtbQ9CqcqTVgma0znglDIOsCV
         cY7/81MAif7sWj04zAr2mcraUEsUDi1sznPRrcAuaogdpQoe57nZ87YaxxvsYT4UUuwM
         o+4LfKBxLd/dVu7cdqlKgciAMc5+G88cIX4J9684bWayEtj3fQRIx5mMmS8n7rtXbkeo
         SEEp2enu78buC1vyLO2X4yXdvEUkjqjGzzPYRrByx5G+ZpWZKwilhtvMomit3yLlhTgM
         HBcA==
X-Gm-Message-State: AO0yUKWuR7MtQif6Jffv5N6xCjo3aMgrFqnM/Z6YUR4+YzuLE0c3bPZL
	5WUYqFz/QYv0gUdOQSZOCyNTBQ==
X-Google-Smtp-Source: 
 AK7set+5epA/wJFXcFA8AfQy+dzMhWWm13BX2dxUNOkmKLV4wg9xt3YxvKO23nI9zvgvYTleO8N1OA==
X-Received: by 2002:a05:651c:510:b0:293:4b8e:f7e9 with SMTP id
 o16-20020a05651c051000b002934b8ef7e9mr4380059ljp.23.1677077245109;
        Wed, 22 Feb 2023 06:47:25 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id
 a18-20020a2eb552000000b002935899fe3fsm390848ljn.116.2023.02.22.06.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 06:47:24 -0800 (PST)
Message-ID: <dc544641-b9f1-96b4-95a1-30fafc0712e5@linaro.org>
Date: Wed, 22 Feb 2023 15:47:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] soundwire: qcom: gracefully handle too many ports in
 DT
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230222144412.237832-1-krzysztof.kozlowski@linaro.org>
 <20230222144412.237832-2-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230222144412.237832-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NYN3N2PA54HE2L2Y4BX2NCJWOBISFQSP
X-Message-ID-Hash: NYN3N2PA54HE2L2Y4BX2NCJWOBISFQSP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NYN3N2PA54HE2L2Y4BX2NCJWOBISFQSP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 22.02.2023 15:44, Krzysztof Kozlowski wrote:
> There are two issues related to the number of ports coming from
> Devicetree when exceeding in total QCOM_SDW_MAX_PORTS.  Both lead to
> incorrect memory accesses:
> 1. With DTS having too big value of input or output ports, the driver,
>    when copying port parameters from local/stack arrays into 'pconfig'
>    array in 'struct qcom_swrm_ctrl', will iterate over their sizes.
> 
> 2. If DTS also has too many parameters for these ports (e.g.
>    qcom,ports-sinterval-low), the driver will overflow buffers on the
>    stack when reading these properties from DTS.
> 
> Add a sanity check so incorrect DTS will not cause kernel memory
> corruption.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Fixes: 02efb49aa805 ("soundwire: qcom: add support for SoundWire controller")

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soundwire/qcom.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 79bebcecde6d..c296e0bf897b 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1218,6 +1218,9 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
>  	ctrl->num_dout_ports = val;
>  
>  	nports = ctrl->num_dout_ports + ctrl->num_din_ports;
> +	if (nports > QCOM_SDW_MAX_PORTS)
> +		return -EINVAL;
> +
>  	/* Valid port numbers are from 1-14, so mask out port 0 explicitly */
>  	set_bit(0, &ctrl->dout_port_mask);
>  	set_bit(0, &ctrl->din_port_mask);
