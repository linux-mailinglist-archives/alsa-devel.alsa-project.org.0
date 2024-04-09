Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6627889E0F2
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Apr 2024 19:01:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEEDF2BCB;
	Tue,  9 Apr 2024 19:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEEDF2BCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712682111;
	bh=FKssRu0p/meu6e+rq96ejjZXIY12wnzoRsWc4bjH1sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ej9Xz7oULeE59osBCtNEOQho105aBPSwBA4IaWXdEuewahRZNofgEyPgzYaAInHdd
	 C2hz6iJV9Ns2Dqy2gDqBCFWZWTkXKHO4YLXYQAyFveAI2m0tftT5rYJpoPMWt8QilL
	 qMUmyAGkc3rJMYOXhr+Qv4e+OY7eHQWGQnF3FR3Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC7E8F80588; Tue,  9 Apr 2024 19:01:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BF38F80568;
	Tue,  9 Apr 2024 19:01:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EC66F8026D; Tue,  9 Apr 2024 19:01:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE714F800C9
	for <alsa-devel@alsa-project.org>; Tue,  9 Apr 2024 19:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE714F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HTWBNr7q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712682059; x=1744218059;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FKssRu0p/meu6e+rq96ejjZXIY12wnzoRsWc4bjH1sc=;
  b=HTWBNr7qpgSiVe/+QxYTjnkrkM25N6N0Wd1UYSmN28jaWemgFR1le3Z/
   i4OHq2KafSaOLftv2tNFdB1/j7m7zSXnJKuY+ZaMCLepjJR6hyehMzVK+
   UmkmVNDYLtFMkc+5G0OD/fmv1fuemXDOKPciZBP/oqcK2+m3m50Oa0+pV
   pWZhwkDMsM+6k948W/QJSVakuCLKF48QSibakNX1VerwldPsQxsKNBwFq
   8q+rf4qdxXdBjKfmzBtBCcryzW67+LXCfGOrYCeIGdI0P7J+lGTafar2C
   uAeLNf4NI6tnn9uFjCTtBJCnv3uqJQGKRrp6KPKmfF7l2hPGX31wwH33E
   A==;
X-CSE-ConnectionGUID: tPdGU/X9S3SRLPveEYHFSw==
X-CSE-MsgGUID: 3YSDqlNWTHyyqd6130rmMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18573570"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000";
   d="scan'208";a="18573570"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 10:00:53 -0700
X-CSE-ConnectionGUID: aPYdnrrDT+6kda6GqIUjtg==
X-CSE-MsgGUID: g3qMP7FqRYat0QkGxSq9Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000";
   d="scan'208";a="24908740"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Apr 2024 10:00:49 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruEpy-0006K6-2S;
	Tue, 09 Apr 2024 17:00:46 +0000
Date: Wed, 10 Apr 2024 01:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: Baojun Xu <baojun.xu@ti.com>, tiwai@suse.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, robh+dt@kernel.org,
	andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com,
	perex@perex.cz, pierre-louis.bossart@linux.intel.com,
	kevin-lu@ti.com, shenghao-ding@ti.com, navada@ti.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, yung-chuan.liao@linux.intel.com,
	baojun.xu@ti.com, broonie@kernel.org, soyer@irl.hu
Subject: Re: [PATCH v2 2/3] ALSA: hda/tas2781: Main code of tas2781 driver
 for SPI
Message-ID: <202404100015.FAgrEOeO-lkp@intel.com>
References: <20240409024816.1180-3-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409024816.1180-3-baojun.xu@ti.com>
Message-ID-Hash: 75T4KJERDFA4OTNTCS3CF2UGLAQ6D6RX
X-Message-ID-Hash: 75T4KJERDFA4OTNTCS3CF2UGLAQ6D6RX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/75T4KJERDFA4OTNTCS3CF2UGLAQ6D6RX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Baojun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus rafael-pm/linux-next linus/master v6.9-rc3 next-20240409]
[cannot apply to rafael-pm/acpi-bus rafael-pm/devprop]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baojun-Xu/ALSA-hda-tas2781-Modification-for-add-tas2781-driver-for-SPI/20240409-105140
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20240409024816.1180-3-baojun.xu%40ti.com
patch subject: [PATCH v2 2/3] ALSA: hda/tas2781: Main code of tas2781 driver for SPI
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240410/202404100015.FAgrEOeO-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100015.FAgrEOeO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100015.FAgrEOeO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/pci/hda/tas2781_hda_spi.c:9:
   In file included from include/linux/acpi.h:39:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> sound/pci/hda/tas2781_hda_spi.c:1159:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1159 |         if (strstr(dev_name(&spi->dev), "TIAS2781")) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/tas2781_hda_spi.c:1203:6: note: uninitialized use occurs here
    1203 |         if (ret)
         |             ^~~
   sound/pci/hda/tas2781_hda_spi.c:1159:2: note: remove the 'if' if its condition is always true
    1159 |         if (strstr(dev_name(&spi->dev), "TIAS2781")) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1160 |                 device_name = "TIAS2781";
    1161 |                 tas_priv->save_calibration = tas2781_save_calibration;
    1162 |                 tas_priv->apply_calibration = tas2781_apply_calib;
    1163 |         } else
         |           ~~~~
    1164 |                 goto err;
         |                 ~~~~~~~~
