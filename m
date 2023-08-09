Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E22776954
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 21:58:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AD7A823;
	Wed,  9 Aug 2023 21:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AD7A823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691611126;
	bh=b7rRtFZvCdrSzvxKPCv1b1fyqfgdn3+o7xdr+LnZuYQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G2ScU2yA3rQb2PdMXMrQRj7GWHYkV1fSyFB8vRmBt3bB9hHzgfcD8m2k3P7dqIsge
	 8VsFd36mXBoJ/4oC/665PlUFA2hxlv/ko81D0YQArzzKtoYgHK/mlApvOnoPPp2PhC
	 NCLm9RrNE5xENJ8OPJproGNY8qhqUGUegwA+Q82k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F319F800FB; Wed,  9 Aug 2023 21:57:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C186BF80116;
	Wed,  9 Aug 2023 21:57:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A8DEF80134; Wed,  9 Aug 2023 21:57:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69EF5F800FB;
	Wed,  9 Aug 2023 21:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69EF5F800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EciZKEas
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691611041; x=1723147041;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=b7rRtFZvCdrSzvxKPCv1b1fyqfgdn3+o7xdr+LnZuYQ=;
  b=EciZKEasLuoQBBkyjws9W1XGoO5LMZgEuF4lbRr1ttGD1w4JJ4U1aTpu
   ywQHzZZ7EmtP6WIb2C2tvcgwNWaZN3YGNMLvv2jem3yCFCWcVj+TKE4+P
   hdw0eIANWsQVzYT6SN4jpR1n1ahfk4XqrVXCNf4PjHV/vEzxgoNOf0CMz
   4iF3ObZ5fZUyat+27/EqM1dnFB+aki75ih8UhQeZf1I2p0n1je78326KL
   Nxjenyw5em2K5xVRKsI+X/nH99gKs0NBiE6+E06nfC3609MrR6yqGqSAb
   OsSwNOrFkDqnf5DtNG+1jXvKBFaBcxsKvXQgAZvZWdd3216sHvtDQxA3V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="361349678"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200";
   d="scan'208";a="361349678"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 12:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="766977515"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200";
   d="scan'208";a="766977515"
Received: from jcaminer-mobl.amr.corp.intel.com (HELO [10.212.58.36])
 ([10.212.58.36])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 12:57:14 -0700
Message-ID: <2a2de1b5-4dd5-f170-bb0b-61d39230c3a7@linux.intel.com>
Date: Wed, 9 Aug 2023 14:57:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: SOF: Intel: Initialize chip in
 hda_sdw_check_wakeen_irq()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, kai.vehmanen@linux.intel.com,
 ndesaulniers@google.com, trix@redhat.com, rander.wang@intel.com,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 llvm@lists.linux.dev, patches@lists.linux.dev
References: 
 <20230809-intel-hda-missing-chip-init-v1-1-61557ca6fa8a@kernel.org>
 <8eed2099-2853-df8d-92db-921d0702f512@linux.intel.com>
 <20230809190212.GB3355565@dev-arch.thelio-3990X>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230809190212.GB3355565@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: Z5PCMOZ5XVTBKNZDOKQ7YSCHKLII25SK
X-Message-ID-Hash: Z5PCMOZ5XVTBKNZDOKQ7YSCHKLII25SK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z5PCMOZ5XVTBKNZDOKQ7YSCHKLII25SK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




>> That said, we DO compile with clang and there was no warning
>> https://github.com/thesofproject/linux/actions/runs/5542372669/job/15010818307
>>
>> Is this dependent on a specific version of clang? I'd like to make sure
>> our tools and tests are updated.
> 
> It should not be, I can reproduce it with all the versions of clang that
> the kernel supports (11.x+).
> 
> Looking at your GitHub Actions files, I am not sure exporting CC works
> correctly so I don't think you are building with clang. If I do it

D'oh. I did not see this one coming... nice.

> locally:
> 
> $ export CC=clang
> 
> $ make -j$(nproc) defconfig
> 
> $ grep -E 'CONFIG_(CC_IS|CLANG|GCC)' .config
> CONFIG_CC_IS_GCC=y
> CONFIG_GCC_VERSION=130201
> CONFIG_CLANG_VERSION=0
> CONFIG_GCC11_NO_ARRAY_BOUNDS=y
> CONFIG_GCC_PLUGINS=y
> # CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
> # CONFIG_GCC_PLUGIN_STACKLEAK is not set
> 
> $ make -j$(nproc) sound/soc/sof/intel/hda.o
> 
> $ head -1 sound/soc/sof/intel/.hda.o.cmd
> savedcmd_sound/soc/sof/intel/hda.o := gcc ...
> 
> This was brought up some time ago and Masahiro made a decent point that
> this might not be a desirable behavior change.
> 
> https://lore.kernel.org/CAK7LNAT6Yp3oemUxSst+htnmM-St8WmSv+UZ2x2XF23cw-kU-Q@mail.gmail.com/
> 
> Switching to passing CC via the actual make command should fix that.

Not quite. We generate our .config using "make defconfig" as a baseline
and then "merge_config.sh" to add a bunch of fragments we need [1]. And
of course the latter script does not understand CC=clang and switches
back to GCC.

Looks like I painted myself in a corner for the last 5 years...Any
recommendations would be welcome.

[1]
https://github.com/thesofproject/kconfig/blob/master/kconfig-sof-default.sh
