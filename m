Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A57A72FE8EB
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 12:37:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10A2C18D3;
	Thu, 21 Jan 2021 12:36:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10A2C18D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611229027;
	bh=P8CGZQni8sHxDdb1U1LToUt48/D63oGrYsAyfyWN0n4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rhQenvkfbFiTb5GRuv1VhrZOK1tT4t+Lf3tGdEoguswLJS+SYMzD/ypXMtXOxd0WN
	 lSvIkJN2lhGUFiyNDsLC3JcKDQ2Rbsep6TYX28Y/xfyBygVOWoDViTSldFDcl9MOfu
	 i6FbwzGmySiNlls/EwnV7MSD7irCwhouxvG9ZQfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BC6BF80164;
	Thu, 21 Jan 2021 12:35:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCA82F80257; Thu, 21 Jan 2021 12:35:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BF3AF80164
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 12:35:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BF3AF80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="R1qMmimU"
Received: by mail-wr1-x435.google.com with SMTP id c12so1383491wrc.7
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 03:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rc71x9TS71KaH+vBTC5IHCDnRNTPkNtiIqNh/exWqsc=;
 b=R1qMmimUh7xC7DTZFuC+wrgnkfUadRgEtVRdWS97cBihtkTL0p6Pz91WiHk8LHLB6S
 PE+OugPoFtk8BRQkOCZkT4YxuBkO9+dsr1dGur+xUbhJqPJVePDdffv9DbNgMxGw9yJc
 YPde5ZpM3qpRDCdF4nc1g3o1g1PorW4zee8HYOKbLqJuMPa63kX74aqqCthpHGlfNYmD
 sCqP9iLniEJKGxZ3Qkv4BTxeyTe2geLvKJ24vsg6gFaloOOjqHrdA58XFqFzSBBh2oaQ
 lV1jAslAEv66rP6oSvJN5ataFUbsPXU/4jZjAlXL4MsJQg0dsUsk7abHF0U/16H/sIID
 P4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rc71x9TS71KaH+vBTC5IHCDnRNTPkNtiIqNh/exWqsc=;
 b=gSUKQxZprC1NN2MxUdM4RLPNuyWrnXKw6r/jpRKnW+8zdw+U8yqA2sWuQV8zd02dlP
 Ge4TGuTv/X8W4ChI8Ny0lZy1F1ATz4MiWSrAWtE/9GIJ0ktKZDUcAxvm7/HWhdpZ7V3l
 hpv/CP8ejr1KXSytTuhwzqD09/nmK9exV8mJmuetN6HbrVc+Y4b8W8nRVCm+hWy6Cx7O
 LCx0I5xEriL6dpij40yCT5b/dqKoCOEy++P94DnJBBrSYXObLvxh9GHMT+zzNpPMmbcj
 lSTQRUDpPjxkWA2whlLRK7+f6xNPeW4SBMGWlySDdusY0IEGFKB5tQ3eiex62vLcPRjk
 BNnQ==
X-Gm-Message-State: AOAM532WzlrxZRsZHZkLHveFnqTUdJClhYSEPm7Nj2zeek/2THtqdbzS
 VSyxUq/UigsY0ckG/d1Wu57c/Q==
X-Google-Smtp-Source: ABdhPJwMfLdUylIRf3XEW6U838QeBvWhs6H60c51uU1QwoGmMEvGxunqPML5U9E1+K4/lo+dTDTuoA==
X-Received: by 2002:a5d:4204:: with SMTP id n4mr1362292wrq.196.1611228922477; 
 Thu, 21 Jan 2021 03:35:22 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id s25sm9392026wrs.49.2021.01.21.03.35.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Jan 2021 03:35:21 -0800 (PST)
Subject: Re: [RFC PATCH 1/2] soundwire: add support for static port mapping
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20210120180110.8357-1-srinivas.kandagatla@linaro.org>
 <20210120180110.8357-2-srinivas.kandagatla@linaro.org>
 <fcc1b199-644d-8c7f-5e8b-d12b0d9c9a04@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <0a2bbbe5-821a-34dd-e893-fef42baaad2b@linaro.org>
Date: Thu, 21 Jan 2021 11:35:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fcc1b199-644d-8c7f-5e8b-d12b0d9c9a04@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: gregkh@linuxfoundation.org, sanyog.r.kale@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Thanks Pierre for your inputs,

On 20/01/2021 22:15, Pierre-Louis Bossart wrote:
> 
> 
> On 1/20/21 12:01 PM, Srinivas Kandagatla wrote:
>> Some of the soundwire controllers can have static functions assigned
>> to each port, like some ports can only do PCM or PDM. This is the 
>> situation
>> with some of the Qualcomm Controllers.
>>
>> In such cases its not correct to assign/map any free port on master
>> during streaming.
>>
>> So, this patch provides a way to pass mapped port number along
>> with the port config, so that master can assign correct ports based
>> on the provided static mapping.
> 
> I am not sure I understand the problem or what's different between Intel 
> and Qualcomm.
> 
> On the Intel side we also have fixed-function ports, some for PDM and 
> some for PCM. They are not interchangeable, and they are also dedicated 
> for each link.
> 
That is good to know!

> We don't dynamically allocate ports on the master side, the mapping is 
> defined by the dai->id and is static. There is a 1:1 relationship 
> between dai->id and port_number. See intel_register_dai() and 
> intel_hw_params() in drivers/soundwire/intel.c
> 
> In the machine driver we make use of specific master DAIs in the dailink 
> definitions, just like regular ASoC solutions, so which DAIs you use in 
> the machine driver defines what ports end-up being used. There is 
> nothing fancy or dynamic here, the dai/port allocation is defined by the 
> dailinks. This is a static/worst-case allocation, we don't reassign 
> ports depending on use-cases, etc.
> 
> The only thing that is dynamic is that the programming of each port is 
> handled based on the bandwidth needs of that port, i.e if you play 16 or 
> 24 bits you'd get fewer or more bitSlots allocated to that dai/port, and 
> the DPn registers are updated if you have concurrent streaming on other 
> ports. If you only have a fixed set of payloads, as in the existing 
> amplifier cases, you can hard-code this allocation as well.
Yes, it will work for the existing WSA881x amplifier case.

Am preparing patches for a new QCOM codec driver WCD938x (TX and RX) 
connected via Soundwire,

Port allocations are something like this:

RX: (Simple)
Port 1 -> HPH L/R
Port 2 -> CLASS H Amp
Port 3 -> COMP
Port 4 -> DSD.

TX: (This get bit more complicated)
Port 1: PCM
Port 2: ADC 1 & 2
Port 3: ADC 3 & 4
Port 4: DMIC-0, DMIC-1, DIMC-2 , DMIC-3 and MBHC
Port 5: DMIC-4, DMIC-5, DMIC-6 and DMIC-7

We handle the port allocation dynamically based on mixer and dapm 
widgets in my code! Also channel allocations are different for each 
function!

> 
> Does this help and can you align on what Intel started with?

Firstly, This is where the issue comes, if we go with the 
suggested(dai->id) solution, we would end up with a long list of 
dai-links with different combinations of both inputs/output connections 
and usecases. Again we have to deal with limited DSP resources too!

Secondly, The check [1] in stream.c will not allow more than one master 
port config to be added to master runtime. Ex: RX Port 1, 2, 3 is used 
for Headset Playback.

But if we have a static mapping table of the ports then this will 
provide more flexibility to codec driver! And we can dynamically select 
ports based on the usecase or active dapm path!

--srini

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soundwire/stream.c?h=v5.11-rc4#n1294
> 
