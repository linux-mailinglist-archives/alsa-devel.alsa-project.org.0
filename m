Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3849848A1
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 17:27:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48360AE8;
	Tue, 24 Sep 2024 17:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48360AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727191656;
	bh=crP61cv9l0YOmL/BmcGW/GhtjRfu/3XjSbTnQpUe+LI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uhO6C6Wl7od6fFjCyG5DWGNlcObStFJDG+6BxTJx6WHNubwPl/VqOYJd8XuaUXzdX
	 qztnTonEi91vU1HPoAAIerIFBZFCK3MlawDAKk0JX7MUnMk7kJzv9jAQbEFYcG2vv4
	 Dn234dNo3JRoq2WYi0cLZOTmENBLf0QfIh4Fjook=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BF91F805A0; Tue, 24 Sep 2024 17:27:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90B39F805B1;
	Tue, 24 Sep 2024 17:27:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D9A5F802DB; Tue, 24 Sep 2024 17:27:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2927F8010B
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 17:26:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2927F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=M7BgROBd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727191617; x=1758727617;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=crP61cv9l0YOmL/BmcGW/GhtjRfu/3XjSbTnQpUe+LI=;
  b=M7BgROBdIt/+bvC7iN4B87uZEflrEBaBXf5CQeNV9NUB/06iKH1+o7/x
   fY+xFXf6AE7QOiWKr/LdgBzb6blsxpWDqOfaInEE8289JRRoRMyDcENM+
   7EabyS/J04XpGPidv5ymr1WkSaTgX04b+2Hc3Hq15+6ZL93No4eZjH6dq
   j7a+8kAeEPfAtH+yIgxCjMs0BhoDRvsObKaq/cRj4cZOSElCKEo7IiIG2
   xQlb94LB8A3EfkarehIkDHxAyJpE5tCPkR5qiYy5S3URVbuh2Jlj7BCSg
   9VloukWBRumzPO11eVfZ0GO2jiDg82iRkg9/hkZs7PMdjcFbEfet1inw0
   Q==;
X-CSE-ConnectionGUID: AeQ7E2h4RtC55Wr37LLCKQ==
X-CSE-MsgGUID: PS5STQ00TVCswsXUN/fThw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26289507"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600";
   d="scan'208";a="26289507"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 08:26:49 -0700
X-CSE-ConnectionGUID: GF7nkS4ITTKxB10A8YOM3Q==
X-CSE-MsgGUID: Pv+wcsdYRHuZmw2Qc8SDLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600";
   d="scan'208";a="94781056"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.202])
 ([10.245.246.202])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 08:26:44 -0700
Message-ID: <12d2ef42-694e-47fc-af85-ab2b27dd8afa@linux.intel.com>
Date: Tue, 24 Sep 2024 17:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: rt721-sdca: Add RT721 SDCA driver
To: Mark Brown <broonie@kernel.org>, Jack Yu <jack.yu@realtek.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
 <shumingf@realtek.com>, =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?=
 <derek.fang@realtek.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <1538ca2e1df042a7b771cc387b438710@realtek.com>
 <65339ec1-ee9d-40cb-acd2-b6cfa0445c7e@linux.intel.com>
 <1297b09d51654ecfbec2d000175a2c78@realtek.com>
 <ZvKsYUXJ42UZ_bhm@finisterre.sirena.org.uk>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZvKsYUXJ42UZ_bhm@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GNX45JCHRWWWQNAOJXTAYWJVTGWP3YDJ
X-Message-ID-Hash: GNX45JCHRWWWQNAOJXTAYWJVTGWP3YDJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GNX45JCHRWWWQNAOJXTAYWJVTGWP3YDJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



>>> That tells us it has 3 functions (jack, mic, amp), so what's different to RT722?
>>> could we have a single driver for both parts? A lot of this driver seems
>>> copy-pasted-renamed.
> 
>> RT721 has 3 functions just like RT722, but it's still a different codec and from internal discussion,
>> we think it's better to separate the driver for future code management.
> 
> As I mentioned with the events it's possible there's some room for
> factoring out some of the code for the common bits that are shared
> between multiple devices.  Look at how Cirrus' Arizona drivers for
> example, each chip has specific support in a separate driver but there's
> a lot of shared code.
> 
>>>> +     /* Set RC calibration  */
>>>> +     rt721_sdca_index_write(rt721, RT721_RC_CALIB_CTRL,
>>>> +             RT721_RC_CALIB_CTRL0, 0x0b00);
>>>> +     rt721_sdca_index_write(rt721, RT721_RC_CALIB_CTRL,
>>>> +             RT721_RC_CALIB_CTRL0, 0x0b40);
>>>> +     /* Fine tune PDE2A latency */
>>>> +     regmap_write(rt721->regmap, 0x2f5c, 0x25); }
> 
>>> Humm, isn't all this supposed to be handled with blind writes? It seems odd to
>>> hard-code all this, no?
> 
>> It seems there is no api or function to support blind write from ACPI from latest upstream code,
>> and we think it's easier for us to manage the different function's blind write.

The problem is that those blind writes are supposed to be sku-specific,
so it's not great to encode a behavior in a generic codec driver.

It's my understanding that the Windows driver will rely on blind writes,
it'd seem natural to use the same initialization parameters, no?

> It's always possible for you to add shared code for things like parsing
> ACPI tables (any references to the spec for blind writes here?).

Yes, the code is already available in a prototype, see the initial code
here:
https://github.com/thesofproject/linux/pull/5010/commits/3e4ff84242dbb7774bbed785371d27c3afc10a96

The goal was to add a sound/soc/sdca library to parse ACPI function
information, extract initialization tables, deal with interrupts, create
controls, etc.

That said, it's probably best if Bard and/or Charles take over since I
won't be able to work on this short-term.

One of the big opens is how we deal with regmap. In theory each SDCA
function is independent from others, but in practice they all share a
common control channel and interrupt mechanism.

I initially thought we could have one regmap for each function, but
Charles had a different idea that we should handle regmap at the device
level. Both options have merits and issues, we didn't really reach a
conclusion on this.

One of the other opens is also related to regmap, we now have two types
of regmap for SoundWire (sdw- and sdw-mbq), but there are parts of ASoC
where components are assumed to have a single regmap.
