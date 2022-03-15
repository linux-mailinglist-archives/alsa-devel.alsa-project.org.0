Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 336FB4D9BC8
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 14:05:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A79E8173C;
	Tue, 15 Mar 2022 14:04:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A79E8173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647349514;
	bh=Og5007/yax74F7mTPuGmY7Dr9RZENppU/9CL0MTRpjM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vgA9uic9OlEaYSZ5FMPrBJGkV1/U5YtXBuY/rz2CriYwoLQEjXATuvgGI+7OHg1Hi
	 9fsLsYu0nGpHZYhwfCG/USm/r87Su+Ocrv0OjdOjTJl9XRXikgU9H24k356V2xUZFw
	 SY0mjg0gLijRc7/+N+LK1C4vPBm+QRA91/gEKGdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 069C1F801F7;
	Tue, 15 Mar 2022 14:04:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D43EF80162; Tue, 15 Mar 2022 14:04:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32F19F80128
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 14:03:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32F19F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lyVEIzey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647349440; x=1678885440;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Og5007/yax74F7mTPuGmY7Dr9RZENppU/9CL0MTRpjM=;
 b=lyVEIzeypMTNpHjOMRsJnLVZlD52ZZgoRMrYhEsau3+5ghlAAA0zU/Xd
 8GWveNb0Jxhju77OKO9lE9i+XI7BRCKNtAFiDQxWZdIAQ3LL+oV7OHjNA
 lPD10TP+zBiMd+JYO4RkYiW5XCfDQuekSvJUVOBW+rtniwqalwAdwC+Cx
 qWE6HSJqMazjlZYjwLh4NK6SuTUno9f0gc3/fNy5h7ovH1xWvHlUCcTDw
 FJrLnYVGi783ZzkiM6LDyqhu1x6uc5eqrUf8Qu5wit7SewX/GE3k5pku2
 q7+YnRE1AnzJDrZg6zzlDngOpdMzQzNZHDCf8TWrf5vJ5Wpd0YBJtWI39 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="238458769"
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="238458769"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 06:03:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="819792584"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 15 Mar 2022 06:03:52 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nU6q8-000Azi-0T; Tue, 15 Mar 2022 13:03:52 +0000
Date: Tue, 15 Mar 2022 21:03:16 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>, broonie@kernel.org, tiwai@suse.com,
 arnaud.pouliquen@st.com
Subject: Re: [PATCH] ASoC: sti: sti_uniperif: Remove driver
Message-ID: <202203152101.Ld99AKpt-lkp@intel.com>
References: <20220315091319.3351522-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220315091319.3351522-1-daniel@0x0f.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, Daniel Palmer <daniel@0x0f.com>
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

