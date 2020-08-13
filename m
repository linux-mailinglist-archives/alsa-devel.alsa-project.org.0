Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D7F2435FB
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 10:32:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76F02165E;
	Thu, 13 Aug 2020 10:31:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76F02165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597307554;
	bh=1afIKpE2Al5S3BmSHl0u3Vb4PdmWd2dSO2udwv5dLxI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dXGywJ+2nFnGbxKsy6iZSElzyEMbMDLQdgaakniju+6ahAOyyeilSSLXKkmOU8cCG
	 2Spfpdftudd6LBfXqyNyYUpUvZ1vJWGkx1NQWYNvaXM0GrQfPvmC6rrEjmVdS7blRt
	 WGHixt9g4gsZJs9KLDiCDp0OaahPf9cAHQVqc488=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5463F800D3;
	Thu, 13 Aug 2020 10:30:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69A2BF8015B; Thu, 13 Aug 2020 10:30:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B755CF8014C
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 10:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B755CF8014C
IronPort-SDR: vjFWK5qQu6kLXz7zKJ/8aCrTb/KzLy6D0/X508L4PUu4VFkPKISe7jm52yodzvWvcRZN1T69QJ
 lPctiPtK7xTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9711"; a="134236818"
X-IronPort-AV: E=Sophos;i="5.76,307,1592895600"; d="scan'208";a="134236818"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 01:30:37 -0700
IronPort-SDR: 9M5y61xDeU7ftE03ENCXLs5Z/0aZCz1A04M5XVjtmb9ZXhK0a9s+yR/w9eCtGBrpPrq/anD+LT
 Nxc9p4vx39Pg==
X-IronPort-AV: E=Sophos;i="5.76,307,1592895600"; d="scan'208";a="291314332"
Received: from aslawinx-mobl1.ger.corp.intel.com (HELO [10.249.136.248])
 ([10.249.136.248])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 01:30:33 -0700
Subject: Re: [PATCH v4 00/13] ASoC: Intel: Catpt - Lynx and Wildcat point
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <195d4e6e-248f-770a-63dd-1e4d819c4ef6@linux.intel.com>
Date: Thu, 13 Aug 2020 10:30:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200812205753.29115-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: andriy.shevchenko@intel.com, filip.kaczmarski@intel.com,
 harshapriya.n@intel.com, ppapierkowski@habana.ai, marcin.barlik@intel.com,
 zwisler@google.com, pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 filip.proborszcz@intel.com, broonie@kernel.org, michal.wasko@intel.com,
 tiwai@suse.com, krzysztof.hejmowski@intel.com, cujomalainey@chromium.org,
 vamshi.krishna.gopal@intel.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 8/12/2020 10:57 PM, Cezary Rojewski wrote:
> Implement support for Lynxpoint and Wildcat Point AudioDSP. Catpt
> solution deprecates existing sound/soc/intel/haswell which is removed in
> the following series. This cover-letter is followed by 'Developer's deep
> dive' message schedding light on catpt's key concepts and areas
> addressed.
> 
> Due to high range of errors and desynchronization from recommendations
> set by Windows solution, re-write came as a lower-cost solution compared
> to refactoring /haswell/ with several series of patches.
> 
> Special thanks go to Marcin Barlik and Piotr Papierkowski for sharing
> their LPT/WPT AudioDSP architecture expertise as well as helping
> backtrack its historical background.
> My thanks go to Amadeusz Slawinski for reviews and improvements proposed
> on and off the internal list. Most of internal diff below is his
> contribution.
> Krzysztof Hejmowski helped me setup my own Xtensa environment and
> recompile LPT/WPT FW binary sources what sped up the development greatly.
> 
> This would not have been possible without help from these champions,
> especially considering how quickly the catpt was written: 2 weeks
> features, 3 weeks optimizations. Thank you.
> 
> Userspace-exposed members are compatible with what is exposed by
> deprecated solution as well as FW binary being re-used thus no harm is
> done. The only visible differences are: the newly added 'Loopback Mute'
> kcontrol and volume support extending to quad from stereo.
> 
> On top of fixing erros and design flows, catpt also adds module reload,
> dynamic SRAM memory allocation during PCM runtime and exposes missing
> userspace API: 'Loopback Mute' kcontrol, quad volume controls and sysfs
> fw-version entries. Event tracing is provided to easy solution
> debugging.
> 
> Following are not included in this update and are scheduled as later
> addition:
> - fw logging
> - module (library) support
> 
> Note: LPT power up/down sequences might get aligned with WPT once enough
> testing is done as capabilities are shared for both DSPs.
> Note #2: Both LPT and WPT power up/down sequences may get optimized in
> future updates as thanks to help from the Windows team, most of nuances
> behind why/what/when in regard to hw registers have been backtracked and
> reviewed again.
> 
> Link to developer's deep dive message:
> https://www.spinics.net/lists/alsa-devel/msg113563.html
> 
> Changes in v4:
> - fixed compilation with i386 kconfig (conflicting names)
> - streamlined naming for SHIM and PCI registers to match SSP ones
>    (SHIM_REG -> SHIM)
> - catpt_component_probe removed and kcontrols again initializzed
>    statically via snd_kcontrol_new array: this is to remove
>    kctl->id.device shenanigans
> - renamed catpt_set_ctlvol to catpt_set_dspvol - function name wasn't
>    matching its purpose
> 

I see nothing more, so once again:

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
