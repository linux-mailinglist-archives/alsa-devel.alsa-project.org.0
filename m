Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE58F3DF086
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 16:40:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6453218CA;
	Tue,  3 Aug 2021 16:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6453218CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628001640;
	bh=4nWLv16lyXmRdRC35PFlN7orqFSznQWRLy5D+L/MmtE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I83RaIJZt1B09bj6hTcSpAN1ln3TNLyqx4RcLatuC6OEdXY/s2OQfrXkHNhoeLMoU
	 pJ2cijES/Z8s3YoMsgHx12XNX9n9vEwKuW+Lf9smYOla45qoL6pHGV/Ft5hPc9AgG6
	 gLhbwQGimcea3/UbNtS3rLfG6zvtE+icPVwLcNO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE7E4F8032C;
	Tue,  3 Aug 2021 16:39:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CB28F802E8; Tue,  3 Aug 2021 16:39:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60F76F80095
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 16:39:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60F76F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HpvhYYi4"
Received: by mail-wm1-x32d.google.com with SMTP id b128so12623878wmb.4
 for <alsa-devel@alsa-project.org>; Tue, 03 Aug 2021 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M8gAj66STiwkkGW8S9E1MMInjJYv6wtJtKzCqXg7juQ=;
 b=HpvhYYi4fm+8uzvbtCtyoqymYi/p6+HblVxg9yVBLZCmGYeD9lGxD8XwPAUS5kf0Hi
 vFZbgUZzio06LrDnFD0i6P5gEu0u4rXr7C4asJ6zQSXxBoKVDTzSHI5lAiCSZdoteCv6
 p8/pXoqIwnTx8cjlOWmIcV9NeGWB0iC8UM3HR4z22UXzzY1oDZoAbxqeFz8FnHPIk4ev
 6ZPckoep2UcroHTi6iE4qEMfPVA0WOkPtqJMN9cECB+MZpFLC6D+FkI+phd7/I1Af7gu
 zhCvzL2MI8A3u8psySRXKfeP8OstQuYyyiorzbfLBlez1i2Rn3MPuwQcWaOmgzVg8mSk
 RFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M8gAj66STiwkkGW8S9E1MMInjJYv6wtJtKzCqXg7juQ=;
 b=Q60gVk9byTyKrg++6qYk8o5P5ze6VgpXtTkr/gAGDXc1q+qfQiaGZ5hJwpUOHrkpJ1
 50oGf3wQDkgqzPa+AyuakxIAuPTv6FbZIhLeHedPYMHu6Od7v57IonvzLXcAz+IvvnZ1
 5wfrybSx7GhQB1Mhk/gvK/8uKrsjedo3FoOquBF3EHvYwUxh0P9VF2XX890r+n0zbvYp
 PXK2Hd4/hcE4FXT9zuK8zz9uhfbCnj05or8BLsrVOXayM1O9jTyuYuHwtPrJigNR5VzF
 Eddn2QvvRRAyDSLzvDB0w5mEijPHNLzZZglXUvM7UwpS0TRZ7ABPqSAwr8ZFfvz/tQIl
 mQEw==
X-Gm-Message-State: AOAM530eT86aRuDGjWl1Oz67ocLBHuhUM6GRZ8AkTkwXAX3NCFmmq2hv
 EMEXxak+yNFBqOkvdYjPUwBPrA==
X-Google-Smtp-Source: ABdhPJwjOUvnzHBFh+pvSm4xxD8HG6cddUUCmGbo8HqyGhCTlDoYFZH+MZiXycNLDQkQTnZKmgqUzw==
X-Received: by 2002:a7b:c416:: with SMTP id k22mr4719475wmi.177.1628001542661; 
 Tue, 03 Aug 2021 07:39:02 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id g5sm2692133wmh.31.2021.08.03.07.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 07:39:01 -0700 (PDT)
Subject: Re: [PATCH v3 13/20] ASoC: qdsp6: audioreach: add basic pkt alloc
 support
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, bjorn.andersson@linaro.org,
 broonie@kernel.org, robh@kernel.org
References: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
 <20210803125411.28066-14-srinivas.kandagatla@linaro.org>
 <3c97465c-356d-9989-c855-6eae325e8da6@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <9bdfd7f9-b167-4ec5-880b-c86126c9d1cf@linaro.org>
Date: Tue, 3 Aug 2021 15:39:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3c97465c-356d-9989-c855-6eae325e8da6@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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

Thanks Amadeusz for review,

On 03/08/2021 15:19, Amadeusz Sławiński wrote:
> On 8/3/2021 2:54 PM, Srinivas Kandagatla wrote:
>> Add basic helper functions for AudioReach.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
> 
> ...
> 
>> +
>> +#define APM_PARAM_ID_GAIN            0x08001006
>> +struct param_id_gain_cfg {
>> +    uint16_t gain;
>> +    uint16_t reserved;
>> +};
>> +
>> +#define PARAM_ID_PCM_OUTPUT_FORMAT_CFG        0x08001008
>> +struct param_id_pcm_output_format_cfg {
>> +    uint32_t data_format;
>> +    uint32_t fmt_id;
>> +    uint32_t payload_size;
>> +} __packed;
>> +
>> +struct payload_pcm_output_format_cfg {
>> +    uint16_t bit_width;
>> +    uint16_t alignment;
>> +    uint16_t bits_per_sample;
>> +    uint16_t q_factor;
>> +    uint16_t endianness;
>> +    uint16_t interleaved;
>> +    uint16_t reserved;
>> +    uint16_t num_channels;
>> +    uint8_t channel_mapping[0];
> 
> Current kernel convention is to use something like:
> uint8_t channel_mapping[];
> for flexible arrays.
> I've pointed out few more later, but it would be best to run some kind 
> of search to find them all in all files in patchset.

I agree, will search and fix such instances.

--srini
