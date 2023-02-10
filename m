Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4DC692675
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 20:34:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 139A883B;
	Fri, 10 Feb 2023 20:34:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 139A883B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676057691;
	bh=wuYTt/zD0XFJgkCJev0VkUuWzzy9G332AMg83Db8eNk=;
	h=Date:Subject:From:To:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GcjFHGtKczEqj9C8k5lkUv0zRqtS4NFKbp2Trukt3nNp0xOv3gcxDYMILorIBwbPW
	 sKODfTEirguYOjeiTrTeDBIx1//wCSpn4G/ZZUV/VCpfnSM7UEgZLbjhyo1boHtDLA
	 I4GXa/S/UauLaiFO8TO1TTAJ4bz5wfyU7S+FJcCo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BCA0F800B8;
	Fri, 10 Feb 2023 20:34:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EA54F800E4; Fri, 10 Feb 2023 20:33:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE39EF80086
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 20:33:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE39EF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=LysO3tFr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676057611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lgPGguAIupQ40Gj3yYs0g6D0wN93UBUjTZwAvya27/Q=;
	b=LysO3tFreq2lLJs7lF4Pyba6fmHTT0Xq5kBx/hF5uvbIZVrPxuflV6CHZsko/hXDhE5zs1
	3HgzQ77hfsT81TkWSQJCgzc2Zg7r/Lkpi4LUWFdy5XjP5drAGJDAQqDqBlLxg45gBOwnVe
	L8jj1nqw6to4um94c4p8dsZPL/ZNcnQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-388-gwssLLuRPb6OFhpYUe8KYQ-1; Fri, 10 Feb 2023 14:33:29 -0500
X-MC-Unique: gwssLLuRPb6OFhpYUe8KYQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 w3-20020a056402268300b00487e0d9b53fso4157553edd.10
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 11:33:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgPGguAIupQ40Gj3yYs0g6D0wN93UBUjTZwAvya27/Q=;
        b=spw/1+K6ZiOxy9yoya4iN715cixDX1m4bZGdIqCTFp+h/AWZE7TvG/Pv8jpu8WHVh9
         84FwV1ElkGUHMIiwNbIBqModfUAEnHw4POvcqeOmP6FQUxPZRDNNUPw+zP6MlDbBqk0K
         eAlShBUQl7Wb7vVw0TPjm2SCUu8XiJWfbC1NLvrIvYEYauiGUDBZnC0D6JIkOzQjJOTj
         wS8iRsxz0OxVjFzt/GfjvEGSqneG/hBdHIHtQjYlHHrenO9JsYqyLRjjoVU6tpF6soDR
         hLy/XovF4hXkxhCkBs+PLaO62hffLJ7W6QaiO5VqX9Mi3YXpMzNuOe5AD9l1IRgL5IE1
         RUOg==
X-Gm-Message-State: AO0yUKWrd+U5IgYvLTXH8+f6aqZAvkxZhgX/NBqws070kbo0kAbScDnf
	niP7aadTdznsGozX7ObAB3ba7yLYu/cpUZpbDHh60Si1w2gnoF9I0vPSxNBlhbUhxooUcpluUGI
	OQxw9Cc+b1KBcryuFtwsr3FM=
X-Received: by 2002:a50:a45a:0:b0:472:1436:73ab with SMTP id
 v26-20020a50a45a000000b00472143673abmr17550392edb.28.1676057608630;
        Fri, 10 Feb 2023 11:33:28 -0800 (PST)
X-Google-Smtp-Source: 
 AK7set9lIWI+15QivdoTZK+NEIYP5AV1VIY+nIPcZiME3QwhYRDhgoA8GEIQ9OR9X+Zok/bVlZR+qw==
X-Received: by 2002:a50:a45a:0:b0:472:1436:73ab with SMTP id
 v26-20020a50a45a000000b00472143673abmr17550370edb.28.1676057608402;
        Fri, 10 Feb 2023 11:33:28 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id
 b2-20020a50b402000000b004a245d70f17sm2701859edh.54.2023.02.10.11.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 11:33:27 -0800 (PST)
