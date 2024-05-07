Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D228BE12B
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 13:40:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64C947F8;
	Tue,  7 May 2024 13:40:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64C947F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715082043;
	bh=P5uLisXOuxBxifYghRn6YmN4fZZN3pN3vNnX6Ki7prY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hTQVQLGKy/tdZOXznA6CjW3waSjjdnBErJSgXKS6LaDpDSca55PGPhl8KH3kB3CXe
	 jmbv9VTXPwfwm8zG8D9QwAYO5O3ZUrOZB+dSHB1AT+rFhqUmZkOrrRpLcrVaaFGW5t
	 GquIFohl/1G4dfJY9jixYjsJwYol93v8eEomg4sA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D513BF80588; Tue,  7 May 2024 13:40:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8045DF8057C;
	Tue,  7 May 2024 13:40:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E81E8F8049C; Tue,  7 May 2024 13:40:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F27DF80152
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 13:39:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F27DF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DIhGAmgc
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-51f17ac14daso3269677e87.1
        for <alsa-devel@alsa-project.org>;
 Tue, 07 May 2024 04:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715081993; x=1715686793;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQc6eSsksX0o7pSNc/57Q6qum3aXB90lj21OWn/LIWY=;
        b=DIhGAmgc+lzqIPoZ2hUHIDRkI4IxOnMHgn/sW6IPGCFa81YCxA7jzlaWAW4twBpCIr
         ZdBQNF9BZqypSVav4oeGkiaY4akWj34w16J5PG5suvv7vsjgagVcJseN49SQ07y5yoOC
         45HiIpx+EXPwcNxRkELtCEx4oqBoNCtZifSmHiCl+reAsOlqCYCjdAAHwp1S0+dVIDEL
         NxjvK0VOkEmVg7YkIUQCuLVsK68Ffd/cAhTnA0/7z1SYCC2VfnU+3aSbQ3bNsrn/L5DL
         1aEqQJ8DXiqYsECB3Xyf2O7pVOcJvTMzSMySqhSiiQP5BcGIdDEI8ohDQbIS6CZ/g82Z
         SwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715081993; x=1715686793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQc6eSsksX0o7pSNc/57Q6qum3aXB90lj21OWn/LIWY=;
        b=M70p5BP8VL0jKxa+i2+k0FXYM4YsaxbopzVzZqbAI4vhcT/OM447j7c9eS5Iks81ja
         QqNMI6nN/N1IQPwla1E8UcX/8dYGMloX/PDrZTmjBROVjYdNLyrwqNyZphZJi/nQZ3GB
         oEvxWIAnPpfr19MkudwGJ7bv1EGIqW/WS6IW+ySFCfFJdsy7tGiuY+zph5e1f76x+btW
         7kuRMbJf5gH8xX3StAgS9Vj+IEt1MxwmlpUjM1Rh2zYquZ3kfdVvhiMLKOs2LsrqRNct
         NT04PxcA1O6x36YZeS2mIrgATzFEHMT3fLeh0px+0+z3PDjOBfBBBF5qSRNZrz0LjLsw
         634A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9qJongRGkORmr9PEIfWrYdF9ltqAPHI+5aLFjKLv3xYyjS7lcIRsStFtZRGFPkC/XFBEmz5rtJmtL+f9A81XUQCnYTgqCfUMbV5I=
X-Gm-Message-State: AOJu0Yy3n3u/cNFp6+hhjtxaIPtuyyKUvTyZ3GDbJwjPiidyo313qsYR
	mJAkBa+rqJwI3Y6D6Rifksdl6q/5ctPAjCKHIZTLGbw2YnIaZ1z+0W2u15JYulw=
X-Google-Smtp-Source: 
 AGHT+IEQl+GcEsxQFRjcV6Q20fwLgSVV2rorfeOoqBlHfFGwibG/eWjdLeSZi4NLB5VFWaqx9bzyBg==
X-Received: by 2002:ac2:434f:0:b0:51e:f68b:cc69 with SMTP id
 o15-20020ac2434f000000b0051ef68bcc69mr7614847lfl.5.1715081992635;
        Tue, 07 May 2024 04:39:52 -0700 (PDT)
Received: from [172.30.205.144] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id
 a14-20020ac25e6e000000b0051f95499c06sm1772483lfr.285.2024.05.07.04.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 04:39:52 -0700 (PDT)
Message-ID: <247e4ce7-1ba2-43b8-8a11-ec70f99a4fc1@linaro.org>
Date: Tue, 7 May 2024 13:39:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] slimbus: qcom-ngd-ctrl: Add stream disable support
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andersson@kernel.org,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
 quic_anupkulk@quicinc.com, quic_cchiluve@quicinc.com
