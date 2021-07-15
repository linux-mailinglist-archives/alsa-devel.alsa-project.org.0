Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2FD3C9CC2
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 12:34:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7F911685;
	Thu, 15 Jul 2021 12:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7F911685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626345272;
	bh=8UGWIRXOpWfyBJ0SeBQBDasSB74f0qs61vp1EWOCedw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HH8PRl9CNT5hWaBfrbbSD61BvEneSokQ0tXWBrB7cVAq9hfoP0STneodgeSMmvJQz
	 vfmU2WTSirOsvas5WyKEgdeKAaVXynscG0hfFXBQ4rWb5Yzf6Py0Xj0G2XFCIGcsa+
	 x+TAfTdfe6meXdJuJhpa4Ynq/I/5uTtj8qbRJ45c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3030F804E2;
	Thu, 15 Jul 2021 12:32:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34632F804E2; Thu, 15 Jul 2021 12:32:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0AC5F804DA
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 12:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0AC5F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wUmdJPHc"
Received: by mail-wr1-x433.google.com with SMTP id a13so7064397wrf.10
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 03:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QQ9uYw60QT52Mb6pwDvwipu2yY8+bwDR1+TUxrl1UKg=;
 b=wUmdJPHcrUBQXsFk6OQVqkBVLEvFwKaynwMe9+94Zwnofrjs/vvigT28RgKWKS0x1X
 QqVta5d9JGRFbDeD5vMTECO30aIn30e0g4P+MuWtskgg3+Bd8mJKgpLNDvq9I1XDxfz8
 mccDpBwfxXBbl5B70SvH0ZSfYV+/ytfK/ko2040mq6/RgSfRPviHZzcNwgCV7qrUvcE6
 q1TkX7/aV2DivCPlcuf6Liu93osMxNISUMzTAEecaiBdF8NiVC6nVVQ//L6Ly4vakmwM
 UqvEYDmiyOGZtdotfW/Th8oKZBlvjzQWSRjtDxmnC4LeuHpQzWGB5+wzBNBukmeqBzCf
 yHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QQ9uYw60QT52Mb6pwDvwipu2yY8+bwDR1+TUxrl1UKg=;
 b=eai16+80sdCt/i4WKxhvEWT3xIFryEXbAzEnAf9mmBBQqEy+jmdhjL4QQuytYbHeEi
 XSOlSPI66d27fUwHRdDaqE+KiaNyBzrlNQIeCbFkkqdoXDPBrmvvRmUgL3pVDe8C0F4W
 NL7ErAysIhp/a2UjXCE517nfgn6QFak4KuCznv4C7zZmhrax6q9jwVpd3Qgyf0Yzx6sW
 xYJu/ihE8QFwx6uCle9WEvruTLWOGeZftav0BfrIZ0pAT6gcG44eL/2bQB8l8lQSQt7t
 dNU23t0RaiP00Q49poCgScrQQqKlAfI9lQKvqEVJ48bimogtotP7QfZ+/ShjKM6h/oXZ
 EOnQ==
X-Gm-Message-State: AOAM531FcvBZYwNXTKPV8js5oWn8+jZyV6l68wmx1qMuGQP/YSDOaQ71
 fXrz4Lq8bUBoTyIp+1Xg13mmmA==
X-Google-Smtp-Source: ABdhPJzbmzr56TMMDysLHgbDl/J9edrHkbunhopnL4Ep1n/ouXkSOU2eeiUZe+h/zHlAE2GwjOyh+Q==
X-Received: by 2002:a5d:6992:: with SMTP id g18mr4738344wru.118.1626345127586; 
 Thu, 15 Jul 2021 03:32:07 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id o22sm4593073wmc.18.2021.07.15.03.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 03:32:07 -0700 (PDT)
Subject: Re: [PATCH v2 07/16] ASoC: qcom: audioreach: add module configuration
 command helpers
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
 <20210714153039.28373-8-srinivas.kandagatla@linaro.org>
 <d3e9bf09-cc72-c527-89b2-5f23a15163e4@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5d8eadba-dc58-5f84-93ad-0430de049958@linaro.org>
Date: Thu, 15 Jul 2021 11:32:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d3e9bf09-cc72-c527-89b2-5f23a15163e4@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

Thanks Pierre,

On 14/07/2021 17:48, Pierre-Louis Bossart wrote:
> 
>> +static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
>> +				       struct audioreach_module *module,
>> +				       int direction, uint32_t rate,
>> +				       uint32_t num_channels,
>> +				       u8 channel_map[PCM_MAX_NUM_CHANNEL],
>> +				       uint16_t bits_per_sample)
>> +{
>> +	struct apm_module_param_data *param_data;
>> +	struct payload_media_fmt_pcm *cfg;
>> +	struct media_format *header;
>> +	int rc, payload_size;
>> +	struct gpr_pkt *pkt;
>> +	void *p;
>> +
>> +	if (num_channels < 0 || num_channels > 2)
>> +		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
> 
> that doesn't sound good, you flag num_channels as an invalid value but still continue using it.

I forgot to run cppcheck after doing make W=1 C=1.

It did catch these, will fix all such instances before I send out next 
version.



--srini
