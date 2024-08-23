Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FDD95C8D2
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2024 11:08:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 643573E8;
	Fri, 23 Aug 2024 11:08:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 643573E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724404090;
	bh=+8Fu/rZKFtxsUw6aNrkFYOyfx45h89bkz9fVgWxBbhY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c3a9vnwH7f5Smi7XAAZpxplyckDrH8xb1Uuw7z/19ebjn4S1z9hBq7xnPQEHlqv9S
	 39GdEIJzaZxlSJ9nvUySFS7cHxS+25Tgzu0Rits/qrMkG1SnDDtyAMXQxrz95LG/LI
	 hqJ/1aEIArS1Ap44i/Uz/WLwVyZArOxB/JxDya70=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E43D7F805E1; Fri, 23 Aug 2024 11:07:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AACAF805D8;
	Fri, 23 Aug 2024 11:07:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93C34F80496; Fri, 23 Aug 2024 11:07:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9E8EF80494
	for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2024 11:07:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9E8EF80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ci0A/V59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724404032; x=1755940032;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+8Fu/rZKFtxsUw6aNrkFYOyfx45h89bkz9fVgWxBbhY=;
  b=Ci0A/V59seqrCkXnRWl21JtJe6TcYeDblRBB3ZHrgIYnneLNPaoVy9Vt
   +RufkP97i/P1pnc9tMYgPXUjF7o1HAREqpzYxcqMY6UjONxZ9uZ+Qb7G6
   xF/4rVeKu8bYLVTN7u4Tsh93phV4RHEYDhHqCAVui7PrqJTT3JNe3p71z
   CBsUMN8i6pNpWyqbWjpeFiE5OTSekWnGk2ZqTpu2bb56O0umnobZtp63M
   dLYstoiv5LDVsBXuhzEB82OjenyoZCyroO6qZlN0MbtccbAfb7MXpBQ/a
   wx57XcND+dYwLFBBG+tmpJwBXXemkn4uaUcvlZVVeGXdvOt1Jkq4+6Af2
   w==;
X-CSE-ConnectionGUID: 5tdBGDc8SA6L/4hALA00wA==
X-CSE-MsgGUID: ZXdZ3NzySj6lNPGN+miRDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40377632"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600";
   d="scan'208";a="40377632"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 02:07:07 -0700
X-CSE-ConnectionGUID: tsR3MRv+TpS1KulT6HcNyg==
X-CSE-MsgGUID: kVSL0mjlQGSKTbFkhZ2Mow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600";
   d="scan'208";a="62041956"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.219])
 ([10.245.246.219])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 02:07:04 -0700
Message-ID: <69c1f722-e864-4668-9db0-c44fac00af8e@linux.intel.com>
Date: Fri, 23 Aug 2024 09:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.11 regression fix] ASoC: Intel: Boards: Fix NULL pointer
 deref in BYT/CHT boards harder
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 stable@vger.kernel.org
References: <20240823074217.14653-1-hdegoede@redhat.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240823074217.14653-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: W4MTV5RMR2EAX2RBWVLR6OTQGGTWU6VW
X-Message-ID-Hash: W4MTV5RMR2EAX2RBWVLR6OTQGGTWU6VW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W4MTV5RMR2EAX2RBWVLR6OTQGGTWU6VW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/23/24 09:42, Hans de Goede wrote:
> Since commit 13f58267cda3 ("ASoC: soc.h: don't create dummy Component
> via COMP_DUMMY()") dummy codecs declared like this:
> 
> SND_SOC_DAILINK_DEF(dummy,
>         DAILINK_COMP_ARRAY(COMP_DUMMY()));
> 
> expand to:
> 
> static struct snd_soc_dai_link_component dummy[] = {
> };
> 
> Which means that dummy is a zero sized array and thus dais[i].codecs should
> not be dereferenced *at all* since it points to the address of the next
> variable stored in the data section as the "dummy" variable has an address
> but no size, so even dereferencing dais[0] is already an out of bounds
> array reference.
> 
> Which means that the if (dais[i].codecs->name) check added in
> commit 7d99a70b6595 ("ASoC: Intel: Boards: Fix NULL pointer deref
> in BYT/CHT boards") relies on that the part of the next variable which
> the name member maps to just happens to be NULL.
> 
> Which apparently so far it usually is, except when it isn't
> and then it results in crashes like this one:
> 
> [   28.795659] BUG: unable to handle page fault for address: 0000000000030011
> ...
> [   28.795780] Call Trace:
> [   28.795787]  <TASK>
> ...
> [   28.795862]  ? strcmp+0x18/0x40
> [   28.795872]  0xffffffffc150c605
> [   28.795887]  platform_probe+0x40/0xa0
> ...
> [   28.795979]  ? __pfx_init_module+0x10/0x10 [snd_soc_sst_bytcr_wm5102]
> 
> Really fix things this time around by checking dais.num_codecs != 0.
> 
> Fixes: 7d99a70b6595 ("ASoC: Intel: Boards: Fix NULL pointer deref in BYT/CHT boards")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
