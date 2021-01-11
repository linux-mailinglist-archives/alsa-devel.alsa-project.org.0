Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F002F1EBB
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 20:14:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A38C0173B;
	Mon, 11 Jan 2021 20:13:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A38C0173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610392452;
	bh=zpaNkIRCm1LVX8vNEnqBsoTV32pbpUoE7E4ZzGtZ4Hk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CZROuji3kbew8fCNbUJdnpCEIKecei93RHSuHU/fHJrg8NMSIu0BA8Gh26CB89Xnt
	 GF1uo+8Gon8a73pD7MI74+cqSRqCRIsaMVM9oazFZ8SAyxh2j54Ws8H975uhsfF1AV
	 ZaJZ07QphPAfZNQ+OMU9BBbguB2WnGYwxm5L+4+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4B8FF800BE;
	Mon, 11 Jan 2021 20:12:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 894E1F8016D; Mon, 11 Jan 2021 20:12:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A02EEF800BE
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 20:12:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A02EEF800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="KCKXss+Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610392352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k4k4vHfas2/mfUg7QiyVoCdeOBt+W1BwAcMEvMJo9ZY=;
 b=KCKXss+Ye7/2qyvyg6KYuYTk2aIXb99kVUkgB2zcy7mGtBKrwIwPPkC8jeDCkk9pUKD3wh
 yYC4PwNb79B3mzQNtOwc5X4jsA2uBuMrtccZxBx8GGq/Kn1b8kkziqIP6fW+jczu8Muf6O
 VVLlYWlWx/WgVJT909EYcJtUdWUOmPY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-YRnGshOqPDy7cAbWdzKKUg-1; Mon, 11 Jan 2021 14:12:30 -0500
X-MC-Unique: YRnGshOqPDy7cAbWdzKKUg-1
Received: by mail-ed1-f72.google.com with SMTP id u17so118626edi.18
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 11:12:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k4k4vHfas2/mfUg7QiyVoCdeOBt+W1BwAcMEvMJo9ZY=;
 b=Su336mk8Dq9Kl75Di4LBBnJOnpiAVuscYkEe/lnALb7/BRlU4ebbblFI2PDRo+lcQr
 1AeP4ZNBnH2RmAYr2Fy3lHpwMbPsTtGpTykgGO1ORDTX7yPPQQvGhc5Lc/oHbVcO/3T/
 9UzHxfz3mHPy8jzZRELUB/9j2CGrom2l5f1BvYPY2OGUDk2EGA3rP9Qkh4yV+nr9ZbZx
 8/At+JDU0EcmAjqjq4HivXDOwMfKHYSLpiK03jzsQMAFjPFrqK6bzgfhcga82w0kZdJo
 bq6vTVUCdly4nvzZVyvKbL4DtsmV8MP6RnSF56a/R62+If4vMy94DGJtGKRJeeFoQnDc
 tczA==
X-Gm-Message-State: AOAM5338PkrPcWF5YesReuePnauuymxSN+lleqSAHmqpSY9E2pa1n86X
 sOZ/JPmPPX52Fcsc7YyBEbnkvtOjFpf2tN0FAUsjnriw17iaB2YrOuTEmAXz5lg5uAUHwENYZnm
 ER8G9RcsINZ5eJTGZBDAX4jfmE3H4hI5hzcD13ho79l19zg5Tb94tx+jun2LQ0Kl//v52NZWXC2
 s=
X-Received: by 2002:aa7:df0d:: with SMTP id c13mr608361edy.387.1610392348981; 
 Mon, 11 Jan 2021 11:12:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoUfiTrQIZDkbSWIORExhpcx31FDvF4RUR04EuWDnj+mZK8y6ZiTUUVvTNgVsSA/0cqV+nwA==
X-Received: by 2002:aa7:df0d:: with SMTP id c13mr608334edy.387.1610392348650; 
 Mon, 11 Jan 2021 11:12:28 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id k23sm199424ejs.100.2021.01.11.11.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 11:12:28 -0800 (PST)
Subject: Re: [PATCH 04/14] mfd: arizona: Allow building arizona MFD-core as
 module
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-5-hdegoede@redhat.com>
 <20201229120039.GI9673@ediswmail.ad.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <d80e90c1-143e-2655-b053-9361458f3df9@redhat.com>
Date: Mon, 11 Jan 2021 20:12:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201229120039.GI9673@ediswmail.ad.cirrus.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Mark Brown <broonie@kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>,
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

