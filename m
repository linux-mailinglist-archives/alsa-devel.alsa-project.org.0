Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D906F46D1
	for <lists+alsa-devel@lfdr.de>; Tue,  2 May 2023 17:14:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0D921254;
	Tue,  2 May 2023 17:13:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0D921254
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683040484;
	bh=g1JhWMaHg8dPkL+NAKckASazi0K2qxrFUTSspRCvr6g=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=svLJe6Yp2oXeRJv/+fpSSacURQXNjtIfQlOsAZW4T7DxhVMu601ESGxTih8NMcEcG
	 WpGy25MoaRZWFEn6aftqbuBX05l1KGX/jLLluzy4ZWSEnPXb+RQRO52qTtD5byURJm
	 3C6SO75MSeXSyJ3LW+SwkhR7sqAEMZPgiVaUJG+I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 523DAF8032B;
	Tue,  2 May 2023 17:13:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A85FAF8049E; Tue,  2 May 2023 17:13:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3A18F80137
	for <alsa-devel@alsa-project.org>; Tue,  2 May 2023 17:13:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3A18F80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JAkrEVEf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683040419; x=1714576419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g1JhWMaHg8dPkL+NAKckASazi0K2qxrFUTSspRCvr6g=;
  b=JAkrEVEfbkEks1NYdLp5gHGrGaFqCMxE6vuaPefOUZVGjfIWyLGfffeC
   /QfKEY4Y2fwj3RN2mZt1DLm+cY21F8v6JNbZCG/n2Z6mdj/toK8ennzsd
   bSiJfNa42g/cstr1s7t7FpnUPGJardBlDi9AJZFGxGSxA53kiwC6tMKrU
   BSU9xawObZ1+I3Jg8TtfoF4fGnhNiTdRx7FCvJtwJOpl/92rI7x6/bX1s
   BUPH5taca70tUnjHnkE3jz5x6e8PfofPH1TDruR92YRDUdSUdHDccseAu
   ftai9tG5XlmmEqypUovqQSMb+Eg+NLaGQZRTnGdV2FUFtgYt+HjftMf2L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="345902488"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200";
   d="scan'208";a="345902488"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 08:13:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="646568393"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200";
   d="scan'208";a="646568393"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 May 2023 08:13:28 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptrh1-00017U-32;
	Tue, 02 May 2023 15:13:27 +0000
Date: Tue, 2 May 2023 23:13:06 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <13916275206@139.com>, broonie@kernel.org,
	lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH v1 4/5] ASoC: tas2781: Add tas2781 driver
Message-ID: <202305022338.ZA1okoZW-lkp@intel.com>
References: <20230502053254.27085-1-13916275206@139.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502053254.27085-1-13916275206@139.com>
Message-ID-Hash: 3KZS2C46ALBOXPQBZQ4BGXRPCL2ANVFY
X-Message-ID-Hash: 3KZS2C46ALBOXPQBZQ4BGXRPCL2ANVFY
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, kevin-lu@ti.com,
 shenghao-ding@ti.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com, navada@ti.com,
 gentuser@gmail.com, Shenghao Ding <13916275206@139.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KZS2C46ALBOXPQBZQ4BGXRPCL2ANVFY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shenghao,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.3 next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenghao-Ding/ASoC-dt-bindings-Add-tas2781-amplifier/20230502-133533
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230502053254.27085-1-13916275206%40139.com
patch subject: [PATCH v1 4/5] ASoC: tas2781: Add tas2781 driver
config: s390-randconfig-r025-20230501 (https://download.01.org/0day-ci/archive/20230502/202305022338.ZA1okoZW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/2ce0b86d1a6546d78dc4151d98a67537b8cc8669
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shenghao-Ding/ASoC-dt-bindings-Add-tas2781-amplifier/20230502-133533
        git checkout 2ce0b86d1a6546d78dc4151d98a67537b8cc8669
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=s390 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305022338.ZA1okoZW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/tas2781-i2c.c:24:
   In file included from include/linux/of_gpio.h:14:
   In file included from include/linux/gpio/driver.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from sound/soc/codecs/tas2781-i2c.c:24:
   In file included from include/linux/of_gpio.h:14:
   In file included from include/linux/gpio/driver.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from sound/soc/codecs/tas2781-i2c.c:24:
   In file included from include/linux/of_gpio.h:14:
   In file included from include/linux/gpio/driver.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> sound/soc/codecs/tas2781-i2c.c:40:34: warning: unused variable 'tasdevice_of_match' [-Wunused-const-variable]
   static const struct of_device_id tasdevice_of_match[] = {
                                    ^
   13 warnings generated.
--
   s390x-linux-ld: DWARF error: could not find abbrev number 48
>> sound/soc/codecs/tas2781-lib.o:(.rodata+0x0): multiple definition of `dvc_tlv'; s390x-linux-ld: DWARF error: could not find abbrev number 9338
   drivers/firmware/ti/tasdevice-fmw.o:(.rodata+0x2a0): first defined here
>> s390x-linux-ld: sound/soc/codecs/tas2781-lib.o:(.rodata+0x20): multiple definition of `amp_vol_tlv'; drivers/firmware/ti/tasdevice-fmw.o:(.rodata+0x2c0): first defined here
   s390x-linux-ld: DWARF error: could not find abbrev number 1109429
>> sound/soc/codecs/tas2781-i2c.o:(.rodata+0x20): multiple definition of `dvc_tlv'; drivers/firmware/ti/tasdevice-fmw.o:(.rodata+0x2a0): first defined here
   s390x-linux-ld: sound/soc/codecs/tas2781-i2c.o:(.rodata+0x40): multiple definition of `amp_vol_tlv'; drivers/firmware/ti/tasdevice-fmw.o:(.rodata+0x2c0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
