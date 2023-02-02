Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1136687829
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 10:03:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B7E8826;
	Thu,  2 Feb 2023 10:02:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B7E8826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675328615;
	bh=LDDs5HFwk3RKv81l2LtmKwv1GfoDxgJexqkSPa/jwW4=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ILppWl4Ja3R96vs0jeB/5P/wfKA/dKo2kOnH++XMkGndC2zIm7K6Dugl9blnlrDEf
	 kBOIOXSgOYXgVj7mF7u2AdTuGn/VJjvtkZYDoxo4W9rn0ZWPA8OguJ/i8zn6OpaRzl
	 oEugnZ7ieRG3/kqmUXBSFJcgqwVJDqCf4WE9sTSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F695F800E3;
	Thu,  2 Feb 2023 10:02:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF669F80169; Thu,  2 Feb 2023 10:02:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52789F80169
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 10:02:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52789F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Bf+E8mOY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675328546; x=1706864546;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LDDs5HFwk3RKv81l2LtmKwv1GfoDxgJexqkSPa/jwW4=;
 b=Bf+E8mOYOzr1nHFoo0ZlDoKG/6mzg/mbMU4Pbvy0Bn61s1yaFrifOBPi
 pngdTmTzTLoC2X/z+sOvyZSIYnBWGsysNUHTkbIwg1Cl4YVRwa09OLFAK
 OBNDj45NNDb6KxcY9ytmbeQu4Fi4KXdQXPXPfM9m17mqA0tBJphyyhdzr
 JzDMbkijHWw5CXTWPBlCPeQW1Nu6EhVzQm8yAmqYVq+uRrAX0e0X8sW+P
 Za77bs9tA+FxRUjhdz7uFBRF5tuxltIljbS32T5m4n4UyBa0PPxDBJikh
 K71IDhpvMBLuataVk2peTds0qgniS03LMvTS2M2FbRJn+QWrQeu2wtkmK g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="414603282"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="414603282"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:02:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="807902694"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="807902694"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2023 01:02:21 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pNVU4-0006M8-2k;
 Thu, 02 Feb 2023 09:02:20 +0000
Date: Thu, 2 Feb 2023 17:01:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] ALSA: hda: Fix the control element identification for
 multiple codecs
Message-ID: <202302021656.nqNSqtwW-lkp@intel.com>
References: <20230131094215.3545993-1-perex@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131094215.3545993-1-perex@perex.cz>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Takashi Iwai <tiwai@suse.de>, oe-kbuild-all@lists.linux.dev
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Jaroslav,

I love your patch! Yet something to improve:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v6.2-rc6 next-20230202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jaroslav-Kysela/ALSA-hda-Fix-the-control-element-identification-for-multiple-codecs/20230131-174413
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230131094215.3545993-1-perex%40perex.cz
patch subject: [PATCH] ALSA: hda: Fix the control element identification for multiple codecs
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230202/202302021656.nqNSqtwW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/8dfc91ec424bfc92232d31eadddd1901fa5c65f6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jaroslav-Kysela/ALSA-hda-Fix-the-control-element-identification-for-multiple-codecs/20230131-174413
        git checkout 8dfc91ec424bfc92232d31eadddd1901fa5c65f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/pci/hda/hda_intel.c:123:41: error: 'CONFIG_SND_HDA_CTL_DEV_ID' undeclared here (not in a function); did you mean 'CONFIG_SND_HDA_CORE'?
     123 |                                         CONFIG_SND_HDA_CTL_DEV_ID};
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         CONFIG_SND_HDA_CORE


vim +123 sound/pci/hda/hda_intel.c

   101	
   102	
   103	static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
   104	static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;
   105	static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_PNP;
   106	static char *model[SNDRV_CARDS];
   107	static int position_fix[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] = -1};
   108	static int bdl_pos_adj[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] = -1};
   109	static int probe_mask[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] = -1};
   110	static int probe_only[SNDRV_CARDS];
   111	static int jackpoll_ms[SNDRV_CARDS];
   112	static int single_cmd = -1;
   113	static int enable_msi = -1;
   114	#ifdef CONFIG_SND_HDA_PATCH_LOADER
   115	static char *patch[SNDRV_CARDS];
   116	#endif
   117	#ifdef CONFIG_SND_HDA_INPUT_BEEP
   118	static bool beep_mode[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] =
   119						CONFIG_SND_HDA_INPUT_BEEP_MODE};
   120	#endif
   121	static bool dmic_detect = 1;
   122	static bool ctl_dev_id[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] =
 > 123						CONFIG_SND_HDA_CTL_DEV_ID};
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
