Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B0482B9E4
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jan 2024 04:15:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87ED4EB6;
	Fri, 12 Jan 2024 04:15:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87ED4EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705029343;
	bh=cwgXaGkg+9dlKT7vM6fOfd1vb77DgMTDItkjEAJYj2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZW3oliu+TsVNHsAR/0GN1mlcF5abcnUKyEEPkM49zCXjkpa7I5B8B2P5Sbp1Wq721
	 PczMzceqwsYs7ZZGdQsK9AXDId6Lz0qDFJJqlq6/cYyDwmBHV1Lhnh/LKqNdVxUcvF
	 esrbtoxsmb5DWAaunVWFEuOaldR/MO61wi3ItNVU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFDA0F805AE; Fri, 12 Jan 2024 04:15:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DFC0F8057E;
	Fri, 12 Jan 2024 04:15:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2912F80254; Fri, 12 Jan 2024 04:15:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56BDEF8003A
	for <alsa-devel@alsa-project.org>; Fri, 12 Jan 2024 04:14:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56BDEF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Dp9Y0YFs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705029287; x=1736565287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cwgXaGkg+9dlKT7vM6fOfd1vb77DgMTDItkjEAJYj2w=;
  b=Dp9Y0YFsdEfUZ7OV4Q2fh/SneWRS/MDmD3UUg73/L4sZlg4IO3QGZRnb
   eLu0ItPQNiAzs8Vf+nFzWIq8gfKAFoW7LJaZ6gXTM6Iq3cqrZ2NDrsTQS
   pBdojoMDi6qExkID/1vf0mwXd78OrlV8IQ3yU2v/YQjxaFngXIzNfUMEQ
   upipU8U98wOHGegppNCak7k2zDM5Twm6Uv2lr+W9dtPNKvJFju/AHRsW3
   781XlWbAMnbCnrb3MrGBeR5LuHzyhIaIhjK6IVOTw4clLQtF5W29b4KMP
   UFNXsxlgvWsaCNaNAFpENVMaR0xdYqnRcGsfmHIrHQa9nz4uKfq1REDrz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="397948525"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600";
   d="scan'208";a="397948525"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 19:14:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="732453627"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600";
   d="scan'208";a="732453627"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Jan 2024 19:14:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rO80A-000906-0B;
	Fri, 12 Jan 2024 03:14:34 +0000
Date: Fri, 12 Jan 2024 11:13:54 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ribalda@chromium.org,
	nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
	kuninori.morimoto.gx@renesas.com, nfraprado@collabora.com,
	alsa-devel@alsa-project.org, trevor.wu@mediatek.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 6/7] ASoC: mediatek: mt8192-afe-pcm: Simplify with
 dev_err_probe()
Message-ID: <202401121019.EC2g0hQM-lkp@intel.com>
References: <20240111105247.117766-7-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240111105247.117766-7-angelogioacchino.delregno@collabora.com>
Message-ID-Hash: V5NAYOKL35QK35HDUQTZHBMPBQAY3XSJ
X-Message-ID-Hash: V5NAYOKL35QK35HDUQTZHBMPBQAY3XSJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V5NAYOKL35QK35HDUQTZHBMPBQAY3XSJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on broonie-spi/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.7 next-20240111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/ASoC-mediatek-mt8173-afe-pcm-Convert-to-devm_pm_runtime_enable/20240111-185734
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240111105247.117766-7-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH 6/7] ASoC: mediatek: mt8192-afe-pcm: Simplify with dev_err_probe()
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240112/202401121019.EC2g0hQM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401121019.EC2g0hQM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401121019.EC2g0hQM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/mediatek/mt8192/mt8192-afe-pcm.c: In function 'mt8192_afe_pcm_dev_probe':
>> sound/soc/mediatek/mt8192/mt8192-afe-pcm.c:2284:67: warning: format '%d' expects a matching 'int' argument [-Wformat=]
    2284 |                         return dev_err_probe(afe->dev, ret, "dai %d register fail");
         |                                                                  ~^
         |                                                                   |
         |                                                                   int


