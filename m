Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DDD5B43BA
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 04:19:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE82F1622;
	Sat, 10 Sep 2022 04:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE82F1622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662776388;
	bh=IkAZ4T+4alxZetkjjlyVMEX4y6tUlHl03lQa9CmZle8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HRGEpAriERblgmdC3xYu7gpMgyfg8gXRRLfWSQNE5GQlC1m+tA+TZyhP6YeQalRcG
	 PXWbodkB3BbVDChJjPhkd8e7ij3g0zLcf22m4UNSiNqnmsTaqi7cFvrH2hJ++9NqrE
	 NhUS0wFQBoGVYIpZNOS0vuauD6rUpSeN41GO5upA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AB0AF8016C;
	Sat, 10 Sep 2022 04:18:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C614DF8042F; Sat, 10 Sep 2022 04:18:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 286B6F800B8
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 04:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 286B6F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="i/qinkvS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662776321; x=1694312321;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IkAZ4T+4alxZetkjjlyVMEX4y6tUlHl03lQa9CmZle8=;
 b=i/qinkvSAbVQZv6O+BVcY55YHOJhRhMIuJpxhrYp9OkRVetLJO9gxydg
 vQ6bO8XYHExROnipLAdIrNADhRvKK6jmHuSed9/gTA2pvNQFM0RARpVmo
 DBuKFbEACBj/5g3cy5O4YyOhwGDIZuRoogObF97YE0HLmHBjiEa1r8ZIz
 nMWehy0L+pFK9mOxuLIY6QIf9bkzJWIAzkPd/WWPZ5VkvusH5wut8f95h
 TZIPjjz3/7NrGSQeFmaVXGeKGPXua9VP4fJ3p8b3zHo0cbCsU4C2/ZQiu
 twwckLuGOEzILWzjX4PkQALBgA+D3QeOsOtprjCFm/lE3/eses6vqddsg A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="284623671"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="284623671"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 19:18:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="645763928"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 09 Sep 2022 19:18:23 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oWq4d-00020O-0B;
 Sat, 10 Sep 2022 02:18:23 +0000
Date: Sat, 10 Sep 2022 10:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: Astrid Rost <astrid.rost@axis.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ASoC: ts3a227e: allow enabling the jack detect in driver
Message-ID: <202209101015.ZocWeV2G-lkp@intel.com>
References: <20220909093001.13110-1-astrid.rost@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909093001.13110-1-astrid.rost@axis.com>
Cc: kernel@axis.com, alsa-devel-mejlinglistan <alsa-devel@alsa-project.org>,
 kbuild-all@lists.01.org, Astrid Rost <astrid.rost@axis.com>,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Astrid,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.0-rc4 next-20220909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Astrid-Rost/ASoC-ts3a227e-allow-enabling-the-jack-detect-in-driver/20220909-173508
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: arm64-randconfig-r035-20220909 (https://download.01.org/0day-ci/archive/20220910/202209101015.ZocWeV2G-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f147a518459c71521cfe5bc786b804ba317091a0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Astrid-Rost/ASoC-ts3a227e-allow-enabling-the-jack-detect-in-driver/20220909-173508
        git checkout f147a518459c71521cfe5bc786b804ba317091a0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "input_allocate_device" [sound/core/snd.ko] undefined!
>> ERROR: modpost: "input_unregister_device" [sound/core/snd.ko] undefined!
>> ERROR: modpost: "input_free_device" [sound/core/snd.ko] undefined!
>> ERROR: modpost: "input_register_device" [sound/core/snd.ko] undefined!
>> ERROR: modpost: "input_set_capability" [sound/core/snd.ko] undefined!
>> ERROR: modpost: "input_event" [sound/core/snd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
