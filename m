Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7907D403E
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 21:24:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A37384B;
	Mon, 23 Oct 2023 21:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A37384B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698089071;
	bh=LSTYuF3NJoqz6yujuaasHtp0Kr+22sI1wrXEUp6G61g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QGn814uHtDatxOUAJrYkQUfz32EVrXeBakDJSfAys+2jwz3nAMNMu1HLjPodMypaA
	 RSOSLwSsJkxBnsYvV6G9twI72IqBh+S+qZPC8gl/J6uNEKaAN6tFjEqMpuveKkO5gF
	 eMAY1ZhTZKLHMtKq9VnXWoXuzAdSConCVCa6/C08=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9C56F80527; Mon, 23 Oct 2023 21:23:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A8E8F8032D;
	Mon, 23 Oct 2023 21:23:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5014F804F3; Mon, 23 Oct 2023 21:23:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89479F8024E
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 21:23:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89479F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=c54r4BYv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698088997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XHuTTuE/+TRZWcTASJvUu0u9v/tZhQOQ+wZgzwWALPY=;
	b=c54r4BYvVMhvLiqkKzpibGiEUXzdjHNe8yCCVpWps9ImM0U/z4cThEQc9To7+BAw4ypKha
	advUvadfsX745FTOAvJIuoL6Q4Wbc55WSpf+7zKJYtz3k3vwBc4iBSghhSSsGVnKNDx68i
	Nlmb3gykCYHjdmdwjKYVVCPrQyGvw7E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-wqXRgHyEM16GvAklzTq33g-1; Mon, 23 Oct 2023 15:23:16 -0400
X-MC-Unique: wqXRgHyEM16GvAklzTq33g-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9c749c28651so211622566b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 12:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698088994; x=1698693794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHuTTuE/+TRZWcTASJvUu0u9v/tZhQOQ+wZgzwWALPY=;
        b=t0X6/Yc2vlvMZDb8kALUT88DX0K2uiNTkPtN68qyv6uHWV5WQ1QSQ8424k5PL+J2ib
         cIJBmHvz1FNaLz0dO16og93VdgNrBcpKHa+Y/Sn/ys1vOJmNAtmDAq6qMRfxcmG315J7
         kKTDAQJLKos38Sv02jb5rbOcdKO02XPI0OLMZMBKB4tCT8FnxXdqNUAxow23xVX/GcM7
         zG/vjlune/v/DKQl2AF77zD6PoUqh3hmhVkvF0bpwEmf/ucieTk3nbpJS2reB664att8
         gztwq25DItdYwb8atrWax8Jd1VtCETKlX3fFV4lAfxM1VxeuMJ1XyY/RnjA77//+XpX3
         952w==
X-Gm-Message-State: AOJu0Yxl/emNW06fxQ+nczNLtm+rL2s81W7+e4BMqGEPwZyiu7IoPziP
	gZ8kufo6pk85A7UT0hAY0hgXn2MvNyhEDbZuA4DWmVMIruWVwoEOLJoUPcdJideADi0ZHuPm5Me
	vwrBnNtrHt6g+9Q2TunvL4dQ=
X-Received: by 2002:a17:907:1b1c:b0:9bd:a7a5:3a5a with SMTP id
 mp28-20020a1709071b1c00b009bda7a53a5amr6942197ejc.36.1698088994273;
        Mon, 23 Oct 2023 12:23:14 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IES+4vjiiYd5o/2k73kRjoq/AwCI4sp3wlPyZnznzY8NWqy0x6yqSvcGI37g2R/fk2yoFEGHA==
X-Received: by 2002:a17:907:1b1c:b0:9bd:a7a5:3a5a with SMTP id
 mp28-20020a1709071b1c00b009bda7a53a5amr6942190ejc.36.1698088993971;
        Mon, 23 Oct 2023 12:23:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id
 xa17-20020a170907b9d100b009b913aa7cdasm7106778ejc.92.2023.10.23.12.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 12:23:13 -0700 (PDT)
Message-ID: <3a8ef188-ac22-44ca-d847-975841f7cd9c@redhat.com>
Date: Mon, 23 Oct 2023 21:23:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/6] ASoC: Intel: soc-acpi-cht: Add Lenovo Yoga Tab 3 Pro
 YT3-X90 quirk
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
References: <20231021211534.114991-1-hdegoede@redhat.com>
 <fb56b3fd-769c-4524-acf4-3324424c4b5a@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <fb56b3fd-769c-4524-acf4-3324424c4b5a@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4AG4AZBXG5ZT7I2AZRXZAXRWLF3RV6RB
X-Message-ID-Hash: 4AG4AZBXG5ZT7I2AZRXZAXRWLF3RV6RB
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4AG4AZBXG5ZT7I2AZRXZAXRWLF3RV6RB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 10/23/23 20:45, Pierre-Louis Bossart wrote:
> 
> 
> On 10/21/23 16:15, Hans de Goede wrote:
>> The Lenovo Yoga Tab 3 Pro YT3-X90 x86 tablet, which ships with Android with
>> a custom kernel as factory OS, does not list the used WM5102 codec inside
>> its DSDT.
>>
>> Workaround this with a new snd_soc_acpi_intel_baytrail_machines[] entry
>> which matches on the SST id instead of the codec id like nocodec does,
>> combined with using a machine_quirk callback which returns NULL on
>> other machines to skip the new entry on other machines.
> 
> The work-around sounds fine, but out of curiosity what causes the codec
> driver to probe if there's no ACPI HID?
> 
> Really wondering how we avoid the -517 error code with the deferred
> probe never completing because the codec driver never probed and
> registered the needed components?


These x86 android tablets ship with pretty broken DSDTs with
A whole bunch of (usually i2c) devices missing like
e.g. the touchscreen and the accelerometer.

For the factory Android install this is not an issue because
it uses drivers which instantiate the i2c-clients itself using
hardcoded i2c-bus, i2c-address and irqs.

To make this work under Linux I've written a special helper
"driver" which loads only on these broken DSDT devices
based on DMI modalias and then identifies the exact
model (also by DMI) and instantiates the correct devices
from this "driver" (really more of an old fashioned
board file). This code also adds all the necessary
properties, etc. to make standard drivers work, so all
model specific knowledge missing from the DSDT is encoded
in this special x86-android-tablets driver.

I've also submitted a patch for that driver to instantiate
the codec SPI device using spi_device_id matching instead
of acpi_device_id matching:

https://lore.kernel.org/platform-driver-x86/20231014205314.59333-5-hdegoede@redhat.com/

So this is the other side of the puzzle, I hope this
helps explain how I actually got this working.

Regards,

Hans