First of all thank you for the review and for all your comments
(also in the other part of the thread).

On 12/29/20 1:00 PM, Charles Keepax wrote:
> On Sun, Dec 27, 2020 at 10:12:22PM +0100, Hans de Goede wrote:
>> There is no reason why the arizona core,irq and codec model specific
>> regmap bits cannot be build as a module. All they do is export symbols
>> which are used by the arizona-spi and/or arizona-i2c modules, which
>> themselves can be built as module.
>>
>> Change the Kconfig and Makefile arizona bits so that the arizona MFD-core
>> can be built as a module.
>>
>> This is especially useful on x86 platforms with a WM5102 codec, this
>> allows the arizona MFD driver necessary for the WM5102 codec to be
>> enabled in generic distro-kernels without growing the base kernel-image
>> size.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
> 
> I think this patch might still cause some issues. ASoC has an
> idiom where the machine driver does a select on the necessary
> CODEC drivers. Select doesn't take care of dependencies etc. So I
> believe if you build the machine driver as built in, it then
> selects the CODEC as built in. If you have the MFD as a module
> the build then fails due to the the CODEC calling some Arizona
> functions.

The rules for using select in Kconfig say that the Kconfig
symbol doing the selecting must either have a "requires on
or a "select" on any dependencies of the Kconfig symbol which
it is selecting. Looking at the new machine-driver which this
series adds:

config SND_SOC_INTEL_BYTCR_WM5102_MACH
        tristate "Baytrail and Baytrail-CR with WM5102 codec"
        depends on SPI && ACPI
        depends on X86_INTEL_LPSS || COMPILE_TEST
        select SND_SOC_ACPI
        select SND_SOC_WM5102
        help
          This adds support for ASoC machine driver for Intel(R) Baytrail and Baytrail-CR
          platforms with WM5102 audio codec.
          Say Y if you have such a device.
          If unsure select "N".

I now see that I'm breaking that rule myself and this is
missing a "depends on MFD_WM5102" I do see a "depends on MFD_WM5102"
here:

config SND_SOC_WM5102
        tristate
        depends on MFD_WM5102

So I would expect some sort of error if I unselect MFD_WM5102 and indeed
the following happens if I unselect MFD_WM5102:

[hans@x1 linux]$ make oldconfig

WARNING: unmet direct dependencies detected for SND_SOC_WM5102
  Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && MFD_WM5102 [=n]
  Selected by [m]:
  - SND_SOC_INTEL_BYTCR_WM5102_MACH [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_SOC_INTEL_MACH [=y] && (SND_SST_ATOM_HIFI2_PLATFORM [=m] || SND_SOC_SOF_BAYTRAIL [=m]) && SPI [=y] && ACPI [=y] && (X86_INTEL_LPSS [=y] || COMPILE_TEST [=n])

Which of course is not supposed to happen and is caused by the
config SND_SOC_INTEL_BYTCR_WM5102_MACH missing
"depends on MFD_WM5102", which is my bad.

But typing this (rubber ducky effect) has made me realized what the
problem is, the codec Kconfig symbols depend on the: MFD_WM5102,
MFD_WM5110, etc. Kconfig symbols. But those are booleans which enable/disable
support for those codecs inside arizona-core.c. So you are right that
this ("mfd: arizona: Allow building arizona MFD-core as module") could
cause a scenario where the core is built as a module and the codec
driver is builtin.

But I do not think that the solution is to inline all the functions used
from the codec drivers. The solution is to extend:

config SND_SOC_WM5102
        tristate
        depends on MFD_WM5102

to:

config SND_SOC_WM5102
        tristate
        depends on MFD_WM5102
        depends on MFD_ARIZONA

And to update machine drivers to still match the:
"The Kconfig symbol doing the selecting must either have a "requires
on" or a "select" on any dependencies of the Kconfig symbol which
it is selecting." rule which I formulated above.

(and idem for all the other codecs which use symbols from MFD_ARIZONA)

> arizona_request_irq, arizona_free_irq, arizona_set_irq_wake
> 
> On Madera we made the equivalents inline functions to avoid the
> issue, the same should work here.
> 
> include/linux/irqchip/irq-madera.h

Yes that will work too, but I would prefer to solve what is a Kconfig
issue with Kconfig changes.

Note I will simply drop this patch for the next version of this series (*)
since the whole jack rework thing we discussed is really orthogonal to
this and that one will be interesting enough the review all by itself :)

Regards,

Hans



*) I will resubmit a fixed version later after the other stuff has landed

