Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7728683281
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 17:25:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C1061F6;
	Tue, 31 Jan 2023 17:24:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C1061F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675182315;
	bh=blhwIt4pXs4RZFwAJ+0oJ/pbR/6npPnMEeUr9ldlKgc=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GdGhYtBCW/ehWq8TW2W3dROVcCInshjap6vvBooF8AQ7nYccT0lqPIlaVQh5LPsJr
	 SiKK00p2DPwEUP+NgynslB737Kx7ppw+I/oIjQDgSpsCBqnkfnZdoGfxzlmoZ/qFFU
	 ZivqZ3qSvAwLS3gO5NA3hmvaUmPydw9xURcS/3EY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 972B7F800A7;
	Tue, 31 Jan 2023 17:24:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DD6CF804C2; Tue, 31 Jan 2023 17:24:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2953F800A7
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 17:24:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2953F800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZS/LVXQJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675182250; x=1706718250;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=blhwIt4pXs4RZFwAJ+0oJ/pbR/6npPnMEeUr9ldlKgc=;
 b=ZS/LVXQJGFjEZM7k2+IKEZzAg9NaKLPPEq2yjHOB3CHxs1oyIgHEWGh4
 aFg+CFo+IsrIe68k0GZVtWkK6yTHc9p9VXiKkKk91ggYLScrufjXeH0Q8
 VU3sQlfVVU9yvjT3rdhpB0VG4YAYlFfv3npAf1g9a8Gs+uX5XFyfQ1FoG
 jzhfVsoO0B4bJdUAUwSIy/Z0oHxCCkSYpiAzH6ncpl3G1QH0Drc7xBnoI
 yBNdyWYmfSEAcnk+AXXhmscbfUbrytXyiCm0ZCuhlFY4M/KloKYs6xnPP
 j2QVGltJv55KQkBiCUNxG7A8XlVfGxxgREjiDbi/lkd3liKPaCED6RhhL g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="311504551"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="311504551"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 08:24:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="909970895"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="909970895"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 31 Jan 2023 08:24:01 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pMtQO-0004YL-2f;
 Tue, 31 Jan 2023 16:24:00 +0000
