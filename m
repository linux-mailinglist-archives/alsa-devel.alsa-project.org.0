Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA3D38DB02
	for <lists+alsa-devel@lfdr.de>; Sun, 23 May 2021 13:07:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E70AC1686;
	Sun, 23 May 2021 13:06:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E70AC1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621768055;
	bh=cCEXtvEhdoc1ETRa2WBQ3GXHTyNHdUaL8sFMDipiZwI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J0k2nvR0nWmbn1SFFSPayt1l4jZSyHom4Ud8imYQQrRUWWhi/yM//kypYZw0T9zuU
	 gj0UMEE/mZ2thMZvpAXmY0EeFhW2nXVejjXFItjsbfnOg8EAyt3QGJYKdW6ME1236m
	 hXlDoA+k+qfI3uxhAzV9XzhjLqdL+21V9EYx88JI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D12CF801F5;
	Sun, 23 May 2021 13:06:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A885AF801EB; Sun, 23 May 2021 13:06:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 NICE_REPLY_A,PRX_BODY_21,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6209F8016D
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 13:06:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6209F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="M6CgwwUX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621767959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bs5hatLmLqDDqWfEu5qFTnq+OE5Ryali+tI2dHlFutI=;
 b=M6CgwwUX0ecURZPAV3b+KZtDpBxqCRkVuKFdA9ibiuoS2pNh0RrKKpNLwkL130/+yxGF3a
 2yQImmCszRys0Q4fgDbpOXF/NzjglKGwsnof1qsTw2NE+vzg5azNl/lPhnG6SOiQxWMMKG
 8txfj+ro/r/heFw7/+a/VXWWL2a/iPg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-uPtkiai0PXyXMNXiyVUoOQ-1; Sun, 23 May 2021 07:05:57 -0400
X-MC-Unique: uPtkiai0PXyXMNXiyVUoOQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 v18-20020a0564023492b029038d5ad7c8a8so9020996edc.11
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 04:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bs5hatLmLqDDqWfEu5qFTnq+OE5Ryali+tI2dHlFutI=;
 b=d9YE5cIpsENJTWLSf7ghdBe4UdDnr5aOV4EFuhgP11tdefASyWtY7VqkWFljW2Ab51
 u6quAHWZDWbHmetTbc7XZ+JNKbeHLl3ftkDEfAEYeKWgDhsYoMcrMFD9ifl2Oe2isOjv
 Xg0/nasv4P5lNB3l32Q9lD1XqC8n3GxB88OhguvaNLQp2OQ1KOn+AY2PK1LpiHfPdpY4
 OFt6AFWBVL/Dr/xDton+NG88KplKXKKVUp0v4Z5EH7ugHUzP4s5mUSKHnS75ZI1Wjuqo
 jwXmroWC4JJg54FgqfCmTwFwxzZFkz+/k7JXR+Gk8Z9IVMUujvxBflYANnsMMMqJCkQr
 GnPw==
X-Gm-Message-State: AOAM532g1YxgznSmk3DN7TRWFrtKT0kfaKBicFUo9Y5T+43wZtzP8gMB
 zTreTCW9Q78DQwwJ7qRU+DrAHmgip2NefXaAkMvnGMKzMjmV1D6nmQ/Ca5bsKECXA+nulea3liy
 8gX98kqmHCKSJzSWJ0k4F9GBn0ID6gRHWJVCUmK1hOFWSNswerRB4JjOMh2DlCRVilkVbCJVQCW
 w=
X-Received: by 2002:a17:906:c218:: with SMTP id
 d24mr17831607ejz.363.1621767956143; 
 Sun, 23 May 2021 04:05:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQe4wCYR6Ld9L8K18a2z6YZwaqpAwtryb4ceNJphiDJn2+1fZj8JhYopG48DcgKxvYLs2RIw==
X-Received: by 2002:a17:906:c218:: with SMTP id
 d24mr17831583ejz.363.1621767955937; 
 Sun, 23 May 2021 04:05:55 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id md21sm6462319ejb.110.2021.05.23.04.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 May 2021 04:05:55 -0700 (PDT)
Subject: Re: [PATCH 0/8] iio: accel: bmc150: Add support for yoga's with dual
 accelerometers with an ACPI HID of DUAL250E
