Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 754E66C8A8E
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Mar 2023 04:03:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30D7EE87;
	Sat, 25 Mar 2023 04:02:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30D7EE87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679713396;
	bh=iQJGa7yfXG9hUk26kSizEa/MoGGxWJ3Cee01d8SSU+8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MOrpvH/HerMBt6YpdnhR5240Yh1pxqnp1S5rGBG4qRuwAlx5Tj7Lgd0jkDsMbDmFM
	 h4p/xk4Xmr7t8bVLvex5vPdUuOHWUmJpknCTSjxUQGeicyDMf5Tb16vjHS+B3c4goF
	 eiksOz16YPCcMhU2VVGcKJr6miVJ0kzl8QV9o2t0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47748F8027B;
	Sat, 25 Mar 2023 04:02:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 905A9F802E8; Sat, 25 Mar 2023 04:02:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA27EF80093
	for <alsa-devel@alsa-project.org>; Sat, 25 Mar 2023 04:02:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA27EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TT6AmLba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679713328; x=1711249328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iQJGa7yfXG9hUk26kSizEa/MoGGxWJ3Cee01d8SSU+8=;
  b=TT6AmLbaFHc+7hwufq0a2u7OaqWNp3Bo2ms0z8reqx5sQYCPFqY9kfNn
   orCvGAKza5m91A721EBO19N4qzRIbzMReZiEJ7LbwA9wlI7MWFjHxb7mx
   ohDCarxS6gmjN59JVMPG8vbTRvptBn6LpAVLuO2E9adwM9+L5lAl4Bdkh
   Ff7LGMl9YRRx7Esp2dYPX3e50ZwMRyY3bqVcdFKGeaMyidznvLJ73uOSt
   r9iwiyt8ALFzFp80d01XVdvk8DwQSm7lrkNHsaeUoOTOtxTrKBWTdqzR+
   5QlvaZow2VRJffT2nx711FBHTz5RiW1rhyrFM7aeB7zRXoA1wrza/Ez3l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="319580305"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400";
   d="scan'208";a="319580305"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 20:01:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="826460917"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400";
   d="scan'208";a="826460917"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Mar 2023 20:01:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfuA4-000FtT-0T;
	Sat, 25 Mar 2023 03:01:44 +0000
Date: Sat, 25 Mar 2023 11:01:32 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org
Subject: Re: [PATCH] firmware: cs_dsp: Add a debugfs entry containing control
 details
Message-ID: <202303251059.g8YEWRGa-lkp@intel.com>
References: <20230324161010.938599-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324161010.938599-1-rf@opensource.cirrus.com>
Message-ID-Hash: JYO6PJG6UFR2U4YTP74I54NZJGZKPN4D
X-Message-ID-Hash: JYO6PJG6UFR2U4YTP74I54NZJGZKPN4D
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JYO6PJG6UFR2U4YTP74I54NZJGZKPN4D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Richard,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc3 next-20230324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Fitzgerald/firmware-cs_dsp-Add-a-debugfs-entry-containing-control-details/20230325-001218
patch link:    https://lore.kernel.org/r/20230324161010.938599-1-rf%40opensource.cirrus.com
patch subject: [PATCH] firmware: cs_dsp: Add a debugfs entry containing control details
config: mips-randconfig-r005-20230322 (https://download.01.org/0day-ci/archive/20230325/202303251059.g8YEWRGa-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/62afac6e0c35c0d7e44e0bd1e4b2af8380413164
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Richard-Fitzgerald/firmware-cs_dsp-Add-a-debugfs-entry-containing-control-details/20230325-001218
        git checkout 62afac6e0c35c0d7e44e0bd1e4b2af8380413164
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/firmware/cirrus/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303251059.g8YEWRGa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/cirrus/cs_dsp.c: In function 'cs_dsp_debugfs_read_controls_show':
>> drivers/firmware/cirrus/cs_dsp.c:471:44: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     471 |                 seq_printf(s, "%22.*s: %#8lx %s:%08x %#8x %s %#8x %#4x %c%c%c%c %s %s\n",
         |                                        ~~~~^
         |                                            |
         |                                            long unsigned int
         |                                        %#8x
     472 |                            ctl->subname_len, ctl->subname, ctl->len,
         |                                                            ~~~~~~~~
         |                                                               |
         |                                                               size_t {aka unsigned int}


vim +471 drivers/firmware/cirrus/cs_dsp.c

   459	
   460	static int cs_dsp_coeff_base_reg(struct cs_dsp_coeff_ctl *ctl, unsigned int *reg,
   461					 unsigned int off);
   462	
   463	static int cs_dsp_debugfs_read_controls_show(struct seq_file *s, void *ignored)
   464	{
   465		struct cs_dsp *dsp = s->private;
   466		struct cs_dsp_coeff_ctl *ctl;
   467		unsigned int reg;
   468	
   469		list_for_each_entry(ctl, &dsp->ctl_list, list) {
   470			cs_dsp_coeff_base_reg(ctl, &reg, 0);
 > 471			seq_printf(s, "%22.*s: %#8lx %s:%08x %#8x %s %#8x %#4x %c%c%c%c %s %s\n",
   472				   ctl->subname_len, ctl->subname, ctl->len,
   473				   cs_dsp_mem_region_name(ctl->alg_region.type),
   474				   ctl->offset, reg, ctl->fw_name, ctl->alg_region.alg, ctl->type,
   475				   ctl->flags & WMFW_CTL_FLAG_VOLATILE ? 'V' : '-',
   476				   ctl->flags & WMFW_CTL_FLAG_SYS ? 'S' : '-',
   477				   ctl->flags & WMFW_CTL_FLAG_READABLE ? 'R' : '-',
   478				   ctl->flags & WMFW_CTL_FLAG_WRITEABLE ? 'W' : '-',
   479				   ctl->enabled ? "enabled" : "disabled",
   480				   ctl->set ? "dirty" : "clean");
   481		}
   482	
   483		return 0;
   484	}
   485	DEFINE_SHOW_ATTRIBUTE(cs_dsp_debugfs_read_controls);
   486	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
