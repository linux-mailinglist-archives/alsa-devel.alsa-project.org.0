Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9948A06DF
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Apr 2024 05:41:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9D9D27A8;
	Thu, 11 Apr 2024 05:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9D9D27A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712806869;
	bh=2vVOJkm9dcqmIFTabw4YgBLSFIUdPWkH3GowrVie1xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=psufknlVhvxA0OdUCu72ScGCZhZ9eTvOvJRV/rtvLsIU9OP6Vz6ZHWPnNq96xkbos
	 gCJXK4UsbPcIi61jREqaoMvq667ovPJMtvZq2gnU0O7DsggYTgoN2UlL3glmGXf25v
	 hBzFnWElD9jp84ulBgYtVJ5Ekrcq8GHad4I9HAOI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB5F0F805AE; Thu, 11 Apr 2024 05:40:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29F7BF80130;
	Thu, 11 Apr 2024 05:40:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A612F80238; Thu, 11 Apr 2024 05:40:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9693F80236
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 05:40:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9693F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FcubdOcl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712806811; x=1744342811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2vVOJkm9dcqmIFTabw4YgBLSFIUdPWkH3GowrVie1xo=;
  b=FcubdOclhqAQ0B6zmetpC5TEF1OXNBQbfhIfvz7vTnGCNqlOO6wdxeTg
   s3Bf1I5SCxPAA5RQt/JYqglAfOllZ3NdokiWLUWPeN2jhoPEMREA3XXtX
   Z3lTXLQOhIi3X+DjqUvK18ayg97hmXNL5z8CrUkJd5T2GDmtvAbFxIAIX
   zpV7u/oYngSnJsfKxT6pZN3iqLutRONiLeEEjmfn+iw7hTbVgjcTGIlAX
   sClLE1GhfwVsBTtoG3t5VZvmDYPJqQopVbLUkogmSS/0u7DR7KoPuhkZx
   CTOnCvnQi7vh6iKyPI/hTdXwbig57qvciIWIRcZ0NwJISjbBO7LgTfcBB
   Q==;
X-CSE-ConnectionGUID: IKkAdkfDTS64W9ZLRTczgQ==
X-CSE-MsgGUID: ze/Qp53+TGKaYvaymS9f/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8375826"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000";
   d="scan'208";a="8375826"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 20:40:05 -0700
X-CSE-ConnectionGUID: JzFuyIHkS1mooMbLng2hCQ==
X-CSE-MsgGUID: SpoaNdRSSfCRG/krM6/zWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000";
   d="scan'208";a="20805023"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Apr 2024 20:40:03 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rulI9-0008As-01;
	Thu, 11 Apr 2024 03:40:01 +0000
Date: Thu, 11 Apr 2024 11:39:52 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	Stefan Binding <sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v1 1/7] ALSA: hda: cs35l41: Set the max PCM Gain using
 tuning setting
Message-ID: <202404111107.rM73jRGt-lkp@intel.com>
References: <20240410155223.7164-2-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410155223.7164-2-sbinding@opensource.cirrus.com>
Message-ID-Hash: GRSICLA3BPHNZZ4ECYY7TEHJ5G5WCSJV
X-Message-ID-Hash: GRSICLA3BPHNZZ4ECYY7TEHJ5G5WCSJV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GRSICLA3BPHNZZ4ECYY7TEHJ5G5WCSJV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.9-rc3 next-20240410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Binding/ALSA-hda-cs35l41-Set-the-max-PCM-Gain-using-tuning-setting/20240410-235446
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20240410155223.7164-2-sbinding%40opensource.cirrus.com
patch subject: [PATCH v1 1/7] ALSA: hda: cs35l41: Set the max PCM Gain using tuning setting
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20240411/202404111107.rM73jRGt-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111107.rM73jRGt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111107.rM73jRGt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:566,
                    from include/asm-generic/bug.h:22,
                    from arch/loongarch/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/loongarch/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from sound/pci/hda/cs35l41_hda.c:9:
   sound/pci/hda/cs35l41_hda.c: In function 'cs35l41_load_tuning_params':
>> sound/pci/hda/cs35l41_hda.c:565:39: warning: '%s' directive argument is null [-Wformat-overflow=]
     565 |                 dev_dbg(cs35l41->dev, "Missing Tuning Param File: %s: %d\n",
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   sound/pci/hda/cs35l41_hda.c:565:17: note: in expansion of macro 'dev_dbg'
     565 |                 dev_dbg(cs35l41->dev, "Missing Tuning Param File: %s: %d\n",
         |                 ^~~~~~~
   sound/pci/hda/cs35l41_hda.c:565:67: note: format string is defined here
     565 |                 dev_dbg(cs35l41->dev, "Missing Tuning Param File: %s: %d\n",
         |                                                                   ^~


vim +565 sound/pci/hda/cs35l41_hda.c

   555	
   556	static int cs35l41_load_tuning_params(struct cs35l41_hda *cs35l41, char *tuning_filename)
   557	{
   558		const struct firmware *tuning_param_file = NULL;
   559		char *tuning_param_filename = NULL;
   560		int ret;
   561	
   562		ret = cs35l41_request_tuning_param_file(cs35l41, tuning_filename, &tuning_param_file,
   563							&tuning_param_filename, cs35l41->acpi_subsystem_id);
   564		if (ret) {
 > 565			dev_dbg(cs35l41->dev, "Missing Tuning Param File: %s: %d\n",
   566				tuning_param_filename, ret);
   567			return 0;
   568		}
   569	
   570		ret = cs35l41_read_tuning_params(cs35l41, tuning_param_file);
   571		if (ret) {
   572			dev_err(cs35l41->dev, "Error reading Tuning Params from file: %s: %d\n",
   573				tuning_param_filename, ret);
   574			/* Reset to default Tuning Parameters */
   575			cs35l41_set_default_tuning_params(cs35l41);
   576		}
   577	
   578		release_firmware(tuning_param_file);
   579		kfree(tuning_param_filename);
   580	
   581		return ret;
   582	}
   583	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
