Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 036B87A4B6F
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 17:13:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4A30826;
	Mon, 18 Sep 2023 17:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4A30826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695050037;
	bh=PuPVH6kC0OL/jK1UXKYb9C1jeOY57YJIinFY/4p/zkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AJNjZQPYCDjs6KRQvE2Cx5SxAiGA258JzTJc/grEvdrn13Aw30lO76IZp1yaXoIZg
	 uN8jeww0HCrXDNAd4QouydZTJlXv0WZAuP1d0vUC9byMz521PTHjqbsd+Jtnh8vZ7r
	 h1i22Chz6NrElha6mJPIT4Afvsz9UxlY2Ed/MQXE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52A35F80552; Mon, 18 Sep 2023 17:13:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B04B6F801F5;
	Mon, 18 Sep 2023 17:13:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8177F8025A; Mon, 18 Sep 2023 17:13:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7995EF800AA
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 17:12:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7995EF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lD5kTj4g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695049975; x=1726585975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PuPVH6kC0OL/jK1UXKYb9C1jeOY57YJIinFY/4p/zkY=;
  b=lD5kTj4gd3OmM6kTBqwTvI/sfF4EmXeJ603nEJG2sdc19aEKPEdIT4VD
   NAXo2eTTaG//85ftaWewzW+pnV4F8t/RCx4g7sjvknvFb746si1siBoIm
   //8YcYYa9PYcoSV1obmQu+RLW9V+QsKL8Z1XnBA0cx+M7mC4zohsasCEA
   dqApwG7L+7gxK5QY3fiudOObfv4paOPfn9qQTh7eWY2PECOvCQk3sIOJU
   IQ/AM6UeUh6aVYRwtcB7TVkcZaGaWX2irNtlWnzSLeWlgs7Ys8p1ta8of
   DzLG4FeJWHMpwk0QQteee/bEOwGPDpG6GTLsF4J/3vrHtmkaqzXUOOvZ+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="370000916"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000";
   d="scan'208";a="370000916"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 08:12:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811387869"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000";
   d="scan'208";a="811387869"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 18 Sep 2023 08:12:47 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiFvZ-0006DI-0K;
	Mon, 18 Sep 2023 15:12:45 +0000
Date: Mon, 18 Sep 2023 23:11:59 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
	tiwai@suse.com, perex@perex.cz
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 15/17] ALSA: hda: Drop snd_hdac_calc_stream_format()
Message-ID: <202309182301.K9lVpMbl-lkp@intel.com>
References: <20230918133940.3676091-16-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918133940.3676091-16-cezary.rojewski@intel.com>
Message-ID-Hash: B3MGZZKD6PAVGVV7W254IVAYVM2WOD5I
X-Message-ID-Hash: B3MGZZKD6PAVGVV7W254IVAYVM2WOD5I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B3MGZZKD6PAVGVV7W254IVAYVM2WOD5I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Cezary,

kernel test robot noticed the following build errors:

[auto build test ERROR on 564ee9ac788b680e4ec4a6cb3a4a953dc61d5da8]

url:    https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/ALSA-pcm-Introduce-MSBITS-subformat-interface/20230918-214758
base:   564ee9ac788b680e4ec4a6cb3a4a953dc61d5da8
patch link:    https://lore.kernel.org/r/20230918133940.3676091-16-cezary.rojewski%40intel.com
patch subject: [PATCH v2 15/17] ALSA: hda: Drop snd_hdac_calc_stream_format()
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20230918/202309182301.K9lVpMbl-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230918/202309182301.K9lVpMbl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309182301.K9lVpMbl-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/sof/intel/hda-dai-ops.c: In function 'generic_calc_stream_format':
>> sound/soc/sof/intel/hda-dai-ops.c:243:22: error: implicit declaration of function 'snd_hdac_calc_stream_format'; did you mean 'hda_calc_stream_format'? [-Werror=implicit-function-declaration]
     243 |         format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      hda_calc_stream_format
   cc1: some warnings being treated as errors


vim +243 sound/soc/sof/intel/hda-dai-ops.c

d1bf58474d17a7 Pierre-Louis Bossart 2023-06-02  236  
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  237  static unsigned int generic_calc_stream_format(struct snd_sof_dev *sdev,
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  238  					       struct snd_pcm_substream *substream,
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  239  					       struct snd_pcm_hw_params *params)
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  240  {
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  241  	unsigned int format_val;
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  242  
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07 @243  	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  244  						 params_format(params),
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  245  						 params_physical_width(params),
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  246  						 0);
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  247  
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  248  	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  249  		params_rate(params), params_channels(params), params_format(params));
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  250  
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  251  	return format_val;
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  252  }
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  253  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
