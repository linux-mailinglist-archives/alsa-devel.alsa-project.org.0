Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE35C9513C2
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 07:16:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 052EE22CC;
	Wed, 14 Aug 2024 07:16:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 052EE22CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723612572;
	bh=6N5QlFLhTSmeA3YBj5h392m3kLmfqE4/MBjB/1rI2eg=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=B3AGIU02cg1PJtRyOfbwpxYZnAyomNPPUogiaYleycryatXJAs23B69E0rvjEV3lX
	 eGBwBDwIgtlgt7mDph3mCiP9IH9avj+mfHAJU11KPyDIWFnqjAX52D+IKPgy366F9m
	 Ylwi7MemwwvzUT0cKtQ/xCQ/AgY8NqUvy9X0EReQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 638E8F805A1; Wed, 14 Aug 2024 07:15:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FE38F805B1;
	Wed, 14 Aug 2024 07:15:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD6D7F8047C; Wed, 14 Aug 2024 07:10:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C0FBF80107
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 07:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C0FBF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ncOuo0Lq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723612132; x=1755148132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6N5QlFLhTSmeA3YBj5h392m3kLmfqE4/MBjB/1rI2eg=;
  b=ncOuo0Lq8DuI9d1csN8seEiBH+SKl93C+HOizYgUROlSofa8cOc+kGzJ
   UFL/4wDP/N9los7KKzvryQ2uwy78wtpQ3mKevlkkd9H7ftsSXn/rX2Z4F
   ljOnBj8XENBl1UkzSimBW+1SXM4IymnaK1iz+I8kk0pkfnb5A7PCjHPgu
   AlT5U6yH2ijWkyBklqlV2Z3fgK6fUplAMYsSOyMecrt+mdMl/BZz+mALc
   xokbPkvH2VSlIzUS6lBOhvSP5OIHgNcIiKpXNgT3stfWC2TPREyw+84Z9
   iaKwHPMV98r5/qidXSy9QQGVtT7Sq8gYswNaOfBO4f4XDeXHXYEYlugdm
   g==;
X-CSE-ConnectionGUID: 1t/Ryms0Qt24Xc5bNCO1/A==
X-CSE-MsgGUID: TWWIaWdtR56wBR/dLkZOdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32485801"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800";
   d="scan'208";a="32485801"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 22:08:46 -0700
X-CSE-ConnectionGUID: OSrffqCUTay8/TxkttNSMg==
X-CSE-MsgGUID: eXv/hiq+SDGCnor9C1A1RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800";
   d="scan'208";a="63046731"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Aug 2024 22:08:44 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1se6FW-0001B4-0S;
	Wed, 14 Aug 2024 05:08:42 +0000
Date: Wed, 14 Aug 2024 13:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [tiwai-sound:for-linus 2/7] ld.lld: error: undefined symbol:
 i2c_acpi_client_count
Message-ID: <202408141333.gYnaitcV-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: PU5UKX5DW4V55K3HJBCRKU3IYLJST7T4
X-Message-ID-Hash: PU5UKX5DW4V55K3HJBCRKU3IYLJST7T4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PU5UKX5DW4V55K3HJBCRKU3IYLJST7T4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-linus
head:   8475a1d9bb7acf1cb15842dd24baab0e8ea4e4ff
commit: 03c5c350e38d9346b69357d0e52c3c40495c14a0 [2/7] ALSA: hda/realtek: Add support for new HP G12 laptops
config: i386-randconfig-013-20240811 (https://download.01.org/0day-ci/archive/20240814/202408141333.gYnaitcV-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408141333.gYnaitcV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408141333.gYnaitcV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: i2c_acpi_client_count
   >>> referenced by patch_realtek.c:6891 (sound/pci/hda/patch_realtek.c:6891)
   >>>               sound/pci/hda/patch_realtek.o:(cs35lxx_autodet_fixup) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
