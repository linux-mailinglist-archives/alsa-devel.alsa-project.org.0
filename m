Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B9F38DF48
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 04:37:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84EAB1673;
	Mon, 24 May 2021 04:36:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84EAB1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621823863;
	bh=Of8LECn/pxmPvutTd1xHtVIF0cwIgIbvC435x+RbVgY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wmtm1iYsETHuBRpRFf9jfWsR6TXX2NNOxZ03mD9t1K6bgDrV+/5khIln2zNK/VV8b
	 9eL3iOtr1FcVnOygNMizLGJwIZ1MfIDi6o/NiCgmB+/zjAiLuKd6bKyOuQmN69Xqo7
	 uEYWBYdziNLnU66mKdPps3diIiwWJxputp+HrQms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D57EBF8022D;
	Mon, 24 May 2021 04:36:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 207D8F8022B; Mon, 24 May 2021 04:36:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=PRX_BODY_14,SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED, URIBL_SBL,
 URIBL_SBL_A autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B8CEF80149
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 04:36:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B8CEF80149
IronPort-SDR: wWPDYxnqoDVwFdyNpVIBHPoP87zBcPzih2cv1P0Z3g+IlZE99ZVoIou4Y8dIgB8jnPiy2CZ1i8
 Cb4qg/DZ4drg==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="201886404"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
 d="gz'50?scan'50,208,50";a="201886404"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2021 19:35:57 -0700
IronPort-SDR: tbr3CMHnKmv00Xa/bKnCJ/drLW3ntHPbX32+lpbt2ZNKGEa5r+1IpWj3R4Nq9GOO3Ho2UPGIY3
 zpS05sEsPASg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
 d="gz'50?scan'50,208,50";a="546163711"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 23 May 2021 19:35:53 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1ll0Rc-00012Z-EL; Mon, 24 May 2021 02:35:52 +0000
Date: Mon, 24 May 2021 10:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Ion Agorria <ion@agorria.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v3 2/4] ASoC: tegra: Unify ASoC machine drivers
Message-ID: <202105241048.gypbTx2I-lkp@intel.com>
References: <20210523234437.25077-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
In-Reply-To: <20210523234437.25077-3-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-tegra@vger.kernel.org, clang-built-linux@googlegroups.com,
 alsa-devel@alsa-project.org, kbuild-all@lists.01.org
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


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dmitry,

I love your patch! Yet something to improve:

[auto build test ERROR on tegra/for-next]
[also build test ERROR on v5.13-rc3 next-20210521]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dmitry-Osipenko/Unify-NVIDIA-Tegra-ASoC-machine-drivers/20210524-074623
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
config: powerpc64-randconfig-r013-20210524 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 93d1e5822ed64abd777eb94ea9899e96c4c39fbe)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://github.com/0day-ci/linux/commit/ff26440d1eb7f190888e3a7256210fe9da2ddf47
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dmitry-Osipenko/Unify-NVIDIA-Tegra-ASoC-machine-drivers/20210524-074623
        git checkout ff26440d1eb7f190888e3a7256210fe9da2ddf47
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from sound/soc/tegra/tegra_asoc_machine.c:18:
   In file included from include/sound/soc.h:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:178:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:557:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from sound/soc/tegra/tegra_asoc_machine.c:18:
   In file included from include/sound/soc.h:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:180:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from sound/soc/tegra/tegra_asoc_machine.c:18:
   In file included from include/sound/soc.h:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:182:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from sound/soc/tegra/tegra_asoc_machine.c:18:
   In file included from include/sound/soc.h:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:184:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from sound/soc/tegra/tegra_asoc_machine.c:18:
   In file included from include/sound/soc.h:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:186:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> sound/soc/tegra/tegra_asoc_machine.c:73:21: error: no member named 'dapm_event' in 'struct tegra_asoc_data'
           if (machine->asoc->dapm_event) {
               ~~~~~~~~~~~~~  ^
   sound/soc/tegra/tegra_asoc_machine.c:74:28: error: no member named 'dapm_event' in 'struct tegra_asoc_data'
                   int ret = machine->asoc->dapm_event(w, k, event);
                             ~~~~~~~~~~~~~  ^
   12 warnings and 2 errors generated.


vim +73 sound/soc/tegra/tegra_asoc_machine.c

    66	
    67	static int tegra_machine_event(struct snd_soc_dapm_widget *w,
    68				       struct snd_kcontrol *k, int event)
    69	{
    70		struct snd_soc_dapm_context *dapm = w->dapm;
    71		struct tegra_machine *machine = snd_soc_card_get_drvdata(dapm->card);
    72	
  > 73		if (machine->asoc->dapm_event) {
    74			int ret = machine->asoc->dapm_event(w, k, event);
    75			if (ret <= 0)
    76				return ret;
    77		}
    78	
    79		if (!strcmp(w->name, "Int Spk") || !strcmp(w->name, "Speakers"))
    80			gpiod_set_value_cansleep(machine->gpiod_spkr_en,
    81						 SND_SOC_DAPM_EVENT_ON(event));
    82	
    83		if (!strcmp(w->name, "Mic Jack"))
    84			gpiod_set_value_cansleep(machine->gpiod_ext_mic_en,
    85						 SND_SOC_DAPM_EVENT_ON(event));
    86	
    87		if (!strcmp(w->name, "Int Mic"))
    88			gpiod_set_value_cansleep(machine->gpiod_int_mic_en,
    89						 SND_SOC_DAPM_EVENT_ON(event));
    90	
    91		if (!strcmp(w->name, "Headphone") || !strcmp(w->name, "Headphone Jack"))
    92			gpiod_set_value_cansleep(machine->gpiod_hp_mute,
    93						 !SND_SOC_DAPM_EVENT_ON(event));
    94	
    95		return 0;
    96	}
    97	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--ZGiS0Q5IWpPtfppv
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
qeJ1IXnHBmUUiDK1HFqmJnOH/3+qHd5NRQ8CAA==

--ZGiS0Q5IWpPtfppv--
