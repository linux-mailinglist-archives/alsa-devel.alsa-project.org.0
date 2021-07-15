Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4B23C9CBB
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 12:33:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5221916A4;
	Thu, 15 Jul 2021 12:32:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5221916A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626345224;
	bh=L2TXqMcZs3Qh4nCxEKuV2eW5LZ8xeuPgrH/eziIa3Kw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oabcqL/yRvDJ1cjXQ5df3H8hc/FXzqBkLD3pzpBn2HWH3e6JcvuSXtqHnanUjyRL3
	 uT5vCIRfLofKqJEP6rJpYD8o1oGoHNLNgN/L6cpighjDT4391+RgE0TEHVfL/Hs8Cy
	 5ZsYoM3iEsdE2vuBFW6YQ9tIAl+IpuQklr4j7m8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F572F80431;
	Thu, 15 Jul 2021 12:32:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE519F800D3; Thu, 15 Jul 2021 12:32:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D933F800D3
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 12:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D933F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lmeWxw8A"
Received: by mail-wm1-x32c.google.com with SMTP id
 l17-20020a05600c1d11b029021f84fcaf75so5731931wms.1
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 03:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uI5sHLv1X45o41P1ZNlIPZTo6K3CNNbzt4/8j7wHrLk=;
 b=lmeWxw8AKP2iBysQEh7Z2PubnYaxE2lkhrpjNnUE2kdpRe7+LnM8Fmql7GNKcRgT6D
 L4+Icg8PsIGa4cjqvjH03raTn8s2B7dYUPYq4l9pJVf1KPV96EegokF3mTAonWDMxeGL
 VkFkVhDaqbBGhU0ZWY+z/Ynpkqe/su5BTT/kvLF+/zHFipRiGsGCpI72O/pgb6S+B84/
 R5hWAaJj2+N5knNlfVuJm1foqFZp53MzatBLotjhUh4jpJeMJ5SO5RNifwq5qMrTdIc4
 WkdMaxTsS71oJsc4dNKM6sh25DmqrlS1u0gNQZuK1SbhJOk5Zq3u2LXL/k36OHbZFgag
 BO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uI5sHLv1X45o41P1ZNlIPZTo6K3CNNbzt4/8j7wHrLk=;
 b=KP33EEOuFABE+tww1m20ujUkLgXtR7SNXRpfBvlye3Ye6wMGY8UTofYbNJom1F6W3c
 k435mAuP9xJPXRbNspAr6CHGTzAkZDTeOa4BfI3IWEpGsfrPtGcPfmKh4Yw/pdjYVJTF
 tKytOWRAIQFjbYIY9Vp++ASkQX8Iph7rF0Rgg2Uc98NTFPASNqqhlDUGz/wK4HfGmbND
 6N38mFbgMGKL6n8CnEhzMcZO9T3Pzf57kavTx/MwMGYqM0oVGtbekyw8fGMXeIl3r4Dr
 NiTtDOHMIbtaKn8UdYyuAn+jBA+sZzjNw8fBg/4Fq+XnHQ6WlKRO4QH9EJAvsrPaxLJb
 2a6Q==
X-Gm-Message-State: AOAM532ubbptEg2NvJ8G4YQWzhk8em2S5NqNPvkQgiOmX50Gqw7HAR62
 JVjyFxklEAQrFnrp6lB73djFrA==
X-Google-Smtp-Source: ABdhPJy4pUmyzRIiRTluwsc3ODTXdAbGA2QsRKTI7kS9+ycprB0a1iLCcrIuv2LgilRFneLaItVtHQ==
X-Received: by 2002:a05:600c:22d2:: with SMTP id
 18mr3779099wmg.63.1626345111181; 
 Thu, 15 Jul 2021 03:31:51 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id p2sm4505436wmg.6.2021.07.15.03.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 03:31:50 -0700 (PDT)
Subject: Re: [PATCH v2 05/16] ASoC: qcom: audioreach: add basic pkt alloc
 support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
 <20210714153039.28373-6-srinivas.kandagatla@linaro.org>
 <58d6df8d-83ed-c716-81b2-e0927f58da6f@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e581be78-10cd-12e7-17df-c53c1b680473@linaro.org>
Date: Thu, 15 Jul 2021 11:31:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <58d6df8d-83ed-c716-81b2-e0927f58da6f@linux.intel.com>
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

Thanks for review Pierre,

On 14/07/2021 17:30, Pierre-Louis Bossart wrote:
> 
> 
> 
>> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
>> index cc7c1de2f1d9..721ea56b2cb5 100644
>> --- a/sound/soc/qcom/Kconfig
>> +++ b/sound/soc/qcom/Kconfig
>> @@ -103,6 +103,12 @@ config SND_SOC_QDSP6
>>   	 audio drivers. This includes q6asm, q6adm,
>>   	 q6afe interfaces to DSP using apr.
>>   
>> +config SND_SOC_QCOM_AUDIOREACH
>> +	tristate "SoC ALSA audio drives for Qualcomm AUDIOREACH"
> 
> typo: drivers?
> 
Will fix all the typos in next spin.


>> +static void *__audioreach_alloc_pkt(int payload_size, uint32_t opcode,
>> +				     uint32_t token, uint32_t src_port,
>> +				     uint32_t dest_port, bool has_cmd_hdr)
>> +{
>> +	struct apm_cmd_header *cmd_header;
>> +	struct gpr_pkt *pkt;
>> +	void *p;
>> +	int pkt_size = GPR_HDR_SIZE + payload_size;
>> +
>> +	if (has_cmd_hdr)
>> +		pkt_size += APM_CMD_HDR_SIZE;
>> +
>> +	p = kzalloc(pkt_size, GFP_ATOMIC);
> 
> is GFP_ATOMIC required? it's the same question really than my earlier one on spinlock_irqsave, it's rather hard to figure out in what context this code will run.

I had some spinlocks in this patch for compress offload cases, so had to 
make it ATOMIC. having said that we could avoid ATOMIC here.

> 
>> +	if (!p)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	pkt = p;
>> +	pkt->hdr.version = GPR_PKT_VER;
>> +	pkt->hdr.hdr_size = 6;
> 
> magic number. looks like a missing macro...

There is already a macro for this, GPR_PKT_HEADER_WORD_SIZE I should 
have used it.
> 
>> +	pkt->hdr.pkt_size = pkt_size;
>> +	pkt->hdr.dest_port = dest_port;
>> +	pkt->hdr.src_port = src_port;
>> +
>> +	pkt->hdr.dest_domain = GPR_DOMAIN_ID_ADSP;
>> +	pkt->hdr.src_domain = GPR_DOMAIN_ID_APPS;
>> +	pkt->hdr.token = token;
>> +	pkt->hdr.opcode = opcode;
>> +
>> +	if (has_cmd_hdr) {
>> +		p = p + GPR_HDR_SIZE;
>> +		cmd_header = p;
>> +		cmd_header->payload_size = payload_size;
>> +	}
>> +
>> +	return pkt;
>> +}
> 
