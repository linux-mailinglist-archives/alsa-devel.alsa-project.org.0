Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FB86C21D0
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 20:44:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 399521F3;
	Mon, 20 Mar 2023 20:44:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 399521F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679341498;
	bh=XDIEyv4KoHJwPvYFwsfiFgSXNWZ1EVH9C1BhcDF7Vq0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dVytc3aaUralYiOt6/LwA7aHT4ezRIshh/kNylPSxL4UUisrcIFGuVkMNHQjFLSqB
	 ErdrID/FHWbxFA05fIjy/yILTjnkbyhxNzRLUxGY7/MvKGOl0U1n9ceC3tkJ2iraz+
	 VilmBN9LDgUkZ89ZIa+JdtNzuJ9KZyOVNumw50a8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A2BEF80254;
	Mon, 20 Mar 2023 20:44:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32D69F8027B; Mon, 20 Mar 2023 20:44:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84CABF80105
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 20:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84CABF80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KwcxYB7I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679341442; x=1710877442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XDIEyv4KoHJwPvYFwsfiFgSXNWZ1EVH9C1BhcDF7Vq0=;
  b=KwcxYB7IFW49ZigC5zAvqJLGSoJnpO11O89uaCqjMB6Ki3j6hEOV0yMS
   J0wP9rvyqiUFG5Jeo9U7vpdF1M7og5v7Kb/P2VAsiioWblmocAQb1/SV8
   phVBOypXQH9yGRR5a4UUtE7a5jNZRbvNvsmfrzHJNmjxG9v4mx9cp8Ou6
   NfoYiYj3TaOiD7jsU/U+BLY0QNjB0zAd3F9ARHTCYeHW1SycOLRV/UPuQ
   NtsyR6EL+0NvzDi8hOuuiGm768degPuFZxAYn1tL6FFimyvNwRQqdjwp0
   P2S0gvBMxnVmUAOLPQInjLf+GQt+0CJuFzd7xNtV3uU9sjrgLTKBGlftg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="319161001"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400";
   d="scan'208";a="319161001"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 12:43:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="1010617554"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400";
   d="scan'208";a="1010617554"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Mar 2023 12:43:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peLQB-000BGu-0N;
	Mon, 20 Mar 2023 19:43:55 +0000
Date: Tue, 21 Mar 2023 03:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <13916275206@139.com>, broonie@kernel.org,
	lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH v4] ASoC: tas2781: Add tas2781 driver
Message-ID: <202303210304.0taquh1z-lkp@intel.com>
References: <20230320150726.20573-1-13916275206@139.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320150726.20573-1-13916275206@139.com>
Message-ID-Hash: RY7PWE2G5LJPMQUQZPFUKLCB3ZK6K3IF
X-Message-ID-Hash: RY7PWE2G5LJPMQUQZPFUKLCB3ZK6K3IF
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, kevin-lu@ti.com, shenghao-ding@ti.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, x1077012@ti.com,
 peeyush@ti.com, navada@ti.com, Shenghao Ding <13916275206@139.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RY7PWE2G5LJPMQUQZPFUKLCB3ZK6K3IF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shenghao,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.3-rc3 next-20230320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenghao-Ding/ASoC-tas2781-Add-tas2781-driver/20230320-231125
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230320150726.20573-1-13916275206%40139.com
patch subject: [PATCH v4] ASoC: tas2781: Add tas2781 driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230321/202303210304.0taquh1z-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/9620831afc4c833413c073a5b991d0f9be570754
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shenghao-Ding/ASoC-tas2781-Add-tas2781-driver/20230320-231125
        git checkout 9620831afc4c833413c073a5b991d0f9be570754
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210304.0taquh1z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/tas2781-i2c.c: In function 'tasdevice_tuning_switch':
   sound/soc/codecs/tas2781-i2c.c:1007:13: warning: variable 'is_set_glb_mode' set but not used [-Wunused-but-set-variable]
    1007 |         int is_set_glb_mode = 0;
         |             ^~~~~~~~~~~~~~~
   At top level:
>> sound/soc/codecs/tas2781-i2c.c:42:27: warning: 'dts_dev_addr_tag' defined but not used [-Wunused-const-variable=]
      42 | static const char * const dts_dev_addr_tag[] = {
         |                           ^~~~~~~~~~~~~~~~


vim +/dts_dev_addr_tag +42 sound/soc/codecs/tas2781-i2c.c

    41	
  > 42	static const char * const dts_dev_addr_tag[] = {
    43		"topleft-channel",
    44		"topright-channel",
    45		"bottomleft-channel",
    46		"bottomright-channel"
    47	};
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
