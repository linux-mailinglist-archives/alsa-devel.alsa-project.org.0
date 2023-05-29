Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BCE7146E6
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 11:14:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A935220C;
	Mon, 29 May 2023 11:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A935220C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685351656;
	bh=CS+64cfGMkifnvf19CsNASk9Hl347b/hzZ7/jaFoKSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ma2sfayyS9QdBZjvNRw1+Ji5FX3eQED4b93XKA//AGRDGUPHvmhfF4h50T7j3s4Qq
	 NXyzaLC6Imvn+wrR0AR4tY8cPmpAdq+HtkAE4yJ9A8eC/mbpJTQGCN4h5IMNBD1J7e
	 SaizyPOT9AQTPsTpm/MQt2Ypq67pVvbFQ8PE+PSw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25E11F80542; Mon, 29 May 2023 11:12:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FDB8F8026A;
	Mon, 29 May 2023 11:12:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0842F8016B; Mon, 29 May 2023 11:06:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9CD3F8016B
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 11:04:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9CD3F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RSFmr2DG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685351089; x=1716887089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CS+64cfGMkifnvf19CsNASk9Hl347b/hzZ7/jaFoKSQ=;
  b=RSFmr2DGhoRarnz5zfwyOz2q5QiQf1DGLxqKsrme1+R1wM8W/7tPeLYs
   hkIlE3vfrwZ9/FRZoyegSewnDFoC6c6z1v4lsJtfQUYNDCZJqQo56+Zy0
   mZirbM15XEPSDfist9nhfzbDgmaLw8GbD1p5Y1I/kPFNbkvNcSth/FrJe
   1afOm4On7W+0pSDr/kYyrFt36xfL0FQLZ7XnBuQG8cMNlvVYrG6MykidD
   OS5scB2oFBBI7R3goPbzxKCTXtRFGFtL7Htefnrd9yA4eo4AOTv7hUH/J
   9E7qQrEwDi0aaXzEof43IsJZeRRKn0Hv8pQ6qfCpGXIRq4VSDr1K89MjJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="418144388"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400";
   d="scan'208";a="418144388"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 02:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="709186687"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400";
   d="scan'208";a="709186687"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 May 2023 02:04:42 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3Yny-000Kx8-16;
	Mon, 29 May 2023 09:04:42 +0000
Date: Mon, 29 May 2023 17:03:47 +0800
From: kernel test robot <lkp@intel.com>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	alsa-devel@alsa-project.org
Cc: oe-kbuild-all@lists.linux.dev, Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 3/6] ALSA: emu10k1: actually disassemble DSP instructions
 in /proc
Message-ID: <202305291658.Q6wZncPQ-lkp@intel.com>
References: <20230526101659.437969-4-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526101659.437969-4-oswald.buddenhagen@gmx.de>
Message-ID-Hash: VBDERQC43QJUKM363DHKSV4MLJAA55TH
X-Message-ID-Hash: VBDERQC43QJUKM363DHKSV4MLJAA55TH
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VBDERQC43QJUKM363DHKSV4MLJAA55TH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Oswald,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.4-rc4 next-20230525]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oswald-Buddenhagen/ALSA-emu10k1-hide-absent-2nd-pointer-offset-register-set-from-proc/20230526-182102
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230526101659.437969-4-oswald.buddenhagen%40gmx.de
patch subject: [PATCH 3/6] ALSA: emu10k1: actually disassemble DSP instructions in /proc
config: x86_64-randconfig-s021-20230528 (https://download.01.org/0day-ci/archive/20230529/202305291658.Q6wZncPQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/13e0e28f29ed98ae73420158c2a879c4e32c694a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oswald-Buddenhagen/ALSA-emu10k1-hide-absent-2nd-pointer-offset-register-set-from-proc/20230526-182102
        git checkout 13e0e28f29ed98ae73420158c2a879c4e32c694a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/pci/emu10k1/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305291658.Q6wZncPQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/pci/emu10k1/emuproc.c:294:21: sparse: sparse: Using plain integer as NULL pointer
   sound/pci/emu10k1/emuproc.c:316:21: sparse: sparse: Using plain integer as NULL pointer

vim +294 sound/pci/emu10k1/emuproc.c

   282	
   283	static const struct emu10k1_reg_entry sblive_reg_entries[] = {
   284		{    0, 0x10, "FXBUS" },
   285		{ 0x10, 0x10, "EXTIN" },
   286		{ 0x20, 0x10, "EXTOUT" },
   287		{ 0x30, 0x10, "FXBUS2" },
   288		{ 0x40, 0x20, NULL },  // Constants
   289		{ 0x100, 0x100, "GPR" },
   290		{ 0x200, 0x80, "ITRAM_DATA" },
   291		{ 0x280, 0x20, "ETRAM_DATA" },
   292		{ 0x300, 0x80, "ITRAM_ADDR" },
   293		{ 0x380, 0x20, "ETRAM_ADDR" },
 > 294		{ 0x400, 0, 0 }
   295	};
   296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
