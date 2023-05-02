Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 903E16F43E5
	for <lists+alsa-devel@lfdr.de>; Tue,  2 May 2023 14:29:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A0461694;
	Tue,  2 May 2023 14:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A0461694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683030580;
	bh=qdK9ZCfjM/VCR79/TkJmrZ0wJaDOUM+rryu9bdTqOrk=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a8IuILqVfwmeYGpDty9SbidbG6MxZLkv1oP5uR7+59CGCDkay92IbouveEL0mMO1A
	 kt1ghqbNNT+l9ANTSUCXn2IfoJzUIrthD1eCEv+YqUTTOn+6IKdQlRmbeGJVfA84zT
	 4tL7htfJ6N2v91FVnXjtQRLDXRl+/JvkD7NpifeE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E610F8032B;
	Tue,  2 May 2023 14:28:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EBABF8049E; Tue,  2 May 2023 14:28:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 289F7F800EC
	for <alsa-devel@alsa-project.org>; Tue,  2 May 2023 14:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 289F7F800EC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LIvbyPHM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683030514; x=1714566514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qdK9ZCfjM/VCR79/TkJmrZ0wJaDOUM+rryu9bdTqOrk=;
  b=LIvbyPHMSjnVk1Dnqbb21ekTsWx3ddGVm9Kk8pUYFNNtx0qIatPdgTTb
   hnHqPJA+R16xFlGY29T672MSpyI4ROPiMyUt4apFQDe9fXaQzM9AbcoaC
   Pc4QWCsvw3xOcL2mVc2t/kjn6qm4GgY/TyWJRIrVO5XkBjVdj57151nkK
   ZwlIj1Cl6dkrVcJllvSQH3t5Zsg2irzkUFuauPnL14uah7uZNQ78gU3fY
   iyIAW6U7DyRX4b1r391VxCznH65iGBg5jHY6/WFgqX0VxAEA+ed7CJYvY
   MiG4e4PU1bHluppKVNLG4BrEQz5IfDbQtkIDkjtGXAWtgAAz/zxhA9V5d
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="413825452"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200";
   d="scan'208";a="413825452"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 05:28:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="840277778"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200";
   d="scan'208";a="840277778"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 02 May 2023 05:28:24 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptp7H-00012e-15;
	Tue, 02 May 2023 12:28:23 +0000
Date: Tue, 2 May 2023 20:27:24 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <13916275206@139.com>, broonie@kernel.org,
	lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH v1 4/5] ASoC: tas2781: Add tas2781 driver
Message-ID: <202305022033.LiI7Ojm4-lkp@intel.com>
References: <20230502053254.27085-1-13916275206@139.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502053254.27085-1-13916275206@139.com>
Message-ID-Hash: VJAITCRDDJBU4OCOI3UGFSQ27ILLM7K6
X-Message-ID-Hash: VJAITCRDDJBU4OCOI3UGFSQ27ILLM7K6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VJAITCRDDJBU4OCOI3UGFSQ27ILLM7K6/>
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
config: hexagon-randconfig-r045-20230430 (https://download.01.org/0day-ci/archive/20230502/202305022033.LiI7Ojm4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2ce0b86d1a6546d78dc4151d98a67537b8cc8669
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shenghao-Ding/ASoC-dt-bindings-Add-tas2781-amplifier/20230502-133533
        git checkout 2ce0b86d1a6546d78dc4151d98a67537b8cc8669
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305022033.LiI7Ojm4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: dvc_tlv
   >>> defined at tas2781.h:148 (include/sound/tas2781.h:148)
   >>>            drivers/firmware/ti/tasdevice-fmw.o:(dvc_tlv) in archive vmlinux.a
   >>> defined at tas2781.h:148 (include/sound/tas2781.h:148)
   >>>            sound/soc/codecs/tas2781-lib.o:(.rodata+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: amp_vol_tlv
   >>> defined at tas2781.h:149 (include/sound/tas2781.h:149)
   >>>            drivers/firmware/ti/tasdevice-fmw.o:(amp_vol_tlv) in archive vmlinux.a
   >>> defined at tas2781.h:149 (include/sound/tas2781.h:149)
   >>>            sound/soc/codecs/tas2781-lib.o:(.rodata+0x10) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: dvc_tlv
   >>> defined at tas2781.h:148 (include/sound/tas2781.h:148)
   >>>            drivers/firmware/ti/tasdevice-fmw.o:(dvc_tlv) in archive vmlinux.a
   >>> defined at tas2781.h:148 (include/sound/tas2781.h:148)
   >>>            sound/soc/codecs/tas2781-i2c.o:(.rodata+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: amp_vol_tlv
   >>> defined at tas2781.h:149 (include/sound/tas2781.h:149)
   >>>            drivers/firmware/ti/tasdevice-fmw.o:(amp_vol_tlv) in archive vmlinux.a
   >>> defined at tas2781.h:149 (include/sound/tas2781.h:149)
   >>>            sound/soc/codecs/tas2781-i2c.o:(.rodata+0x10) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
