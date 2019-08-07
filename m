Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E07584F82
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 17:11:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12E98165D;
	Wed,  7 Aug 2019 17:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12E98165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565190680;
	bh=4yY7udfBM8uQW8qvKAscnQ5BxIPPev/5Z7bH/VsgJIw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cZG1Km6ye0DZu4l6imDt7YjldEdoFuGe71KsAMKwz1Hd1b+wT/fgRFFx29RYX1Tm5
	 fu/6EZR68+82fQQfK9Vyv2LlC5mgqNEyrIt6pADmhfPd8l3o0xymdDtfhQ1olXH55O
	 7HfNSF4QbigwfFzKHD/4Zn7ravFTHalNF0+0kpfA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44A34F80290;
	Wed,  7 Aug 2019 17:09:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03A3AF80290; Wed,  7 Aug 2019 17:09:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FF5CF800E4
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 17:09:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FF5CF800E4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 08:09:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,357,1559545200"; d="scan'208";a="373801730"
Received: from knguye7-mobl.amr.corp.intel.com (HELO [10.255.81.127])
 ([10.255.81.127])
 by fmsmga005.fm.intel.com with ESMTP; 07 Aug 2019 08:09:27 -0700
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20190718230215.18675-1-pierre-louis.bossart@linux.intel.com>
 <CAJZ5v0g5Hk9JYLvRXfLk5-o=n_RVPKtWD=QONpiimCWyQOFELQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <52a2cb0c-92a6-59d5-72da-832edd6481f3@linux.intel.com>
Date: Wed, 7 Aug 2019 10:09:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0g5Hk9JYLvRXfLk5-o=n_RVPKtWD=QONpiimCWyQOFELQ@mail.gmail.com>
Content-Language: en-US
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, jank@cadence.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH] soundwire: fix regmap dependencies and
 align with other serial links
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 7/19/19 4:04 AM, Rafael J. Wysocki wrote:
> On Fri, Jul 19, 2019 at 1:02 AM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>> The existing code has a mixed select/depend usage which makes no sense.
>>
>> config SOUNDWIRE_BUS
>>         tristate
>>         select REGMAP_SOUNDWIRE
>>
>> config REGMAP_SOUNDWIRE
>>          tristate
>>          depends on SOUNDWIRE_BUS
>>
>> Let's remove one layer of Kconfig definitions and align with the
>> solutions used by all other serial links.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> No issues found:
> 
> Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Vinod, Mark, any feedback?

There will be a set of SoundWire codec drivers provided upstream soonish 
and we'll get a number of kbuild errors without this patch.

> 
>> ---
>>   drivers/base/regmap/Kconfig | 2 +-
>>   drivers/soundwire/Kconfig   | 7 +------
>>   drivers/soundwire/Makefile  | 2 +-
>>   3 files changed, 3 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
>> index 6ad5ef48b61e..8cd2ac650b50 100644
>> --- a/drivers/base/regmap/Kconfig
>> +++ b/drivers/base/regmap/Kconfig
>> @@ -44,7 +44,7 @@ config REGMAP_IRQ
>>
>>   config REGMAP_SOUNDWIRE
>>          tristate
>> -       depends on SOUNDWIRE_BUS
>> +       depends on SOUNDWIRE
>>
>>   config REGMAP_SCCB
>>          tristate
>> diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
>> index 3a01cfd70fdc..f518273cfbe3 100644
>> --- a/drivers/soundwire/Kconfig
>> +++ b/drivers/soundwire/Kconfig
>> @@ -4,7 +4,7 @@
>>   #
>>
>>   menuconfig SOUNDWIRE
>> -       bool "SoundWire support"
>> +       tristate "SoundWire support"
>>          help
>>            SoundWire is a 2-Pin interface with data and clock line ratified
>>            by the MIPI Alliance. SoundWire is used for transporting data
>> @@ -17,17 +17,12 @@ if SOUNDWIRE
>>
>>   comment "SoundWire Devices"
>>
>> -config SOUNDWIRE_BUS
>> -       tristate
>> -       select REGMAP_SOUNDWIRE
>> -
>>   config SOUNDWIRE_CADENCE
>>          tristate
>>
>>   config SOUNDWIRE_INTEL
>>          tristate "Intel SoundWire Master driver"
>>          select SOUNDWIRE_CADENCE
>> -       select SOUNDWIRE_BUS
>>          depends on X86 && ACPI && SND_SOC
>>          help
>>            SoundWire Intel Master driver.
>> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
>> index fd99a831b92a..45b7e5001653 100644
>> --- a/drivers/soundwire/Makefile
>> +++ b/drivers/soundwire/Makefile
>> @@ -5,7 +5,7 @@
>>
>>   #Bus Objs
>>   soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o
>> -obj-$(CONFIG_SOUNDWIRE_BUS) += soundwire-bus.o
>> +obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
>>
>>   #Cadence Objs
>>   soundwire-cadence-objs := cadence_master.o
>> --
>> 2.20.1
>>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
