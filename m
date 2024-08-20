Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4D2958041
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 09:49:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCFB0B60;
	Tue, 20 Aug 2024 09:49:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCFB0B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724140171;
	bh=OrDJAbkTDtrWTESQ58o7M5iBYBRfzxIlIs8+nm7F7Nk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ifg7Ydbbw5CCYuqpDTEO8l5nfR4q/xF8eVGqiiStohIM3btp0obeM0FGQvgR2/fKJ
	 mPr1tBFg1cLjH1fkgEn0e34Y2H39Yow/5iuSSL6NwmRP3UHew7kUOPSNZWSgITkx14
	 WZ2WXvfarVSOn9y9GB7e3QNKsIh04/dAd0JW9C5w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CDDCF80517; Tue, 20 Aug 2024 09:49:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94239F805AE;
	Tue, 20 Aug 2024 09:48:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EADB2F80494; Tue, 20 Aug 2024 09:48:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93D50F800F0
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 09:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93D50F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iYjHLi2J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724140098; x=1755676098;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OrDJAbkTDtrWTESQ58o7M5iBYBRfzxIlIs8+nm7F7Nk=;
  b=iYjHLi2Jx9CwyNFV+YKzNSoQdqRqGbBXWga91FI080PoovoQTkPlG0mp
   PzWxPujg0CJhzw9K6qt1p+whhQt4FbxHmWsigsB+OGfLFlH60OZPbyybV
   hREmto8rluNLstqRhE2h0a9d2tGQtrMn1gjZ5lxt8AkjJCAQmbJMERxua
   amMm/YwYK9I+DxrMOH4RqCZ8/EsEflnLybrJ3O9oK4UAgHnW+g1eVIXyO
   e6ZJ/RI170+6kDOiBpxHPFwtsZrmPlm6+H88q5YFhXqS2fjPOXkHsWNmq
   qbtA3R8xwEZ92bOfDrArTuPyf75JiYBAJD0dsWHpgsmssFKJqIov9QQvr
   w==;
X-CSE-ConnectionGUID: C4typnLkTYmC8Ea3qQESOA==
X-CSE-MsgGUID: 8ygcT1ElTNioRD3x1srwFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22391448"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600";
   d="scan'208";a="22391448"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 00:48:13 -0700
X-CSE-ConnectionGUID: kINnNrznQD6lCWNpUohnSQ==
X-CSE-MsgGUID: lmiC27YGQ4+EW+cNKkgN/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600";
   d="scan'208";a="65467328"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.176])
 ([10.245.246.176])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 00:48:08 -0700
Message-ID: <be277abb-af6c-470f-8237-17f45bd990b8@linux.intel.com>
Date: Tue, 20 Aug 2024 09:48:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FEEVQTYLRHHVJREGL545KYNOACTFGV7S
X-Message-ID-Hash: FEEVQTYLRHHVJREGL545KYNOACTFGV7S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FEEVQTYLRHHVJREGL545KYNOACTFGV7S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

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

I am now revisiting this entire patchset to try to enable firmware
downloads with this SoundWire BPT/BRA protocol. I re-looked at
regmap_raw_write_async()/regmap_async_complete() and they seem to map
well with my initial write/wait_async proposal.

Do I get this right that these async capabilities could be used to
enable this faster SoundWire protocol, but the regular regmap_write()
could still happen in parallel with these async transfers? This could be
useful if e.g. there's a jack detection while downloading firmware for
another function.

I don't see any locking that would prevent such a dual operation - with
the caveat that it would be up to the codec driver to make sure they
don't try to access the same register with the two modes of operation.

The only thing that would need to be extended is that we'd need
additional callbacks to check if the protocol is supported on a given
hardware/firmware platform, and if there's no audio stream. In these
cases the async writes would be demoted to regular writes. Otherwise the
bus would be locked to make sure no reconfiguration takes place while
the firmware download happens, and unlocked when the transfer ends.

Thanks for your help on all this,
-Pierre
