Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 565AD8D6BF8
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 23:54:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC1CE85D;
	Fri, 31 May 2024 23:53:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC1CE85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717192446;
	bh=CPHoggbhzNf5ibw9VbBbdMg/tioqAhC9EB19f97+qc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S3fXij/uRvfwKg59ebXtJje5bvEcJV4rNleze2TwDCIsi8/fTH0Icno0LtuIkB/24
	 7eP0+rc2yCGDtpAI3qWWN1rL0N3I2lsV8iXe5R83hRrK6r0BW6kpVJtbkTvWcYzaFK
	 +OjoZpeLLQKYdOCClcSDUDq+U569+AexubiVRInQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BB4BF8059F; Fri, 31 May 2024 23:53:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F36ECF80587;
	Fri, 31 May 2024 23:53:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52B52F8026D; Fri, 31 May 2024 23:53:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 422B4F80051
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 23:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 422B4F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HCXjZ+jK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717192406; x=1748728406;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CPHoggbhzNf5ibw9VbBbdMg/tioqAhC9EB19f97+qc8=;
  b=HCXjZ+jKqIMYCqBXlrTUHwQPeI/gnf6xbZB74t3CSutIWYguOMRkNw0B
   oqefGFQYTAMI/4uOEc88FblJH2nwe8oKiJS9fbWjzeIXf6Ps2I2uPf9Da
   4pUVFpKYY069o9Py8cVNQrNLmEQuJjzT9c5rgJ4/g7ReOpY37Vuh8tRpH
   H1P8x+sCUWC6YQyJeWuruth2fkOa7dkjuSwIzbcfS8t/0mUVccKPuvPvn
   rcryedUV/J1jDyrGpdGBtvX0iGEO7zCILsbx6GSc3wODRDXGjbCC7yk5H
   pihuZ8gA1QbHlaPwJUo39m5UBfl01gHjxesCylwlrUOI4XbnNQiDE9w6O
   Q==;
X-CSE-ConnectionGUID: pBzccY8TTsG2S0oSwiU0eQ==
X-CSE-MsgGUID: uTN3Sd6QTbOeH+qCk1l92A==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="17600227"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000";
   d="scan'208";a="17600227"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 14:53:21 -0700
X-CSE-ConnectionGUID: c9OWndSkQPeEQpneVeUCbA==
X-CSE-MsgGUID: BhUsEDPER0eHdbxJaGJzaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000";
   d="scan'208";a="36205908"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 31 May 2024 14:53:14 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDABU-000Hsc-0O;
	Fri, 31 May 2024 21:53:12 +0000
Date: Sat, 1 Jun 2024 05:52:28 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Rob Herring <robh@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Mark Brown <broonie@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Chancel Liu <chancel.liu@nxp.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>, Kevin Lu <kevin-lu@ti.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/6] ASoC: codecs: Remove unused of_gpio.h
Message-ID: <202406010556.2MUAFCcz-lkp@intel.com>
References: <20240531153038.1590171-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531153038.1590171-2-andriy.shevchenko@linux.intel.com>
Message-ID-Hash: 3SDO2RTX4A6EQDS3QLU5JE5HJXJPTRRF
X-Message-ID-Hash: 3SDO2RTX4A6EQDS3QLU5JE5HJXJPTRRF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3SDO2RTX4A6EQDS3QLU5JE5HJXJPTRRF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on shawnguo/for-next rockchip/for-next linus/master v6.10-rc1 next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/ASoC-codecs-Remove-unused-of_gpio-h/20240531-233513
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240531153038.1590171-2-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v2 1/6] ASoC: codecs: Remove unused of_gpio.h
config: i386-buildonly-randconfig-006-20240601 (https://download.01.org/0day-ci/archive/20240601/202406010556.2MUAFCcz-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010556.2MUAFCcz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010556.2MUAFCcz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/aw88399.c:1791:3: error: call to undeclared function 'gpiod_set_value_cansleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1791 |                 gpiod_set_value_cansleep(aw88399->reset_gpio, 1);
         |                 ^
>> sound/soc/codecs/aw88399.c:1868:24: error: call to undeclared function 'devm_gpiod_get_optional'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1868 |         aw88399->reset_gpio = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_LOW);
         |                               ^
   sound/soc/codecs/aw88399.c:1868:24: note: did you mean 'devm_regulator_get_optional'?
   include/linux/regulator/consumer.h:347:1: note: 'devm_regulator_get_optional' declared here
     347 | devm_regulator_get_optional(struct device *dev, const char *id)
         | ^
