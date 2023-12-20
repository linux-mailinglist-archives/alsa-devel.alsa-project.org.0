Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F5781A6D9
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Dec 2023 19:27:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48912AE9;
	Wed, 20 Dec 2023 19:27:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48912AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703096848;
	bh=BlE59YgYyj+Kss6Xe1C7XI51igbB0E4yxLToN2uPzH4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fz7PKYPWXSnq+mS5UKUWG3W0tTJ9/b6RjTWaFw2W46MkaEb50BpC5bxxq1u3KrG69
	 5DQBLqFukFhV7QowAeGz1R8J/tZoqzZ/z0c/6LqVnAF9NHUomE8IwL+FTYPIxFI35X
	 Nf1ochXtEGZ5AVlg+LLuXfXVHhxzYa8vI0mQLqCo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F859F8058C; Wed, 20 Dec 2023 19:26:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E870FF80570;
	Wed, 20 Dec 2023 19:26:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62E7BF8016E; Wed, 20 Dec 2023 19:26:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93FCBF800BD
	for <alsa-devel@alsa-project.org>; Wed, 20 Dec 2023 19:26:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93FCBF800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=A722KC2l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703096799; x=1734632799;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BlE59YgYyj+Kss6Xe1C7XI51igbB0E4yxLToN2uPzH4=;
  b=A722KC2lFCVAkMCEjy8hrHJ/+tCmNfarRZRJDT64Yzrrl+g8SQ0o/LLl
   3pNoiCJCyD0xPz9yXmoSoB0CRcknYUuclsN6iNKOg8NY5V1Ivs4CkNoes
   7/AAe+SIoMaWGe5BlhjE2b1bC5LCQEtkFuud0oxy+s4lfFxUGFpXyKI0b
   s9bq+pjAtgMI1sIAA1TfKcS6LeTRtsOHnnA91UZIEb/yKhEvw0etZa6H3
   I08q+TtLVhD24rX23vCGpuAkVSX5LpNEDD3dlYvsXz+v3tOXwnxf2FYkT
   +h8X3/FQirq5G3kO2/d4cEC9JMunXgqVjgk6OK6oUDP+Zuc2cXK3saVFp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="375344173"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600";
   d="scan'208";a="375344173"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 10:26:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="810689336"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600";
   d="scan'208";a="810689336"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO [10.249.35.12])
 ([10.249.35.12])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 10:26:27 -0800
Message-ID: <546d698c-3e23-4a92-9081-f1bebd6b33ae@linux.intel.com>
Date: Wed, 20 Dec 2023 19:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, tiwai@suse.de, vinod.koul@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
 <5b8e74ad-460f-4e68-a17b-3131d810f29b@linux.intel.com>
 <ZXOPWRWvrRddOWpT@finisterre.sirena.org.uk>
 <700e564d-7e87-463a-a764-c4713ddf11cd@linux.intel.com>
 <bec481f0-5361-4090-b69c-1123f83ac8ac@sirena.org.uk>
 <f24a2a89-3d8a-4a6d-849a-cddbae4c1e03@linux.intel.com>
 <20231220151631.GD14858@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231220151631.GD14858@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BNLBWBF4ZBMGXDHX34SJS5KQIXEQ3LJ4
X-Message-ID-Hash: BNLBWBF4ZBMGXDHX34SJS5KQIXEQ3LJ4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BNLBWBF4ZBMGXDHX34SJS5KQIXEQ3LJ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/20/23 16:16, Charles Keepax wrote:
> On Tue, Dec 19, 2023 at 06:08:15PM +0100, Pierre-Louis Bossart wrote:
>> On 12/19/23 17:53, Mark Brown wrote:
>>> On Tue, Dec 19, 2023 at 05:50:30PM +0100, Pierre-Louis Bossart wrote:
>>>>> grep for regmap_.*async - cs_dsp.c is the upstream example in a driver,
>>>>> or there's the rbtree cache sync code which uses a back door to go into
>>>>> an async mode.  Basically just variants of all the normal regmap I/O
>>>>> calls with a _complete() call you can use to wait for everything to
>>>>> happen.  The implementation is a bit heavyweight since it was written to
>>>>> work with fairly slow buses.
>>>
>>>> I spent a fair amount of time this afternoon trying to understand the
>>>> regmap_async parts, and I am not following where in the code there is an
>>>> ordering requirement/enforcement between async and sync usages.
>>>
>>> The only actual async implementation is SPI which processes things in
>>> order of submission, the sync API wraps the async API.
>>>
>>>> Also is this just me spacing out or there is no regmap_raw_read_async()?
>>>
>>> Right, there was never any need.
>>
>> ok. I am starting to think that we could have a new type of regmap, say
>> "regmap-sdw-bra", where the use of write_raw_async() would rely on the
>> send/wait bus primitives, and write_raw() would fallback to the regular
>> read/write commands. We'd need a mutual exclusion to prevent parallel
>> async/sync access to the same regmap.
>>
>> In other words, "memory" areas that are used for firmware downloads
>> would be moved to a different regmap with async capabilities and no
>> caching support.
> 
> I would be a little inclined to say leave adding a regmap for a
> follow up series, whether we add it to the existing regmap or add
> a new one, or whatever, it should all sit happily on top of the
> API being added in this series. Makes it a little more contained
> to focus on one area at a time, and leave this series as adding
> core support for BRA. But that said, if we really want to I don't
> feel mega strongly on this one.

Right, I was probably going too far down in the details for a December
20 post.

The point I was trying to make it seems there's consensus that regmap
with the async parts would be the API used by SoundWire/ASoC codecs, and
the regmap implementation would rely on the bus/host send/wait routines.

The regmap stuff will need joint work with codec driver folks so it
should indeed be done in a second step when the SoundWire bus/host parts
are available.

Put differently: is there any sustained objection to the proposal of
extending regmap with async BRA transfers?
