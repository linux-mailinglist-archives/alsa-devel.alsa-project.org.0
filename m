Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D0E2E713B
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Dec 2020 14:59:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B256117BB;
	Tue, 29 Dec 2020 14:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B256117BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609250377;
	bh=FTkbHjQA7b5niKjm8aSZ+OCWNStmrthh37chrwAwRmQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E917G8/cXxLRnfkt50XNHc9w+RPLr8I4DqovwjZn+n3diC3kg+vc+MvDZ88qe6XTd
	 xdEv+Fwnr0phsAwUBpIdtLOGcv6fZjMngJQq6Ymer+1GuN48SLBmrGfVN2FJihO3jm
	 3v9EKGppooUPXk5gROCg4lclujxAo+swnkdj7iEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11B2AF8022D;
	Tue, 29 Dec 2020 14:57:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25931F8022B; Tue, 29 Dec 2020 14:57:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2F81F80162
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 14:57:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2F81F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="PqJwJWf4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609250263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yZ2YhHN3Hwjg2UbDRol1QpNQE1SnLZkkD3OZg+bxNoY=;
 b=PqJwJWf4QlsFNJ435n0j/ymL7myBFGnelFaOTL+OUqQsvi2Eat0lGBRnKrIXPNIZ5vNP+Q
 QFjURgxQyAFJg0y6sG+w7wfUhhggD19v00OTSB6LYqos5WiwLU8EGT6gn7PiDzL/qzDdJJ
 No2/n2k3O7GFXXn1cplEQ0dSvQP9Ko8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-bLnCycnBNWOnjLv53BPHJA-1; Tue, 29 Dec 2020 08:57:42 -0500
X-MC-Unique: bLnCycnBNWOnjLv53BPHJA-1
Received: by mail-ed1-f70.google.com with SMTP id bf13so4471112edb.10
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 05:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yZ2YhHN3Hwjg2UbDRol1QpNQE1SnLZkkD3OZg+bxNoY=;
 b=gMSfTjtu5F7sWN3seyvvkYOWCkIqygFtzzfCKOZa3bliLv96LcZp5jvPGjFQjK24Lf
 ytm+UOwFQwNv6YpFGAz1G6/Tgw19W9S7AfavJumE1mUaX4TSGfHIaoqEz2qcg1NIBMSH
 NDOMtQHOFKkJOEaUHVY3K+i3yV82JRD2IJO48ZK3JB6RBg6ipVjQGQiRLwvGQd6IH/pc
 uBnQuJUAbg23mTFl1XGvMm5T6Te1wmeZXVx8p20W+irFChBUvp1rNx5o1bL+TE1Dyh8N
 6pFFxmHM1UTFwiYQOGIyWWGXQuNjXZOroMDZYFzwaufLKDostIp886YXwLpnyqxwWFwh
 xhPw==
X-Gm-Message-State: AOAM533tg0XClOW8Za5FRYgxPAZbwc/UfvWemZIxKVqNCOMZ3MGNXCDe
 ttBA2Robg8rnUAS1w8jFTWx/NYy+xyJ2ZxkcnZi1aUF3IsS8C+uW+4soHat0tjbuqvUnkA9UKZV
 tuh7R+3wm1X4osTZDStTHbV/cKposUSn2n2IUI0Ic+UZALa+zRnZ3huBWiT7M/FWJQHMTsxrcfQ
 I=
X-Received: by 2002:a17:906:cc9c:: with SMTP id
 oq28mr45873030ejb.224.1609250260686; 
 Tue, 29 Dec 2020 05:57:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuBE7wnJ/yXJ3rin6TYBmB4kU4OTVwnk0PDgy2e3mTu2jz5027n4FrjiiaK6btd5XfnkS2yg==
X-Received: by 2002:a17:906:cc9c:: with SMTP id
 oq28mr45873004ejb.224.1609250260286; 
 Tue, 29 Dec 2020 05:57:40 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id a13sm37319747edb.76.2020.12.29.05.57.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Dec 2020 05:57:39 -0800 (PST)
