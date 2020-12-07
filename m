Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7132D1481
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 16:19:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 770E6174E;
	Mon,  7 Dec 2020 16:18:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 770E6174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607354375;
	bh=22ZyXJztb/ToDxiK/eA81Wfof8IbwGgYTpXrBZyzKfs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P/A5oLXc8mChmuE1DtB3bSsqNhSKwsIThiCRvLiWu1vRC5yinvuSPXsyAmRiJQBuA
	 qQhi/QYTwDQ34DZADicMFhROLSaguFc9hxYNwJOrgCBnhk9l2VKf3+khw2hiSumS5H
	 7WrEAgiF8YeTXkOEYa5IkprXGjEKqqQVXSD3KA2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FD21F8015B;
	Mon,  7 Dec 2020 16:18:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48798F8020D; Mon,  7 Dec 2020 16:17:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36637F8015B
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 16:17:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36637F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="L8RIv8Kd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607354267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZ1OZkSQex0GH9NjRCSc4AEhhp75r0pXMp0ZtVFZXgw=;
 b=L8RIv8KdqEt7skesapPf4O79zTZphePzOMmPAr2hBfyOWvkU1i7Cakk7bSK10Jd+qbYIcR
 aLXSvHWsrUGg2bMVaULhQm/upxjW8wKuHRh74rj6Oop256W9A9tnH+8Om7ElBdHIGWPU+s
 5rQ/q1yhxyrYm/5S1S4WEvypUzncGHg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-jRqo4VXmPVCRA9ya1ezCug-1; Mon, 07 Dec 2020 10:17:40 -0500
X-MC-Unique: jRqo4VXmPVCRA9ya1ezCug-1
Received: by mail-ej1-f72.google.com with SMTP id lw15so2474064ejb.7
 for <alsa-devel@alsa-project.org>; Mon, 07 Dec 2020 07:17:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EZ1OZkSQex0GH9NjRCSc4AEhhp75r0pXMp0ZtVFZXgw=;
 b=l/84yg7kGRYjruUlhxKuQJopn6ZVSo1+b61JDFcMzyNFBer5c2aCJk5Gn8oh+q0UCG
 ebAx9MY2/+r49O4fUYrPVMwIp8+OAd+Qvt+LuLjE24RxkdyecEMmRU7guYePLMX/5Bo5
 FbrEHjW5EGyPr62C5RdB3nehX/OjqpXawV2+0ywbMkesqvLS/1AI41hL5vgm6cOSadw+
 oPTCG84B0XEhjCnxSeFy3kFnuHF6qLXvf1G+XM7t4vgNGR1qWz1QkweKLAxaXnSbh8N5
 yjRc685yNq94UFsH4kGytk+IlGpdFjSYWDKVjFiFBHL9rkq4NUYLrtrNYQ5k858SkCvm
 fFJQ==
X-Gm-Message-State: AOAM530tnpwEYN1GEwdCDLEZLfVlk9xRfeHt/PL4h9PIuPpAik1Qv+ZN
 tomF6T0aAiMxQ1q7K/n/7riL1B6QthUoy5bSIrSsKhinB/vbj5BdkxRz+nlI+i0cPQ73ux3gaio
 /q0zhmiT7YHcNy2wlb/nmyxnBbHZaqvRu9Te0LozidwQsYbKOek7KCl47oeu0m86yI5by2lD34T
 0=
X-Received: by 2002:a05:6402:22b4:: with SMTP id
 cx20mr20177024edb.262.1607354259101; 
 Mon, 07 Dec 2020 07:17:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5p13xgfVjqjmXK/YX1FrRTDqrluDIJC/sfifNcwscTW1WZFRkK1LXDjjcJGbHD/8M2xXd/g==
X-Received: by 2002:a05:6402:22b4:: with SMTP id
 cx20mr20176989edb.262.1607354258778; 
 Mon, 07 Dec 2020 07:17:38 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id u17sm12634089eje.11.2020.12.07.07.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 07:17:38 -0800 (PST)
