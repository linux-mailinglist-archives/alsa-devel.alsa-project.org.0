Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 952806C3F5F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 01:54:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D688C3E7;
	Wed, 22 Mar 2023 01:53:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D688C3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679446466;
	bh=PW5+lKHrsPBo20QJvQbLwYxaOXo5Xht6FFbihrbgyK4=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J5bdGFnkx4osi1NYq9XxatTFwq/81GdK/2f9Xi2+LtDj1BnGlrj4z5Tv4IxicQwZ6
	 dmskL+43M5lrA2qr9f83K8DbyTKVtOo4DOuA3QMeFmPGF4STJifWsX/qpd4iLuDVXT
	 VRrasnHnNq/fGa2p45X32jiNh2EjcyPgW4oaDj+s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BE43F80254;
	Wed, 22 Mar 2023 01:53:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F0FAF8027B; Wed, 22 Mar 2023 01:53:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38AA6F80105
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 01:53:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38AA6F80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=N0E/7T34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679446404; x=1710982404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PW5+lKHrsPBo20QJvQbLwYxaOXo5Xht6FFbihrbgyK4=;
  b=N0E/7T34gbrqAppXh4OE7COqs1sXxOCYZcS9nn1otmDUes32Vums1LtW
   ELcu0+4zN+V10nlyoBxq+BCaTSNezWIrklFQIwQ2eLd4rM+z0G5pWN9Gy
   SGRm61pQYF3EKvkOLTWci1uM1upKK8MDrr76RMa+kRVgFdFCedTfK21iV
   sO4tbXLOxrthp1hANEh2m1F2gJJ3xn1qQJSKLgDq68egOgy+sr+NjdWR5
   U2xf9W7ZKBNCKIcDZTIFkLDeEpOyQTDK+osmfsLAg12WcjpwopkZJbxTa
   pwhipj46fOSvC1c8LuYL/rg+IK432sSNRkAYRgKl3OtpCAtIUnFz20TAD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="403980144"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400";
   d="scan'208";a="403980144"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 17:53:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="1011178333"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400";
   d="scan'208";a="1011178333"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Mar 2023 17:53:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pemit-000Ccg-25;
	Wed, 22 Mar 2023 00:53:03 +0000
Date: Wed, 22 Mar 2023 08:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <13916275206@139.com>, broonie@kernel.org,
	lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH v5] ASoC: tas2781: Add tas2781 driver
