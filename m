Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B423A726549
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 17:58:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3E936C0;
	Wed,  7 Jun 2023 17:57:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3E936C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686153481;
	bh=7nNTbx876l3a0dmbd1lJ09G1ovmqUK2cjUQUfZr1dsM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lhNkzKoicWbSbazZC7CdBg3rqC9imGPK7KE4I8ixxgIPDXt/Wljg2ojtupzWN0XLm
	 Xj9lKYoEjiE7a5HBMfzV9Fn+7XVoNiF00+yOgJtaPkRI955hi6L73AZ/o0rl/z7Eyo
	 64Y9Ekfdg9vrvfTsHbJJV+etkWR81CaWWLsEm2C4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23549F80520; Wed,  7 Jun 2023 17:57:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F47CF80199;
	Wed,  7 Jun 2023 17:57:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFCF2F80254; Wed,  7 Jun 2023 17:57:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EA37F80155
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 17:56:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EA37F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PywH69qV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686153418; x=1717689418;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7nNTbx876l3a0dmbd1lJ09G1ovmqUK2cjUQUfZr1dsM=;
  b=PywH69qV6fQmz41acsjnwlOB2Mi+kTwumGcL8cPnAxye04BlIE/s+9PG
   Vl9dj+8EOgiyNJRJlBUzVwvQHHzdRlh1e4BEeIEosJRLjMksxPmzw8pcr
   dZMY81Tp+iYfkP2jcvqb4sNRK4sQ0IBya4GYNcEvXHVq9b/FVZEuQFWFd
   oqmYtCACB6zg5dx11dIF9NxC9L4GDXuC5CYiatON3ElimhvIBLgpmLXTV
   /7k9bPvr2w5Vzt+pBLiA0IgKgbNl/NYwFkVJzsOLqwrHEnmSfMq+rcXnL
   i8Qn+VYOc/6oOJu20Ik5nfvbBRH5tG/Tl+66lC/RGVoL6Nk7ud1+0LfSF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="360360056"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400";
   d="scan'208";a="360360056"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 08:56:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="739335739"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400";
   d="scan'208";a="739335739"
Received: from sorrin-mobl3.amr.corp.intel.com (HELO [10.209.124.63])
 ([10.209.124.63])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 08:56:49 -0700
Message-ID: <a00d401f-961a-bd1d-b344-5c234e87135b@linux.intel.com>
Date: Wed, 7 Jun 2023 09:45:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH v2 00/26] ASoC/soundwire: add support for ACE2.x
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, tiwai@suse.de,
 linux-kernel@vger.kernel.org, bard.liao@intel.com
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
 <ZHHdSjXwyHvBezkG@matsya>
 <8f4a024d-a218-c4ed-925c-b74663b7e280@linux.intel.com>
 <ZICA/YIYQ/DGhhdk@matsya>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZICA/YIYQ/DGhhdk@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AIMKEO67XK4ILTI4VSZBKILDHIZKAN6H
X-Message-ID-Hash: AIMKEO67XK4ILTI4VSZBKILDHIZKAN6H
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AIMKEO67XK4ILTI4VSZBKILDHIZKAN6H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/7/23 08:07, Vinod Koul wrote:
> 
> Hi Pierre,
> 
> On 02-06-23, 15:46, Pierre-Louis Bossart wrote:
>> On 5/27/23 05:36, Vinod Koul wrote:
>>> On 15-05-23, 15:10, Bard Liao wrote:
>>>> This series uses the abstraction added in past kernel cycles to provide
>>>> support for the ACE2.x integration. The existing SHIM and Cadence
>>>> registers are now split in 3 (SHIM, IP, SHIM vendor-specific), with some
>>>> parts also moved to the HDaudio Extended Multi link structures. Nothing
>>>> fundamentally different except for the register map.
>>>>
>>>> This series only provides the basic mechanisms to expose SoundWire-based
>>>> DAIs. The PCI parts and DSP management will be contributed later, and the
>>>> DAI ops are now empty as well.
>>>>
>>>> The change is mainly on SoundWire. It would be better to go through
>>>> SoundWire tree.
>>>
>>> Applied, thanks
>>
>> Hi Vinod, is there a way you could provide an immutable tag for Mark
>> Brown, the patch1 in this set is required for my next set of ASoC
>> LunarLake patches?
> 
> Unfortunately, I have picked the whole series into next. If I was aware
> I would have pushed them to a topic.
> 
> Mark can pull sdw/next but that would bring other things as well which
> may not be preferred. I guess next best would be wait few weeks (rc1)

Yeah, it's a miss on my side, I forgot about this one-line enum
dependency for DMIC/SSP.

SoundWire has more dependencies so we expected to send the relevant
patches in the next cycle. DMIC/SSP is quite simple and could have been
part of 6.5.

Oh well.

>> "ASoC: SOF: Intel: shim: add enum for ACE 2.0 IP used in LunarLake" adds
>> the SOF_INTEL_ACE_2_0 definition to select different ops for LunarLake.
>>
>> Thank you
>> -Pierre
> 
