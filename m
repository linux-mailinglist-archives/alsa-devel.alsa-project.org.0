Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 179A58C19D0
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2024 01:11:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DA65E9D;
	Fri, 10 May 2024 01:11:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DA65E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715296290;
	bh=MGh8/Zydz2ujwedtTOqwlPTEuKsnkt8sbW0reAIUVv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G581LxPa7KO9BjrseqoegFYLAnXgfCLlL5344L1/ubdzBQszeOg1m70pzHOdq+g7I
	 Aj0t7X8X2LOQSSf/5FtpzxUiDGNOa8oSX+cZoCy8nzmoKmZfWYM0RNEnuj/ZBtgud+
	 /4ikk/6YyAa3l5jxClJHwgmRc3pUi7lBFr6beu1g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8527EF80571; Fri, 10 May 2024 01:10:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3C1CF8058C;
	Fri, 10 May 2024 01:10:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 422F4F8049C; Fri, 10 May 2024 01:10:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 788DDF800E2
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 01:10:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 788DDF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TNIZLE2/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715296239; x=1746832239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MGh8/Zydz2ujwedtTOqwlPTEuKsnkt8sbW0reAIUVv0=;
  b=TNIZLE2//QGLronjEM90wvmz42xAurWBDFTa5BnlZ1vT/c6JTY28645I
   U1wziNxFwW2/nEE1ukn/5BOZbBz389lU3jUGLgKQ4V0ofQ/5cGbitiemd
   ImlYy5vnsggIupCQYO1IXpb9iInFdRKh2vFn0TQgA5GZCG+a6ZRxYXoUG
   tBFCGm15/4eQYpJYwjLQ8PldKVy4ZHWtrnvEZNBifMA1JUafxSMXKeXVt
   QYu9RaNk/8KvdQt6OQrno4g4kqAnYXTwiyLDJjKFrFqqQO8vScSmyJBqY
   a1MAcGnozzHAFtHDXMbu5cunCD1IAo8NXhbgBzl5/UV5408O59y6pjsTm
   Q==;
X-CSE-ConnectionGUID: pMNFJ9AUSDSvwJ+mwPGjjA==
X-CSE-MsgGUID: +4v0GCzISe6CgUP5y/uViA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="28737692"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000";
   d="scan'208";a="28737692"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 16:10:33 -0700
X-CSE-ConnectionGUID: rhUqsZuZRka0osey9Emkxw==
X-CSE-MsgGUID: pnt6RfLSTl+2NA+rjLRrsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000";
   d="scan'208";a="33940273"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 May 2024 16:10:28 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5CuA-0005Tj-0H;
	Thu, 09 May 2024 23:10:26 +0000
Date: Fri, 10 May 2024 07:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
	broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shengjiu.wang@gmail.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/4] ASoC: fsl_xcvr: Support reparent pll clocks for
 phy_clk
Message-ID: <202405100658.D0KXAx8b-lkp@intel.com>
References: <1715223460-32662-4-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1715223460-32662-4-git-send-email-shengjiu.wang@nxp.com>
Message-ID-Hash: IAV76G6XC3NTYGGAYPTH7JFBKGMMSNQY
X-Message-ID-Hash: IAV76G6XC3NTYGGAYPTH7JFBKGMMSNQY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IAV76G6XC3NTYGGAYPTH7JFBKGMMSNQY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shengjiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.9-rc7 next-20240509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/ASoC-dt-bindings-fsl-xcvr-Add-compatible-string-for-i-MX95/20240509-112112
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/1715223460-32662-4-git-send-email-shengjiu.wang%40nxp.com
patch subject: [PATCH 3/4] ASoC: fsl_xcvr: Support reparent pll clocks for phy_clk
config: x86_64-randconfig-103-20240509 (https://download.01.org/0day-ci/archive/20240510/202405100658.D0KXAx8b-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405100658.D0KXAx8b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405100658.D0KXAx8b-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp437.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp855.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp860.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp865.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp866.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp950.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-7.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-r.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-u.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-ru.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-cyrillic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-greek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-roman.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/unicode/utf8-selftest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_misc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/jbd2/jbd2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/sysv/sysv.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/autofs/autofs4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/btrfs/btrfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in security/keys/trusted-keys/trusted.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/af_alg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/algif_hash.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/curve25519-generic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/math/prime_numbers.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libarc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08_i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-pcf857x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/pci-stub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/backlight/rt4831-backlight.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/matrox/matroxfb_accel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/matrox/matroxfb_DAC1064.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/matrox/matroxfb_Ti3026.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/macmodes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/via/viafb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/kyro/kyrofb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/acpi/acpi_tad.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/acpi/platform_profile.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/qcom/hdma_mgmt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/qcom/hdma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/dmatest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/max20411-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/rt4831-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/amd64-agp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/via-agp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-w1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-sccb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-spi-avmm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/arizona.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/rt4831.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cxl/cxl_pci.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spi/spi-bitbang.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_aec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/yenta_socket.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/i82092.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/matrix-keymap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-ccgx-ucsi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-ali1563.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/i2c/uda1342.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/tuners/tda9887.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/au8522_decoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/mb86a16.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-fwnode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/thermal/intel/int340x_thermal/processor_thermal_rapl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/thermal/intel/int340x_thermal/processor_thermal_rfim.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/thermal/intel/int340x_thermal/processor_thermal_mbox.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/thermal/intel/int340x_thermal/processor_thermal_wt_req.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/thermal/intel/int340x_thermal/processor_thermal_wt_hint.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/thermal/intel/int340x_thermal/processor_thermal_power_floor.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/simatic-ipc-wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/simple/simatic-ipc-leds.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/simple/simatic-ipc-leds-gpio-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/simple/simatic-ipc-leds-gpio-elkhartlake.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/intel/intel-hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/amilo-rfkill.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/ibm_rtl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/classmate-laptop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/firmware_attributes_class.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/siemens/simatic-ipc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/siemens/simatic-ipc-batt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rpmsg/rpmsg_char.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwtracing/intel_th/intel_th_msu_sink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_cmdset_0020.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/maps/map_funcs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-sigmadsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-wm-adsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/yc/snd-soc-acp6x-mach.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/ps/snd-soc-ps-mach.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/video/fbdev.o
>> ERROR: modpost: "fsl_asoc_reparent_pll_clocks" [sound/soc/fsl/snd-soc-fsl-xcvr.ko] undefined!
>> ERROR: modpost: "fsl_asoc_get_pll_clocks" [sound/soc/fsl/snd-soc-fsl-xcvr.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
