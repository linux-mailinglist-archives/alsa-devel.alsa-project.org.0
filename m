Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9C112BBE4
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Dec 2019 01:19:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BED561765;
	Sat, 28 Dec 2019 01:18:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BED561765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577492370;
	bh=gQAkMt23cZ3lppodXuFp500LI8I0ZdQOMC7qLE4mKR4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nvlkY8bLDsJB4Q+b6gQfM1g4kuJ2bq7BsjON8AELV9FrUkSR7KxFucOEtgm1+vCqu
	 jvtP9zvYik7ueKoJk0KRWakCZf57rXMKWCF3nFiNd6Verk+sbi5j+qVwIcMuaK1AvL
	 XXB2tdXeGbzgRkMAU7DTuFbV1d/FLmINFl0ys5fI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8027F80269;
	Sat, 28 Dec 2019 01:16:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89555F80264; Sat, 28 Dec 2019 01:16:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02D53F800CD
 for <alsa-devel@alsa-project.org>; Sat, 28 Dec 2019 01:16:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02D53F800CD
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Dec 2019 16:16:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,364,1571727600"; d="scan'208";a="243364226"
Received: from vdoan2-mobl.ccr.corp.intel.com (HELO [10.251.152.151])
 ([10.251.152.151])
 by fmsmga004.fm.intel.com with ESMTP; 27 Dec 2019 16:16:11 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
 <20191217210314.20410-10-pierre-louis.bossart@linux.intel.com>
 <20191227090826.GM3006@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5be4d9df-0f46-d36f-471c-aae9e1f55cc0@linux.intel.com>
Date: Fri, 27 Dec 2019 18:13:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191227090826.GM3006@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v5 09/17] soundwire: intel: remove platform
 devices and use 'Master Devices' instead
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



>> +extern struct sdw_md_driver intel_sdw_driver;
> 
> who uses this intel_sdw_driver? I would assumed someone would register
> this with the core...

this is a structure used by intel_init(), see the following code.

+		md = sdw_md_add(&intel_sdw_driver,
+				res->parent,
+				acpi_fwnode_handle(adev),
+				i);

that will in turn call intel_master_probe() as defined below:

+struct sdw_md_driver intel_sdw_driver = {
+	.probe = intel_master_probe,
+	.startup = intel_master_startup,
+	

>> -		link->pdev = pdev;
>> -		link++;
>> +		/* let the SoundWire master driver to its probe */
>> +		md->driver->probe(md, link);
> 
> So you are invoking driver probe here.. That is typically role of driver
> core to do that.. If we need that, make driver core do that for you!
> 
> That reminds me I am missing match code for master driver...

There is no match for the master because it doesn't have an existence in 
ACPI. There are no _ADR or HID that can be used, the only thing that 
exists is the Controller which has 4 sublinks. Each master must be added 
  by hand.

Also the SoundWire master cannot be enumerated or matched against a 
SoundWire bus, since it controls the bus itself (that would be a chicken 
and egg problem). The SoundWire master would need to be matched on a 
parent bus (which does not exist for Intel) since the hardware is 
embedded in a larger audio cluster that's visible on PCI only.

Currently for Intel platforms, the SoundWire master device is created by 
the SOF driver (via the abstraction in intel_init.c).

> So we seem to be somewhere is middle wrt driver probing here! IIUC this
> is not a full master driver, thats okay, but then it is not
> completely transparent either...
> 
> I was somehow thinking that the driver will continue to be
> 'platform/acpi/of' driver and master device abstraction will be
> handled in the core (for example see how the busses like i2c handle
> this). The master device is created and used to represent but driver
> probing etc is not done

I2C controllers are typically PCI devices or have some sort of ACPI 
description. This is not the case for SoundWire masters on Intel 
platforms, so even if I wanted to I would have no ability to implement 
any matching or parent bus registration.

Also the notion of 'probe' does not necessarily mean that the device is 
attached to a bus, we use DAI 'drivers' in ASoC and still have 
probe/remove callbacks.

And if you look at the definitions, we added additional callbacks since 
probe/remove are not enough to deal with hardware restrictions:

For Intel platforms, we have a startup() callback which is only invoked 
once the DSP is powered and the rails stable. Likewise we added an 
'autonomous_clock_stop()' callback which will be needed when the Linux 
driver hands-over control of the hardware to the DSP firmware, e.g. to 
deal with in-band wakes in D0i3.

FWIW, the implementation here follows what was suggested for Greybus 
'Host Devices' [1] [2], so it's not like I am creating any sort of 
dangerous precedent.

[1] 
https://elixir.bootlin.com/linux/latest/source/drivers/greybus/es2.c#L1275
[2] https://elixir.bootlin.com/linux/latest/source/drivers/greybus/hd.c#L124

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
