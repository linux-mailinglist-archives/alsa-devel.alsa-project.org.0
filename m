Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AF431391F
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 17:18:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 232071689;
	Mon,  8 Feb 2021 17:17:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 232071689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612801122;
	bh=L/4n17N01HA6MUH+7s/uP1AjbhQeZOauHD1/yJSBR/Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A8mxZNpotr5MsFfN6ihFLzzCLFBK0ySS+OooqEoU0D2c9gEx0i9MkqRwhdIR8mUML
	 QJuzHh9GjJjQ9bxODznI7o2ZSvNczcMu1KPy9CCI+KCdGvd93pfs3RFnn300hm9bQl
	 Ym9zRKS75RBKjFDtJiVnx/0qvL/2MCGwQ4H+MhCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AF0AF80165;
	Mon,  8 Feb 2021 17:17:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83EEDF8022B; Mon,  8 Feb 2021 17:17:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76F95F80165
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 17:17:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76F95F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Q5o5BVqt"
Received: by mail-wr1-x42e.google.com with SMTP id g6so4856803wrs.11
 for <alsa-devel@alsa-project.org>; Mon, 08 Feb 2021 08:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aaBKMnRXM76VUB0Qoag8JdTNr4XL1er0J91Eb9Bg540=;
 b=Q5o5BVqtOKxv7+VCMcZ+h49qvYsbkLeOdPqyKzh5GM6YlClJ8vu9nBRgsVjFH+4H4/
 taXKbqrMQeXZeT/dTOKtXZpmnkhXbdAuHDe9w+yyMIQrex0yXzC6asrXkQ6SjqD0Lcyp
 KOjhaxgALsRTgUQ4LXiHinQOIy8PjEBbz1mqvEoDHhxcanjVWNOPo36Bn3R1z+m2MkLT
 /HqwDeJyqgMsE31cTha3KDGuxjTjwohjmi/iQI0BSlsE/4lliOn9Vytbr5hyqb+4Qxb6
 ldcw+UtBoKgdj8VRbMpxhrYUqqHQ0CDQ8YYcGAo1zcVCgQgQiOQ1DAuta0JSXgCtB3P8
 VsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aaBKMnRXM76VUB0Qoag8JdTNr4XL1er0J91Eb9Bg540=;
 b=L0rh1rnhdxUobyo17sflwMYwD3S5uAXq21KhgRLhF6e6LagNrzk7QEnmAQQrhmrSrB
 rboGahmCW+Xn9YnEyHIqqH8Mk3NMUCeBSEicR6E4F7nnriHuddr+6P+2in66icmWDHk4
 TFsXkUZ71rmydGHIvB+RL+3o/9Eie54GCabOF8QtFR+3C09QPnY/N2t01UwWrdmQd9Wg
 1Ux1mEUv/ZJTOg8G2WndJDT1+tsVPDaexnVcuN5lNxBjJV/X5QXDZgXs2IzWC+DXCfia
 TPFltqzy55BbxBOkjambtVCUgltuaInGhOxruMHSRwVfVpfp4JAB3fPbxCx7IkmJwyKt
 nlpw==
X-Gm-Message-State: AOAM5339n4L5rEbfLqI48BT9SCjupm3QE+1WYqdjc9raxG8Rq5nB1a16
 HIb52cBclQkuj3QzPHqJMGyLYrkFkpuPOQ==
X-Google-Smtp-Source: ABdhPJxnnCQSjQogvNvpcKbraMOutlLvkJdfzRF8nhXIrYaq59QP+GzyEZfiWFITnEnwC6L5Tnfxpg==
X-Received: by 2002:adf:fc8a:: with SMTP id g10mr21425065wrr.189.1612801024340; 
 Mon, 08 Feb 2021 08:17:04 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id q24sm20742143wmq.24.2021.02.08.08.17.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Feb 2021 08:17:03 -0800 (PST)
Subject: Re: [PATCH v2 2/7] ASoC: codec: lpass-rx-macro: add support for lpass
 rx macro
To: Mark Brown <broonie@kernel.org>
References: <20210208141719.23305-1-srinivas.kandagatla@linaro.org>
 <20210208141719.23305-3-srinivas.kandagatla@linaro.org>
 <20210208160830.GI8645@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1397a895-c205-ae1a-5319-28cfacaa4ecb@linaro.org>
Date: Mon, 8 Feb 2021 16:17:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210208160830.GI8645@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
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



On 08/02/2021 16:08, Mark Brown wrote:
>> +	SOC_SINGLE_EXT("RX_Softclip Enable", SND_SOC_NOPM, 0, 1, 0,
>> +		     rx_macro_soft_clip_enable_get,
>> +		     rx_macro_soft_clip_enable_put),
>> +	SOC_SINGLE_EXT("AUX_HPF Enable", SND_SOC_NOPM, 0, 1, 0,
>> +			rx_macro_aux_hpf_mode_get,
>> +			rx_macro_aux_hpf_mode_put),
> These are simple on/off controls so should end in Switch AFAICT.

Yes it makes sense!
> Otherwise this looks good.
Thanks, will fix this and send a new version!

--srini
