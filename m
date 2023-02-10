Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05171692636
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 20:20:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E983D83B;
	Fri, 10 Feb 2023 20:19:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E983D83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676056834;
	bh=9joRaultstfzrxgf6XwfkXXHD6fBtvgv2ExfAzQTI1w=;
	h=Date:Subject:From:To:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TnAbu8QmpOX4UgCrlsvyowJUrd8JR6EHjXi6V73jOaKc943pYbj/q+cGcCWhMNxUl
	 90ujgG3JIpS+ehBmtL0+TmkgIl7NYQ5vzU+k5u0cAabM9BBjsSRKLFnZMoyuvSt3Kj
	 NQej2TWukEmH/BOljgqBlH/xobV1FGMasGfpyck8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56CE4F800B8;
	Fri, 10 Feb 2023 20:19:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39CEEF800E4; Fri, 10 Feb 2023 20:19:40 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CF70F8001E
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 20:19:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CF70F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=MytzUYK1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676056772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gwSrY4DltmA/yFlYQvFrP0zXeruXNly6+GpVcGdaJm4=;
	b=MytzUYK1MHFOGQODOOdSLgxsWmryjJuDBx13OjEHqYKBED0wdq7IYuxGk9++AaaoFlxZuU
	49TdR53h6OJEQCTGyc5B0U1zOE3/eWVSMrXhblocsDYNcdM5cJI/x07jkVHJaHul75Pymh
	j2hr+YefNzbCrh5XFWut6kVwBojiC8w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-194-cTtbrPcGNTmq6cpcQrDzJQ-1; Fri, 10 Feb 2023 14:19:30 -0500
X-MC-Unique: cTtbrPcGNTmq6cpcQrDzJQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 d21-20020aa7c1d5000000b004a6e1efa7d0so4122289edp.19
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 11:19:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gwSrY4DltmA/yFlYQvFrP0zXeruXNly6+GpVcGdaJm4=;
        b=lDu26/WgLWe7WbgoZTiW1aBa9/MIUYKSqdpDgxF0BugdOFtu9Bndmiqm3m/zyWiHx2
         NDFBQHxILwN1f4SojISYtcMJM4c7ZUPoPr/4jFYLdJ2qt6mChXYNoiyJxMPGGz5l/sQA
         5jc9OKryQrtZP6C8OEeEOycMiROkSe9b/d0WRK2dhfL0MXxoLX0zQ+50JFldKEythx29
         WhRIEOL42nn3U99lkmtGJZn9b8tIFWlTc444PT08z2SOHgoCb0ZeiZ3De3S/emLhdjhD
         WMZdMyQ8NM5GXhIWIQAnKmPN81MLWYqqMGj/Rj93g/GzH4LpwDoDBIaV1OE+mlHRQe2W
         Ou2A==
X-Gm-Message-State: AO0yUKUjoSA7mmNYj8SWSl9O+o9Y8Evfu7GKE2AeMgbYaTriqpLxYYQH
	P4IiPI2+yh2ZMVY/WzAvndbqfU00CXOQ4AknZNGETBM9xUkgnHbKW3RQ3o1JCFzGE0+uupNzio8
	U8vgimEIuGjNcPdetmZVRjE8=
X-Received: by 2002:a17:906:308e:b0:88a:da35:dd51 with SMTP id
 14-20020a170906308e00b0088ada35dd51mr16539107ejv.14.1676056769345;
        Fri, 10 Feb 2023 11:19:29 -0800 (PST)
X-Google-Smtp-Source: 
 AK7set/LjslSqRW4K+lvECJSA5kEr2lyEGJrPcE6CF5MmtIxPBIdllG3b8htAgAt5ndbUDTe3go1qA==
X-Received: by 2002:a17:906:308e:b0:88a:da35:dd51 with SMTP id
 14-20020a170906308e00b0088ada35dd51mr16539083ejv.14.1676056769183;
        Fri, 10 Feb 2023 11:19:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id
 h14-20020a17090634ce00b00877e1bb54b0sm2770373ejb.53.2023.02.10.11.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 11:19:28 -0800 (PST)
Message-ID: <74e3c9ae-b1f1-1e7b-4af1-56f918471b36@redhat.com>
Date: Fri, 10 Feb 2023 20:19:27 +0100
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
Message-ID-Hash: IEZ4F2S2WVO2RL6AF6FCGTHH5YQG4NBV
X-Message-ID-Hash: IEZ4F2S2WVO2RL6AF6FCGTHH5YQG4NBV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IEZ4F2S2WVO2RL6AF6FCGTHH5YQG4NBV/>
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
> 
> Depending on the decoding hw in the chip this may work fine,
> or this may work not at all.
> 
> I realized that you have asked for more testing, but most surviving
> macbooks from the older apple-gmux era appear to be models without
> a discrete GPU (which are often the first thing to break) and thus
> without a gmux.
> 
> Unless we get a bunch of testers to show up, which I doubt. I would
> prefer slightly bigger / less pretty code and not change the functional
> behavior of the driver on these older models.

A quick follow up on this, I just noticed that only the pio_write32
is doing the one byte at a time thing:

static u32 gmux_pio_read32(struct apple_gmux_data *gmux_data, int port)
{
        return inl(gmux_data->iostart + port);
}

static void gmux_pio_write32(struct apple_gmux_data *gmux_data, int port,
                             u32 val)
{
        int i;
        u8 tmpval;

        for (i = 0; i < 4; i++) {
                tmpval = (val >> (i * 8)) & 0xff;
                outb(tmpval, gmux_data->iostart + port + i);
        }
}

And if you look closely gmux_pio_write32() is not swapping
the order to be32 at all, it is just taking the bytes
in little-endian memory order, starting with the first
(index 0) byte which is the least significant byte of
the value.

On x86 the original code is no different then doing:

static void gmux_pio_write32(struct apple_gmux_data *gmux_data, int port,
                             u32 val)
{
        u8 *data = (u8 *)&val;
        int i;

        for (i = 0; i < 4; i++)
                outb(data[i], gmux_data->iostart + port + i);
}

So yeah this patch is definitely wrong, it actually swaps
the byte order compared to the original code. Which becomes
clear when you look the weird difference between the read32 and
write32 functions after this patch.

Presumably there is a specific reason why gmux_pio_write32()
is not already doing a single outl(..., val) and byte-ordering
is not the reason.

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

