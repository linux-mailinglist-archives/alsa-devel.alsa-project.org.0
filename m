Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 169726C22EC
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 21:37:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 110E23E8;
	Mon, 20 Mar 2023 21:36:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 110E23E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679344663;
	bh=q2WHkKbj/gorEAJvCbAOYCbTNV4/YP8lsrrEl2fs4ko=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DaphpXooN4P80CB7TXa2sni5bZyUpiqnH/SQf+8a5BYf/POv0L322jNyQSYIw1t1Y
	 7gRAKaPlNoivp83ERA5PIh3Aotb5atXExOTmwUuYLBPK/0HAviTUkpNbrXOgTrchKr
	 ADNjYl1cjtxti6WuwD7NyIkqvK9PtcDxjdKkq/hA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07CC6F8027B;
	Mon, 20 Mar 2023 21:36:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C314F80551; Mon, 20 Mar 2023 21:36:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14529F80548
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 21:36:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14529F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=K3PxAtxd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679344570; x=1710880570;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q2WHkKbj/gorEAJvCbAOYCbTNV4/YP8lsrrEl2fs4ko=;
  b=K3PxAtxdcfbYOvpziH5aW7EQLGpfplbbJ+uFc41J09xGcGZCiXH9J0kX
   Mt/1Ambj8sI8dFICgOenCjHQjpL7xjyYwyYKFLfUoiopAVIpFtQnitb+j
   ZyWSaMFsohjqNkHUKzq88e2m7A4sqqSGm3LXWVsIXGn0WbgLE9qL/l7OE
   KAQEcsDlGJqw3R9MSDcEYN6kgQg63xba2ggH2ETsm74zdtkd7fze4Yyvz
   74cFlNGDGwQOOXyiOcv7WQs0VkNpacUj0g/C0Bx3bY2GTwzYmpZLZZH5n
   Zk2QJGwo1ddrMLF3BxJ6fvUSDfcqGegpER9+QFmNzBpNzIbePDHYyWrFU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="318424171"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400";
   d="scan'208";a="318424171"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 13:36:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="681223528"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400";
   d="scan'208";a="681223528"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Mar 2023 13:36:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peMEW-000BIc-0p;
	Mon, 20 Mar 2023 20:35:56 +0000
Date: Tue, 21 Mar 2023 04:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <13916275206@139.com>, broonie@kernel.org,
	lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH v4] ASoC: tas2781: Add tas2781 driver
Message-ID: <202303210435.ij3d6YHB-lkp@intel.com>
References: <20230320150726.20573-1-13916275206@139.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320150726.20573-1-13916275206@139.com>
Message-ID-Hash: NTF6ISRR7B3SD5FD7TUNF2CBOBDFNHLK
X-Message-ID-Hash: NTF6ISRR7B3SD5FD7TUNF2CBOBDFNHLK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NTF6ISRR7B3SD5FD7TUNF2CBOBDFNHLK/>
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
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230321/202303210435.ij3d6YHB-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9620831afc4c833413c073a5b991d0f9be570754
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shenghao-Ding/ASoC-tas2781-Add-tas2781-driver/20230320-231125
        git checkout 9620831afc4c833413c073a5b991d0f9be570754
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210435.ij3d6YHB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/tas2781-i2c.c: In function 'tasdevice_tuning_switch':
>> sound/soc/codecs/tas2781-i2c.c:1007:13: warning: variable 'is_set_glb_mode' set but not used [-Wunused-but-set-variable]
    1007 |         int is_set_glb_mode = 0;
         |             ^~~~~~~~~~~~~~~
   sound/soc/codecs/tas2781-i2c.c: At top level:
   sound/soc/codecs/tas2781-i2c.c:42:27: warning: 'dts_dev_addr_tag' defined but not used [-Wunused-const-variable=]
      42 | static const char * const dts_dev_addr_tag[] = {
         |                           ^~~~~~~~~~~~~~~~


vim +/is_set_glb_mode +1007 sound/soc/codecs/tas2781-i2c.c

  1001	
  1002	static void tasdevice_tuning_switch(
  1003		struct tasdevice_priv *tas_dev, int state)
  1004	{
  1005		struct tasdevice_fw *tas_fmw = tas_dev->fmw;
  1006		int profile_cfg_id = 0;
> 1007		int is_set_glb_mode = 0;
  1008	
  1009		if (state == 0) {
  1010			if (tas_fmw) {
  1011				if (tas_dev->cur_prog >= tas_fmw->nr_programs)
  1012					/*bypass all in rca is profile id 0*/
  1013					profile_cfg_id = RCA_CONFIGID_BYPASS_ALL;
  1014				else {
  1015					/*dsp mode or tuning mode*/
  1016					profile_cfg_id =
  1017						tas_dev->rcabin.profile_cfg_id;
  1018	
  1019					is_set_glb_mode =
  1020						tasdevice_select_tuningprm_cfg(tas_dev,
  1021							tas_dev->cur_prog,
  1022							tas_dev->cur_conf,
  1023							profile_cfg_id);
  1024					if (tas_dev->set_global_mode != NULL)
  1025						tas_dev->set_global_mode(tas_dev);
  1026				}
  1027			}  else
  1028				profile_cfg_id = RCA_CONFIGID_BYPASS_ALL;
  1029	
  1030			tasdevice_select_cfg_blk(tas_dev, profile_cfg_id,
  1031				TASDEVICE_BIN_BLK_PRE_POWER_UP);
  1032		} else
  1033			tasdevice_select_cfg_blk(tas_dev,
  1034				tas_dev->rcabin.profile_cfg_id,
  1035				TASDEVICE_BIN_BLK_PRE_SHUTDOWN);
  1036	}
  1037	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