Message-ID: <990b254c-b55f-539d-d6b5-fa4499078527@redhat.com>
Date: Fri, 10 Feb 2023 20:33:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 1/9] apple-gmux: use cpu_to_be32 instead of manual
 reorder
From: Hans de Goede <hdegoede@redhat.com>
To: Orlando Chamberlain <orlandoch.dev@gmail.com>,
 platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
 <20230210044826.9834-2-orlandoch.dev@gmail.com>
 <3af65b5e-1f52-79f6-4130-03901ce76d2f@redhat.com>
In-Reply-To: <3af65b5e-1f52-79f6-4130-03901ce76d2f@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JP532WJ7KJLNKYCX2YZ53GQFMZKVBOMD
X-Message-ID-Hash: JP532WJ7KJLNKYCX2YZ53GQFMZKVBOMD
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Gross <markgross@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Kerem Karabay <kekrby@gmail.com>,
 Aditya Garg <gargaditya08@live.com>, Aun-Ali Zaidi <admin@kodeit.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JP532WJ7KJLNKYCX2YZ53GQFMZKVBOMD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 2/10/23 20:09, Hans de Goede wrote:
> Hi,
> 
> On 2/10/23 05:48, Orlando Chamberlain wrote:
>> Currently it manually flips the byte order, but we can instead use
>> cpu_to_be32(val) for this.
>>
>> Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
>> ---
>>  drivers/platform/x86/apple-gmux.c | 18 ++----------------
>>  1 file changed, 2 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
>> index 9333f82cfa8a..e8cb084cb81f 100644
>> --- a/drivers/platform/x86/apple-gmux.c
>> +++ b/drivers/platform/x86/apple-gmux.c
>> @@ -94,13 +94,7 @@ static u32 gmux_pio_read32(struct apple_gmux_data *gmux_data, int port)
>>  static void gmux_pio_write32(struct apple_gmux_data *gmux_data, int port,
>>  			     u32 val)
>>  {
>> -	int i;
>> -	u8 tmpval;
>> -
>> -	for (i = 0; i < 4; i++) {
>> -		tmpval = (val >> (i * 8)) & 0xff;
>> -		outb(tmpval, gmux_data->iostart + port + i);
>> -	}
>> +	outl(cpu_to_be32(val), gmux_data->iostart + port);
>>  }
>>  
>>  static int gmux_index_wait_ready(struct apple_gmux_data *gmux_data)
> 
> The ioport / indexed-ioport accessed apple_gmux-es likely are (part of?)
> LPC bus devices . Looking at the bus level you are now changing 4 io
> accesses with a size of 1 byte, to 1 32 bit io-access.

Correction to myself, re-reading the LPC specification, then
if I'm right and this is a LPC device then all IO in/out accesses
are always 1 byte accesses. Since the LPC bus only supports 16 / 32
bit accesses for DMA cycles.

So presumably the outl() would get split into 4 separate 8 bit
(port) IO accesses.

Regards,

Hans





>> @@ -177,16 +171,8 @@ static u32 gmux_index_read32(struct apple_gmux_data *gmux_data, int port)
>>  static void gmux_index_write32(struct apple_gmux_data *gmux_data, int port,
>>  			       u32 val)
>>  {
>> -	int i;
>> -	u8 tmpval;
>> -
>>  	mutex_lock(&gmux_data->index_lock);
>> -
>> -	for (i = 0; i < 4; i++) {
>> -		tmpval = (val >> (i * 8)) & 0xff;
>> -		outb(tmpval, gmux_data->iostart + GMUX_PORT_VALUE + i);
>> -	}
>> -
>> +	outl(cpu_to_be32(val), gmux_data->iostart + GMUX_PORT_VALUE);
>>  	gmux_index_wait_ready(gmux_data);
>>  	outb(port & 0xff, gmux_data->iostart + GMUX_PORT_WRITE);
>>  	gmux_index_wait_complete(gmux_data);
> 

