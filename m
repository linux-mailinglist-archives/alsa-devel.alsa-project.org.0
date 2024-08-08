Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC25F94C6EE
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 00:19:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FE18BC0;
	Fri,  9 Aug 2024 00:19:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FE18BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723155573;
	bh=dkBBAPHvAZBQsYnnm/hRvZvf6GqN8xomrejp5POxLb4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=imoZqZ9zA2say2+TZfCD7hwb1ohmvOcmwMOQQKnhoorG/XQKqMV0qYEueqOjsg6uJ
	 VLxa2bQ3ICIOrWHgtHyKlNuH2lsqzwC5Y1QJzmRatVAYPRCXt74NZGjEpPR3aVh8vZ
	 o3uWg6E8lnrvDXLy742iS3zwNVq/hBzVaV9M7fwY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2676F805D9; Fri,  9 Aug 2024 00:18:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 275F8F805D8;
	Fri,  9 Aug 2024 00:18:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33641F802DB; Fri,  9 Aug 2024 00:18:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51D0FF800BF
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 00:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51D0FF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KUNdthgO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723155474; x=1754691474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dkBBAPHvAZBQsYnnm/hRvZvf6GqN8xomrejp5POxLb4=;
  b=KUNdthgOPCZCVASQBGWU4cx480ZxakgOb5PC+oyW68YAHq33iEhvV8jy
   9o6YU87A8LPjaxG5wUIxdO4NULpyV+s0gr+oUlPu80qHD4OBFRcjd/T1f
   xFkC7PaRGGem8/XFL8vTM26zLZeASzPUXw+ezVu2TA6ygA0JbunrWRNnl
   1/M+E4G8dBPTJCLBhZHoj6Nb1FrcolIbWY/RIXCGoYHu3KL9TKq70cOzU
   2Aa5iKgfdtYQ8z6JtUoc+KSAGB+MrlWKTKtF+kkYrIvNfaBqLtqTOjwOu
   TABjDQrJf20SrnBuGpOlFxHjCqXnnFL8DfP6On/vF9AvvKSMKu7pD9enk
   w==;
X-CSE-ConnectionGUID: HIGkcY4pROysTi33a8OCsg==
X-CSE-MsgGUID: Rp7OKhcLS3KBzCVJjC0rUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43827894"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800";
   d="scan'208";a="43827894"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 15:17:47 -0700
X-CSE-ConnectionGUID: hc4F4SfDRcyttGfw4c2oYg==
X-CSE-MsgGUID: +6Z3ELm3Qeekl2mnFaW9sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800";
   d="scan'208";a="57604307"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 08 Aug 2024 15:17:45 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scBS2-0006Ys-1n;
	Thu, 08 Aug 2024 22:17:42 +0000
Date: Fri, 9 Aug 2024 06:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: [tiwai-sound:for-next 73/83] sound/sparc/cs4231.c:2018:25: error:
 'chpi' undeclared; did you mean 'chip'?
Message-ID: <202408090648.J2EAijjH-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: XUZWGXUAO25UWTITJFLCKAJAJQ33DMNA
X-Message-ID-Hash: XUZWGXUAO25UWTITJFLCKAJAJQ33DMNA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XUZWGXUAO25UWTITJFLCKAJAJQ33DMNA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   c46fc83e3f3c89f18962e43890de90b1c304747a
commit: d41abde894830bfb77252653f606473728e930eb [73/83] ALSA: sparc: Use standard print API
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20240809/202408090648.J2EAijjH-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090648.J2EAijjH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090648.J2EAijjH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from sound/sparc/cs4231.c:21:
   sound/sparc/cs4231.c: In function 'snd_cs4231_ebus_create':
