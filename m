Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2EB105FB
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 10:01:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7BB216CD;
	Wed,  1 May 2019 10:00:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7BB216CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556697688;
	bh=uEZLSWQSrMDs8R7RYjtYGWMVw9ZZyn9K22fx0EyNqzY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rADOZBqvEkN5Qmzy14PdiTaS57rn9suehCxhsqqR4l6JDL51U0pUEiQTjiNA8eDNW
	 VGNhHg1eLx9UeoQCeNwhQ/O3sx3J8dfi6QUHjoBDbKQdWCApfgLo6iHWsNVlJHOfE1
	 I94EM4nj/5ZKtRS/ylvBwLjAX/38x3udMKZP2ZIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FFDBF896CB;
	Wed,  1 May 2019 09:59:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 992BAF8065C; Wed,  1 May 2019 09:59:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,RCVD_IN_MSPIKE_H2,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FF73F8065C
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 09:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FF73F8065C
Received: by mail-oi1-f195.google.com with SMTP id l203so13361706oia.3
 for <alsa-devel@alsa-project.org>; Wed, 01 May 2019 00:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zxgDmRsn1/IVmGuf5U9azTe0s7v3EA8DrDT/1fTHG9Q=;
 b=BOnNUL8ur0A5lslhFhuxZH02kGmI/UFsdIHe7fHt7eI+8npzx/ki/4wQSiPoBlDMir
 AwJMhFZTvMjkZOkcck59ZSjkTsOXQI+ZRWVFp1F5jasNvez63xUZChnUoV+2ytMCa/rQ
 G0ROyGIIcs2K79u+bY7TVaOY7XodJ3xxgeDplLBvIAynwAMA/NsT++TetZC4Ed+9hN7o
 cm9Qw8+FNdbvEHFRMSkHCj6p2rzU5AiBYHhklI+8FtVWAlyAycySNI9l2yYaz/1Di+Fb
 EF9ilnl5XQTw2vrAaBFETGnsUWrrwlyFEj5xE7nFGcq1sXZ1I4OSDjz1/SYuev/EUk1/
 EmYg==
X-Gm-Message-State: APjAAAW8xIgYpGeiVPXFzOJqIikjFxAmaPF54qvvqu/wb6O0dcJf1lVJ
 58AK1net2Tqq9GgJ1oyHdU+YrlhbnPUOs9D0BDk=
X-Google-Smtp-Source: APXvYqwRucsn2ORnmZzJM80aybzIMoVJlKVHwZ0llOPopwmEQAxBSBA2QxPX+O9LwH4uQ12+7ADgZSOR7ZOcJJsf2+o=
X-Received: by 2002:aca:ba82:: with SMTP id k124mr6169480oif.110.1556697576304; 
 Wed, 01 May 2019 00:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190415151857.25531-1-pierre-louis.bossart@linux.intel.com>
 <20190416032923.GQ28103@vkoul-mobl>
 <CAJZ5v0jOkQ7aWn6B_yVTYd7y+78mpGSzBoGuWe3uCdzDRNE94Q@mail.gmail.com>
 <eda0ed4e-fc36-a53a-225f-e7d54bb73413@linux.intel.com>
In-Reply-To: <eda0ed4e-fc36-a53a-225f-e7d54bb73413@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 1 May 2019 09:59:25 +0200
Message-ID: <CAJZ5v0iwm5tLRy2mLX6_uTk2wh+1Y4VaEcqDx5Z1WDLZHMnpEg@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Takashi Iwai <tiwai@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Moore <robert.moore@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, jank@cadence.com,
 Joe Perches <joe@perches.com>, Len Brown <lenb@kernel.org>,
 Erik Schmauss <erik.schmauss@intel.com>,
 "open list:ACPI COMPONENT ARCHITECTURE \(ACPICA\)" <devel@acpica.org>
Subject: Re: [alsa-devel] [PATCH] ACPI / device_sysfs: change _ADR
 representation to 64 bits
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Apr 30, 2019 at 8:23 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 4/16/19 3:09 AM, Rafael J. Wysocki wrote:
> > On Tue, Apr 16, 2019 at 5:29 AM Vinod Koul <vkoul@kernel.org> wrote:
> >>
> >> On 15-04-19, 10:18, Pierre-Louis Bossart wrote:
> >>> Standards such as the MIPI DisCo for SoundWire 1.0 specification
> >>> assume the _ADR field is 64 bits.
> >>>
> >>> _ADR is defined as an "Integer" represented as 64 bits since ACPI 2.0
> >>> released in 2002. The low levels already use _ADR as 64 bits, e.g. in
> >>> struct acpi_device_info.
> >>>
> >>> This patch bumps the representation used for sysfs to 64 bits.
> >>>
> >>> Example with a SoundWire device, the results show the complete
> >>> vendorID and linkID which were omitted before:
> >>>
> >>> Before:
> >>> $ more /sys/bus/acpi/devices/device\:38/adr
> >>> 0x5d070000
> >>> After:
> >>> $ more /sys/bus/acpi/devices/device\:38/adr
> >>> 0x000010025d070000
> >>
> >> This looks fine but the sysfs file is an ABI. Not sure if we can modify
> >> the value returned this way.. Though it should not cause userspace
> >> reading 32bits to break...
> >
> > Well, IIRC using "08" instead of "016" in the format field would
> > preserve the existing behavior for 32-bit values, wouldn't it?
>
> yes, but it makes the 64-bit address not aligned depending on the number
> of leading zeroes, see below. I get a migraine just looking at the results.

Well, scripts reading them won't get that, but fair enough.

> Maybe add a test to use 08 for values that are below 0xFFFFFFFF and 16
> for addresses who really need the full range, typically because of an
> encoding?

That would be fine by me.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
