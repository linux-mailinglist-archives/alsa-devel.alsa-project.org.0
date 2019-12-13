Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBFC11EDA1
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 23:18:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A758165D;
	Fri, 13 Dec 2019 23:17:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A758165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576275484;
	bh=rRi68kA/of2g+1MoPIXbIBf4wpHhTVmtG/tdmkrelSk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iaTjzLhppAr1QP4YxSBP4GIyLIirUUanQzrgUS2ghPs9c6ABOSBZwB7nxpTh/0Vz4
	 Y2BtBfk3SY9JkBEYIAA+O1ITJDQdB1oBefrDfKZSgnix9jF9F0nnBuhLeuWoKmJwNL
	 pfPiok7UCcJLkcLTz8k07tiicA5PZUqy0MFqkBTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A085F80234;
	Fri, 13 Dec 2019 23:16:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 980F0F800AB; Fri, 13 Dec 2019 23:16:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70602F800AB
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 23:16:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70602F800AB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 14:16:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,311,1571727600"; d="scan'208";a="239424458"
Received: from dmjacob-mobl2.amr.corp.intel.com (HELO [10.252.129.36])
 ([10.252.129.36])
 by fmsmga004.fm.intel.com with ESMTP; 13 Dec 2019 14:16:10 -0800
To: Greg KH <gregkh@linuxfoundation.org>
References: <20191213050409.12776-1-pierre-louis.bossart@linux.intel.com>
 <20191213050409.12776-7-pierre-louis.bossart@linux.intel.com>
 <20191213072127.GD1750354@kroah.com>
 <41d1fcbc-47b7-bbee-5b55-759cbb5f5a7b@linux.intel.com>
 <20191213161218.GC2653074@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c7d25b39-b8bf-46f1-96c2-8e52aa858dff@linux.intel.com>
Date: Fri, 13 Dec 2019 16:14:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191213161218.GC2653074@kroah.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v4 06/15] soundwire: add support for
 sdw_slave_type
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



On 12/13/19 10:12 AM, Greg KH wrote:
> On Fri, Dec 13, 2019 at 09:05:37AM -0600, Pierre-Louis Bossart wrote:
>> On 12/13/19 1:21 AM, Greg KH wrote:
>>> On Thu, Dec 12, 2019 at 11:04:00PM -0600, Pierre-Louis Bossart wrote:
>>>> Currently the bus does not have any explicit support for master
>>>> devices.
>>>>
>>>> First add explicit support for sdw_slave_type and error checks if this type
>>>> is not set.
>>>>
>>>> In follow-up patches we can add support for the sdw_md_type (md==Master
>>>> Device), following the Grey Bus example.
>>>
>>> How are you using greybus as an example of "master devices"?  All you
>>> are doing here is setting the type of the existing devices, right?
>>
>> I took your advice to look at GreyBus and used the 'gb host device' as the
>> model to implement the 'sdw master' add/startup/remove interfaces we needed.
>>
>> so yes in this patch we just add a type for the slave, the interesting part
>> is in the next patches.
> 
> Is that what a "master" device really is?  A host controller, like a USB
> host controller?  Or something else?
> 
> I thought things were a bit more complex for this type of topology.

The "Master Device" is similar to a USB host controller, but with a much 
lower complexity. It can also be viewed as similar to an 
HDaudio/AC97/SLIMbus  controller which handles a serial link with 
interleaved command/data, but with lower latency to e.g. support 1-bit 
oversampled PDM data typically used by digital microphones (or amplifiers).

The Master device provides the clock for the bus, handles clock 
stop/restart sequences in and out of idle state, and it issues commands 
which contain a sync pattern. The Master device will also typically have 
audio 'ports'.

The 'Slave Devices' are similar to USB/SLIMbus devices, they look for a 
sync pattern and when synchronized will respond to status/write/read 
commands. They cannot send commands on their own but can signal in-band 
interrupts. The bus is multi-drop and typically single-level (no 
hubs/bridges so far).

Unfortunately there is no host controller interface so we need a 
vendor-specific driver for each Master device implementation. The Master 
IP is typically part of the audio controller, so in the Intel 
implementation it's represented as an ACPI-enumerated child device of 
the PCI audio controller.

The patches in this series provide a means for the SOF/HDaudio driver to 
check the ACPI DSDT tables and detect if SoundWire links are enabled, 
allocate all necessary resources and start the hardware operation once 
all the power rail dependencies are handled.

Here are a couple of publicly-available pointers:

https://mipi.org/sites/default/files/Audio_Spec_Brief_20141007.pdf
https://mipi.org/sites/default/files/MIPI-SoundWire-webinar-20150121-final.pdf


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