Date: Wed, 1 Feb 2023 00:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <13916275206@139.com>, broonie@kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH v2] ASoC: tas2781: Add tas2781 driver.
Message-ID: <202302010039.V0TFjmXX-lkp@intel.com>
References: <20230131131701.7097-1-13916275206@139.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131131701.7097-1-13916275206@139.com>
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 shenghao-ding@ti.com, kevin-lu@ti.com, oe-kbuild-all@lists.linux.dev,
 Shenghao Ding <13916275206@139.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Shenghao,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.2-rc6 next-20230131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenghao-Ding/ASoC-tas2781-Add-tas2781-driver/20230131-212221
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230131131701.7097-1-13916275206%40139.com
patch subject: [PATCH v2] ASoC: tas2781: Add tas2781 driver.
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230201/202302010039.V0TFjmXX-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d0782b52a1274657458fa49356eacb7c56eddf6b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shenghao-Ding/ASoC-tas2781-Add-tas2781-driver/20230131-212221
        git checkout d0782b52a1274657458fa49356eacb7c56eddf6b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   sound/soc/codecs/tas2781-dsp.c:591:5: warning: no previous prototype for 'fw_parse_variable_header_git' [-Wmissing-prototypes]
     591 | int fw_parse_variable_header_git(struct tasdevice_priv *tas_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:650:5: warning: no previous prototype for 'fw_parse_variable_header_cal' [-Wmissing-prototypes]
     650 | int fw_parse_variable_header_cal(struct tasdevice_priv *tas_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from include/linux/i2c.h:13,
                    from sound/soc/codecs/tas2781-dsp.c:16:
   sound/soc/codecs/tas2781-dsp.c: In function 'fw_parse_block_data':
>> sound/soc/codecs/tas2781-dsp.c:809:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     809 |                         "%s: File Size(%lu) error offset = %d n = %d\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/codecs/tas2781-dsp.c:808:17: note: in expansion of macro 'dev_err'
     808 |                 dev_err(tas_fmw->dev,
         |                 ^~~~~~~
   sound/soc/codecs/tas2781-dsp.c:809:42: note: format string is defined here
     809 |                         "%s: File Size(%lu) error offset = %d n = %d\n",
         |                                        ~~^
         |                                          |
         |                                          long unsigned int
         |                                        %u
   sound/soc/codecs/tas2781-dsp.c: In function 'fw_parse_header':
>> sound/soc/codecs/tas2781-dsp.c:1199:39: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    1199 |                 dev_err(tas_dev->dev, "File size not match, %ld %u", fmw->size,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/codecs/tas2781-dsp.c:1199:17: note: in expansion of macro 'dev_err'
    1199 |                 dev_err(tas_dev->dev, "File size not match, %ld %u", fmw->size,
         |                 ^~~~~~~
   sound/soc/codecs/tas2781-dsp.c:1199:63: note: format string is defined here
    1199 |                 dev_err(tas_dev->dev, "File size not match, %ld %u", fmw->size,
         |                                                             ~~^
         |                                                               |
         |                                                               long int
         |                                                             %d
   sound/soc/codecs/tas2781-dsp.c: In function 'tas2781_load_calibration':
   sound/soc/codecs/tas2781-dsp.c:1819:33: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    1819 |                                 "%s: file read error: size = %ld\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/codecs/tas2781-dsp.c:1818:25: note: in expansion of macro 'dev_err'
    1818 |                         dev_err(tas_dev->dev,
         |                         ^~~~~~~
   sound/soc/codecs/tas2781-dsp.c:1819:64: note: format string is defined here
    1819 |                                 "%s: file read error: size = %ld\n",
         |                                                              ~~^
         |                                                                |
         |                                                                long int
         |                                                              %d


vim +809 sound/soc/codecs/tas2781-dsp.c

   740	
   741	static int fw_parse_block_data(struct tasdevice_fw *tas_fmw,
   742		struct tasdevice_block *block, const struct firmware *fmw, int offset)
   743	{
   744		unsigned char *data = (unsigned char *)fmw->data;
   745		int n;
   746	
   747		if (offset + 4 > fmw->size) {
   748			dev_err(tas_fmw->dev, "%s: mnType error\n", __func__);
   749			offset = -1;
   750			goto out;
   751		}
   752		block->type = SMS_HTONL(data[offset], data[offset + 1],
   753			data[offset + 2], data[offset + 3]);
   754		offset  += 4;
   755	
   756		if (tas_fmw->fw_hdr.fixed_hdr.drv_ver >=
   757			PPC_DRIVER_CRCCHK) {
   758			if (offset + 1 > fmw->size) {
   759				dev_err(tas_fmw->dev, "%s: mbPChkSumPresent error\n",
   760					__func__);
   761				offset = -1;
   762				goto out;
   763			}
   764			block->is_pchksum_present = data[offset];
   765			offset++;
   766	
   767			if (offset + 1 > fmw->size) {
   768				dev_err(tas_fmw->dev, "%s: mnPChkSum error\n",
   769					__func__);
   770				offset = -1;
   771				goto out;
   772			}
   773			block->pchksum = data[offset];
   774			offset++;
   775	
   776			if (offset + 1 > fmw->size) {
   777				dev_err(tas_fmw->dev, "%s: mbYChkSumPresent error\n",
   778					__func__);
   779				offset = -1;
   780				goto out;
   781			}
   782			block->is_ychksum_present = data[offset];
   783			offset++;
   784	
   785			if (offset + 1 > fmw->size) {
   786				dev_err(tas_fmw->dev, "%s: mnYChkSum error\n",
   787					__func__);
   788				offset = -1;
   789				goto out;
   790			}
   791			block->ychksum = data[offset];
   792			offset++;
   793		} else {
   794			block->is_pchksum_present = 0;
   795			block->is_ychksum_present = 0;
   796		}
   797		if (offset + 4 > fmw->size) {
   798			dev_err(tas_fmw->dev, "%s: mnCommands error\n", __func__);
   799			offset = -1;
   800			goto out;
   801		}
   802		block->n_cmds = SMS_HTONL(data[offset], data[offset + 1],
   803			data[offset + 2], data[offset + 3]);
   804		offset  += 4;
   805	
   806		n = block->n_cmds * 4;
   807		if (offset + n > fmw->size) {
   808			dev_err(tas_fmw->dev,
 > 809				"%s: File Size(%lu) error offset = %d n = %d\n",
   810				__func__, fmw->size, offset, n);
   811			offset = -1;
   812			goto out;
   813		}
   814		block->data = kmemdup(&data[offset], n, GFP_KERNEL);
   815		if (block->data == NULL) {
   816			offset = -1;
   817			goto out;
   818		}
   819		offset  += n;
   820	out:
   821		return offset;
   822	}
   823	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
