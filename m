Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6994D15D167
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 06:14:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB8CC1674;
	Fri, 14 Feb 2020 06:13:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB8CC1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581657260;
	bh=pm4U4DpK/klAG7ly8BOGFzDQpMdqFI7QDf08LXba6hY=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=awnRoVxDinfThIjwYBId+oPO7CCYpHMp9m6tz2liShJOiVQ7C+hI0ElF+GHCJ4fEA
	 VyWGBjQrxiwnABSXYzInjlM6QcyPEYDwGfs+QvB5FdiD7xuxRpVOcNN5tSfI5QZ6sc
	 tohra9nrSTw3tlLdo4tZnlHvPu8jX1zhmleGKWr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78618F800F0;
	Fri, 14 Feb 2020 06:12:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2934F8014F; Fri, 14 Feb 2020 06:12:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 765C4F800F0
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 06:12:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 765C4F800F0
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2020 21:12:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,439,1574150400"; d="scan'208";a="234343122"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 13 Feb 2020 21:12:23 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1j2TH4-000Eh8-Ou; Fri, 14 Feb 2020 13:12:22 +0800
Date: Fri, 14 Feb 2020 13:11:31 +0800
From: kbuild test robot <lkp@intel.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Message-ID: <202002141324.cUMWV44e%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kbuild-all@lists.01.org
Subject: [alsa-devel] [asoc:for-5.7 65/70] sound/soc/meson/aiu.c:186:31-37:
 ERROR: application of sizeof to pointer
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7
head:   e37a0c313a0f8ba0b8de9c30db98fbc77bd8d446
commit: 6ae9ca9ce986bffe71fd0fbf9595de8500891b52 [65/70] ASoC: meson: aiu: add i2s and spdif support

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


coccinelle warnings: (new ones prefixed by >>)

>> sound/soc/meson/aiu.c:186:31-37: ERROR: application of sizeof to pointer
--
>> sound/soc/meson/aiu.c:298:2-9: line 298 is redundant because platform_get_irq() already prints an error
   sound/soc/meson/aiu.c:304:2-9: line 304 is redundant because platform_get_irq() already prints an error
--
>> sound/soc/meson/aiu.c:297:5-17: WARNING: Unsigned expression compared with zero: aiu -> i2s . irq < 0
>> sound/soc/meson/aiu.c:303:5-19: WARNING: Unsigned expression compared with zero: aiu -> spdif . irq < 0