>> sound/pci/hda/tas2781_hda_spi.c:1153:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1153 |         if (!tas_priv)
         |             ^~~~~~~~~
   sound/pci/hda/tas2781_hda_spi.c:1203:6: note: uninitialized use occurs here
    1203 |         if (ret)
         |             ^~~
   sound/pci/hda/tas2781_hda_spi.c:1153:2: note: remove the 'if' if its condition is always false
    1153 |         if (!tas_priv)
         |         ^~~~~~~~~~~~~~
    1154 |                 goto err;
         |                 ~~~~~~~~
   sound/pci/hda/tas2781_hda_spi.c:1144:9: note: initialize the variable 'ret' to silence this warning
    1144 |         int ret;
         |                ^
         |                 = 0
   7 warnings generated.


vim +1159 sound/pci/hda/tas2781_hda_spi.c

  1138	
  1139	static int tas2781_hda_spi_probe(struct spi_device *spi)
  1140	{
  1141		struct tasdevice_priv *tas_priv;
  1142		struct tas2781_hda *tas_hda;
  1143		const char *device_name;
  1144		int ret;
  1145	
  1146		tas_hda = devm_kzalloc(&spi->dev, sizeof(*tas_hda), GFP_KERNEL);
  1147		if (!tas_hda)
  1148			return -ENOMEM;
  1149	
  1150		tas_hda->dev = &spi->dev;
  1151	
  1152		tas_priv = devm_kzalloc(&spi->dev, sizeof(*tas_priv), GFP_KERNEL);
> 1153		if (!tas_priv)
  1154			goto err;
  1155		tas_priv->dev = &spi->dev;
  1156		tas_priv->client = (void *)spi;
  1157		tas_hda->priv = tas_priv;
  1158	
> 1159		if (strstr(dev_name(&spi->dev), "TIAS2781")) {
  1160			device_name = "TIAS2781";
  1161			tas_priv->save_calibration = tas2781_save_calibration;
  1162			tas_priv->apply_calibration = tas2781_apply_calib;
  1163		} else
  1164			goto err;
  1165	
  1166		tas_priv->irq_info.irq = spi->irq;
  1167		dev_set_drvdata(&spi->dev, tas_hda);
  1168		ret = tas2781_read_acpi(tas_hda, device_name,
  1169			spi_get_chipselect(spi, 0));
  1170		if (ret)
  1171			return dev_err_probe(tas_hda->dev, ret,
  1172				"Platform not supported\n");
  1173	
  1174		tas_priv->regmap = devm_regmap_init_spi(spi, &tasdevice_regmap);
  1175		if (IS_ERR(tas_priv->regmap)) {
  1176			ret = PTR_ERR(tas_priv->regmap);
  1177			dev_err(tas_priv->dev, "Failed to allocate regmap: %d\n",
  1178				ret);
  1179			goto err;
  1180		}
  1181		ret = tasdevice_spi_init(tas_hda->priv);
  1182		if (ret)
  1183			goto err;
  1184	
  1185		pm_runtime_set_autosuspend_delay(tas_hda->dev, 3000);
  1186		pm_runtime_use_autosuspend(tas_hda->dev);
  1187		pm_runtime_mark_last_busy(tas_hda->dev);
  1188		pm_runtime_set_active(tas_hda->dev);
  1189		pm_runtime_get_noresume(tas_hda->dev);
  1190		pm_runtime_enable(tas_hda->dev);
  1191	
  1192		pm_runtime_put_autosuspend(tas_hda->dev);
  1193	
  1194		tas2781_spi_reset(tas_priv);
  1195	
  1196		ret = component_add(tas_hda->dev, &tas2781_hda_comp_ops);
  1197		if (ret) {
  1198			dev_err(tas_hda->dev, "Register component failed: %d\n", ret);
  1199			pm_runtime_disable(tas_hda->dev);
  1200		}
  1201	
  1202	err:
  1203		if (ret)
  1204			tas2781_hda_remove(&spi->dev);
  1205		return ret;
  1206	}
  1207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
