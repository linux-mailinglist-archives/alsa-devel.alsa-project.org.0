Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4527DA852
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Oct 2023 19:58:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB8E1868;
	Sat, 28 Oct 2023 19:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB8E1868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698515921;
	bh=AFsLwf98b+T6tdG9kTHblQKkbRc6qOMueaSvpCDcCOk=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NS0rtntJP4lB+7liw9Jh/wtozfSOE1fHnZ26VNc+40vHtkJvpKnBMsGYd30ldAsNq
	 wCPdRaCiC1Dg8mQ9fuiM/PcUKu7cQ9QQPPxI+/OMFpm/1ptkZ7uFmBEuck4EYQNoCL
	 +aLc0hFWca8AWzCd47jHLx6cquG2iMpkHoINmA08=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E4E4F8020D; Sat, 28 Oct 2023 19:57:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1807CF80165;
	Sat, 28 Oct 2023 19:57:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0DEDF8019B; Sat, 28 Oct 2023 19:57:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 513E7F80152
	for <alsa-devel@alsa-project.org>; Sat, 28 Oct 2023 19:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 513E7F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gGIsrioS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698515860; x=1730051860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AFsLwf98b+T6tdG9kTHblQKkbRc6qOMueaSvpCDcCOk=;
  b=gGIsrioS8i2MnuuCOoqXOVudqT8BNYTZ9ReadOb248QUAObdYH6Vlikb
   Shge0sAvZXWiID0LKMQU17iB6YPg7NdKHHJxDVattkedkPonfMELbYvPO
   h5ggV6Q+y9x9rSYL0f3XlsOq1qOioiWDeT3M9tBFou5PjOFaYi2HTr9yL
   wZUs2hmahPaRbjwSNmxdGMKUb2PWAqvmkfsA7qKBwel2szWL04wWzngDV
   T2u0uFQgVMhQ3Ua+z+aTbA0yfW6y7AEeQYhF3GXmQKfSSihbCLQah87LA
   fWpU/8nwEXS+eouhc5gje3rO5a+ibX46tah3YBoIlSUviKJM/IFigtiMD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="387724757"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200";
   d="scan'208";a="387724757"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 10:57:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200";
   d="scan'208";a="7941199"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Oct 2023 10:57:19 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwnYx-000ByB-1P;
	Sat, 28 Oct 2023 17:57:31 +0000
Date: Sun, 29 Oct 2023 01:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 90/101] sound/pci/hda/cs35l41_hda.c:733:5:
 warning: no previous declaration for 'cs35l41_verify_id'
Message-ID: <202310290100.edUObACr-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: MN3QNLSUSG2UTHW5PMG5YFTAYYURXXLZ
X-Message-ID-Hash: MN3QNLSUSG2UTHW5PMG5YFTAYYURXXLZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MN3QNLSUSG2UTHW5PMG5YFTAYYURXXLZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   a5901f27dcf13203e5b342b7e9439314a775bf32
commit: 881b7bce0c250386680b49b637455d31238a4b30 [90/101] ALSA: hda: cs35l41: Run boot process during resume callbacks
config: i386-buildonly-randconfig-003-20231028 (https://download.01.org/0day-ci/archive/20231029/202310290100.edUObACr-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310290100.edUObACr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310290100.edUObACr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/pci/hda/cs35l41_hda.c:733:5: warning: no previous declaration for 'cs35l41_verify_id' [-Wmissing-declarations]
    int cs35l41_verify_id(struct cs35l41_hda *cs35l41, unsigned int *regid, unsigned int *reg_revid)
        ^~~~~~~~~~~~~~~~~


vim +/cs35l41_verify_id +733 sound/pci/hda/cs35l41_hda.c

   732	
 > 733	int cs35l41_verify_id(struct cs35l41_hda *cs35l41, unsigned int *regid, unsigned int *reg_revid)
   734	{
   735		unsigned int mtl_revid, chipid;
   736		int ret;
   737	
   738		ret = regmap_read(cs35l41->regmap, CS35L41_DEVID, regid);
   739		if (ret) {
   740			dev_err_probe(cs35l41->dev, ret, "Get Device ID failed\n");
   741			return ret;
   742		}
   743	
   744		ret = regmap_read(cs35l41->regmap, CS35L41_REVID, reg_revid);
   745		if (ret) {
   746			dev_err_probe(cs35l41->dev, ret, "Get Revision ID failed\n");
   747			return ret;
   748		}
   749	
   750		mtl_revid = *reg_revid & CS35L41_MTLREVID_MASK;
   751	
   752		chipid = (mtl_revid % 2) ? CS35L41R_CHIP_ID : CS35L41_CHIP_ID;
   753		if (*regid != chipid) {
   754			dev_err(cs35l41->dev, "CS35L41 Device ID (%X). Expected ID %X\n", *regid, chipid);
   755			return -ENODEV;
   756		}
   757	
   758		return 0;
   759	}
   760	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
