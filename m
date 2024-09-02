Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9600D968FE3
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 00:50:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E8E1829;
	Tue,  3 Sep 2024 00:50:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E8E1829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725317414;
	bh=hM9Z4BDK049pTPtzfQR5/DrcTHC5fpfuvDDY2kJwe60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PmLeWGrh6SzkUZ18BtBBleiVX6Izp2LDbg/hdsxj7bnrNRA9djjSTXsivERyIXyVA
	 0YzuPzLtmT+JPUArWKFhOhPAbNU1FbcANYR3yfDfztrSr4KrM/flxwy5PfP1A0xX/B
	 MxwuQ23c0NX+vSSK/DhW0k+yGjZysP8qINl/pV/o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ECAFF80527; Tue,  3 Sep 2024 00:49:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67C84F8032D;
	Tue,  3 Sep 2024 00:49:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 889E9F80199; Tue,  3 Sep 2024 00:49:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F689F80107
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 00:49:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F689F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=h9PkDbKc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725317377; x=1756853377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hM9Z4BDK049pTPtzfQR5/DrcTHC5fpfuvDDY2kJwe60=;
  b=h9PkDbKcnALxbJUmyt+GUTEM9LwILyq+57StHtGYvKbtiNNuV8bB9H7w
   FCZkzZwjLcdFD2cMUmoxqsMGlSpy+iZhBlmtBhmBPUEJVH/Nk+xQABLNe
   rL46rVKTkjBzPozI9ude3sKQ+xcw3lZ0/mFONvxx3jOMduOupME0T+nuT
   SXgimAeJ9zM1dE/uV7igG/fwR7w8zUT3tfjvgAsXk52BZSW4oLuiCK4YK
   BwzIV/KnPieZMx/HCJpSJRnRB0fGMVOQLCwr4xFKX8gUNDlNAH88eWzXM
   rMi0zmPQ+pINtcclz83z0eljnGf4/XUZ4h9zty3+el3Ny7cv9Q++VoeV+
   g==;
X-CSE-ConnectionGUID: NA/IeLMYTvGsl00igwzzvw==
X-CSE-MsgGUID: v8E1y8maSdqT7Bd9ziFLxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="34505549"
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600";
   d="scan'208";a="34505549"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 15:49:31 -0700
X-CSE-ConnectionGUID: DwtGiH6iTHO4XCXanijk0w==
X-CSE-MsgGUID: 2gI6yUKsSR+BUeLSgFutqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600";
   d="scan'208";a="65214969"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Sep 2024 15:49:25 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slFrO-0005zC-11;
	Mon, 02 Sep 2024 22:49:22 +0000
Date: Tue, 3 Sep 2024 06:49:10 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>, broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andriy.shevchenko@linux.intel.com,
	lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
	liam.r.girdwood@intel.com, jaden-yue@ti.com,
	yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
	henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com, Baojun.Xu@fpt.com,
	judyhsiao@google.com, navada@ti.com, cujomalainey@google.com,
	aanya@ti.com, nayeem.mahmud@ti.com,
	savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com,
	jesse-ji@ti.com, darren.ye@mediatek.com, antheas.dk@gmail.com,
	Jerry2.Huang@lcfuturecenter.com, jim.shil@goertek.com
Subject: Re: [PATCH v2] ASoC: tas2781: Add Calibration Kcontrols for
 Chromebook
Message-ID: <202409030627.SFdj22Xs-lkp@intel.com>
References: <20240902062029.983-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902062029.983-1-shenghao-ding@ti.com>
Message-ID-Hash: AGWKQCMPAA5ER4DL3ZNTB3U2YKTX7ACH
X-Message-ID-Hash: AGWKQCMPAA5ER4DL3ZNTB3U2YKTX7ACH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGWKQCMPAA5ER4DL3ZNTB3U2YKTX7ACH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shenghao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on next-20240902]
[cannot apply to tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.11-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenghao-Ding/ASoC-tas2781-Add-Calibration-Kcontrols-for-Chromebook/20240902-142152
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240902062029.983-1-shenghao-ding%40ti.com
patch subject: [PATCH v2] ASoC: tas2781: Add Calibration Kcontrols for Chromebook
config: alpha-randconfig-r073-20240902 (https://download.01.org/0day-ci/archive/20240903/202409030627.SFdj22Xs-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409030627.SFdj22Xs-lkp@intel.com/

smatch warnings:
sound/soc/codecs/tas2781-i2c.c:452 sngl_calib_start() warn: inconsistent indenting

vim +452 sound/soc/codecs/tas2781-i2c.c

   425	
   426	static void sngl_calib_start(struct tasdevice_priv *tas_priv, int i,
   427		int *reg, unsigned char *dat)
   428	{
   429		struct tasdevice *tasdev = tas_priv->tasdevice;
   430		struct bulk_reg_val *p = tasdev[i].cali_data_backup;
   431		const int sum = ARRAY_SIZE(tas2781_cali_start_reg);
   432		int j;
   433	
   434		if (p == NULL)
   435			return;
   436	
   437		/* Store the current setting from the chip */
   438		for (j = 0; j < sum; j++) {
   439			if (p[j].val_len == 1) {
   440				if (p[j].is_locked)
   441					tasdevice_dev_write(tas_priv, i,
   442						TAS2781_TEST_UNLOCK_REG,
   443						TAS2781_TEST_PAGE_UNLOCK);
   444				tasdevice_dev_read(tas_priv, i, p[j].reg,
   445					(int *)&p[j].val[0]);
   446			} else {
   447				switch (p[j].reg) {
   448				case 0:
   449				if (!reg[0])
   450					continue;
   451				p[j].reg = reg[0];
 > 452					break;
   453				case TAS2781_PRM_PLT_FLAG_REG:
   454				p[j].reg = reg[1];
   455					break;
   456				case TAS2781_PRM_SINEGAIN_REG:
   457				p[j].reg = reg[2];
   458					break;
   459				case TAS2781_PRM_SINEGAIN2_REG:
   460				p[j].reg = reg[3];
   461					break;
   462				}
   463				tasdevice_dev_bulk_read(tas_priv, i, p[j].reg,
   464					p[j].val, 4);
   465			}
   466		}
   467	
   468		/* Update the setting for calibration */
   469		for (j = 0; j < sum - 2; j++) {
   470			if (p[j].val_len == 1) {
   471				if (p[j].is_locked)
   472					tasdevice_dev_write(tas_priv, i,
   473						TAS2781_TEST_UNLOCK_REG,
   474						TAS2781_TEST_PAGE_UNLOCK);
   475				tasdevice_dev_write(tas_priv, i, p[j].reg,
   476					tas2781_cali_start_reg[j].val[0]);
   477			} else {
   478				if (!p[j].reg)
   479					continue;
   480				tasdevice_dev_bulk_write(tas_priv, i, p[j].reg,
   481					(unsigned char *)
   482					tas2781_cali_start_reg[j].val, 4);
   483			}
   484		}
   485	
   486		tasdevice_dev_bulk_write(tas_priv, i, p[j].reg, &dat[1], 4);
   487		tasdevice_dev_bulk_write(tas_priv, i, p[j + 1].reg, &dat[5], 4);
   488	}
   489	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
