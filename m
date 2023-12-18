Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE638170A0
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 14:39:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF9C5DEB;
	Mon, 18 Dec 2023 14:39:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF9C5DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702906778;
	bh=J3ELLp5LAeAwAWR1C/4qxH4K8OaxLDU00Y9CzVO+Azo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JbFr/lOLnwtNy7awpukOJrX/jvoiks18p/Uxq6j2wPyoTR35KSfgSkDfPZJySBJ21
	 tq21pRfAup6YTQEZYfQNd7m4mG6mnbPJgJz62w+wCBhL0o0nGc1S+LoDYrKhqOVub3
	 hT9bFLul/jTt1Laj5h0BPLXlAHAeBx6Jq1dIEdBw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E7B2F80425; Mon, 18 Dec 2023 14:39:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 404D4F8057C;
	Mon, 18 Dec 2023 14:39:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FDF2F80431; Mon, 18 Dec 2023 14:39:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D714F800BD
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 14:39:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D714F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=giG10Q/w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702906748; x=1734442748;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=J3ELLp5LAeAwAWR1C/4qxH4K8OaxLDU00Y9CzVO+Azo=;
  b=giG10Q/w0D7VORThb765ez1Qs5vd16QM3qaEPrqljJox+zuT+u74XEGF
   lPO//DUg4xv98XN5l/jam6Sy1mNDQRJlBlUPGnPL6rx82lZnRS+ZHeOi6
   IHXnmCz2qaZJF/Y3kzm8XbPCH6AqnGh8cKFK37FWYzytIqjNcAUtQSfhm
   6F2pemnHFYRhk56RM3xbOuHCO224SQwm5tqLlpKGRtA4P0SpiLSKf7yLE
   WA77KXk1luhckgSjR7w918d8kHgRCRL3CYWb+dnIxkvdsx3nGya2CJgQU
   1z2jUnyWQ12n88tG+NZMF5x4BxUgAqY55XJVvmpmQn35u3ICouG4SvJn4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="8868634"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600";
   d="scan'208";a="8868634"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 05:39:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="1022753474"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600";
   d="scan'208";a="1022753474"
Received: from mmaiores-mobl1.ger.corp.intel.com (HELO [10.249.34.197])
 ([10.249.34.197])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 05:38:58 -0800
Message-ID: <a5d0e3a7-e45c-4971-8ad7-7ba19702acf1@linux.intel.com>
Date: Mon, 18 Dec 2023 13:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 broonie@kernel.org, vinod.koul@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
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
 <ZYAvoFbEP8RH_x0Y@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZYAvoFbEP8RH_x0Y@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MIHFQWWIY5XZKH2BM6WLGTGB5XFA3KZV
X-Message-ID-Hash: MIHFQWWIY5XZKH2BM6WLGTGB5XFA3KZV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MIHFQWWIY5XZKH2BM6WLGTGB5XFA3KZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>  Documentation/driver-api/soundwire/bra.rst    | 478 ++++++++++++++++++
> 
> Can we split the cadence parts of this to bra-cadence.rst that way this
> file documents the core parts only

Yes, we can split the Cadence parts out.


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
> Is this runtime suspend or S3/S4 case?

System suspend (which can also mean S0i1).

I don't think we can have a case where a peripheral driver waits on
something without having done a pm_runtime_get_sync() to prevent
runtime_pm suspend.

> 
>> +BTP/BRA API available to peripheral drivers
>> +-------------------------------------------
>> +
>> +ASoC Peripheral drivers may use
>> +
>> +   - sdw_bpt_stream_open(mode)
>> +
>> +      This function verifies that the BPT protocol with the
>> +      'mode'. For now only BRA is accepted as a mode. This function
>> +      allocates a work buffer internally. This buffer is not exposed
>> +      to the caller.
>> +
>> +     errors:
>> +         -ENODEV: BPT/BRA is not supported by the Manager.
>> +
>> +         -EBUSY: another agent is already using the audio payload for
>> +          audio transfers. There is no way to predict when the audio
>> +          streams might stop, this will require the Peripheral driver
>> +          to fall back to the regular (slow) command channel.
>> +
>> +         -EAGAIN: another agent is already transferring data using the
>> +          BPT/BRA protocol. Since the transfers will typically last
>> +          10s or 100s of ms, the Peripheral driver may wait and retry
>> +          later.
>> +
>> +    - sdw_bpt_message_send_async(bpt_message)
> 
> why not have a single API that does both? First check if it is supported
> and then allocate buffers and do the transfer.. What are the advantages
> of using this two step process

Symmetry is the only thing that comes to my mind. Open - close and send
- wait are natural matches, aren't they?

We do need a wait(), so bundling open() and send() would be odd.

But you have a point that the open() is not generic in that it also
prepares the DMA buffers for transmission. Maybe it's more natural to
follow the traditional open(), hw_params(), hw_free, close() from ALSA.