Hi Daniel,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.17-rc8 next-20220310]
[cannot apply to broonie-sound/for-next tiwai-sound/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Palmer/ASoC-sti-sti_uniperif-Remove-driver/20220315-171525
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 09688c0166e76ce2fb85e86b9d99be8b0084cdf9
config: x86_64-randconfig-a011-20220314
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6b2f50fb47da3baeee10b1906da6e30ac5d26ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/7970e4bb3de4ff810c1dafb8ac38d222d90ca071
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Palmer/ASoC-sti-sti_uniperif-Remove-driver/20220315-171525
        git checkout 7970e4bb3de4ff810c1dafb8ac38d222d90ca071
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64  randconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/soc/Kconfig:86: can't open file "sound/soc/sti/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:77: oldconfig] Error 1
   make[1]: *** [Makefile:619: oldconfig] Error 2
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> sound/soc/Kconfig:86: can't open file "sound/soc/sti/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:77: olddefconfig] Error 1
   make[1]: *** [Makefile:619: olddefconfig] Error 2
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +86 sound/soc/Kconfig

89fe5117928b2c1 Takashi Iwai                 2008-05-23  25  
89fe5117928b2c1 Takashi Iwai                 2008-05-23  26  config SND_SOC_AC97_BUS
89fe5117928b2c1 Takashi Iwai                 2008-05-23  27  	bool
89fe5117928b2c1 Takashi Iwai                 2008-05-23  28  
28c4468b00a1e55 Lars-Peter Clausen           2013-04-15  29  config SND_SOC_GENERIC_DMAENGINE_PCM
28c4468b00a1e55 Lars-Peter Clausen           2013-04-15  30  	bool
b7ae6f31d8243ec Daniel Mack                  2013-08-12  31  	select SND_DMAENGINE_PCM
28c4468b00a1e55 Lars-Peter Clausen           2013-04-15  32  
6f0c42269f000b1 Jie Yang                     2015-10-13  33  config SND_SOC_COMPRESS
6f0c42269f000b1 Jie Yang                     2015-10-13  34  	bool
6f0c42269f000b1 Jie Yang                     2015-10-13  35  	select SND_COMPRESS_OFFLOAD
6f0c42269f000b1 Jie Yang                     2015-10-13  36  
78b50f39142612d Mark Brown                   2015-08-15  37  config SND_SOC_TOPOLOGY
78b50f39142612d Mark Brown                   2015-08-15  38  	bool
2635c226036c1bf Peter Ujfalusi               2021-07-26  39  	select SND_DYNAMIC_MINORS
78b50f39142612d Mark Brown                   2015-08-15  40  
b5fb388da472a69 Nico Pache                   2021-04-14  41  config SND_SOC_TOPOLOGY_KUNIT_TEST
d52bbf747cfa8a2 Amadeusz Sławiński           2021-01-20  42  	tristate "KUnit tests for SoC topology"
d52bbf747cfa8a2 Amadeusz Sławiński           2021-01-20  43  	depends on KUNIT
d52bbf747cfa8a2 Amadeusz Sławiński           2021-01-20  44  	depends on SND_SOC_TOPOLOGY
d52bbf747cfa8a2 Amadeusz Sławiński           2021-01-20  45  	default KUNIT_ALL_TESTS
d52bbf747cfa8a2 Amadeusz Sławiński           2021-01-20  46  	help
d52bbf747cfa8a2 Amadeusz Sławiński           2021-01-20  47  	  If you want to perform tests on ALSA SoC topology support say Y here.
d52bbf747cfa8a2 Amadeusz Sławiński           2021-01-20  48  
d52bbf747cfa8a2 Amadeusz Sławiński           2021-01-20  49  	  This builds a module which can be later manually loaded to run KUNIT
d52bbf747cfa8a2 Amadeusz Sławiński           2021-01-20  50  	  test cases against soc-topology.c API. This should be primarily used
d52bbf747cfa8a2 Amadeusz Sławiński           2021-01-20  51  	  by developers to test their changes to ASoC.
d52bbf747cfa8a2 Amadeusz Sławiński           2021-01-20  52  
d52bbf747cfa8a2 Amadeusz Sławiński           2021-01-20  53  	  Do note that it creates fake playback devices which do not interact
d52bbf747cfa8a2 Amadeusz Sławiński           2021-01-20  54  	  well with userspace. When running tests one may want to disable
d52bbf747cfa8a2 Amadeusz Sławiński           2021-01-20  55  	  userspace applications such as pulseaudio, to prevent unnecessary
d52bbf747cfa8a2 Amadeusz Sławiński           2021-01-20  56  	  problems.
d52bbf747cfa8a2 Amadeusz Sławiński           2021-01-20  57  
7feb2f786a46d34 Pierre-Louis Bossart         2017-10-12  58  config SND_SOC_ACPI
7feb2f786a46d34 Pierre-Louis Bossart         2017-10-12  59  	tristate
7feb2f786a46d34 Pierre-Louis Bossart         2017-10-12  60  
0b34a3d03e2fa61 Mark Brown                   2008-12-16  61  # All the supported SoCs
8f2fe346822419e Lars-Peter Clausen           2013-12-06  62  source "sound/soc/adi/Kconfig"
7c31335a03b6aff Maruthi Srinivas Bayyavarapu 2016-01-08  63  source "sound/soc/amd/Kconfig"
6c7425095c9ee23 Sedji Gaouaou                2008-10-03  64  source "sound/soc/atmel/Kconfig"
4a161d235b68eb7 Manuel Lauss                 2008-07-09  65  source "sound/soc/au1x/Kconfig"
c6aeb7de226dd08 Florian Meier                2013-11-22  66  source "sound/soc/bcm/Kconfig"
0ed275eff31029c Alexander Shiyan             2012-08-21  67  source "sound/soc/cirrus/Kconfig"
3a9cf8efd7b64f2 Rajeev Kumar                 2012-06-21  68  source "sound/soc/dwc/Kconfig"
0b34a3d03e2fa61 Mark Brown                   2008-12-16  69  source "sound/soc/fsl/Kconfig"
0bf750f4cbe1406 Andy Green                   2017-03-31  70  source "sound/soc/hisilicon/Kconfig"
9af8381023e48bf Mark Brown                   2010-07-05  71  source "sound/soc/jz4740/Kconfig"
f9b95980f87f021 apatard@mandriva.com         2010-05-31  72  source "sound/soc/kirkwood/Kconfig"
14b947d9ced4f72 Damien.Horsley               2015-11-04  73  source "sound/soc/img/Kconfig"
784cbf8ab4641c8 Jarkko Nikula                2013-11-21  74  source "sound/soc/intel/Kconfig"
ee0bcaff109f36d Koro Chen                    2015-06-15  75  source "sound/soc/mediatek/Kconfig"
6dc4fa179fb86d2 Jerome Brunet                2018-07-17  76  source "sound/soc/meson/Kconfig"
009ad054b71b772 Dong Aisheng                 2011-07-21  77  source "sound/soc/mxs/Kconfig"
734c2d4bb7cfcca Liam Girdwood                2006-10-12  78  source "sound/soc/pxa/Kconfig"
6a328885896ef08 Kenneth Westfield            2015-03-13  79  source "sound/soc/qcom/Kconfig"
4495c89fcf2624d Jianqun Xu                   2014-07-05  80  source "sound/soc/rockchip/Kconfig"
5033f43c6675429 Jassi Brar                   2010-11-22  81  source "sound/soc/samsung/Kconfig"
aef3b06ac69783d Manuel Lauss                 2007-05-14  82  source "sound/soc/sh/Kconfig"
7e978fa37df7f77 Liam Girdwood                2019-04-12  83  source "sound/soc/sof/Kconfig"
e58070ee4fdf797 Rajeev Kumar                 2013-06-10  84  source "sound/soc/spear/Kconfig"
42fea318e1d19c0 Baolin Wang                  2019-01-29  85  source "sound/soc/sprd/Kconfig"
1e6babb417f76bd Arnaud Pouliquen             2015-07-16 @86  source "sound/soc/sti/Kconfig"
3e086edfe0c73da olivier moysan               2017-04-10  87  source "sound/soc/stm/Kconfig"
45fb6b6f2aa3f6b Emilio López                 2015-09-12  88  source "sound/soc/sunxi/Kconfig"
8b75d714a6ae644 Stephen Warren               2011-01-07  89  source "sound/soc/tegra/Kconfig"
f2055e145f2975a Peter Ujfalusi               2018-12-17  90  source "sound/soc/ti/Kconfig"
3a47b1dfa291303 Katsuhiro Suzuki             2017-11-22  91  source "sound/soc/uniphier/Kconfig"
3592b7f69a54388 Ola Lilja                    2012-05-08  92  source "sound/soc/ux500/Kconfig"
33f8db9a89200c1 Maruthi Srinivas Bayyavarapu 2018-12-08  93  source "sound/soc/xilinx/Kconfig"
57b7068de5d0cca Max Filippov                 2014-12-26  94  source "sound/soc/xtensa/Kconfig"
8dafc0fb49b903c Frank Mandarino              2006-10-06  95  

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
