Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB4AAFC24C
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jul 2025 07:55:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AADA060209;
	Tue,  8 Jul 2025 07:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AADA060209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751954107;
	bh=+CHxP4+M1ekWa17UTqWKSrWA6jLeDtXFvbSRz1Kvk6M=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hs2jJPZqFOPeXFQJioqDz4KIW8Npx6i3NzW53yhuGnCuGwI2glwL+/2dnVavmZEPh
	 p9YPqYa/6hjWh+eAFb/4TxQpO1UncDZJ7CVwj1spStNO3Xx6gYofOzfRAKbiMC/g0U
	 w19Xp8/Pq+3V1MBm6wru1O3WffV2dv+lpZGR3RA8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61AC1F805D2; Tue,  8 Jul 2025 07:54:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3620FF805B6;
	Tue,  8 Jul 2025 07:54:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94EFAF80494; Tue,  8 Jul 2025 07:54:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E558F800FA
	for <alsa-devel@alsa-project.org>; Tue,  8 Jul 2025 07:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E558F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Q7BqcLHG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751954066; x=1783490066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+CHxP4+M1ekWa17UTqWKSrWA6jLeDtXFvbSRz1Kvk6M=;
  b=Q7BqcLHGtNb1pfKxSJKoXMlx5IUnf8HrAK/0IB1+XSiK/x4K2N+i3cdN
   h0qwCrSZATsv0uvNysnuWQupw3rkIrsS6LKHJ5f7B2cQI1YNwxJNNbZP3
   kSNNk0pw97JwroAzbuTcks23RVPCQ6zDFvqT3G5oEn6mC3gcAGWuwD84T
   frq/t7B3ASmXmY3bsqAoAeaa7b0DHN/enPafsbYpcc/AtbMVdi9lKAy4w
   K4RZ9vOfXyAeu7yA4RVOA/MIw1wqh0yejAF8YzshBww2o2Nal7PDR7oeu
   m2d9bynWh81qCNXnu7QGMXst1rrV/fNPm5psaC2Y2gzM0YwDo202bLsFu
   Q==;
X-CSE-ConnectionGUID: pBax+HqmRSyNSY6B8VLkjg==
X-CSE-MsgGUID: SEkiPORvQ5KeZV5ETMT1UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57949749"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600";
   d="scan'208";a="57949749"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 22:54:21 -0700
X-CSE-ConnectionGUID: QrwFovJVR0Oc+uRq24F4nw==
X-CSE-MsgGUID: BjubGk0CQZuVNDHaKQVuSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600";
   d="scan'208";a="159742465"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Jul 2025 22:54:19 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZ1HV-00012P-1r;
	Tue, 08 Jul 2025 05:54:17 +0000
