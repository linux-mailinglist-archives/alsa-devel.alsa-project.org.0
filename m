Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BEB2E38F4
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 14:18:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F8F616EC;
	Mon, 28 Dec 2020 14:17:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F8F616EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609161476;
	bh=pDrUC6zcVzxt20zp77eoSlx3Hl6I4Sr4uAaAsz0Pbqs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=STtbWCBQHm5wS1QUuFSGc3LuXQGjmhphwhBfmn90WKNZU/e93cmVTWyGewTzPp/Ye
	 OUQMSqrD94OaG2vvFWhZ7tFb4nliJwRKe51bSNWNGbXfsuBZOEL4i6hzcFcSa6iSZ7
	 BFeGoD5vB11iDTgq+Lsj3B8w6u4+K3wQ850/ldvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C51E4F80169;
	Mon, 28 Dec 2020 14:16:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81AA1F801F5; Mon, 28 Dec 2020 14:16:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9476F8014E
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 14:16:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9476F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="gTK8LZsh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609161370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BpGZqNqjl/EqgtMH0TEGlmSlmsvZxZ2+cVJLVuiye3o=;
 b=gTK8LZshZ8PKIYMAuu/tr9nJ2El5KvjhbPMiKR5Ov1g8mxggXky0qNyve8HQDwOrFv69mP
 YiUJjkpIq9UWqaMJslIyRXNx035wfpCeYUKptXyhkbEIjmIvh1p4RbrLT0Mlt/1jO/stOz
 eQ4ZXYGeu9DD75xNQq6ddiBYq24oHhE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-ou7QJp9nNZmwawU2XoD2SA-1; Mon, 28 Dec 2020 08:16:07 -0500
X-MC-Unique: ou7QJp9nNZmwawU2XoD2SA-1
Received: by mail-ed1-f69.google.com with SMTP id n18so3311013eds.2
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 05:16:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BpGZqNqjl/EqgtMH0TEGlmSlmsvZxZ2+cVJLVuiye3o=;
 b=jWcHEk+XPzYtlbDzJ60WBHm8JLcE9vUDzRBJb1uK21Aey9jYLpD50fTIy0VnwqDksW
 MsvO45I20dfN0N/bGix9YEb4q7Eac3zPlIVr7hWLNdL+2uOefSUplGjY7rGvqReuRnJ7
 7tcC5fau9VbHU+dqb4VtewEbOtTWVlDuA5rzWT0Mnq40Chl4qaR1XWElpohYF69jHTjP
 I8dqmfJx/BF33ynSqcZSs979kEZp1sj6wnnuUZXV4VGnKYfr4Mx+90ws79DhXH5O/z6l
 AqHiotBbVTiiG0ZLlgmm4KevyAgCH/mEjnTPh23MvFoS1NEpVMrSa1e+EldzG8E6cKNj
 Y3gg==
X-Gm-Message-State: AOAM533Ik/LjvVTrZcyXj5zC196kN25iQw1aFJlRfD8AAYHqqsakZ+O7
 bLS8h3DVyM/fuy8LJK9CTHWGWUXmRP1KO+8+P6eCMUN0Jh7wpFwQC9embtg2LywHSgstL6Sorle
 ElcOOHOSi4TRShxduCbGsd2BCWm2sXpZWgpTGLBPIWQgFo+rGZd80Kv5iuX/p5TR2dIFISS0umr
 U=
X-Received: by 2002:a17:907:40f0:: with SMTP id
 nn24mr40959184ejb.233.1609161366056; 
 Mon, 28 Dec 2020 05:16:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzrt1uKlVWXyK7ZFE9xUmRMZZXRSzEOAZI8gbA5K9cPIpgkRK+cinnSnJmQyqJNyCEoqnoxw==
X-Received: by 2002:a17:907:40f0:: with SMTP id
 nn24mr40959157ejb.233.1609161365830; 
 Mon, 28 Dec 2020 05:16:05 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id e19sm36838102edr.61.2020.12.28.05.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Dec 2020 05:16:05 -0800 (PST)