References: <20240507063004.21853-1-quic_vdadhani@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240507063004.21853-1-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RNLKXJ3M6OY23GAD3IZZJJ7XWTIYEW5R
X-Message-ID-Hash: RNLKXJ3M6OY23GAD3IZZJJ7XWTIYEW5R
X-MailFrom: konrad.dybcio@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RNLKXJ3M6OY23GAD3IZZJJ7XWTIYEW5R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/7/24 08:30, Viken Dadhaniya wrote:
> Currently slimbus driver doesn't support stream disable
> callback, it only supports stream enable callback.
> 
> In slimbus usecase, client is switching to new frequency
> with same channel and calling enable stream callback for
> new frequency but DSP subsystem is crashing as we are switching
> to new frequency with same channel without disabling stream
> for older frequency.

This is very difficult to read

but AFAICU comes down to:
"Trying to switch frequencies without closing the channel results
in an attempt to re-enable the channel without a clean shutdown,
which then leads to a crash on the ADSP."

> 
> Ideally, before switching to another frequency, client should
> call disable stream callback and then enable stream for newer frequency.
> 
> Hence add support to disable stream via qcom_slim_ngd_disable_stream().
> 
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
>   drivers/slimbus/qcom-ngd-ctrl.c | 70 +++++++++++++++++++++++++++++++++
>   drivers/slimbus/slimbus.h       | 13 ++++++
>   2 files changed, 83 insertions(+)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index e0b21f0f79c1..d952827d2e12 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0
>   // Copyright (c) 2011-2017, The Linux Foundation. All rights reserved.
>   // Copyright (c) 2018, Linaro Limited
> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   
>   #include <linux/irq.h>
>   #include <linux/kernel.h>
> @@ -1084,6 +1085,74 @@ static int qcom_slim_ngd_enable_stream(struct slim_stream_runtime *rt)
>   	return ret;
>   }
>   
> +static int qcom_slim_ngd_disable_stream(struct slim_stream_runtime *rt)
> +{
> +	struct slim_device *sdev = rt->dev;
> +	struct slim_controller *ctrl = sdev->ctrl;
> +	struct slim_val_inf msg =  {0};
> +	u8 wbuf[SLIM_MSGQ_BUF_LEN];
> +	u8 rbuf[SLIM_MSGQ_BUF_LEN];
> +	struct slim_msg_txn txn = {0,};
{ 0 } is enough

Also, reverse-Christmas-tre, please

> +	int i, ret;
> +
> +	txn.mt = SLIM_MSG_MT_DEST_REFERRED_USER;
> +	txn.dt = SLIM_MSG_DEST_LOGICALADDR;
> +	txn.la = SLIM_LA_MGR;
> +	txn.ec = 0;
> +	txn.msg = &msg;
> +	txn.msg->num_bytes = 0;
> +	txn.msg->wbuf = wbuf;
> +	txn.msg->rbuf = rbuf;
> +
> +	for (i = 0; i < rt->num_ports; i++) {
> +		struct slim_port *port = &rt->ports[i];
> +
> +		if (txn.msg->num_bytes == 0) {
> +			wbuf[txn.msg->num_bytes++] = (u8)(SLIM_CH_REMOVE << 6)
> +							| (sdev->laddr & 0x1f);

Add a #define and use FIELD_PREP

> +
> +			ret = slim_alloc_txn_tid(ctrl, &txn);
> +			if (ret) {
> +				dev_err(&sdev->dev, "Fail to allocate TID\n");
> +				return -ENXIO;
> +			}
> +			wbuf[txn.msg->num_bytes++] = txn.tid;
> +		}
> +		wbuf[txn.msg->num_bytes++] = port->ch.id;
> +	}
> +
> +	txn.mc = SLIM_USR_MC_CHAN_CTRL;
> +	txn.rl = txn.msg->num_bytes + 4;

Why +4?

> +	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
> +	if (ret) {
> +		slim_free_txn_tid(ctrl, &txn);
> +		dev_err(&sdev->dev, "TX timed out:MC:0x%x,mt:0x%x ret:%d\n",

Please clean this up, add commas to separate all three prints and a
space after each comma

[...]

>   
> +/*
> + * enum slim_ch_control: Channel control.
> + * Activate will schedule channel and/or group of channels in the TDM frame.
> + * Suspend will keep the schedule but data-transfer won't happen.
> + * Remove will remove the channel/group from the TDM frame.

"will" suggests these are not immediate.

Konrad
