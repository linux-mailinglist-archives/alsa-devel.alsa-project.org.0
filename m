Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B3880AEB7
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Dec 2023 22:17:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F293E950;
	Fri,  8 Dec 2023 22:16:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F293E950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702070229;
	bh=jRmhCUo2hgqabgOKbQ6li7BIJdUvyqxr2ShtfqhCDgE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K3ZEH01i+SZ69XwUd8LCmo84lpOPjX5EDtOH15JcpZG6GkAHPbWTTBUMNnfgHhApB
	 3cAKqYwZ220c9R3kDZNxpgCVd1vcRzvLed7edevbyPJPthDx7jdEyhl1Dr9RukskfB
	 8fcshB7podeC7NM89PVW38CUt5/ejugWWv9HCm+g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFCA5F80563; Fri,  8 Dec 2023 22:16:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67A11F80570;
	Fri,  8 Dec 2023 22:16:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72E76F8024E; Fri,  8 Dec 2023 22:16:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FF36F800F5
	for <alsa-devel@alsa-project.org>; Fri,  8 Dec 2023 22:16:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FF36F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UzMTwQfx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702070173; x=1733606173;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jRmhCUo2hgqabgOKbQ6li7BIJdUvyqxr2ShtfqhCDgE=;
  b=UzMTwQfxDFtgbU2g9fKsHIepbxOxMhHjEeC79II4Le94WCFodsPAQ0w5
   3h/yKkFVPiB1Te0hEfLXbV7sylnU0WnSpd932jyuKzF39aasZpu9NOu7C
   1s2IxTkBPD/1POZpz11c53R4XvZfIDibFRqzBc2Iy0v8HoF0bqKGVUDil
   coTOqTOR++RF1Ke6cUWfbPxAZ+s61QsyAATD6j9OSlcH2MGQ3RDjkrSGy
   t7zXxUtXaS7tzsJc6vIZpmpTd1K+rsFFuglNXBJ0LqyZnIrCaLq4DAFCL
   hIU4eN735md8VAr6QFuYaFkXM43dHpI8N6GWMTBrOhkYF+9kdhqIugcQO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="425595729"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600";
   d="scan'208";a="425595729"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 13:16:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="863010335"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600";
   d="scan'208";a="863010335"
Received: from williamh-mobl.amr.corp.intel.com (HELO [10.212.151.176])
 ([10.212.151.176])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 13:16:02 -0800
Message-ID: <5b8e74ad-460f-4e68-a17b-3131d810f29b@linux.intel.com>
Date: Thu, 7 Dec 2023 18:56:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 vinod.koul@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BBFCWIYPVE6KOXD34TUZDQPIRRXRKSM7
X-Message-ID-Hash: BBFCWIYPVE6KOXD34TUZDQPIRRXRKSM7
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BBFCWIYPVE6KOXD34TUZDQPIRRXRKSM7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks for the comments Mark, much appreciated.

>> +Addressing restrictions
>> +-----------------------
>> +
>> +The Device Number specified in the Header follows the SoundWire
>> +definitions, and broadcast and group addressing are
>> +permitted. However, in reality it is very unlikely that the exact same
>> +binary data needs to be provided to the two different Peripheral
>> +devices. The Linux implementation only allows for transfers to a
>> +single device at a time.
> 
> For the firmware download case it seems likely that this won't always be
> the case, but it's definitely a thing that could be done incrementally.

One example discussed this week on the mailing list is the Cirrus Logic
case, where the firmware contains information on which speakers a given
amplifier should be doing, and each firmware is named as AMP-n.

I have really not found any practical case where the same data needs to
be sent to N devices, and I don't have a burning desire to tie the codec
initialization together with all the asynchronous nature of
enumeration/probe.

>> +Regmap use
>> +~~~~~~~~~~
> 
>> +Existing codec drivers rely on regmap to download firmware to
>> +Peripherals, so at a high-level it would seem natural to combine BRA
>> +and regmap. The regmap layer could check if BRA is available or not,
>> +and use a regular read-write command channel in the latter case.
> 
>> +However, the regmap layer does not have information on latency or how
>> +critical a BRA transfer is. It would make more sense to let the codec
>> +driver make decisions (wait, timeout, fallback to regular
>> +read/writes).
> 
> These don't seem like insurmountable obstacles - they feel more like a
> copy break kind of situation where we can infer things from the pattern
> of transactions, and there's always the possibility of adding some calls
> to give regmap more high level information about the overall state of
> the device.  One of the expected usage patterns with cache only mode is
> to build up a final register state then let the cache code work out the
> optimal pattern to actually write that out.