>> sound/soc/codecs/aw88399.c:1868:68: error: use of undeclared identifier 'GPIOD_OUT_LOW'
    1868 |         aw88399->reset_gpio = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_LOW);
         |                                                                           ^
   3 errors generated.


vim +/gpiod_set_value_cansleep +1791 sound/soc/codecs/aw88399.c

8ade6cc7e26175 Weidong Wang 2023-10-25  1787  
8ade6cc7e26175 Weidong Wang 2023-10-25  1788  static void aw88399_hw_reset(struct aw88399 *aw88399)
8ade6cc7e26175 Weidong Wang 2023-10-25  1789  {
8ade6cc7e26175 Weidong Wang 2023-10-25  1790  	if (aw88399->reset_gpio) {
8ade6cc7e26175 Weidong Wang 2023-10-25 @1791  		gpiod_set_value_cansleep(aw88399->reset_gpio, 1);
8ade6cc7e26175 Weidong Wang 2023-10-25  1792  		usleep_range(AW88399_1000_US, AW88399_1000_US + 10);
8ade6cc7e26175 Weidong Wang 2023-10-25  1793  		gpiod_set_value_cansleep(aw88399->reset_gpio, 0);
8ade6cc7e26175 Weidong Wang 2023-10-25  1794  		usleep_range(AW88399_1000_US, AW88399_1000_US + 10);
8ade6cc7e26175 Weidong Wang 2023-10-25  1795  		gpiod_set_value_cansleep(aw88399->reset_gpio, 1);
8ade6cc7e26175 Weidong Wang 2023-10-25  1796  		usleep_range(AW88399_1000_US, AW88399_1000_US + 10);
8ade6cc7e26175 Weidong Wang 2023-10-25  1797  	}
8ade6cc7e26175 Weidong Wang 2023-10-25  1798  }
8ade6cc7e26175 Weidong Wang 2023-10-25  1799  
8ade6cc7e26175 Weidong Wang 2023-10-25  1800  static void aw88399_parse_channel_dt(struct aw_device *aw_dev)
8ade6cc7e26175 Weidong Wang 2023-10-25  1801  {
8ade6cc7e26175 Weidong Wang 2023-10-25  1802  	struct device_node *np = aw_dev->dev->of_node;
8ade6cc7e26175 Weidong Wang 2023-10-25  1803  	u32 channel_value;
8ade6cc7e26175 Weidong Wang 2023-10-25  1804  
8ade6cc7e26175 Weidong Wang 2023-10-25  1805  	of_property_read_u32(np, "awinic,audio-channel", &channel_value);
8ade6cc7e26175 Weidong Wang 2023-10-25  1806  	aw_dev->channel = channel_value;
8ade6cc7e26175 Weidong Wang 2023-10-25  1807  }
8ade6cc7e26175 Weidong Wang 2023-10-25  1808  
8ade6cc7e26175 Weidong Wang 2023-10-25  1809  static int aw88399_init(struct aw88399 *aw88399, struct i2c_client *i2c, struct regmap *regmap)
8ade6cc7e26175 Weidong Wang 2023-10-25  1810  {
8ade6cc7e26175 Weidong Wang 2023-10-25  1811  	struct aw_device *aw_dev;
8ade6cc7e26175 Weidong Wang 2023-10-25  1812  	unsigned int chip_id;
8ade6cc7e26175 Weidong Wang 2023-10-25  1813  	int ret;
8ade6cc7e26175 Weidong Wang 2023-10-25  1814  
8ade6cc7e26175 Weidong Wang 2023-10-25  1815  	ret = regmap_read(regmap, AW88399_ID_REG, &chip_id);
8ade6cc7e26175 Weidong Wang 2023-10-25  1816  	if (ret) {
8ade6cc7e26175 Weidong Wang 2023-10-25  1817  		dev_err(&i2c->dev, "%s read chipid error. ret = %d", __func__, ret);
8ade6cc7e26175 Weidong Wang 2023-10-25  1818  		return ret;
8ade6cc7e26175 Weidong Wang 2023-10-25  1819  	}
8ade6cc7e26175 Weidong Wang 2023-10-25  1820  	if (chip_id != AW88399_CHIP_ID) {
8ade6cc7e26175 Weidong Wang 2023-10-25  1821  		dev_err(&i2c->dev, "unsupported device");
8ade6cc7e26175 Weidong Wang 2023-10-25  1822  		return -ENXIO;
8ade6cc7e26175 Weidong Wang 2023-10-25  1823  	}
8ade6cc7e26175 Weidong Wang 2023-10-25  1824  	dev_dbg(&i2c->dev, "chip id = %x\n", chip_id);
8ade6cc7e26175 Weidong Wang 2023-10-25  1825  
8ade6cc7e26175 Weidong Wang 2023-10-25  1826  	aw_dev = devm_kzalloc(&i2c->dev, sizeof(*aw_dev), GFP_KERNEL);
8ade6cc7e26175 Weidong Wang 2023-10-25  1827  	if (!aw_dev)
8ade6cc7e26175 Weidong Wang 2023-10-25  1828  		return -ENOMEM;
8ade6cc7e26175 Weidong Wang 2023-10-25  1829  	aw88399->aw_pa = aw_dev;
8ade6cc7e26175 Weidong Wang 2023-10-25  1830  
8ade6cc7e26175 Weidong Wang 2023-10-25  1831  	aw_dev->i2c = i2c;
8ade6cc7e26175 Weidong Wang 2023-10-25  1832  	aw_dev->dev = &i2c->dev;
8ade6cc7e26175 Weidong Wang 2023-10-25  1833  	aw_dev->regmap = regmap;
8ade6cc7e26175 Weidong Wang 2023-10-25  1834  	mutex_init(&aw_dev->dsp_lock);
8ade6cc7e26175 Weidong Wang 2023-10-25  1835  
8ade6cc7e26175 Weidong Wang 2023-10-25  1836  	aw_dev->chip_id = chip_id;
8ade6cc7e26175 Weidong Wang 2023-10-25  1837  	aw_dev->acf = NULL;
8ade6cc7e26175 Weidong Wang 2023-10-25  1838  	aw_dev->prof_info.prof_desc = NULL;
8ade6cc7e26175 Weidong Wang 2023-10-25  1839  	aw_dev->prof_info.count = 0;
8ade6cc7e26175 Weidong Wang 2023-10-25  1840  	aw_dev->prof_info.prof_type = AW88395_DEV_NONE_TYPE_ID;
8ade6cc7e26175 Weidong Wang 2023-10-25  1841  	aw_dev->channel = AW88399_DEV_DEFAULT_CH;
8ade6cc7e26175 Weidong Wang 2023-10-25  1842  	aw_dev->fw_status = AW88399_DEV_FW_FAILED;
8ade6cc7e26175 Weidong Wang 2023-10-25  1843  
8ade6cc7e26175 Weidong Wang 2023-10-25  1844  	aw_dev->fade_step = AW88399_VOLUME_STEP_DB;
8ade6cc7e26175 Weidong Wang 2023-10-25  1845  	aw_dev->volume_desc.ctl_volume = AW88399_VOL_DEFAULT_VALUE;
8ade6cc7e26175 Weidong Wang 2023-10-25  1846  
8ade6cc7e26175 Weidong Wang 2023-10-25  1847  	aw88399_parse_channel_dt(aw_dev);
8ade6cc7e26175 Weidong Wang 2023-10-25  1848  
8ade6cc7e26175 Weidong Wang 2023-10-25  1849  	return 0;
8ade6cc7e26175 Weidong Wang 2023-10-25  1850  }
8ade6cc7e26175 Weidong Wang 2023-10-25  1851  
8ade6cc7e26175 Weidong Wang 2023-10-25  1852  static int aw88399_i2c_probe(struct i2c_client *i2c)
8ade6cc7e26175 Weidong Wang 2023-10-25  1853  {
8ade6cc7e26175 Weidong Wang 2023-10-25  1854  	struct aw88399 *aw88399;
8ade6cc7e26175 Weidong Wang 2023-10-25  1855  	int ret;
8ade6cc7e26175 Weidong Wang 2023-10-25  1856  
8ade6cc7e26175 Weidong Wang 2023-10-25  1857  	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C))
8ade6cc7e26175 Weidong Wang 2023-10-25  1858  		return dev_err_probe(&i2c->dev, -ENXIO, "check_functionality failed");
8ade6cc7e26175 Weidong Wang 2023-10-25  1859  
8ade6cc7e26175 Weidong Wang 2023-10-25  1860  	aw88399 = devm_kzalloc(&i2c->dev, sizeof(*aw88399), GFP_KERNEL);
8ade6cc7e26175 Weidong Wang 2023-10-25  1861  	if (!aw88399)
8ade6cc7e26175 Weidong Wang 2023-10-25  1862  		return -ENOMEM;
8ade6cc7e26175 Weidong Wang 2023-10-25  1863  
8ade6cc7e26175 Weidong Wang 2023-10-25  1864  	mutex_init(&aw88399->lock);
8ade6cc7e26175 Weidong Wang 2023-10-25  1865  
8ade6cc7e26175 Weidong Wang 2023-10-25  1866  	i2c_set_clientdata(i2c, aw88399);
8ade6cc7e26175 Weidong Wang 2023-10-25  1867  
8ade6cc7e26175 Weidong Wang 2023-10-25 @1868  	aw88399->reset_gpio = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_LOW);
8ade6cc7e26175 Weidong Wang 2023-10-25  1869  	if (IS_ERR(aw88399->reset_gpio))
8ade6cc7e26175 Weidong Wang 2023-10-25  1870  		return dev_err_probe(&i2c->dev, PTR_ERR(aw88399->reset_gpio),
8ade6cc7e26175 Weidong Wang 2023-10-25  1871  							"reset gpio not defined\n");
8ade6cc7e26175 Weidong Wang 2023-10-25  1872  	aw88399_hw_reset(aw88399);
8ade6cc7e26175 Weidong Wang 2023-10-25  1873  
8ade6cc7e26175 Weidong Wang 2023-10-25  1874  	aw88399->regmap = devm_regmap_init_i2c(i2c, &aw88399_remap_config);
8ade6cc7e26175 Weidong Wang 2023-10-25  1875  	if (IS_ERR(aw88399->regmap))
8ade6cc7e26175 Weidong Wang 2023-10-25  1876  		return dev_err_probe(&i2c->dev, PTR_ERR(aw88399->regmap),
8ade6cc7e26175 Weidong Wang 2023-10-25  1877  							"failed to init regmap\n");
8ade6cc7e26175 Weidong Wang 2023-10-25  1878  
8ade6cc7e26175 Weidong Wang 2023-10-25  1879  	/* aw pa init */
8ade6cc7e26175 Weidong Wang 2023-10-25  1880  	ret = aw88399_init(aw88399, i2c, aw88399->regmap);
8ade6cc7e26175 Weidong Wang 2023-10-25  1881  	if (ret)
8ade6cc7e26175 Weidong Wang 2023-10-25  1882  		return ret;
8ade6cc7e26175 Weidong Wang 2023-10-25  1883  
8ade6cc7e26175 Weidong Wang 2023-10-25  1884  	ret = devm_snd_soc_register_component(&i2c->dev,
8ade6cc7e26175 Weidong Wang 2023-10-25  1885  			&soc_codec_dev_aw88399,
8ade6cc7e26175 Weidong Wang 2023-10-25  1886  			aw88399_dai, ARRAY_SIZE(aw88399_dai));
8ade6cc7e26175 Weidong Wang 2023-10-25  1887  	if (ret)
8ade6cc7e26175 Weidong Wang 2023-10-25  1888  		dev_err(&i2c->dev, "failed to register aw88399: %d", ret);
8ade6cc7e26175 Weidong Wang 2023-10-25  1889  
8ade6cc7e26175 Weidong Wang 2023-10-25  1890  	return ret;
8ade6cc7e26175 Weidong Wang 2023-10-25  1891  }
8ade6cc7e26175 Weidong Wang 2023-10-25  1892  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
