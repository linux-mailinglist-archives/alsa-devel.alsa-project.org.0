Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F48808CD7
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 17:02:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AA8E85D;
	Thu,  7 Dec 2023 17:02:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AA8E85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701964959;
	bh=phWQlYp9T78VNLL1jO/M1PShHVS5tnBO9tbtLaPHCwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iRsh3Z5YgdMIlBqCQbkGUBL5mynbhmf6+KH2hJ7pArm1CgfVwPE83I+XCZyRxd/Zs
	 COdg9An/DKdFMNstx9kXf4iEM7OBf8zaXEsNZxgp5RDUz59z+wREWFxQm+A2wkxnAT
	 znRDDtDLHYdmDhT6FPeM5/5a8XEjCDobn4gi4Lcc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB5BFF80580; Thu,  7 Dec 2023 17:02:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E54DFF8056F;
	Thu,  7 Dec 2023 17:02:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63BB5F8024E; Thu,  7 Dec 2023 17:02:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29E63F800AC
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 17:01:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29E63F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TIh6MkDJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701964915; x=1733500915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=phWQlYp9T78VNLL1jO/M1PShHVS5tnBO9tbtLaPHCwo=;
  b=TIh6MkDJdcj3sKdex+atXvsGmYRKedNvW9ELEqXXd3tgagD7c2FhtL6u
   DtDOG+ukYnApud1UlSM12eApmF1UaJw/tHHbM60TDmYzee/Oydc+niZyK
   SGE7SVFWiZ5fiyVMXL9hJuHo7fvv0GBwA9msvTgYj7Z6meMhpbvSmv/Tv
   mP892TYT9PpQlhEstfgr/K62w7VJkkYcGZtQsQKnv6oBqLi5xqva7nBoR
   6xCBzfw1H8jIdI1nMKuLXYEIbxFdz8D3R3VC3jlq1w0NaC2bIX2dKtta/
   h0MPGQaW7FukEQRl6Oh3Y3w9ahqKbY/WTJUbfdcFS5GEpAH8AdSA63nqi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1358014"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600";
   d="scan'208";a="1358014"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 08:01:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="748006917"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600";
   d="scan'208";a="748006917"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 07 Dec 2023 08:01:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBGoc-000CSM-22;
	Thu, 07 Dec 2023 16:01:30 +0000
Date: Fri, 8 Dec 2023 00:00:42 +0800
From: kernel test robot <lkp@intel.com>
To: Gergo Koteles <soyer@irl.hu>, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	Gergo Koteles <soyer@irl.hu>
Subject: Re: [PATCH 13/16] ALSA: hda/tas2781: remove sound controls in unbind
Message-ID: <202312072318.9KUgvYeb-lkp@intel.com>
References: 
 <8f16576930682297fd08bba5e063a9a1f3150388.1701906455.git.soyer@irl.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <8f16576930682297fd08bba5e063a9a1f3150388.1701906455.git.soyer@irl.hu>
Message-ID-Hash: AXVLKDLCNHWDITMECCSSXL6RK755IF6B
X-Message-ID-Hash: AXVLKDLCNHWDITMECCSSXL6RK755IF6B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXVLKDLCNHWDITMECCSSXL6RK755IF6B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Gergo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus broonie-sound/for-next linus/master v6.7-rc4 next-20231207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gergo-Koteles/ALSA-hda-tas2781-leave-hda_component-in-usable-state/20231207-085947
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/8f16576930682297fd08bba5e063a9a1f3150388.1701906455.git.soyer%40irl.hu
patch subject: [PATCH 13/16] ALSA: hda/tas2781: remove sound controls in unbind
config: x86_64-randconfig-001-20231207 (https://download.01.org/0day-ci/archive/20231207/202312072318.9KUgvYeb-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312072318.9KUgvYeb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312072318.9KUgvYeb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/pci/hda/tas2781_hda_i2c.c:868:1: warning: unused label 'out' [-Wunused-label]
   out:
   ^~~~
   1 warning generated.


vim +/out +868 sound/pci/hda/tas2781_hda_i2c.c

   852	
   853	static int tas2781_runtime_resume(struct device *dev)
   854	{
   855		struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
   856	
   857		dev_dbg(tas_hda->dev, "Runtime Resume\n");
   858	
   859		mutex_lock(&tas_hda->priv->codec_lock);
   860	
   861		tasdevice_prmg_load(tas_hda->priv, tas_hda->priv->cur_prog);
   862	
   863		/* If calibrated data occurs error, dsp will still works with default
   864		 * calibrated data inside algo.
   865		 */
   866		tasdevice_apply_calibration(tas_hda->priv);
   867	
 > 868	out:
   869		mutex_unlock(&tas_hda->priv->codec_lock);
   870	
   871		return 0;
   872	}
   873	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
