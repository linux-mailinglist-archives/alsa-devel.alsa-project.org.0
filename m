Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FC832282B
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 10:55:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E96AF1678;
	Tue, 23 Feb 2021 10:54:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E96AF1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614074145;
	bh=HFXsKv97OLbSCzt0YtYGOR+/qCrLhO815u1dk+OcV0A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ovmDALpctu7LY6fIcJ0sJ2mH5f5+MYLV3Hoowf6QVqh9/xFpV6fcYUBGzXUB5pgkc
	 FvflnyUtyMCYvgRyio1icps6+t4nOK/GnLXjSGB3JHsAoRYYP/vgzQKw6bqsIAB7Cc
	 As7jDve3y9N0PeoVfsfNZ47fh2IVrAQlujvnU/ko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A572F80169;
	Tue, 23 Feb 2021 10:54:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30549F8016A; Tue, 23 Feb 2021 10:54:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D338F80129
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 10:54:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D338F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="JPIjcJgi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614074048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XBaCiawHuHxF7z3D+NjLyiPcqq6H/HI2WrKdgh3jyJY=;
 b=JPIjcJgitt5n5dda14MIcb+3lMjwP5rlAd5tcvZ8N3xFEaqfGeWP45xBvwo8TFyizP8ozF
 gTD5+05V0uEbnbnUo0HcQCoCpeSx07EcGNGCshYW3ZpCNGkNINQ4iWEkM3uTQtnnDbHyTX
 Ay3sBblzSyMTWNXB9tRNaSo/FedNzEo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-OjK7r1P7M5-jjeu8CLZJ_Q-1; Tue, 23 Feb 2021 04:52:36 -0500
X-MC-Unique: OjK7r1P7M5-jjeu8CLZJ_Q-1
Received: by mail-ej1-f72.google.com with SMTP id m4so5104870ejc.14
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 01:52:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XBaCiawHuHxF7z3D+NjLyiPcqq6H/HI2WrKdgh3jyJY=;
 b=DXXz7vbCZRDc5Qxez4JNV3vEmQRxRHIfQ8gV7x/OzD0/RVljZDRwHfndCzugafZyYM
 SNs3BMHdO2H2gnfEC3P1rhHDGyNlAQygXi0sTfQMpDtqFOeihfjyUAuVGrUn/6WodEOe
 gcLujo8FU4KplFPSvexT/XlGw4hPKOU8lPftKFJzhKk3HV1Mi3tucvDLZYoWf8bHkcLY
 SWBWGmkFF+dQcEV6iuPgIdtqvhOctviAQ/TrcAs6r+kNbYzxspKzrBapjjNHcoO8yxct
 SndR5QF4eavgfGPMC/ks91TYUcyPLQCacKAL5yAXpX/yukwOCOJK0w7+Z3ZlkLiA3mxj
 SjYw==
X-Gm-Message-State: AOAM531ZA0QFH1xixogAUL3p90CbBv6c1RLUd6hHvrhiPwHIxTegAN6f
 LbUSIJzIjs/rwiwOjuJlz5S/zrUCfmfF5hJWsSAddJEnPqcBcpgsz+Ff5kDMJ8Uw+fP4MsUDJvy
 l3uYfITIg7FC49YpWvf9Vo08=
X-Received: by 2002:a05:6402:893:: with SMTP id
 e19mr17439892edy.206.1614073955757; 
 Tue, 23 Feb 2021 01:52:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweuDHvamB9xP8reZNw7UlHYvMPZ07GR1VWJy1ZAQV5CHfJXceMQoMzDN8k5sn6ryEOwgoLwg==
X-Received: by 2002:a05:6402:893:: with SMTP id
 e19mr17439880edy.206.1614073955590; 
 Tue, 23 Feb 2021 01:52:35 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id bn2sm12402271ejb.35.2021.02.23.01.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 01:52:35 -0800 (PST)
Subject: Re: [PATCH v2] leds: trigger: audio: Add an activate callback to
 ensure the initial brightness is set
To: Pavel Machek <pavel@ucw.cz>
References: <20210221115208.105203-1-hdegoede@redhat.com>
 <20210223091230.GI9750@amd>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <6d5f521e-0484-cb22-fde5-8a6e133075a5@redhat.com>
Date: Tue, 23 Feb 2021 10:52:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210223091230.GI9750@amd>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 linux-leds@vger.kernel.org
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

On 2/23/21 10:12 AM, Pavel Machek wrote:
> Hi!
> 
>> Some 2-in-1s with a detachable (USB) keyboard(dock) have mute-LEDs in
>> the speaker- and/or mic-mute keys on the keyboard.
>>
>> Examples of this are the Lenovo Thinkpad10 tablet (with its USB kbd-dock)
>> and the HP x2 10 series.
>>
>> The detachable nature of these keyboards means that the keyboard and
>> thus the mute LEDs may show up after the user (or userspace restoring
>> old mixer settings) has muted the speaker and/or mic.
>>
>> Current LED-class devices with a default_trigger of "audio-mute" or
>> "audio-micmute" initialize the brightness member of led_classdev with
>> ledtrig_audio_get() before registering the LED.
>>
>> This makes the software state after attaching the keyboard match the
>> actual audio mute state, e.g. cat /sys/class/leds/foo/brightness will
>> show the right value.
> 
> Makes sense.
> 
>> +++ b/drivers/leds/trigger/ledtrig-audio.c
>> @@ -6,10 +6,33 @@
>>  #include <linux/kernel.h>
>>  #include <linux/leds.h>
>>  #include <linux/module.h>
>> +#include "../leds.h"
>>  
>> -static struct led_trigger *ledtrig_audio[NUM_AUDIO_LEDS];
>>  static enum led_brightness audio_state[NUM_AUDIO_LEDS];
>>  
>> +static int ledtrig_audio_mute_activate(struct led_classdev *led_cdev)
>> +{
>> +	led_set_brightness_nosleep(led_cdev, audio_state[LED_AUDIO_MUTE]);
>> +	return 0;
>> +}
> 
> Is mute_activate called from atomic context?

All the other ledtrig-foo.c activate callbacks use led_set_brightness_nosleep(),
so yes I would assume so (I did not check, I assumed the others have good
reasons to do this).

Regards,

Hans

