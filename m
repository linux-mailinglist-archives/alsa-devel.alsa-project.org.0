Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D883A7EDA6A
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Nov 2023 04:38:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BD9F828;
	Thu, 16 Nov 2023 04:37:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BD9F828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700105903;
	bh=7AyLsMjUoSNJQ59baXaZemUaL8riPE32/6cbF2IbqLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P/STYbJd8jcR/iA9sBx7uGu2BWeoWG7wrEwUBJGdDXHYaFddvr/fkPqx5l8bhTK5e
	 mdiXhONG6nJ3HMcISFrPDNzWkEkEOVi2HgGSf6rDZgRDIwSElTViqQetcvzk8hi07/
	 C8Xv3Y4sBvNKt3S3FrJnF6NCVWLttOOgT8JljJ9s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5320F80549; Thu, 16 Nov 2023 04:37:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 621DEF8016E;
	Thu, 16 Nov 2023 04:37:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E018F801D5; Thu, 16 Nov 2023 04:37:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2806F800ED
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 04:37:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2806F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lnB+kObM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700105839; x=1731641839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7AyLsMjUoSNJQ59baXaZemUaL8riPE32/6cbF2IbqLA=;
  b=lnB+kObMtcZd8kJa9fGx+hn/HUe3hIbIwcG7pfeZ6PhX1thO4pV8u6++
   Qts6uNn25MZJLib8/sTl+dnt70xdwqWz91WYJVcu+Mmc+afdTVYkF58Lz
   aNZev2pIbodTlBwhXFjdcL/m/vdgzDuuGAp7UkVOtG4HcfZkD5HEtfPOJ
   Y6ECjM7OUDSlyimvMdz9ZXRXvFQo33E8UGX2aDiYanfSfQXNrsOqkVqCz
   1wW58xfLPV19BxZOvwg7t+C9ASgbknLsA7G4fd10YTmtMkTYk4gN0NiMW
   IB7dKE8GoisyDmlm3F+Zsp9zx4dEWBcFgBsqqo85A8KzKsbTSeeoRMA1r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4083595"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200";
   d="scan'208";a="4083595"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 19:37:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="835609913"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200";
   d="scan'208";a="835609913"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Nov 2023 19:37:10 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3TBj-0001FP-2u;
	Thu, 16 Nov 2023 03:37:07 +0000
Date: Thu, 16 Nov 2023 11:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
	tiwai@suse.com, perex@perex.cz
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v3 14/16] ALSA: hda: Drop snd_hdac_calc_stream_format()
Message-ID: <202311161157.L2mvHx68-lkp@intel.com>
References: <20231114201317.1348066-15-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114201317.1348066-15-cezary.rojewski@intel.com>
Message-ID-Hash: YGRSTRJNG4ZOXHM6C7JPEB3ECJLNPLWF
X-Message-ID-Hash: YGRSTRJNG4ZOXHM6C7JPEB3ECJLNPLWF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGRSTRJNG4ZOXHM6C7JPEB3ECJLNPLWF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Cezary,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus broonie-sound/for-next linus/master v6.7-rc1 next-20231115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/ALSA-pcm-Introduce-MSBITS-subformat-interface/20231115-041959
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20231114201317.1348066-15-cezary.rojewski%40intel.com
patch subject: [PATCH v3 14/16] ALSA: hda: Drop snd_hdac_calc_stream_format()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231116/202311161157.L2mvHx68-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311161157.L2mvHx68-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311161157.L2mvHx68-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/sof/intel/hda-dai-ops.c: In function 'generic_calc_stream_format':
>> sound/soc/sof/intel/hda-dai-ops.c:243:22: error: implicit declaration of function 'snd_hdac_calc_stream_format'; did you mean 'hda_calc_stream_format'? [-Werror=implicit-function-declaration]
     243 |         format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      hda_calc_stream_format
   cc1: some warnings being treated as errors


vim +243 sound/soc/sof/intel/hda-dai-ops.c

d1bf58474d17a77a Pierre-Louis Bossart 2023-06-02  236  
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  237  static unsigned int generic_calc_stream_format(struct snd_sof_dev *sdev,
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  238  					       struct snd_pcm_substream *substream,
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  239  					       struct snd_pcm_hw_params *params)
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  240  {
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  241  	unsigned int format_val;
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  242  
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07 @243  	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  244  						 params_format(params),
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  245  						 params_physical_width(params),
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  246  						 0);
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  247  
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  248  	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  249  		params_rate(params), params_channels(params), params_format(params));
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  250  
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  251  	return format_val;
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  252  }
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  253  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