Subject: Re: [PATCH 01/14] mfd: arizona: Add jack pointer to struct arizona
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-2-hdegoede@redhat.com>
 <20201228122138.GA5352@sirena.org.uk>
 <44f84485-8efc-39f9-d0a7-cb8db2ea3faa@redhat.com>
 <20201228162807.GE5352@sirena.org.uk>
 <20201229130657.GN9673@ediswmail.ad.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <19c2d056-4f71-2c4c-c243-cdcc0115876c@redhat.com>
Date: Tue, 29 Dec 2020 14:57:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201229130657.GN9673@ediswmail.ad.cirrus.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Lee Jones <lee.jones@linaro.org>
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

On 12/29/20 2:06 PM, Charles Keepax wrote:
> On Mon, Dec 28, 2020 at 04:28:07PM +0000, Mark Brown wrote:
>> On Mon, Dec 28, 2020 at 02:16:04PM +0100, Hans de Goede wrote:
>>
>>> And more in general AFAIK extcon is sort of deprecated and it is
>>> not advised to use it for new code. I would esp. not expect it to
>>> be used for new jack-detection code since we already have standard
>>> uAPI support for that through sound/core/jack.c .
>>
>> Has Android been fixed to use the ALSA/input layer interfaces?  That's
>> why that code is there, long term the goal was to have ALSA generate
>> extcon events too so userspace could fall over to using that.  The basic
>> thing at the time was that nobody liked any of the existing interfaces
>> (the input layer thing is a total bodge stemming from it having been
>> easy to hack in a key for GPIO detection and using ALSA controls means
>> having to link against alsa-lib which is an awful faff for system level
>> UI stuff) and there were three separate userspace interfaces used by
>> different software stacks which needed to be joined together, extcon was
>> felt to be a bit more designed and is a superset so that was the
>> direction we were heading in.
> 
> Android has been updated to have the option to catch input events
> for jack detection now.
> 
> I have always been slightly confused between extcon and the ALSA
> jack reporting and have been unsure as to what is the longer term
> plan here. I vaguely thought there was a gentle plan to move to
> extcon, it is interesting to see Hans basically saying the
> opposite that extcon is intended to be paritially deprecated. I
> assume you just mean with respect to audio jacks, not other
> connector types?

No I mean that afaik extcon is being deprecated in general. Extcon
is mostly meant for kernel internal use, to allow things like
charger-type-detection done by e.g. a fsa micro-usb mux or a
Type-C PD controller to be hooked up to the actual charger chip
and set the input-current-limit based on this.

But there is no clean way to express these relation-ships
in extcon terms in devicetree. At least for new device with
Type-C functionality this is all being moved to OF graph bindings
combined with using the power_supply class to provide info like
negotiated voltage and current to the charger-IC.

Note this is mostly my 2 cents / my impression about where extcon
is heading. I have actually tried to use extcon for Type-C stuff
and this was frowned upon by both the devicetree bindings people and
the USB Type-C code controller people.

Also despite its age, the extcon code is still not really in good
shape. E.g. a driver can do extcon_get_extcon_dev, but that does
not return a device-reference, that just does a lookup and returns
the requested extcon-device, but there are 0 guarantees that the
extcon device will not go away and dereferencing the returned
pointer after doing a rmmod of the extcon-driver will result in
a nasty crash.

So all this suggests to me that extcon should not be used for
new code / projects.

> I would agree with Mark though that if extcon exists for external
> connectors it seems odd that audio jacks would have their own
> special way rather than just using the connector stuff.

Well as I said above in me experience the extcon code is (was) mostly
meant for kernel internal use. The sysfs API is more of a debugging
tool then anything else (IMHO).

Also the kernel has support for a lot of sound devices, including
many with jack-detection support. Yet a grep for EXTCON_JACK_HEADPHONE
over the entire mainline kernel tree shows that only extcon-arizona.c
is using it. So given that we have dozens of drivers providing jack
functionality through the sound/core/jack.c core and only 1 driver
using the extcon interface I believe that the ship on how to export
this to userspace has long sailed, since most userspace code will
clearly expect the sound/core/jack.c way of doing things to be used.

Arguably we should/could maybe even drop the extcon part of extcon-arizona.c
but I did not do that as I did not want to regress existing userspace
code which may depend on this (on specific embedded/android devices).

Regards,

Hans