To: Jonathan Cameron <jic23@kernel.org>
References: <20210521171418.393871-1-hdegoede@redhat.com>
 <20210522190138.1715b095@jic23-huawei>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <6019fc0c-ff75-824c-5b7c-e888b7fdf800@redhat.com>
Date: Sun, 23 May 2021 13:05:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210522190138.1715b095@jic23-huawei>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-iio@vger.kernel.org,
 patches@opensource.cirrus.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jeremy Cline <jeremy@jcline.org>, Mark Brown <broonie@kernel.org>
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

On 5/22/21 8:01 PM, Jonathan Cameron wrote:
> On Fri, 21 May 2021 19:14:10 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Hi All,
>>
>> Some 360 degree hinges (yoga) style 2-in-1 devices use 2 bmc150 accels
>> to allow the OS to determine the angle between the display and the base
>> of the device, so that the OS can determine if the 2-in-1 is in laptop
>> or in tablet-mode.
>>
>> We already support this setup on devices using a single ACPI node
>> with a HID of "BOSC0200" to describe both accelerometers. This patch
>> set extends this support to also support the same setup but then
>> using a HID of "DUAL250E".
>>
>> While testing this I found some crashes on rmmod, patches 1-2
>> fix those patches, patch 3 does some refactoring and patch 4
>> adds support for the "DUAL250E" HID.
>>
>> Unfortunately we need some more special handling though, which the
>> rest of the patches are for.
>>
>> On Windows both accelerometers are read (polled) by a special service
>> and this service calls a DSM (Device Specific Method), which in turn
>> translates the angles to one of laptop/tablet/tent/stand mode and then
>> notifies the EC about the new mode and the EC then enables or disables
>> the builtin keyboard and touchpad based in the mode.
>>
>> When the 2-in-1 is powered-on or resumed folded in tablet mode the
>> EC senses this independent of the DSM by using a HALL effect sensor
>> which senses that the keyboard has been folded away behind the display.
>>
>> At power-on or resume the EC disables the keyboard based on this and
>> the only way to get the keyboard to work after this is to call the
>> DSM to re-enable it (similar to how we also need to call a special
>> DSM in the kxcjk-1013.c accel driver to re-enable the keyboard).
>>
>> Patches 5-7 deal with the DSM mess and patch 8 adds labels to the
>> 2 accelerometers specifying which one is which.
> 
> Given only thing I'm planning to do is tweak the line wrapping, I'm
> happy to pick this series up.
> 
> The two fixes will slow things down a bit though as we should probably
> get those upstream this cycle.
> 
> I'm going to leave this on list for a few days before I take anything
> though, to give others time to take a look.

I'll do a v2 addressing a few minor things which Andy pointed out,
I'll also take care of the comment re-wrap in the v2.

> One side note, cc list includes a few random choices... Seems you've
> accidentally included alsa people as well as IIO ones. 

You're right, I accidentally included the address-list which I use
for ASoC patches. ASoc folks, sorry for the noise.

Regards,

Hans



>> Hans de Goede (8):
>>   iio: accel: bmc150: Fix dereferencing the wrong pointer in
>>     bmc150_get/set_second_device
>>   iio: accel: bmc150: Don't make the remove function of the second
>>     accelerometer unregister itself
>>   iio: accel: bmc150: Move check for second ACPI device into a separate
>>     function
>>   iio: accel: bmc150: Add support for dual-accelerometers with a
>>     DUAL250E HID
>>   iio: accel: bmc150: Move struct bmc150_accel_data definition to
>>     bmc150-accel.h
>>   iio: accel: bmc150: Remove bmc150_set/get_second_device() accessor
>>     functions
>>   iio: accel: bmc150: Add support for DUAL250E ACPI DSM for setting the
>>     hinge angle
>>   iio: accel: bmc150: Set label based on accel-location for ACPI
>>     DUAL250E fwnodes
>>
>>  drivers/iio/accel/bmc150-accel-core.c |  87 ++----------
>>  drivers/iio/accel/bmc150-accel-i2c.c  | 192 +++++++++++++++++++++-----
>>  drivers/iio/accel/bmc150-accel.h      |  66 ++++++++-
>>  3 files changed, 239 insertions(+), 106 deletions(-)
>>
> 

