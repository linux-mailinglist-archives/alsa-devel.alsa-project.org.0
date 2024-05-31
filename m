Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEAA8D6A3F
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 22:00:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0933D832;
	Fri, 31 May 2024 22:00:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0933D832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717185657;
	bh=jnv5YKLbj+Z2l8vdr8swzLTMD2a39mAbcZlrOzmNvKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ovg3V/OsvppZI3FGEOhwWBiix7W29rx6Gl2O2eo6fQu/j7wbBvMel+XNcWj5YqwTn
	 ddhxBZCR5E+wPvbtIfznjssZvl5lM9FwScZstrEF0gAGMi9vULjJ14VWkaa5K0c1IB
	 kJoI15E+x76/mvzC2FaJNQuU0XYLLkSGcOfzYNSY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59F1DF8026D; Fri, 31 May 2024 22:00:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D31AAF8051F;
	Fri, 31 May 2024 22:00:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92E3FF8026D; Fri, 31 May 2024 21:59:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3527DF8003A
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 21:59:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3527DF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=B266ZgMg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717185563; x=1748721563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jnv5YKLbj+Z2l8vdr8swzLTMD2a39mAbcZlrOzmNvKc=;
  b=B266ZgMgfyMNtMGIVxc7Ppu/HSZBFv/cxSugRVe4UQslLlAsYDw9x2aF
   tvQ53I2RgrKlzgoitm4HiINEstyeUwOU+3zT6hli5tyaaNPqJH0ftwr8J
   WVuW5cy8jvU3Sb/A/fS1c87OWPlWKt2Xzg10i/FUQppbPGr+yIGtT6E2Y
   xqaPQmuT3+NtNe6QuAk4X/Ti42EEunPA2nrznLIoHqsHQB4ugkAudzx4V
   9Yt9FRdtvbok/PzSXdlGyv5F+0/UU8T1gDdLq+NK8LRXzk4t/ZottuwLA
   TfVm3dzNsb3wkKg/VyRLf3BF31l/LtjzLKLEgoEMM1/s9n8rdXMVpF6B9
   Q==;
X-CSE-ConnectionGUID: i4Zm4CcjR8282e4MvacLvw==
X-CSE-MsgGUID: yeh4/JZpSCOjq0GJ3dLJJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="24321221"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000";
   d="scan'208";a="24321221"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 12:59:18 -0700
X-CSE-ConnectionGUID: koVK9twYRRmYVQ1QSc9Rvw==
X-CSE-MsgGUID: 56AM9RKLQEWQM53t0AqYIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000";
   d="scan'208";a="36202161"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 31 May 2024 12:59:15 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD8P9-000HlJ-2z;
	Fri, 31 May 2024 19:59:11 +0000
Date: Sat, 1 Jun 2024 03:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Trimmer <simont@opensource.cirrus.com>, tiwai@suse.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	soyer@irl.hu, shenghao-ding@ti.com, kevin-lu@ti.com,
	baojun.xu@ti.com, kailang@realtek.com,
	Simon Trimmer <simont@opensource.cirrus.com>
Subject: Re: [PATCH 4/7] ALSA: hda: hda_component: Introduce component parent
 structure
Message-ID: <202406010354.ludmQT3O-lkp@intel.com>
References: <20240531151409.80284-5-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531151409.80284-5-simont@opensource.cirrus.com>
Message-ID-Hash: WRAUSPVZMDKUA7LPXZJ3DEVEQGF4DKDX
X-Message-ID-Hash: WRAUSPVZMDKUA7LPXZJ3DEVEQGF4DKDX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WRAUSPVZMDKUA7LPXZJ3DEVEQGF4DKDX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Simon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.10-rc1 next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Simon-Trimmer/ALSA-hda-cs35l56-Component-should-be-unbound-before-deconstruction/20240531-231828
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20240531151409.80284-5-simont%40opensource.cirrus.com
patch subject: [PATCH 4/7] ALSA: hda: hda_component: Introduce component parent structure
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240601/202406010354.ludmQT3O-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010354.ludmQT3O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010354.ludmQT3O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/pci/hda/hda_component.c:140:27: warning: 'memset' call operates on objects of type 'struct hda_component_parent' while the size is based on a different type 'struct hda_component_parent *' [-Wsizeof-pointer-memaccess]
           memset(parent, 0, sizeof(parent));
                  ~~~~~~            ^~~~~~
   sound/pci/hda/hda_component.c:140:27: note: did you mean to dereference the argument to 'sizeof' (and multiply it by the number of elements)?
           memset(parent, 0, sizeof(parent));
                                    ^~~~~~
   1 warning generated.


vim +140 sound/pci/hda/hda_component.c

   133	
   134	int hda_component_manager_bind(struct hda_codec *cdc,
   135				       struct hda_component_parent *parent)
   136	{
   137		int i;
   138	
   139		/* Init shared and component specific data */
 > 140		memset(parent, 0, sizeof(parent));
   141		for (i = 0; i < ARRAY_SIZE(parent->comps); i++)
   142			parent->comps[i].codec = cdc;
   143	
   144		return component_bind_all(hda_codec_dev(cdc), &parent->comps);
   145	}
   146	EXPORT_SYMBOL_NS_GPL(hda_component_manager_bind, SND_HDA_SCODEC_COMPONENT);
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