vim +2284 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c

  2172	
  2173	static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
  2174	{
  2175		struct mtk_base_afe *afe;
  2176		struct mt8192_afe_private *afe_priv;
  2177		struct device *dev;
  2178		struct reset_control *rstc;
  2179		int i, ret, irq_id;
  2180	
  2181		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
  2182		if (ret)
  2183			return ret;
  2184	
  2185		afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
  2186		if (!afe)
  2187			return -ENOMEM;
  2188		platform_set_drvdata(pdev, afe);
  2189	
  2190		afe->platform_priv = devm_kzalloc(&pdev->dev, sizeof(*afe_priv),
  2191						  GFP_KERNEL);
  2192		if (!afe->platform_priv)
  2193			return -ENOMEM;
  2194		afe_priv = afe->platform_priv;
  2195	
  2196		afe->dev = &pdev->dev;
  2197		dev = afe->dev;
  2198	
  2199		/* init audio related clock */
  2200		ret = mt8192_init_clock(afe);
  2201		if (ret) {
  2202			dev_err(dev, "init clock error\n");
  2203			return ret;
  2204		}
  2205	
  2206		/* reset controller to reset audio regs before regmap cache */
  2207		rstc = devm_reset_control_get_exclusive(dev, "audiosys");
  2208		if (IS_ERR(rstc))
  2209			return dev_err_probe(dev, PTR_ERR(rstc), "could not get audiosys reset\n");
  2210	
  2211		ret = reset_control_reset(rstc);
  2212		if (ret)
  2213			return dev_err_probe(dev, ret, "failed to trigger audio reset\n");
  2214	
  2215		ret = devm_pm_runtime_enable(&pdev->dev);
  2216		if (ret)
  2217			return ret;
  2218	
  2219		/* regmap init */
  2220		afe->regmap = syscon_node_to_regmap(dev->parent->of_node);
  2221		if (IS_ERR(afe->regmap))
  2222			return dev_err_probe(dev, PTR_ERR(afe->regmap),
  2223					     "could not get regmap from parent");
  2224	
  2225		ret = regmap_attach_dev(dev, afe->regmap, &mt8192_afe_regmap_config);
  2226		if (ret)
  2227			return dev_err_probe(dev, ret, "regmap_attach_dev fail\n");
  2228	
  2229		/* enable clock for regcache get default value from hw */
  2230		afe_priv->pm_runtime_bypass_reg_ctl = true;
  2231		pm_runtime_get_sync(&pdev->dev);
  2232	
  2233		ret = regmap_reinit_cache(afe->regmap, &mt8192_afe_regmap_config);
  2234		if (ret)
  2235			return dev_err_probe(dev, ret, "regmap_reinit_cache fail\n");
  2236	
  2237		pm_runtime_put_sync(&pdev->dev);
  2238		afe_priv->pm_runtime_bypass_reg_ctl = false;
  2239	
  2240		regcache_cache_only(afe->regmap, true);
  2241		regcache_mark_dirty(afe->regmap);
  2242	
  2243		/* init memif */
  2244		afe->memif_size = MT8192_MEMIF_NUM;
  2245		afe->memif = devm_kcalloc(dev, afe->memif_size, sizeof(*afe->memif),
  2246					  GFP_KERNEL);
  2247		if (!afe->memif)
  2248			return -ENOMEM;
  2249	
  2250		for (i = 0; i < afe->memif_size; i++) {
  2251			afe->memif[i].data = &memif_data[i];
  2252			afe->memif[i].irq_usage = memif_irq_usage[i];
  2253			afe->memif[i].const_irq = 1;
  2254		}
  2255	
  2256		mutex_init(&afe->irq_alloc_lock);	/* needed when dynamic irq */
  2257	
  2258		/* init irq */
  2259		afe->irqs_size = MT8192_IRQ_NUM;
  2260		afe->irqs = devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs),
  2261					 GFP_KERNEL);
  2262		if (!afe->irqs)
  2263			return -ENOMEM;
  2264	
  2265		for (i = 0; i < afe->irqs_size; i++)
  2266			afe->irqs[i].irq_data = &irq_data[i];
  2267	
  2268		/* request irq */
  2269		irq_id = platform_get_irq(pdev, 0);
  2270		if (irq_id < 0)
  2271			return irq_id;
  2272	
  2273		ret = devm_request_irq(dev, irq_id, mt8192_afe_irq_handler,
  2274				       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
  2275		if (ret)
  2276			return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
  2277	
  2278		/* init sub_dais */
  2279		INIT_LIST_HEAD(&afe->sub_dais);
  2280	
  2281		for (i = 0; i < ARRAY_SIZE(dai_register_cbs); i++) {
  2282			ret = dai_register_cbs[i](afe);
  2283			if (ret)
> 2284				return dev_err_probe(afe->dev, ret, "dai %d register fail");
  2285		}
  2286	
  2287		/* init dai_driver and component_driver */
  2288		ret = mtk_afe_combine_sub_dai(afe);
  2289		if (ret)
  2290			return dev_err_probe(afe->dev, ret, "mtk_afe_combine_sub_dai fail\n");
  2291	
  2292		/* others */
  2293		afe->mtk_afe_hardware = &mt8192_afe_hardware;
  2294		afe->memif_fs = mt8192_memif_fs;
  2295		afe->irq_fs = mt8192_irq_fs;
  2296		afe->get_dai_fs = mt8192_get_dai_fs;
  2297		afe->get_memif_pbuf_size = mt8192_get_memif_pbuf_size;
  2298		afe->memif_32bit_supported = 1;
  2299	
  2300		afe->runtime_resume = mt8192_afe_runtime_resume;
  2301		afe->runtime_suspend = mt8192_afe_runtime_suspend;
  2302	
  2303		/* register platform */
  2304		ret = devm_snd_soc_register_component(&pdev->dev,
  2305						      &mt8192_afe_component, NULL, 0);
  2306		if (ret)
  2307			return dev_err_probe(dev, ret, "Couldn't register AFE component\n");
  2308	
  2309		ret = devm_snd_soc_register_component(&pdev->dev,
  2310						      &mt8192_afe_pcm_component,
  2311						      afe->dai_drivers,
  2312						      afe->num_dai_drivers);
  2313		if (ret)
  2314			return dev_err_probe(dev, ret, "Couldn't register AFE-PCM component\n");
  2315	
  2316		return 0;
  2317	}
  2318	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
