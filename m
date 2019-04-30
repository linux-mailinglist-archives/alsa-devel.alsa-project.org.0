Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6ABFFB6
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 20:25:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E39D16B7;
	Tue, 30 Apr 2019 20:24:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E39D16B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556648736;
	bh=vcrN+B3Ly8aVmLa/dXg51np4qwJE10i7MuzMWEAsq6o=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=emuUZmdMifEwhKyr1h4OEGr2SfuXreXkbhtf8FqMFySb7AqcsydQYIpSFI0fpQxUI
	 hSnY6jZU19AVjjgM4SMLCHIgRC1pl+Qm1yx9NFQMO9oTLwR4mndq2y0HMcSE0hMM/6
	 sObwTFajRS+Ny6wQCkg5g77kp0rMCPWBKeK83wyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81066F8962C;
	Tue, 30 Apr 2019 20:23:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDD2FF896AA; Tue, 30 Apr 2019 20:23:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6857FF8065C
 for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2019 20:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6857FF8065C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 11:23:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,414,1549958400"; d="scan'208";a="144938228"
Received: from cng16-mobl.amr.corp.intel.com (HELO [10.252.205.95])
 ([10.252.205.95])
 by fmsmga008.fm.intel.com with ESMTP; 30 Apr 2019 11:23:39 -0700
To: "Rafael J. Wysocki" <rafael@kernel.org>, Vinod Koul <vkoul@kernel.org>
References: <20190415151857.25531-1-pierre-louis.bossart@linux.intel.com>
 <20190416032923.GQ28103@vkoul-mobl>
 <CAJZ5v0jOkQ7aWn6B_yVTYd7y+78mpGSzBoGuWe3uCdzDRNE94Q@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <eda0ed4e-fc36-a53a-225f-e7d54bb73413@linux.intel.com>
Date: Tue, 30 Apr 2019 13:23:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0jOkQ7aWn6B_yVTYd7y+78mpGSzBoGuWe3uCdzDRNE94Q@mail.gmail.com>
Content-Language: en-US
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Moore <robert.moore@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 4/16/19 3:09 AM, Rafael J. Wysocki wrote:
> On Tue, Apr 16, 2019 at 5:29 AM Vinod Koul <vkoul@kernel.org> wrote:
>>
>> On 15-04-19, 10:18, Pierre-Louis Bossart wrote:
>>> Standards such as the MIPI DisCo for SoundWire 1.0 specification
>>> assume the _ADR field is 64 bits.
>>>
>>> _ADR is defined as an "Integer" represented as 64 bits since ACPI 2.0
>>> released in 2002. The low levels already use _ADR as 64 bits, e.g. in
>>> struct acpi_device_info.
>>>
>>> This patch bumps the representation used for sysfs to 64 bits.
>>>
>>> Example with a SoundWire device, the results show the complete
>>> vendorID and linkID which were omitted before:
>>>
>>> Before:
>>> $ more /sys/bus/acpi/devices/device\:38/adr
>>> 0x5d070000
>>> After:
>>> $ more /sys/bus/acpi/devices/device\:38/adr
>>> 0x000010025d070000
>>
>> This looks fine but the sysfs file is an ABI. Not sure if we can modify
>> the value returned this way.. Though it should not cause userspace
>> reading 32bits to break...
> 
> Well, IIRC using "08" instead of "016" in the format field would
> preserve the existing behavior for 32-bit values, wouldn't it?

yes, but it makes the 64-bit address not aligned depending on the number 
of leading zeroes, see below. I get a migraine just looking at the results.

Maybe add a test to use 08 for values that are below 0xFFFFFFFF and 16 
for addresses who really need the full range, typically because of an 
encoding?

w/ value-dependent format:
/sys/bus/acpi/devices# cat */*/adr

0x00160000
0x00140003
0x000d0000
0x000d0002
0x000d0003
0x00070000
0x00070001
0x00070002
0x00070003
0x000010025d070100
0x000110025d070100
0x000210025d070100
0x000310025d070100
0x000010025d070000
0x000110025d070000
0x000210025d070000
0x000310025d070000
0x00000000

w/ 0x08 only:

0x00160000
0x00140003
0x000d0000
0x000d0002
0x000d0003
0x00070000
0x00070001
0x00070002
0x00070003
0x10025d070100
0x110025d070100
0x210025d070100
0x310025d070100
0x10025d070000
0x110025d070000
0x210025d070000
0x310025d070000
0x00000000
0x00000000

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
