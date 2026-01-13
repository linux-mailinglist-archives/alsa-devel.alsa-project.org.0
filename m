Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06273D1803B
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jan 2026 11:28:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22145601E7;
	Tue, 13 Jan 2026 11:28:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22145601E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1768300128;
	bh=L03h2gpK9PrBWkWHVwlCcFgNsiTqhpYrjmjQsxgLzrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TPD4+hO3O4RlLRQgiAw2y4NAgNmZqFWgTABrR6/sft0BpP/s5YCtCXgwUGwPndqeo
	 OcUlMyc3mFmROaAGRaPyGQ6+JwfVMydbccKR7NfYuUoRQEiRnHuo/AxspamXXCK+oy
	 iFYf6YCL2zkeBPydmqwlFsVBO+RHv4gw3UXUR87Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C200F805E2; Tue, 13 Jan 2026 11:28:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCAFEF805E1;
	Tue, 13 Jan 2026 11:28:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C378BF805CA; Tue, 13 Jan 2026 11:26:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65F15F8016D
	for <alsa-devel@alsa-project.org>; Tue, 13 Jan 2026 11:26:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65F15F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JswYoKJ6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768300013; x=1799836013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L03h2gpK9PrBWkWHVwlCcFgNsiTqhpYrjmjQsxgLzrU=;
  b=JswYoKJ6TsTJO4ddzkbUSHNrZmmGWrRaKSoUA/B+XZ9FaXMPpOU9maBZ
   +SqDXrFphc+bTrrAZud+ryhRB+bfCbIyLe/I2pLtbYj2BQ/zKfCieMu3C
   plcSpJQzovRVLtKl39E979VQ7nXo0jxbUz2noxUv1ckT56yEOAfOFluaX
   h8OSLunkVouYRBSrdU4sCSqHnYeNF2BlicrLV5TLGibodDyPaUo2VjFcq
   iHmL9NueFNzVDmgBQB5gUvNtQL8ygci57Qr9K6lvxJTcnpl4xX8orpgTZ
   fHXwVdUVzJw4imC3HlnLFZeqc8yUc5gG8zUXdnk5HPDtDBSnowEbfzGTO
   A==;
X-CSE-ConnectionGUID: SxnRompZS7KbYhsAsiRt+g==
X-CSE-MsgGUID: 6yoF9YArRfOVCCrUAi/1TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69564570"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800";
   d="scan'208";a="69564570"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 02:26:49 -0800
X-CSE-ConnectionGUID: Ma2498XvSt2EEHpnji4w2w==
X-CSE-MsgGUID: LigmJqi8Tkifoedb7juyjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800";
   d="scan'208";a="209185836"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c)
 ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 13 Jan 2026 02:26:45 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfbbn-0000000017h-0mLj;
	Tue, 13 Jan 2026 10:26:43 +0000
Date: Tue, 13 Jan 2026 11:25:49 +0100
From: kernel test robot <lkp@intel.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	yung-chuan.liao@linux.intel.com, simont@opensource.cirrus.com,
	Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: soc-acpi: add is_device_rt712_vb() helper
Message-ID: <202601131155.RXGj4KHv-lkp@intel.com>
References: <20260110064505.1485927-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260110064505.1485927-1-Vijendar.Mukunda@amd.com>
Message-ID-Hash: DNITTLWM5UR46OUHR72OJY4W26BAXI5F
X-Message-ID-Hash: DNITTLWM5UR46OUHR72OJY4W26BAXI5F
X-MailFrom: lkp@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DNITTLWM5UR46OUHR72OJY4W26BAXI5F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Vijendar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on next-20260113]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vijendar-Mukunda/ASoC-amd-acp-soc-acpi-add-is_device_rt712_vb-helper/20260110-144723
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260110064505.1485927-1-Vijendar.Mukunda%40amd.com
patch subject: [PATCH] ASoC: amd: acp: soc-acpi: add is_device_rt712_vb() helper
config: x86_64-kismet-CONFIG_SND_SOC_ACPI_AMD_SDCA_QUIRKS-CONFIG_SND_SOC_ACPI_AMD_MATCH-0-0 (https://download.01.org/0day-ci/archive/20260113/202601131155.RXGj4KHv-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260113/202601131155.RXGj4KHv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131155.RXGj4KHv-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_ACPI_AMD_SDCA_QUIRKS when selected by SND_SOC_ACPI_AMD_MATCH
   WARNING: unmet direct dependencies detected for SND_SOC_ACPI_AMD_SDCA_QUIRKS
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && ACPI [=y] && SND_SOC_SDCA [=n]
     Selected by [y]:
     - SND_SOC_ACPI_AMD_MATCH [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