Subject: Re: [RFC SOF 1/2] topology: Add sof-byt-codec-tdm4.m4 file
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20201206124626.13932-1-hdegoede@redhat.com>
 <20201206124626.13932-2-hdegoede@redhat.com>
 <1272e367-6600-198d-e93f-ba2bfa2c6c0f@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <fe6ae1ab-8064-8afb-8c8d-36f4624a61fa@redhat.com>
Date: Mon, 7 Dec 2020 16:17:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1272e367-6600-198d-e93f-ba2bfa2c6c0f@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

Hi,

On 12/7/20 4:11 PM, Pierre-Louis Bossart wrote:
> Hi Hans,
> 
>> Some BYT/CHT boards (mostly Cherry Trail) use TDM 4 slots 24 bit as
>> wire format to the codec, rather then standard I2S 2 channel 24 bit.
>>
>> Add a new m4 file for this. This is a copy of sof-byt-codec.m4 with
>> the following changes:
>>
>> @@ -1,4 +1,4 @@
>> -`# Topology for generic' PLATFORM `board with' CODEC `on SSP' SSP_NUM
>> +`# Topology for generic' PLATFORM `board with' CODEC `on SSP' SSP_NUM `using TDM 4 slots 24 bit'
>>
>>   # Include topology builder
>>   include(`utils.m4')
>> @@ -97,8 +97,8 @@
>>   # BE configurations - overrides config in ACPI if present
>>   #
>>   DAI_CONFIG(SSP, SSP_NUM, 0, SSP2-Codec,
>> -       SSP_CONFIG(I2S, SSP_CLOCK(mclk, 19200000, codec_mclk_in),
>> -              SSP_CLOCK(bclk, 2400000, codec_slave),
>> +       SSP_CONFIG(DSP_B, SSP_CLOCK(mclk, 19200000, codec_mclk_in),
>> +              SSP_CLOCK(bclk, 4800000, codec_slave),
>>                 SSP_CLOCK(fsync, 48000, codec_slave),
>> -              SSP_TDM(2, 25, 3, 3),
>> +              SSP_TDM(4, 25, 3, 3),
>>                 SSP_CONFIG_DATA(SSP, SSP_NUM, 24)))
> 
> I don't think this change is necessary, the problem is probably that we still rely on the hard-coded 4 slots in the machine driver which was the default for the Atom/SST driver.
> 
> If I look at the cht_bsw_nau8824.c driver, the only place where there is a reference to 4 slots is in the cht_codec_init() function.
> 
> https://elixir.bootlin.com/linux/latest/source/sound/soc/intel/boards/cht_bsw_nau8824.c#L104
> 
> In other drivers, this was moved to the codec_fixup routine which is overridden/ignored when SOF is used.
> 
> see e.g.
> 
> https://elixir.bootlin.com/linux/latest/source/sound/soc/intel/boards/cht_bsw_max98090_ti.c
> 
> https://elixir.bootlin.com/linux/latest/source/sound/soc/intel/boards/cht_bsw_rt5645.c
> 
> If you follow the same pattern that should make this problem go away. When SOF is used we typically don't have any hard-coded format and whatever is defined in the topology is propagated to the codec driver.

As I explained in the cover, this effectively switches to I2S 2 channel 24 bit format,
which requires mixer-setting / UCM changes in case of the nau8824 codec. The codec
driver has this comment:

 * Configures a DAI for TDM operation. Only support 4 slots TDM.
 */
static int nau8824_set_tdm_slot(struct snd_soc_dai *dai,
        unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width)

Which is not entirely true I did get playback to work with I2S 2 channel 24 bit
(I did not test recording yet) but playback only works after mixer setting
changes, which in turn break things under SST.

Please read the cover letter, which should explain the issue.

As mentioned there we could use I2S 2 channel 24 bit as we do everywhere
(I like standardizing on that) but then the UCM profile would need to
differentiate between the SST and SOF setups and adjust the mixer
accordingly to not regress SST setups.

Regards,

Hans