Date: Tue, 8 Jul 2025 13:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/hda-reorg 17/42]
 sound/soc/intel/atom/sst/sst_acpi.c:272: undefined reference to
 `snd_intel_acpi_dsp_driver_probe'
Message-ID: <202507081351.iyDgGOUP-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: EQNO2UXJQ6WUW7HQ5OCCDQLOZFWJUBIU
X-Message-ID-Hash: EQNO2UXJQ6WUW7HQ5OCCDQLOZFWJUBIU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EQNO2UXJQ6WUW7HQ5OCCDQLOZFWJUBIU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/hda-reorg
head:   be6979113a769a90bab2a55a30ae83b76f5971e6
commit: d1bc64a913342041aaacdde0c0920eb0d5b96281 [17/42] ALSA: hda: Move HD-audio core stuff into sound/hda/core
config: i386-randconfig-063-20250522 (https://download.01.org/0day-ci/archive/20250708/202507081351.iyDgGOUP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507081351.iyDgGOUP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507081351.iyDgGOUP-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/soc/intel/atom/sst/sst_acpi.o: in function `sst_acpi_probe':
>> sound/soc/intel/atom/sst/sst_acpi.c:272: undefined reference to `snd_intel_acpi_dsp_driver_probe'


vim +272 sound/soc/intel/atom/sst/sst_acpi.c

336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  255  
5129ad6e4e6999 sound/soc/intel/sst/sst_acpi.c      Wei Yongjun          2014-12-09  256  static int sst_acpi_probe(struct platform_device *pdev)
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  257  {
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  258  	struct device *dev = &pdev->dev;
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  259  	int ret = 0;
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  260  	struct intel_sst_drv *ctx;
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  261  	const struct acpi_device_id *id;
7feb2f786a46d3 sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2017-10-12  262  	struct snd_soc_acpi_mach *mach;
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  263  	struct platform_device *mdev;
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  264  	struct platform_device *plat_dev;
12cc291b0b5850 sound/soc/intel/atom/sst/sst_acpi.c Vinod Koul           2015-11-05  265  	struct sst_platform_info *pdata;
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  266  	unsigned int dev_id;
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  267  
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  268  	id = acpi_match_device(dev->driver->acpi_match_table, dev);
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  269  	if (!id)
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  270  		return -ENODEV;
df5f5edaef4b65 sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2020-11-12  271  
df5f5edaef4b65 sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2020-11-12 @272  	ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
df5f5edaef4b65 sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2020-11-12  273  	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SST) {
df5f5edaef4b65 sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2020-11-12  274  		dev_dbg(dev, "SST ACPI driver not selected, aborting probe\n");
df5f5edaef4b65 sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2020-11-12  275  		return -ENODEV;
df5f5edaef4b65 sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2020-11-12  276  	}
df5f5edaef4b65 sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2020-11-12  277  
1635c694124fe6 sound/soc/intel/atom/sst/sst_acpi.c Colin Ian King       2016-09-16  278  	dev_dbg(dev, "for %s\n", id->id);
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  279  
7feb2f786a46d3 sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2017-10-12  280  	mach = (struct snd_soc_acpi_mach *)id->driver_data;
7feb2f786a46d3 sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2017-10-12  281  	mach = snd_soc_acpi_find_machine(mach);
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  282  	if (mach == NULL) {
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  283  		dev_err(dev, "No matching machine driver found\n");
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  284  		return -ENODEV;
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  285  	}
73a33f6f6d44db sound/soc/intel/atom/sst/sst_acpi.c Vinod Koul           2016-07-08  286  
536cfd2f375d36 sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2019-05-30  287  	if (soc_intel_is_byt())
6004640638a2cb sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2017-10-12  288  		mach->pdata = &byt_rvp_platform_data;
6004640638a2cb sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2017-10-12  289  	else
6004640638a2cb sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2017-10-12  290  		mach->pdata = &chv_platform_data;
12cc291b0b5850 sound/soc/intel/atom/sst/sst_acpi.c Vinod Koul           2015-11-05  291  	pdata = mach->pdata;
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  292  
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  293  	if (!strcmp(id->id, "LPE0F28")) {
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  294  		struct resource *rsrc;
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  295  
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  296  		/* Use regular BYT SST PCI VID:PID */
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  297  		dev_id = 0x80860F28;
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  298  		byt_rvp_platform_data.res_info = &lpe8086_res_info;
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  299  
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  300  		/*
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  301  		 * The "LPE0F28" ACPI device has separate IO-mem resources for:
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  302  		 * DDR, SHIM, MBOX, IRAM, DRAM, CFG
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  303  		 * None of which covers the entire LPE base address range.
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  304  		 * lpe8086_res_info.acpi_lpe_res_index points to the SHIM.
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  305  		 * Patch this to cover the entire base address range as expected
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  306  		 * by sst_platform_get_resources().
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  307  		 */
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  308  		rsrc = platform_get_resource(pdev, IORESOURCE_MEM,
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  309  					     pdata->res_info->acpi_lpe_res_index);
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  310  		if (!rsrc) {
c1895ba181e560 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-26  311  			dev_err(dev, "Invalid SHIM base\n");
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  312  			return -EIO;
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  313  		}
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  314  		rsrc->start -= pdata->res_info->shim_offset;
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  315  		rsrc->end = rsrc->start + 0x200000 - 1;
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  316  	} else {
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  317  		ret = kstrtouint(id->id, 16, &dev_id);
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  318  		if (ret < 0) {
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  319  			dev_err(dev, "Unique device id conversion error: %d\n", ret);
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  320  			return ret;
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  321  		}
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  322  
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  323  		if (soc_intel_is_byt_cr(pdev))
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  324  			byt_rvp_platform_data.res_info = &bytcr_res_info;
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  325  	}
6668610b4d8ce9 sound/soc/intel/atom/sst/sst_acpi.c Hans de Goede        2024-10-25  326  
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  327  	dev_dbg(dev, "ACPI device id: %x\n", dev_id);
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  328  
a68bc0d43e1b96 sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2016-08-12  329  	ret = sst_alloc_drv_context(&ctx, dev, dev_id);
a68bc0d43e1b96 sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2016-08-12  330  	if (ret < 0)
a68bc0d43e1b96 sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2016-08-12  331  		return ret;
a68bc0d43e1b96 sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2016-08-12  332  
3ee1cd4f81e15f sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2018-11-01  333  	/* update machine parameters */
3ee1cd4f81e15f sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2018-11-01  334  	mach->mach_params.acpi_ipc_irq_index =
3ee1cd4f81e15f sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2018-11-01  335  		pdata->res_info->acpi_ipc_irq_index;
3ee1cd4f81e15f sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2018-11-01  336  
caf94ed8629afb sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2016-01-04  337  	plat_dev = platform_device_register_data(dev, pdata->platform, -1,
caf94ed8629afb sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2016-01-04  338  						NULL, 0);
f5d40b400fe2de sound/soc/intel/sst/sst_acpi.c      Wei Yongjun          2014-12-09  339  	if (IS_ERR(plat_dev)) {
caf94ed8629afb sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2016-01-04  340  		dev_err(dev, "Failed to create machine device: %s\n",
caf94ed8629afb sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2016-01-04  341  			pdata->platform);
f5d40b400fe2de sound/soc/intel/sst/sst_acpi.c      Wei Yongjun          2014-12-09  342  		return PTR_ERR(plat_dev);
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  343  	}
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  344  
caf94ed8629afb sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2016-01-04  345  	/*
caf94ed8629afb sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2016-01-04  346  	 * Create platform device for sst machine driver,
caf94ed8629afb sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2016-01-04  347  	 * pass machine info as pdata
caf94ed8629afb sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2016-01-04  348  	 */
caf94ed8629afb sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2016-01-04  349  	mdev = platform_device_register_data(dev, mach->drv_name, -1,
caf94ed8629afb sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2016-01-04  350  					(const void *)mach, sizeof(*mach));
f5d40b400fe2de sound/soc/intel/sst/sst_acpi.c      Wei Yongjun          2014-12-09  351  	if (IS_ERR(mdev)) {
caf94ed8629afb sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2016-01-04  352  		dev_err(dev, "Failed to create machine device: %s\n",
caf94ed8629afb sound/soc/intel/atom/sst/sst_acpi.c Pierre-Louis Bossart 2016-01-04  353  			mach->drv_name);
f5d40b400fe2de sound/soc/intel/sst/sst_acpi.c      Wei Yongjun          2014-12-09  354  		return PTR_ERR(mdev);
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  355  	}
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  356  
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  357  	/* Fill sst platform data */
12cc291b0b5850 sound/soc/intel/atom/sst/sst_acpi.c Vinod Koul           2015-11-05  358  	ctx->pdata = pdata;
12cc291b0b5850 sound/soc/intel/atom/sst/sst_acpi.c Vinod Koul           2015-11-05  359  	strcpy(ctx->firmware_name, mach->fw_filename);
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  360  
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  361  	ret = sst_platform_get_resources(ctx);
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  362  	if (ret)
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  363  		return ret;
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  364  
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  365  	ret = sst_context_init(ctx);
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  366  	if (ret < 0)
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  367  		return ret;
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  368  
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  369  	sst_configure_runtime_pm(ctx);
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  370  	platform_set_drvdata(pdev, ctx);
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  371  	return ret;
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  372  }
336cfbb05edf7b sound/soc/intel/sst/sst_acpi.c      Vinod Koul           2014-11-11  373  

:::::: The code at line 272 was first introduced by commit
:::::: df5f5edaef4b653fa731dcf3753e71766f95c2cd ASoC: Intel: Atom: add dynamic selection of DSP driver

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
