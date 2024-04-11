Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E46518A069E
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Apr 2024 05:19:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCCA821B5;
	Thu, 11 Apr 2024 05:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCCA821B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712805568;
	bh=Do3t+lDJZQ7My5Ynd97bOg7IPixQUDhEiSuYqHly810=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f2UcDeQogRSd5zposTe+ihNczqilO0QhgyFxehJlIotE25eM9scNYzy02Jl0o95Sk
	 iXKeY+jO1R4uhIRPmWytApr0q3tJPdTlOIno4fcLatATMEnslhXmoijJyNoMbkXwZf
	 X7pdZ2QnZiYhCMBfknm3EY033a8FKvujVmdvTV7M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D385F805B0; Thu, 11 Apr 2024 05:18:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B77EF8059F;
	Thu, 11 Apr 2024 05:18:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A570F8026D; Thu, 11 Apr 2024 05:18:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3ECC2F80236
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 05:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ECC2F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XU6O/UW6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712805490; x=1744341490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Do3t+lDJZQ7My5Ynd97bOg7IPixQUDhEiSuYqHly810=;
  b=XU6O/UW61+WraxiI/Y82prmXED2PCkAlNFLiqcZnB057OpVRvqcHJoji
   8wSvqzI5VDlEPYvhMrH4ekrNrFfzjfoKaHDV64OfFlfncx5dTKgrgVP0Q
   V6m0zuc0XU1T1lJaZ+cPKs3EkWePOPNmQlLx49c8hIMXKiR25Eytp6k2M
   GdXnuQJpO5tbBJ6wvXeu3kPNjaRgsZdyzoM6c5edhWepJZpN/0gNHynQL
   4dwk9ZInuby+DOCsCMPeEus1Oisyu2EcQI6q3L/AjTYYRSSuKsKgrCjQH
   aXalY2+lxhU9tJa0CHGjKcg6WPiCFAHk5q2oI/Sc8mf/aszxt/vbj+daf
   g==;
X-CSE-ConnectionGUID: WAfX42/2TiC1gEzIbeYOvA==
X-CSE-MsgGUID: pRqKv9d2QJeGy9mTGomjOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8361915"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000";
   d="scan'208";a="8361915"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 20:18:05 -0700
X-CSE-ConnectionGUID: MFJlynp3QiuTL7BegSBILg==
X-CSE-MsgGUID: E2fpeducQSmI8sUr5yWpNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000";
   d="scan'208";a="25540715"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Apr 2024 20:18:03 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rukwq-00089i-0r;
	Thu, 11 Apr 2024 03:18:00 +0000
Date: Thu, 11 Apr 2024 11:17:34 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	Stefan Binding <sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v1 1/7] ALSA: hda: cs35l41: Set the max PCM Gain using
 tuning setting
Message-ID: <202404111139.1pqQN9c6-lkp@intel.com>
References: <20240410155223.7164-2-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410155223.7164-2-sbinding@opensource.cirrus.com>
Message-ID-Hash: B4J42KLTVR3W7BJTLZVONXW65UBKR4C3
X-Message-ID-Hash: B4J42KLTVR3W7BJTLZVONXW65UBKR4C3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4J42KLTVR3W7BJTLZVONXW65UBKR4C3/>
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240411/202404111139.1pqQN9c6-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111139.1pqQN9c6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111139.1pqQN9c6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from sound/pci/hda/cs35l41_hda.c:9:
   sound/pci/hda/cs35l41_hda.c: In function 'cs35l41_read_tuning_params':
>> sound/pci/hda/cs35l41_hda.c:511:39: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     511 |                 dev_err(cs35l41->dev, "Wrong Size for Tuning Param file. Expected %d got %ld\n",
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/pci/hda/cs35l41_hda.c:511:17: note: in expansion of macro 'dev_err'
     511 |                 dev_err(cs35l41->dev, "Wrong Size for Tuning Param file. Expected %d got %ld\n",
         |                 ^~~~~~~
   sound/pci/hda/cs35l41_hda.c:511:92: note: format string is defined here
     511 |                 dev_err(cs35l41->dev, "Wrong Size for Tuning Param file. Expected %d got %ld\n",
         |                                                                                          ~~^
         |                                                                                            |
         |                                                                                            long int
         |                                                                                          %d
   In file included from include/linux/printk.h:566,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/spinlock.h:60,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13:
   sound/pci/hda/cs35l41_hda.c: In function 'cs35l41_load_tuning_params':
   sound/pci/hda/cs35l41_hda.c:565:39: warning: '%s' directive argument is null [-Wformat-overflow=]
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


vim +511 sound/pci/hda/cs35l41_hda.c

   500	
   501	static int cs35l41_read_tuning_params(struct cs35l41_hda *cs35l41, const struct firmware *firmware)
   502	{
   503		struct cs35l41_tuning_params *params;
   504		unsigned int offset = 0;
   505		unsigned int end;
   506		int i;
   507	
   508		params = (void *)&firmware->data[0];
   509	
   510		if (le32_to_cpu(params->size) != firmware->size) {
 > 511			dev_err(cs35l41->dev, "Wrong Size for Tuning Param file. Expected %d got %ld\n",
   512				le32_to_cpu(params->size), firmware->size);
   513			return -EINVAL;
   514		}
   515	
   516		if (le32_to_cpu(params->version) != 1) {
   517			dev_err(cs35l41->dev, "Unsupported Tuning Param Version: %d\n",
   518				le32_to_cpu(params->version));
   519			return -EINVAL;
   520		}
   521	
   522		if (le32_to_cpu(params->signature) != CS35L41_TUNING_SIG) {
   523			dev_err(cs35l41->dev,
   524				"Mismatched Signature for Tuning Param file. Expected %#x got %#x\n",
   525				CS35L41_TUNING_SIG, le32_to_cpu(params->signature));
   526			return -EINVAL;
   527		}
   528	
   529		end = firmware->size - sizeof(struct cs35l41_tuning_params);
   530	
   531		for (i = 0; i < le32_to_cpu(params->num_entries); i++) {
   532			struct cs35l41_tuning_param *param;
   533	
   534			if ((offset >= end) || ((offset + sizeof(struct cs35l41_tuning_param_hdr)) >= end))
   535				return -EFAULT;
   536	
   537			param = (void *)&params->data[offset];
   538			offset += le32_to_cpu(param->hdr.size);
   539	
   540			if (offset > end)
   541				return -EFAULT;
   542	
   543			switch (le32_to_cpu(param->hdr.type)) {
   544			case TUNING_PARAM_GAIN:
   545				cs35l41->tuning_gain = le32_to_cpu(param->gain);
   546				dev_dbg(cs35l41->dev, "Applying Gain: %d\n", cs35l41->tuning_gain);
   547				break;
   548			default:
   549				break;
   550			}
   551		}
   552	
   553		return 0;
   554	}
   555	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