>> sound/sparc/cs4231.c:2018:25: error: 'chpi' undeclared (first use in this function); did you mean 'chip'?
    2018 |                 dev_dbg(chpi->card->dev,
         |                         ^~~~
   include/linux/dev_printk.h:139:44: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                            ^~~
   sound/sparc/cs4231.c:2018:17: note: in expansion of macro 'dev_dbg'
    2018 |                 dev_dbg(chpi->card->dev,
         |                 ^~~~~~~
   sound/sparc/cs4231.c:2018:25: note: each undeclared identifier is reported only once for each function it appears in
    2018 |                 dev_dbg(chpi->card->dev,
         |                         ^~~~
   include/linux/dev_printk.h:139:44: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                            ^~~
   sound/sparc/cs4231.c:2018:17: note: in expansion of macro 'dev_dbg'
    2018 |                 dev_dbg(chpi->card->dev,
         |                 ^~~~~~~


vim +2018 sound/sparc/cs4231.c

  1950	
  1951	static int snd_cs4231_ebus_create(struct snd_card *card,
  1952					  struct platform_device *op,
  1953					  int dev)
  1954	{
  1955		struct snd_cs4231 *chip = card->private_data;
  1956		int err;
  1957	
  1958		spin_lock_init(&chip->lock);
  1959		spin_lock_init(&chip->c_dma.ebus_info.lock);
  1960		spin_lock_init(&chip->p_dma.ebus_info.lock);
  1961		mutex_init(&chip->mce_mutex);
  1962		mutex_init(&chip->open_mutex);
  1963		chip->flags |= CS4231_FLAG_EBUS;
  1964		chip->op = op;
  1965		memcpy(&chip->image, &snd_cs4231_original_image,
  1966		       sizeof(snd_cs4231_original_image));
  1967		strcpy(chip->c_dma.ebus_info.name, "cs4231(capture)");
  1968		chip->c_dma.ebus_info.flags = EBUS_DMA_FLAG_USE_EBDMA_HANDLER;
  1969		chip->c_dma.ebus_info.callback = snd_cs4231_ebus_capture_callback;
  1970		chip->c_dma.ebus_info.client_cookie = chip;
  1971		chip->c_dma.ebus_info.irq = op->archdata.irqs[0];
  1972		strcpy(chip->p_dma.ebus_info.name, "cs4231(play)");
  1973		chip->p_dma.ebus_info.flags = EBUS_DMA_FLAG_USE_EBDMA_HANDLER;
  1974		chip->p_dma.ebus_info.callback = snd_cs4231_ebus_play_callback;
  1975		chip->p_dma.ebus_info.client_cookie = chip;
  1976		chip->p_dma.ebus_info.irq = op->archdata.irqs[1];
  1977	
  1978		chip->p_dma.prepare = _ebus_dma_prepare;
  1979		chip->p_dma.enable = _ebus_dma_enable;
  1980		chip->p_dma.request = _ebus_dma_request;
  1981		chip->p_dma.address = _ebus_dma_addr;
  1982	
  1983		chip->c_dma.prepare = _ebus_dma_prepare;
  1984		chip->c_dma.enable = _ebus_dma_enable;
  1985		chip->c_dma.request = _ebus_dma_request;
  1986		chip->c_dma.address = _ebus_dma_addr;
  1987	
  1988		chip->port = of_ioremap(&op->resource[0], 0, 0x10, "cs4231");
  1989		chip->p_dma.ebus_info.regs =
  1990			of_ioremap(&op->resource[1], 0, 0x10, "cs4231_pdma");
  1991		chip->c_dma.ebus_info.regs =
  1992			of_ioremap(&op->resource[2], 0, 0x10, "cs4231_cdma");
  1993		if (!chip->port || !chip->p_dma.ebus_info.regs ||
  1994		    !chip->c_dma.ebus_info.regs) {
  1995			snd_cs4231_ebus_free(chip);
  1996			dev_dbg(chip->card->dev,
  1997				"cs4231-%d: Unable to map chip registers.\n", dev);
  1998			return -EIO;
  1999		}
  2000	
  2001		if (ebus_dma_register(&chip->c_dma.ebus_info)) {
  2002			snd_cs4231_ebus_free(chip);
  2003			dev_dbg(chip->card->dev,
  2004				"cs4231-%d: Unable to register EBUS capture DMA\n",
  2005				dev);
  2006			return -EBUSY;
  2007		}
  2008		if (ebus_dma_irq_enable(&chip->c_dma.ebus_info, 1)) {
  2009			snd_cs4231_ebus_free(chip);
  2010			dev_dbg(chip->card->dev,
  2011				"cs4231-%d: Unable to enable EBUS capture IRQ\n",
  2012				dev);
  2013			return -EBUSY;
  2014		}
  2015	
  2016		if (ebus_dma_register(&chip->p_dma.ebus_info)) {
  2017			snd_cs4231_ebus_free(chip);
> 2018			dev_dbg(chpi->card->dev,
  2019				"cs4231-%d: Unable to register EBUS play DMA\n",
  2020				dev);
  2021			return -EBUSY;
  2022		}
  2023		if (ebus_dma_irq_enable(&chip->p_dma.ebus_info, 1)) {
  2024			snd_cs4231_ebus_free(chip);
  2025			dev_dbg(chip->card->dev,
  2026				"cs4231-%d: Unable to enable EBUS play IRQ\n", dev);
  2027			return -EBUSY;
  2028		}
  2029	
  2030		if (snd_cs4231_probe(chip) < 0) {
  2031			snd_cs4231_ebus_free(chip);
  2032			return -ENODEV;
  2033		}
  2034		snd_cs4231_init(chip);
  2035	
  2036		err = snd_device_new(card, SNDRV_DEV_LOWLEVEL,
  2037				     chip, &snd_cs4231_ebus_dev_ops);
  2038		if (err < 0) {
  2039			snd_cs4231_ebus_free(chip);
  2040			return err;
  2041		}
  2042	
  2043		return 0;
  2044	}
  2045	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