Message-ID: <202303220800.Pz99eL6X-lkp@intel.com>
References: <20230321113130.25853-1-13916275206@139.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321113130.25853-1-13916275206@139.com>
Message-ID-Hash: P7EGVSMEUDUFSEMHBBT2JZXLSWIFOB5Y
X-Message-ID-Hash: P7EGVSMEUDUFSEMHBBT2JZXLSWIFOB5Y
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
 Shenghao Ding <13916275206@139.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7EGVSMEUDUFSEMHBBT2JZXLSWIFOB5Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shenghao,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.3-rc3 next-20230321]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenghao-Ding/ASoC-tas2781-Add-tas2781-driver/20230321-193259
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230321113130.25853-1-13916275206%40139.com
patch subject: [PATCH v5] ASoC: tas2781: Add tas2781 driver
config: arm-randconfig-r046-20230320 (https://download.01.org/0day-ci/archive/20230322/202303220800.Pz99eL6X-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/a29d62a28a9077c66a962c69116c4eeb61f876f9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shenghao-Ding/ASoC-tas2781-Add-tas2781-driver/20230321-193259
        git checkout a29d62a28a9077c66a962c69116c4eeb61f876f9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220800.Pz99eL6X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/tas2781-i2c.c:1608:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (i2c->dev.of_node)
               ^~~~~~~~~~~~~~~~
   sound/soc/codecs/tas2781-i2c.c:1626:6: note: uninitialized use occurs here
           if (ret < 0 && tas_dev != NULL)
               ^~~
   sound/soc/codecs/tas2781-i2c.c:1608:2: note: remove the 'if' if its condition is always true
           if (i2c->dev.of_node)
           ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas2781-i2c.c:1580:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.
--
>> sound/soc/codecs/tas2781-dsp.c:1239:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                   if (page == TAS2781_YRAM5_PAGE) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:1269:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   sound/soc/codecs/tas2781-dsp.c:1239:3: note: remove the 'if' if its condition is always true
                   if (page == TAS2781_YRAM5_PAGE) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:1210:14: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                   } else if (page == TAS2781_YRAM3_PAGE) {
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:1269:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   sound/soc/codecs/tas2781-dsp.c:1210:10: note: remove the 'if' if its condition is always true
                   } else if (page == TAS2781_YRAM3_PAGE) {
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:1195:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
>> sound/soc/codecs/tas2781-dsp.c:2066:6: warning: variable 'prog_status' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (rca_conf_no > rca->ncfgs || rca_conf_no <= 0 ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:2151:9: note: uninitialized use occurs here
           return prog_status;
                  ^~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:2066:2: note: remove the 'if' if its condition is always false
           if (rca_conf_no > rca->ncfgs || rca_conf_no <= 0 ||
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/codecs/tas2781-dsp.c:2066:6: warning: variable 'prog_status' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
           if (rca_conf_no > rca->ncfgs || rca_conf_no <= 0 ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:2151:9: note: uninitialized use occurs here
           return prog_status;
                  ^~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:2066:6: note: remove the '||' if its condition is always false
           if (rca_conf_no > rca->ncfgs || rca_conf_no <= 0 ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/codecs/tas2781-dsp.c:2066:6: warning: variable 'prog_status' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
           if (rca_conf_no > rca->ncfgs || rca_conf_no <= 0 ||
               ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:2151:9: note: uninitialized use occurs here
           return prog_status;
                  ^~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:2066:6: note: remove the '||' if its condition is always false
           if (rca_conf_no > rca->ncfgs || rca_conf_no <= 0 ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:2059:6: warning: variable 'prog_status' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (prm_no >= tas_fmw->nr_programs) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:2151:9: note: uninitialized use occurs here
           return prog_status;
                  ^~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:2059:2: note: remove the 'if' if its condition is always false
           if (prm_no >= tas_fmw->nr_programs) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:2052:6: warning: variable 'prog_status' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (cfg_no >= tas_fmw->nr_configurations) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:2151:9: note: uninitialized use occurs here
           return prog_status;
                  ^~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:2052:2: note: remove the 'if' if its condition is always false
           if (cfg_no >= tas_fmw->nr_configurations) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:2047:6: warning: variable 'prog_status' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!tas_fmw) {
               ^~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:2151:9: note: uninitialized use occurs here
           return prog_status;
                  ^~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:2047:2: note: remove the 'if' if its condition is always false
           if (!tas_fmw) {
           ^~~~~~~~~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:2045:17: note: initialize the variable 'prog_status' to silence this warning
           int prog_status;
                          ^
                           = 0
   8 warnings generated.


vim +1608 sound/soc/codecs/tas2781-i2c.c

  1576	
  1577	static int tasdevice_i2c_probe(struct i2c_client *i2c)
  1578	{
  1579		struct tasdevice_priv *tas_dev = NULL;
  1580		int ret;
  1581		const struct acpi_device_id *acpi_id;
  1582		const struct i2c_device_id *id = i2c_match_id(tasdevice_id, i2c);
  1583	
  1584		tas_dev = devm_kzalloc(&i2c->dev, sizeof(*tas_dev), GFP_KERNEL);
  1585		if (!tas_dev) {
  1586			ret = -ENOMEM;
  1587			goto out;
  1588		}
  1589	
  1590		if (ACPI_HANDLE(&i2c->dev)) {
  1591			acpi_id = acpi_match_device(i2c->dev.driver->acpi_match_table,
  1592					&i2c->dev);
  1593			if (!acpi_id) {
  1594				dev_err(&i2c->dev, "No driver data\n");
  1595				ret = -EINVAL;
  1596				goto out;
  1597			}
  1598			tas_dev->chip_id = acpi_id->driver_data;
  1599			tas_dev->isacpi = true;
  1600		} else {
  1601			tas_dev->chip_id = (id != NULL) ? id->driver_data : 0;
  1602			tas_dev->isacpi = false;
  1603		}
  1604	
  1605		tas_dev->dev = &i2c->dev;
  1606		tas_dev->client = (void *)i2c;
  1607	
> 1608		if (i2c->dev.of_node)
  1609			ret = tasdevice_parse_dt(tas_dev);
  1610		else {
  1611			dev_err(tas_dev->dev, "No DTS info\n");
  1612			goto out;
  1613		}
  1614	
  1615		tas_dev->regmap = devm_regmap_init_i2c(i2c,
  1616			&tasdevice_regmap);
  1617		if (IS_ERR(tas_dev->regmap)) {
  1618			ret = PTR_ERR(tas_dev->regmap);
  1619			dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
  1620				ret);
  1621			goto out;
  1622		}
  1623		ret = tasdevice_init(tas_dev);
  1624	
  1625	out:
  1626		if (ret < 0 && tas_dev != NULL)
  1627			tasdevice_remove(tas_dev);
  1628		return ret;
  1629	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
