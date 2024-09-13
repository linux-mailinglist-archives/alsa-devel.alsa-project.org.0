Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4154977EF4
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:55:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60742DF9;
	Fri, 13 Sep 2024 13:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60742DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726228551;
	bh=xmNpzz3+CRNT1fZuUU5bLVTxfrWUCEeO6BuVYA1S9u8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XBzKkbMQpKWV1rcWtS+wqbSnf0W0YuNPv4XOKFpEXoudGtoO769Mv0zoQxvJFcax+
	 h/Qs3Fxvxh82vSbS3Gze9hNiMKiwH+smRFO0OBeFkgpPwvjnNDPHD6AxhquOI/kNH2
	 2yGSkBYYrD4U21sdCpOA5vUotyAn0YfIQcafBUlE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB36CF805BA; Fri, 13 Sep 2024 13:55:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D28AF805B0;
	Fri, 13 Sep 2024 13:55:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E93EF801F5; Fri, 13 Sep 2024 13:55:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6B8FF800E9
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 13:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6B8FF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AxoR9sLh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726228513; x=1757764513;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xmNpzz3+CRNT1fZuUU5bLVTxfrWUCEeO6BuVYA1S9u8=;
  b=AxoR9sLh85+CzFzJV9BpFB+L7Ulf5UyD9mIa1eJVL+ShxXnR8BC2lTL8
   yGH41PKZDTnAGka+ZVvm+Bx5aZIXH9D1FHoJmr7gsKJNTJXdgSoT+W7qJ
   YGZhE6Be/YXNhQWHoheSOmltPsNoSWxQxzP0jXB9KyTlQuEcMTIqf4yt3
   8++E97AAzXg6Vud3ynCjeL/Bzn4invivz+HeXBhEcjQv4YqPuayKqwhLE
   dTNB4TExX1ikunGCaqWEC/owTKpuL4yxT+Ux6ax5VVjnJw1kHhJg0sgaA
   f7D9W9K7HxjxMOEPafBb5wTh0SFYrAFNbtTFaJj4KvtwWy/jg09MMZcEb
   Q==;
X-CSE-ConnectionGUID: ZC+GGUe6TU+ZtKYU/YzazQ==
X-CSE-MsgGUID: fpe6Fy0MRVS+xwgQIUX3FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28871334"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600";
   d="scan'208";a="28871334"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 04:55:08 -0700
X-CSE-ConnectionGUID: CT1q92YtQoykMmigt+VuQw==
X-CSE-MsgGUID: tOSe+rmwQhaW2Sv/49p8ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600";
   d="scan'208";a="68285580"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.106])
 ([10.245.246.106])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 04:55:04 -0700
Message-ID: <67b30310-6fbc-4d1d-926b-f4cc7bf68896@linux.intel.com>
Date: Fri, 13 Sep 2024 13:53:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] ASoC: Conditional PCM support
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, tiwai@suse.com,
 perex@perex.cz, amadeuszx.slawinski@linux.intel.com, hdegoede@redhat.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20240821101816.1494541-1-cezary.rojewski@intel.com>
 <83f81553-6dfa-46a3-9ca2-d42f54295eb1@linux.intel.com>
 <d5db8a15-64c9-45be-8f8c-977fd5ed282b@intel.com>
 <2ac45376-5df6-44e9-83d6-cdea49eea916@sirena.org.uk>
 <b95e8c62-db61-4678-8c2d-2224dfb1dd60@intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <b95e8c62-db61-4678-8c2d-2224dfb1dd60@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4QBJTI2WIK7OGEMVGSOKSGOW5SMTSUAE
X-Message-ID-Hash: 4QBJTI2WIK7OGEMVGSOKSGOW5SMTSUAE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4QBJTI2WIK7OGEMVGSOKSGOW5SMTSUAE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/13/24 12:59, Cezary Rojewski wrote:
> On 2024-09-10 10:14 PM, Mark Brown wrote:
>> On Thu, Aug 22, 2024 at 03:57:22PM +0200, Cezary Rojewski wrote:
>>
>>> You've shared many scenarios, I do not think we can cover all of them
>>> here
>>> and while I could agree that current FE/BE (DPCM?) design did not age
>>> well,
>>> we're entering "rewrite how-to-pcm-in-linux" area.
>>> If general opinion is:
>>>     it's too much, we have to rewrite for the framework to scale
>>>     into the next 20 years of audio in Linux
>>
>>> then my thoughts regarding current review are:
>>>     if the avs-driver needs sideband interface, so be it, but do it
>>>     locally rather than polluting entire framework. Switch to the
>>>     framework-solution once its rewritten.
>>
>> On this bit as I mentioned in the prior reply there's been ideas for
>> redesigning how we tackle digital audio which I think there's general
>> agreement would be the best way forwards.  DPCM is very fragile and
>> creaking at the seams, it can't really represent scenarios like the
>> sideband case you've mentioned well.  OTOH a redesign is a very big lift
>> and there's never really a point where it seems constructive to actually
>> block things on it so long as everyone involved is OK with what's going
>> on.
>>
>> The upshot is that while I'd be *really* happy to see investment in the
>> framework side of things I probably wouldn't block a driver specific or
>> DPCM solution simply on the grounds that it's messy.  DPCM would need
>> buy in from other people using DPCM of course, and hopefully at some
>> point someone with one of these issues will find that the cost of
>> maintaining a bodge is going to be enough to push them to do the work
>> (or someone will have free time to just work on the issue).
> 
> From my experience when it comes to redesigning/rewriting entire
> project, the "upgrade an already running train" strategy does not work,
> so I'd not recommend that.
> 
> Instead, I'd suggest to have a second, separate DPCM implementation
> present next to the existing one and have users opt in during a so-
> called deprecation period of the existing one. Once certain amount of
> time passes, switch all of them. Clean slide also makes it easier for a
> developer to be creative.
> 
> Do you view the second option as viable?

Classic problem without a good solution. In practice new features or
corrections get added to the 'old' framework and the new one is not used
by anyone just yet so it keeps running behind in terms of
features/maturity. And due to limited validation resources or limited
access to a wide variety of hardware, no one is quite ready to enable
the new framework on 'old' platforms because that would break quite a
few devices.

The other problem is that the 'switch' would mean a compatible solution,
but the problem is to get rid of the very notion of front- and
back-ends. Existing users of DPCM have undocumented hard-coded
dependencies on the order in which callbacks are handled, it's not easy
at all to change the routing engine.