vim +186 sound/soc/meson/aiu.c

   177	
   178	static int aiu_clk_bulk_get(struct device *dev,
   179				    const char * const *ids,
   180				    unsigned int num,
   181				    struct aiu_interface *interface)
   182	{
   183		struct clk_bulk_data *clks;
   184		int i, ret;
   185	
 > 186		clks = devm_kcalloc(dev, num, sizeof(clks), GFP_KERNEL);
   187		if (!clks)
   188			return -ENOMEM;
   189	
   190		for (i = 0; i < num; i++)
   191			clks[i].id = ids[i];
   192	
   193		ret = devm_clk_bulk_get(dev, num, clks);
   194		if (ret < 0)
   195			return ret;
   196	
   197		interface->clks = clks;
   198		interface->clk_num = num;
   199		return 0;
   200	}
   201	
   202	static const char * const aiu_i2s_ids[] = {
   203		[PCLK]	= "i2s_pclk",
   204		[AOCLK]	= "i2s_aoclk",
   205		[MCLK]	= "i2s_mclk",
   206		[MIXER]	= "i2s_mixer",
   207	};
   208	
   209	static const char * const aiu_spdif_ids[] = {
   210		[PCLK]	= "spdif_pclk",
   211		[AOCLK]	= "spdif_aoclk",
   212		[MCLK]	= "spdif_mclk_sel"
   213	};
   214	
   215	static int aiu_clk_get(struct device *dev)
   216	{
   217		struct aiu *aiu = dev_get_drvdata(dev);
   218		int ret;
   219	
   220		aiu->pclk = devm_clk_get(dev, "pclk");
   221		if (IS_ERR(aiu->pclk)) {
   222			if (PTR_ERR(aiu->pclk) != -EPROBE_DEFER)
   223				dev_err(dev, "Can't get the aiu pclk\n");
   224			return PTR_ERR(aiu->pclk);
   225		}
   226	
   227		aiu->spdif_mclk = devm_clk_get(dev, "spdif_mclk");
   228		if (IS_ERR(aiu->spdif_mclk)) {
   229			if (PTR_ERR(aiu->spdif_mclk) != -EPROBE_DEFER)
   230				dev_err(dev, "Can't get the aiu spdif master clock\n");
   231			return PTR_ERR(aiu->spdif_mclk);
   232		}
   233	
   234		ret = aiu_clk_bulk_get(dev, aiu_i2s_ids, ARRAY_SIZE(aiu_i2s_ids),
   235				       &aiu->i2s);
   236		if (ret) {
   237			if (ret != -EPROBE_DEFER)
   238				dev_err(dev, "Can't get the i2s clocks\n");
   239			return ret;
   240		}
   241	
   242		ret = aiu_clk_bulk_get(dev, aiu_spdif_ids, ARRAY_SIZE(aiu_spdif_ids),
   243				       &aiu->spdif);
   244		if (ret) {
   245			if (ret != -EPROBE_DEFER)
   246				dev_err(dev, "Can't get the spdif clocks\n");
   247			return ret;
   248		}
   249	
   250		ret = clk_prepare_enable(aiu->pclk);
   251		if (ret) {
   252			dev_err(dev, "peripheral clock enable failed\n");
   253			return ret;
   254		}
   255	
   256		ret = devm_add_action_or_reset(dev,
   257					       (void(*)(void *))clk_disable_unprepare,
   258					       aiu->pclk);
   259		if (ret)
   260			dev_err(dev, "failed to add reset action on pclk");
   261	
   262		return ret;
   263	}
   264	
   265	static int aiu_probe(struct platform_device *pdev)
   266	{
   267		struct device *dev = &pdev->dev;
   268		void __iomem *regs;
   269		struct regmap *map;
   270		struct aiu *aiu;
   271		int ret;
   272	
   273		aiu = devm_kzalloc(dev, sizeof(*aiu), GFP_KERNEL);
   274		if (!aiu)
   275			return -ENOMEM;
   276		platform_set_drvdata(pdev, aiu);
   277	
   278		ret = device_reset(dev);
   279		if (ret) {
   280			if (ret != -EPROBE_DEFER)
   281				dev_err(dev, "Failed to reset device\n");
   282			return ret;
   283		}
   284	
   285		regs = devm_platform_ioremap_resource(pdev, 0);
   286		if (IS_ERR(regs))
   287			return PTR_ERR(regs);
   288	
   289		map = devm_regmap_init_mmio(dev, regs, &aiu_regmap_cfg);
   290		if (IS_ERR(map)) {
   291			dev_err(dev, "failed to init regmap: %ld\n",
   292				PTR_ERR(map));
   293			return PTR_ERR(map);
   294		}
   295	
   296		aiu->i2s.irq = platform_get_irq_byname(pdev, "i2s");
 > 297		if (aiu->i2s.irq < 0) {
 > 298			dev_err(dev, "Can't get i2s irq\n");
   299			return aiu->i2s.irq;
   300		}
   301	
   302		aiu->spdif.irq = platform_get_irq_byname(pdev, "spdif");
 > 303		if (aiu->spdif.irq < 0) {
   304			dev_err(dev, "Can't get spdif irq\n");
   305			return aiu->spdif.irq;
   306		}
   307	
   308		ret = aiu_clk_get(dev);
   309		if (ret)
   310			return ret;
   311	
   312		/* Register the cpu component of the aiu */
   313		ret = snd_soc_register_component(dev, &aiu_cpu_component,
   314						 aiu_cpu_dai_drv,
   315						 ARRAY_SIZE(aiu_cpu_dai_drv));
   316		if (ret)
   317			dev_err(dev, "Failed to register cpu component\n");
   318	
   319		return ret;
   320	}
   321	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