Subject: Re: [PATCH 01/14] mfd: arizona: Add jack pointer to struct arizona
To: Mark Brown <broonie@kernel.org>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-2-hdegoede@redhat.com>
 <20201228122138.GA5352@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <44f84485-8efc-39f9-d0a7-cb8db2ea3faa@redhat.com>
Date: Mon, 28 Dec 2020 14:16:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201228122138.GA5352@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
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

On 12/28/20 1:21 PM, Mark Brown wrote:
> On Sun, Dec 27, 2020 at 10:12:19PM +0100, Hans de Goede wrote:
>> The Linux Arizona driver uses the MFD framework to create several
>> sub-devices for the Arizona codec and then uses a driver per function.
>>
>> The jack-detect support for the Arizona codec is handled by the
>> extcon-arizona driver. This driver exports info about the jack state
>> to userspace through the standard extcon sysfs class interface.
>>
>> But standard Linux userspace does not monitor/use the extcon sysfs
>> interface for jack-detection.
> 
> This seems like the wrong layer to fix this problem at, this issue will
> apply to all extcon devices that can detect audio.

Well, the problem really is that using extcon to report jack-state is
rather unusual to do, extcon-arizona.c is the only extcon driver which
deals with jack-state (typically extcon is used for things like determining
the type of charger connected to an USB charging port):

[hans@x1 linux]$ grep -lr EXTCON_JACK_HEADPHONE drivers/extcon/
drivers/extcon/extcon-arizona.c
drivers/extcon/extcon.c

And more in general AFAIK extcon is sort of deprecated and it is
not advised to use it for new code. I would esp. not expect it to
be used for new jack-detection code since we already have standard
uAPI support for that through sound/core/jack.c .

So extcon-arizona really is the odd duck here and writing some
generic extcon to sound/core/jack.c glue seems unnecessary since
we are just trying dealing with one special case here.

Also at first I tried to use extcon-glue like code in
sound/soc/intel/boards/bytcr_wm5102.c making it listen for
extcon events and have sound/soc/intel/boards/bytcr_wm5102.c
report jack events instead of sharing the jack with extcon-arizona.c
through the shared MFD data struct. But that did not work, because
the extcon-arizona.c probe function already (before this patch-set)
has this:

        if (!arizona->dapm || !arizona->dapm->card)
                return -EPROBE_DEFER;

Which means that the sound/soc/intel/boards/bytcr_wm5102.c machine
driver must first complete calling devm_snd_soc_register_card() before
the extcon driver will bind and register the extcon device.

But listening to extcon events requires the machine driver to do an:
extcon_get_extcon_dev("arizona-extcon") and as long as that returns
NULL, return -EPROBE_DEFER.

So now we have the machine-driver's probe returning with -EPROBE_DEFER
until the extcon driver shows up and the other-way around, so neither
ever binds.

I could have fixed this by making the machine driver bind without the
extcon driver being bound and then poll every second for the extcon device
to show up, and once it has shown up stop polling and register the jack,
once it has the extcon device.

But that seems quite ugly, so I did not even try to implement that
coming up with this solution instead which is much more KISS really.

Also note that sharing the jack is necessary to avoid creating 2
separate input_device-s for the headset, which also looks weird / ugly.

Besides being ugly, there also is another potential problem with
polling to wait for the extcon device to show up: the jack must be
registered before the card registration completes otherwise
snd_jack_dev_register will not run, since we are post registration.
But I guess that the sound core might be smart enough to call
the dev_register op immediately if the card has already been
registered ?

TL;DR: writing a generic solution for what is a special case used
in just driver seems like overkill and also writing such a
generic solution is not easily possible because of probe ordering
issues. So instead I've gone with this approach which is a much
simpler solution and as such seems a better way to deal with this
special case.

Regards,

Hans