I did expect some pushback on regmap :-)

The point is really that the main use for this download is a set of
write-once memory areas which happen to be mapped as registers. There is
no real need to declare or access each memory address individually.

In addition in terms of error handling, the expectation is that the set
of writes are handled in a pass/fail manner. There's no real way to know
which of the individual writes failed.

>> +In addition, the hardware may lose context and ask for the firmware to
>> +be downloaded again. The firmware is not however a fixed definition,
>> +the SDCA definition allows the hardware to request an updated firmware
>> +or a different coefficient table to deal with specific environment
>> +conditions. In other words, traditional regmap cache management is not
>> +good enough, the Peripheral driver is required track hardware
>> +notifications and react accordingly.
> 
> I might be missing something but those requests for redownload sound
> like things that would occur regardless of the mechanism used to perform
> the I/O?

What I meant is that the codec driver would e.g. need to fetch a
different firmware table and download it. There's no real need to
maintain a cache on the host side since the entire table will be downloaded.

>> +Concurrency between BRA and regular read/write
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
>> +The existing 'nread/nwrite' API already relies on a notion of start
>> +address and number of bytes, so it would be possible to extend this
>> +API with a 'hint' requesting BPT/BRA be used.
> 
>> +However BRA transfers could be quite long, and the use of a single
>> +mutex for regular read/write and BRA is a show-stopper. Independent
>> +operation of the control/command and BRA transfers is a fundamental
>> +requirement, e.g. to change the volume level with the existing regmap
>> +interface while downloading firmware.
> 
>> +This places the burden on the codec driver to verify that there is no
>> +concurrent access to the same address with the command/control
>> +protocol and the BRA protocol.
> 
> This makes me feel very nervous about robustness.  I do note that regmap
> has an async interface which is currently only used for SPI and really
> only by the Cirrus DSPs (plus opportunisticly by rbtree cache sync), the
> original usage was to fill the pipleine of SPI controllers so we can
> ideally push data entirely from interrupt.  TBH that was done before SMP
> became standard and it's a lot less clear in this day and age that this
> is actually helpful, the overhead of cross core synchronisation likely
> obliterates any benefit.  There's sufficently few users that we could
> make API changes readily to fit better.

I am not that nervous, it's a known hardware issue and the software
drivers SHALL make sure that the two methods of accessing a register are
not used concurrently. We could add some sort of mutex on specific
memory areas.

>> +One possible strategy to speed-up all initialization tasks would be to
>> +start a BRA transfer for firmware download, then deal with all the
>> +"regular" read/writes in parallel with the command channel, and last
>> +to wait for the BRA transfers to complete. This would allow for a
>> +degree of overlap instead of a purely sequential solution. As a
>> +results, the BRA API must support async transfers and expose a
>> +separate wait function.
> 
> This feels a lot like it could map onto the regmap async interface, it
> would need a bit of a rework (mainly that currently they provide
> ordering guarantees with respect to both each other and sync I/O) but
> those could be removed with some care) but it's got the "here's a list
> of I/O, here's another call to ensure it's all actually happened" thing.
> It sounds very much like how I was thinking of the async API when I was
> writing it and the initial users.
> 
> It's this bit that really got me thinking it could fit well into regmap.

I really don't know anything about this async interface, if you have
pointers on existing examples I am all ears....I am not aware of any
Intel platform or codec used on an Intel platform making use of this API.

At any rate the low-level behavior is to
a) allocate and configure all the SoundWire resources
b) allocate and configure all the DMA resources
c) trigger DMA and enable SoundWire transfers
d) wait for the DMA to complete

The codec API can be modified as needed, as long as there are provisions
for these 4 steps.

>> +Error handling
>> +~~~~~~~~~~~~~~
>> +
>> +The expected response to a 'bra_message' and follow-up behavior may
>> +vary:
>> +
>> +   (1) A Peripheral driver may want to receive an immediate -EBUSY
>> +       response if the BRA protocol is not available at a given time.
>> +
>> +   (2) A Peripheral driver may want to wait until a timeout for the
>> +       on-going transfer to be handled
>> +
>> +   (3) A Peripheral driver may want to wait until existing BRA
>> +       transfers complete or deal with BRA as a background task when
>> +       audio transfers stop. In this case, there would be no timeout,
>> +       and the operation may not happen if the platform is suspended.
> 
> Option 3 would be a jump for regmap.

Sorry, I don't get what a 'jump' means in this context.
