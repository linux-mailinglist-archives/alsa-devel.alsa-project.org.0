Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA76B50AF8
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Sep 2025 04:22:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7472601FF;
	Wed, 10 Sep 2025 04:22:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7472601FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757470944;
	bh=FYVLBz1vJx7COLh0ejkAJi9Jk84BDM07sdchvSx5EBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dsYBWXOrJaFjcAByck/fthonbzbacYiSv74UlbilSjqRG00BC45NoQHwuoxZRfTkJ
	 Olb//MkZdP35zoMM/PjvDpKLy6kx/gJiQe0AIFUzm8IfO++X8oju2KdIhogzxHdHTT
	 Ne5ai2uKDbfe+4+TVEXQb06/7ovfUasMVpj+BCEA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CD4DF805C3; Wed, 10 Sep 2025 04:21:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CF1FF805C4;
	Wed, 10 Sep 2025 04:21:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 807C2F8042F; Wed, 10 Sep 2025 04:21:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8687F80134
	for <alsa-devel@alsa-project.org>; Wed, 10 Sep 2025 04:21:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8687F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ETDuLVSp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757470882; x=1789006882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FYVLBz1vJx7COLh0ejkAJi9Jk84BDM07sdchvSx5EBY=;
  b=ETDuLVSpj2DYjAQTYyR/0NljF81TPAHBKPKQjI+nhEVM5k+36JrLEGim
   E+blKMiHpgcNmcxsQDNPrMraQbrR7aLS2JaNVVl2wtM8AH60bzhsUrs1+
   LLPhkaVx8N6T0oQwH/pMhhWGVFEPmgNfcTz8UN5+b4GggknIt6l3LXg91
   c/Kg5tfIfHE+AK1w9fTuymM3hEbLVPHGpNZTfwgcKqGXhhFQO9wH+Z8/O
   FfUwfslWdPsuUZUu9H7eq9nWYBtVL6mqKC6LVdxNPZEkKecYy/3H7QVy5
   SUaJt5Q583Ork8Ie42Sml/ceiZDnSSRNUnO+jX6dl2c0gUvQL7PLIaz9O
   A==;
X-CSE-ConnectionGUID: Dph4TH5LRmO9xQ/HoXCZRQ==
X-CSE-MsgGUID: DKVt+SfsR5SmOjhWokLW3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="70387522"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800";
   d="scan'208";a="70387522"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 19:21:16 -0700
X-CSE-ConnectionGUID: DOgFKZyyRYyrgTggXh/LNw==
X-CSE-MsgGUID: JWwtxHL5RmSjobIBMF5iWg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Sep 2025 19:21:12 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwASL-0005Rv-1y;
	Wed, 10 Sep 2025 02:21:09 +0000
Date: Wed, 10 Sep 2025 10:21:04 +0800
From: kernel test robot <lkp@intel.com>
To: Niranjan H Y <niranjan.hy@ti.com>, alsa-devel@alsa-project.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-sound@vger.kernel.org, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	yung-chuan.liao@linux.intel.com, cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
	navada@ti.com, shenghao-ding@ti.com, v-hampiholi@ti.com,
	baojun.xu@ti.com, Niranjan H Y <niranjan.hy@ti.com>
Subject: Re: [PATCH v2 1/4] ASoc: tas2783A: Add soundwire based codec driver
Message-ID: <202509101012.OvT5ytrT-lkp@intel.com>
References: <20250901051144.1112-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901051144.1112-1-niranjan.hy@ti.com>
Message-ID-Hash: 3NQLYKKESEJSZKJ7PSROZQSCL63BKX7F
X-Message-ID-Hash: 3NQLYKKESEJSZKJ7PSROZQSCL63BKX7F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NQLYKKESEJSZKJ7PSROZQSCL63BKX7F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Niranjan,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.17-rc5 next-20250909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niranjan-H-Y/ASoc-tas2783A-machine-driver-amp-utility-for-TI-devices/20250909-201553
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250901051144.1112-1-niranjan.hy%40ti.com
patch subject: [PATCH v2 1/4] ASoc: tas2783A: Add soundwire based codec driver
config: hexagon-randconfig-002-20250910 (https://download.01.org/0day-ci/archive/20250910/202509101012.OvT5ytrT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509101012.OvT5ytrT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509101012.OvT5ytrT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/tas2783-sdw.c:791:8: error: incompatible pointer types passing 'size_t *' (aka 'unsigned int *') to parameter of type 'unsigned long *' [-Werror,-Wincompatible-pointer-types]
     791 |                                           &size, NULL);
         |                                           ^~~~~
   1 error generated.


vim +791 sound/soc/codecs/tas2783-sdw.c

   769	
   770	static s32 tas2783_update_calibdata(struct tas2783_prv *tas_dev)
   771	{
   772		efi_guid_t efi_guid = TAS2783_CALI_GUID;
   773		u32 attr, i, *tmp_val;
   774		size_t size;
   775		s32 ret;
   776		efi_status_t status;
   777		static efi_char16_t efi_names[][32] = {
   778			L"SmartAmpCalibrationData", L"CALI_DATA"};
   779	
   780		tmp_val = (u32 *)tas_dev->cali_data.data;
   781		attr = 0;
   782		i = 0;
   783	
   784		/*
   785		 * In some cases, the calibration is performed in Windows,
   786		 * and data was saved in UEFI. Linux can access it.
   787		 */
   788		for (i = 0; i < ARRAY_SIZE(efi_names); i++) {
   789			size = 0;
   790			status = efi.get_variable(efi_names[i], &efi_guid, &attr,
 > 791						  &size, NULL);
   792			if (size > TAS2783_CALIB_DATA_SZ) {
   793				dev_err(tas_dev->dev, "cali data too large\n");
   794				break;
   795			}
   796	
   797			tas_dev->cali_data.read_sz = size;
   798			if (status == EFI_BUFFER_TOO_SMALL) {
   799				status = efi.get_variable(efi_names[i], &efi_guid, &attr,
   800								&tas_dev->cali_data.read_sz,
   801								tas_dev->cali_data.data);
   802				dev_dbg(tas_dev->dev, "cali get %lu bytes result:%ld\n",
   803					tas_dev->cali_data.read_sz, status);
   804			}
   805			if (status == EFI_SUCCESS)
   806				break;
   807		}
   808	
   809		if (status != EFI_SUCCESS) {
   810			/* Failed got calibration data from EFI. */
   811			dev_dbg(tas_dev->dev, "No calibration data in UEFI.");
   812			return 0;
   813		}
   814	
   815		mutex_lock(&tas_dev->calib_lock);
   816		ret = tas2783_validate_calibdata(tas_dev, tas_dev->cali_data.data,
   817						 tas_dev->cali_data.read_sz);
   818		if (!ret)
   819			tas2783_set_calib_params_to_device(tas_dev, tmp_val);
   820		mutex_unlock(&tas_dev->calib_lock);
   821	
   822		return ret;
   823	}
   824	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
