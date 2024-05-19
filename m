Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6468C9D3B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 14:29:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81DB6E0F;
	Mon, 20 May 2024 14:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81DB6E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716208147;
	bh=ZqfuvKtxoWyUPyoUyQdKOfjpNUI+NCOUWwVaQ/3kZ/E=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GSzfkmwiwQVXfH0X+4keJfynsqylHiXVzRixQeJSFZgr2DsYfvpx3N/XgoL636aJC
	 uwuPMtb2VvJxfIymzuGlD9hGHczdNxbl/2qN4/Mxy7Qr+pkQYBkAW4YmlA/wLjNt86
	 TzGB37cjR+X7pvXy4M7Od4Nq14Kg2JgIjZbyPqgI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 073EEF806A3; Mon, 20 May 2024 14:26:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C52AAF806A7;
	Mon, 20 May 2024 14:26:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9441AF8028B; Mon, 20 May 2024 14:21:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3DDCF8016B
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 14:20:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3DDCF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hsLNjHAp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716207661; x=1747743661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZqfuvKtxoWyUPyoUyQdKOfjpNUI+NCOUWwVaQ/3kZ/E=;
  b=hsLNjHApP4ao1nemnnAfj+5zT1PgoAMFfhy9s4dSQMHthCyXSQn7ZnG3
   hsqTJoiTmGp4tuFQNNsVFb7vxH04ZQc2E9GvDUabujlv2nWoikaOutwjL
   F1Uec8XTlslpXjiSSxZ9HDfHjc2h1ET9VU55d4J27ym2gfIkvcLszGoCY
   7ygxK2pSH8jKQbshDa8hPso2C8uvq6p73n4Yq7c139mhK3wFldGMLgRLj
   xO2NfUwmGu2MHCF6PlWHzrSj3vQOMCbcporDkzyzc/qy7AjGBdDJ2g8te
   mDs7iOxhzExGmTh5mMV5wQI+xh4MTowP/PnxKu+DxMUK8TSmeuWPCo/1i
   w==;
X-CSE-ConnectionGUID: wOdCPlldQgycXgj44MM9nA==
X-CSE-MsgGUID: +iMGfR9XRgWdPrhjaZhGMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="22936253"
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000";
   d="scan'208";a="22936253"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2024 10:58:00 -0700
X-CSE-ConnectionGUID: 6jNpzaQFR5uhukJ9AM/VoQ==
X-CSE-MsgGUID: zeNWjm6OQtKgrlPiiTlzcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000";
   d="scan'208";a="36723411"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 May 2024 10:57:55 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8knB-00044O-1E;
	Sun, 19 May 2024 17:57:53 +0000
Date: Mon, 20 May 2024 01:57:12 +0800
From: kernel test robot <lkp@intel.com>
To: Baojun Xu <baojun.xu@ti.com>, tiwai@suse.de
Subject: Re: [PATCH v5 1/1] ALSA: hda/tas2781: Add tas2781 hda driver based
 on SPI
Message-ID: <202405200105.BWxmtco7-lkp@intel.com>
References: <20240519150433.760-2-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240519150433.760-2-baojun.xu@ti.com>
Message-ID-Hash: UFKQH75XEZK36OS6AFMP36LSY3JFSDHQ
X-Message-ID-Hash: UFKQH75XEZK36OS6AFMP36LSY3JFSDHQ
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, robh+dt@kernel.org,
 andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com, shenghao-ding@ti.com,
 navada@ti.com, 13916275206@139.com, v-po@ti.com, niranjan.hy@ti.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 liam.r.girdwood@intel.com, yung-chuan.liao@linux.intel.com, baojun.xu@ti.com,
 broonie@kernel.org, soyer@irl.hu
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Baojun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus rafael-pm/linux-next rafael-pm/bleeding-edge linus/master v6.9 next-20240517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baojun-Xu/ALSA-hda-tas2781-Add-tas2781-hda-driver-based-on-SPI/20240519-230843
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20240519150433.760-2-baojun.xu%40ti.com
patch subject: [PATCH v5 1/1] ALSA: hda/tas2781: Add tas2781 hda driver based on SPI
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240520/202405200105.BWxmtco7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240520/202405200105.BWxmtco7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405200105.BWxmtco7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/pci/hda/tas2781_hda_spi.c: In function 'tas2781_runtime_suspend':
>> sound/pci/hda/tas2781_hda_spi.c:1124:16: warning: unused variable 'ret' [-Wunused-variable]
    1124 |         int i, ret;
         |                ^~~
>> sound/pci/hda/tas2781_hda_spi.c:1124:13: warning: unused variable 'i' [-Wunused-variable]
    1124 |         int i, ret;
         |             ^
   sound/pci/hda/tas2781_hda_spi.c: In function 'tas2781_runtime_resume':
   sound/pci/hda/tas2781_hda_spi.c:1143:16: warning: unused variable 'ret' [-Wunused-variable]
    1143 |         int i, ret;
         |                ^~~
   sound/pci/hda/tas2781_hda_spi.c:1143:13: warning: unused variable 'i' [-Wunused-variable]
    1143 |         int i, ret;
         |             ^


vim +/ret +1124 sound/pci/hda/tas2781_hda_spi.c

  1120	
  1121	static int tas2781_runtime_suspend(struct device *dev)
  1122	{
  1123		struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
> 1124		int i, ret;
  1125	
  1126		guard(mutex)(&tas_hda->priv->codec_lock);
  1127	
  1128		if (tas_hda->priv->playback_started) {
  1129			tasdevice_spi_tuning_switch(tas_hda->priv, 1);
  1130			tas_hda->priv->playback_started = false;
  1131		}
  1132	
  1133		tas_hda->priv->cur_book = -1;
  1134		tas_hda->priv->cur_prog = -1;
  1135		tas_hda->priv->cur_conf = -1;
  1136	
  1137		return 0;
  1138	}
  1139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
