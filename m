Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FE67A7999
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 12:46:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2FF6206;
	Wed, 20 Sep 2023 12:45:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2FF6206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695206800;
	bh=BQ04r3rhhEvN+xUr1SkWuerOykbF40OxGzgam9T1NW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T+ZMOjTXWC3prCf71dpGPKNkIWD9JBX61GyEb5spIR9RJS/tzylTnf5teQSnbHkuY
	 l91Aex8HJVg7iygOcf1xp3dAVdPtiZDmRE5zwPk7MNGgvWK8blHpehudiIprLvmu2y
	 hQrEM7nnpgHqWiM/Moge+OcShooOoTnShMV7MhC4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D24CCF80552; Wed, 20 Sep 2023 12:45:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86853F80125;
	Wed, 20 Sep 2023 12:45:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99F3CF801F5; Wed, 20 Sep 2023 12:45:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8F97F800AA
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 12:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8F97F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mqzkTCMa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695206740; x=1726742740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BQ04r3rhhEvN+xUr1SkWuerOykbF40OxGzgam9T1NW4=;
  b=mqzkTCMaUR9cbHqNweYS51K4RN4gcnKhMGWdTIH96hsfdB5H0CzQj3tf
   tCfd+tsnDrIlXLdPgYMEIDdW/6QtmUSzrL1fXobR8J9PZ0yWr1QBEf1lX
   Ifxy7PCSbehQqJqwuJ53GUR3WwmRQ7UWsuL/P4BnqvnEXGjfuW+o8TR91
   Se34yIjd3/GbCrgMIKrv6DPRnCaJKNMpJYLBPByrNJY2FRGFScrY9w9c+
   7uYpmS+nf0vsKdZ24MH8PsG9Yr1UN6nQqApPP4pd6YmWV/xxLFY0g1+5a
   NtMxP7J6GzRMMSz6XIkLCpFnjKE/WczSvFzciOty0OfG+W8y5LjMiDeX5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="360445468"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000";
   d="scan'208";a="360445468"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 03:45:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="723226594"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000";
   d="scan'208";a="723226594"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Sep 2023 03:45:27 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiuhx-0008ei-08;
	Wed, 20 Sep 2023 10:45:25 +0000
Date: Wed, 20 Sep 2023 18:44:40 +0800
From: kernel test robot <lkp@intel.com>
To: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>,
	lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Bragatheswaran Manickavel <bragathemanick0908@gmail.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: tfa9879: Convert to dtschema
Message-ID: <202309201811.iKOZ5prG-lkp@intel.com>
References: <20230919090739.2448-1-bragathemanick0908@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919090739.2448-1-bragathemanick0908@gmail.com>
Message-ID-Hash: TH4C56PICCXWR3AS25S2OOGHAOHLBCOL
X-Message-ID-Hash: TH4C56PICCXWR3AS25S2OOGHAOHLBCOL
X-MailFrom: lkp@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TH4C56PICCXWR3AS25S2OOGHAOHLBCOL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Bragatheswaran,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.6-rc2 next-20230920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bragatheswaran-Manickavel/ASoC-dt-bindings-tfa9879-Convert-to-dtschema/20230919-170919
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230919090739.2448-1-bragathemanick0908%40gmail.com
patch subject: [PATCH] ASoC: dt-bindings: tfa9879: Convert to dtschema
reproduce: (https://download.01.org/0day-ci/archive/20230920/202309201811.iKOZ5prG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201811.iKOZ5prG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/sound/tfa9879.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
