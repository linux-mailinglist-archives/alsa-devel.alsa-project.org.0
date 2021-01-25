Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AB23027BF
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 17:25:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C8791824;
	Mon, 25 Jan 2021 17:24:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C8791824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611591924;
	bh=AvUsencBrke1s9aE6fp1ctk+l5vvkXVtPrV207ceo+I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n5wlGTF7NMsIb4KPMmdqbrqS6o5oDrJYZXx0q/U8R86CBfN28q1Nv0/SwDO+ajvZP
	 fQqje0OgFbhb/K6PwT3Gm3nivTeubaYhtD3gPWfvb5Ke4qAQqmaN7vxJPhM1OFqZ/D
	 1JLvIBpwnHlLE3hedWcToXuc9lh6HeV4FYT6dX30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 778E3F8025F;
	Mon, 25 Jan 2021 17:23:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5951F80259; Mon, 25 Jan 2021 17:23:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74C8AF8014D
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 17:23:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74C8AF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="YOrhvTmg"
Received: by mail-wr1-x432.google.com with SMTP id b5so13348903wrr.10
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 08:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8ntcyKS2z/vURCjFfNTXCa/WB0rFRGasD9K1aMBQeVg=;
 b=YOrhvTmgbPBursMMTpLVLMkWmwTlD4zQcAxCRsGWKu0dPOiVQaHQo0K/W+Doa1OhVR
 pkbf723h2oTPMzDgVpANcT1wGGCRUv59qw3VhKnw9jvrrZ7/TMzi/KoiB1+rA07m3ENR
 JBSZjmEMl7uBvqtCps3sRB0rXjvV/J3IBtlL1882V1JRzHvSqnFb7DlZnKITiUGSwHpH
 N+rf3UQr56Ek1eShxSmJtOB7HH90xicJZqXJiZEmqRqEyUwjvVoZsVxxZs1k2TGBVySf
 Pt14PjFCY9dPTpc+yzZkjN0pSoFvddf9J04hvlKVFW3GQxRvbpRyl+4EPC2TFG3hj8Y/
 Monw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8ntcyKS2z/vURCjFfNTXCa/WB0rFRGasD9K1aMBQeVg=;
 b=Uot3khCRaBUH4ZHD2y9SYyFbqZecpgJbGFUG/nTA1tUR5VYgJL2N2EzVSNkYtNgVA6
 PwTqPncLCuZgx7gfZZAJ4i4XhmseJTWPXe71iBFX27y5u5ftn5muPcr6w/Wau1c3mWbK
 du0A53+KOIz39WzGkY5U5U9uUZKd7kExeS+40rZmDSBaW//mfIHx2VAl2CRarzi3FLZo
 E+Y1pRZaC3zdipgCbU02/Ud2uYUdzAKxh8LsoBKZxPhrUVFPvr4azFP9DXHJIDAs7ux6
 NffmlDH+kQNE8O+SxeSRzUujbp4RRUeK1NfKCXIu+kVDU2A81FgK5uB6+ySEFttMocbM
 TSmA==
X-Gm-Message-State: AOAM531C4OjItmvyDQFksTdKU8ZgwiHH+5Fqs7CzIBiI/P6RblmdK97l
 DcFQNlSDPuvNjDFyb7a5BipvIw==
X-Google-Smtp-Source: ABdhPJznz/oZIZRIgTjD6QnaUMMHl8/spzDxYWNM3AlfDKD5kHjOUMDsxEXuMaoOrrd0+uy+dPzOpQ==
X-Received: by 2002:a5d:4e89:: with SMTP id e9mr1819480wru.201.1611591817453; 
 Mon, 25 Jan 2021 08:23:37 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id w14sm11646805wro.86.2021.01.25.08.23.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 08:23:36 -0800 (PST)
Subject: Re: [RFC PATCH 1/2] soundwire: add support for static port mapping
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20210120180110.8357-1-srinivas.kandagatla@linaro.org>
 <20210120180110.8357-2-srinivas.kandagatla@linaro.org>
 <fcc1b199-644d-8c7f-5e8b-d12b0d9c9a04@linux.intel.com>
 <0a2bbbe5-821a-34dd-e893-fef42baaad2b@linaro.org>
 <9a688b02-80a6-fb1f-d6fa-36ba2d88d3b9@linux.intel.com>
 <c6278763-57d9-2631-7b43-829259a9ea1f@linaro.org>
 <3ee60ad9-9635-649e-ba67-d40a96b25256@linux.intel.com>
 <487c91f9-f6ea-75c2-9150-52db2de42a3a@linaro.org>
 <eaf13d70-86fe-3e18-7a5a-4043f2d8a22d@linux.intel.com>
 <aaf34f07-5eed-3045-e4c6-dc9416689b20@linaro.org>
 <f960757f-ec8b-6d3f-f00e-27242c687926@linux.intel.com>
 <e962caa8-89c3-4a22-5932-4498c406e8f8@linaro.org>
 <adb91730-35db-db7a-75b3-4771723de945@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <31ff9d2b-760a-374e-5b37-45d8e8116f7b@linaro.org>
Date: Mon, 25 Jan 2021 16:23:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <adb91730-35db-db7a-75b3-4771723de945@linux.intel.com>
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



On 22/01/2021 16:42, Pierre-Louis Bossart wrote:
>>>
>>> if you completely remove the stream and re-add it with updated 
>>> configuration things should work.
>>
>> That's exactly what we do currently!
>>
>> The updated ports due to new configuration ex: for "mic capture" 
>> dailink needs to be communicated from slave(codec) to master so that 
>> it can allocate correct ports. That is what this patch is trying to do 
>> (share current port map information).
> 
> .. we have a disconnect on how to do this configuration update.
> 
> The 'stream' support was designed so that a stream can be split across 
> multiple devices (both masters and slaves). With this design we need to 
> have a central configuration and distribute the information to all 
> devices taking part of the stream.
> 
> It seems you are in a different solution-space, where the codec driver 
> needs to notify the master of which ports it needs to use?

Correct! As Codec is the place where we have mixer controls ant it can 
clearly tell which master ports should be used for that particular 
configuration.

> 
> I also don't see where the mapping is actually set. Patch 2 uses a 
> mapping but there's no codec driver change that defines the mapping?
> 
> Do you actually call sdw_stream_add_slave() with a new mapping?
> 
Yes, currently am working on a codec driver for WCD938x Codec, which I 
will posting very soon!

> It feels we are missing the codec part to really see what you are trying 
> to do?
My WIP code is at 
https://git.linaro.org/people/srinivas.kandagatla/linux.git/tree/sound/soc/codecs/wcd938x.c?h=wcd938x/wip#n4526

Currently the master ports are hardcoded in the driver for now, but 
these will come from DT.

--srini
