Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C8282BFA6
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jan 2024 13:16:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6209E9F;
	Fri, 12 Jan 2024 13:16:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6209E9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705061773;
	bh=1k2499XItRg1tlyMWnQG35kaQ7TwWR/u9ALMUdX+Bjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TIu8nE5Sc5qb7+Zwpx5v2SVS5fS+gp3SrMMa3175FP5LfCFpJ8q9tWW0fS10T4d6y
	 SlHJKJ3o3ol05zmcHNM9zfQJQst12W6r23FrglDclV/gyOgHow2uCIgRKJSU1b1jJl
	 Bto035SSikuBrMJz64Z8pCCp9ql+JW/FevlAh2hI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B935F8058C; Fri, 12 Jan 2024 13:15:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E922CF8057B;
	Fri, 12 Jan 2024 13:15:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CF40F80254; Fri, 12 Jan 2024 13:15:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 365F7F8003A
	for <alsa-devel@alsa-project.org>; Fri, 12 Jan 2024 13:15:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 365F7F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NNYBJtUa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705061724; x=1736597724;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1k2499XItRg1tlyMWnQG35kaQ7TwWR/u9ALMUdX+Bjo=;
  b=NNYBJtUaEoL7sD3lS7AI2ev/2Ivv3js/f8jLfqe4H/IGe+bNdV0krhnr
   TZJZrQqpJtXMhA5UyDowWD238CDhWgFyD/QScsND2W1c6J+kjOfuFTpzR
   YrIYsm48B0g0dECRTXNVQdx//lD80TJTkxCOYTvrlnFY22n3K9SZ1u3/k
   RJoqTsCDpAN6Lc6ARqDbToHpX9jcwpseXY1CnjqDQWrLVSxaNOdyrl3K3
   M/Kmk5Kd0Zls4lhQ9nH4CgWpA9J+UJ+daReyFQmovSsmnBCcb47a+2639
   n648DDZToY7uOis2Zm3mh8KBpQ6OlQNBmpD7GKoyMETZSvn40UY4GG2Ou
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="398842323"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600";
   d="scan'208";a="398842323"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 04:15:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600";
   d="scan'208";a="31369005"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 12 Jan 2024 04:15:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOGRF-0009Rs-30;
	Fri, 12 Jan 2024 12:15:05 +0000
Date: Fri, 12 Jan 2024 20:14:34 +0800
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
Subject: Re: [PATCH 2/7] ASoC: mediatek: mt8173-afe-pcm: Use
 devm_snd_soc_register_component()
Message-ID: <202401122053.qrF0V1zz-lkp@intel.com>
References: <20240111105247.117766-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240111105247.117766-3-angelogioacchino.delregno@collabora.com>
Message-ID-Hash: CFUQLJMIYZBCU2W3PMAJJND3NCEYN5VG
X-Message-ID-Hash: CFUQLJMIYZBCU2W3PMAJJND3NCEYN5VG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CFUQLJMIYZBCU2W3PMAJJND3NCEYN5VG/>
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
[also build test WARNING on broonie-spi/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.7 next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/ASoC-mediatek-mt8173-afe-pcm-Convert-to-devm_pm_runtime_enable/20240111-185734
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240111105247.117766-3-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH 2/7] ASoC: mediatek: mt8173-afe-pcm: Use devm_snd_soc_register_component()
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240112/202401122053.qrF0V1zz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401122053.qrF0V1zz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401122053.qrF0V1zz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_pcm_dev_probe':
>> sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1055:46: warning: unused variable 'comp_hdmi' [-Wunused-variable]
    1055 |         struct snd_soc_component *comp_pcm, *comp_hdmi;
         |                                              ^~~~~~~~~
>> sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1055:35: warning: unused variable 'comp_pcm' [-Wunused-variable]
    1055 |         struct snd_soc_component *comp_pcm, *comp_hdmi;
         |                                   ^~~~~~~~


vim +/comp_hdmi +1055 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c

ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1048  
0d1d7a664288f9c sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1049  static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1050  {
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1051  	int ret, i;
d6e2c4ffdf67de6 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Arvind Yadav               2017-11-29  1052  	int irq_id;
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1053  	struct mtk_base_afe *afe;
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1054  	struct mt8173_afe_private *afe_priv;
8c32984bc7da298 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11 @1055  	struct snd_soc_component *comp_pcm, *comp_hdmi;
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1056  
fcde5a7eca1a28d sound/soc/mediatek/mtk-afe-pcm.c           PC Liao                    2016-01-12  1057  	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(33));
fcde5a7eca1a28d sound/soc/mediatek/mtk-afe-pcm.c           PC Liao                    2016-01-12  1058  	if (ret)
fcde5a7eca1a28d sound/soc/mediatek/mtk-afe-pcm.c           PC Liao                    2016-01-12  1059  		return ret;
fcde5a7eca1a28d sound/soc/mediatek/mtk-afe-pcm.c           PC Liao                    2016-01-12  1060  
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1061  	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1062  	if (!afe)
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1063  		return -ENOMEM;
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1064  
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1065  	afe->platform_priv = devm_kzalloc(&pdev->dev, sizeof(*afe_priv),
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1066  					  GFP_KERNEL);
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1067  	afe_priv = afe->platform_priv;
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1068  	if (!afe_priv)
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1069  		return -ENOMEM;
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1070  
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1071  	afe->dev = &pdev->dev;
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1072  
f9c058d14f4fe23 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda Delgado    2023-06-12  1073  	irq_id = platform_get_irq(pdev, 0);
f9c058d14f4fe23 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda Delgado    2023-06-12  1074  	if (irq_id <= 0)
f9c058d14f4fe23 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda Delgado    2023-06-12  1075  		return irq_id < 0 ? irq_id : -ENXIO;
f9c058d14f4fe23 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda Delgado    2023-06-12  1076  
fceef72b68d6359 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c YueHaibing                 2019-07-27  1077  	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1078  	if (IS_ERR(afe->base_addr))
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1079  		return PTR_ERR(afe->base_addr);
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1080  
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1081  	afe->regmap = devm_regmap_init_mmio(&pdev->dev, afe->base_addr,
0d1d7a664288f9c sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1082  		&mt8173_afe_regmap_config);
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1083  	if (IS_ERR(afe->regmap))
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1084  		return PTR_ERR(afe->regmap);
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1085  
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1086  	/* initial audio related clock */
0d1d7a664288f9c sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1087  	ret = mt8173_afe_init_audio_clk(afe);
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1088  	if (ret) {
0d1d7a664288f9c sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1089  		dev_err(afe->dev, "mt8173_afe_init_audio_clk fail\n");
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1090  		return ret;
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1091  	}
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1092  
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1093  	/* memif % irq initialize*/
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1094  	afe->memif_size = MT8173_AFE_MEMIF_NUM;
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1095  	afe->memif = devm_kcalloc(afe->dev, afe->memif_size,
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1096  				  sizeof(*afe->memif), GFP_KERNEL);
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1097  	if (!afe->memif)
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1098  		return -ENOMEM;
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1099  
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1100  	afe->irqs_size = MT8173_AFE_IRQ_NUM;
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1101  	afe->irqs = devm_kcalloc(afe->dev, afe->irqs_size,
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1102  				 sizeof(*afe->irqs), GFP_KERNEL);
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1103  	if (!afe->irqs)
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1104  		return -ENOMEM;
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1105  
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1106  	for (i = 0; i < afe->irqs_size; i++) {
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1107  		afe->memif[i].data = &memif_data[i];
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1108  		afe->irqs[i].irq_data = &irq_data[i];
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1109  		afe->irqs[i].irq_occupyed = true;
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1110  		afe->memif[i].irq_usage = i;
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1111  		afe->memif[i].const_irq = 1;
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1112  	}
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1113  
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1114  	afe->mtk_afe_hardware = &mt8173_afe_hardware;
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1115  	afe->memif_fs = mt8173_memif_fs;
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1116  	afe->irq_fs = mt8173_irq_fs;
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1117  
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1118  	platform_set_drvdata(pdev, afe);
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1119  
c1042de5f13fba4 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2024-01-11  1120  	ret = devm_pm_runtime_enable(&pdev->dev);
c1042de5f13fba4 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2024-01-11  1121  	if (ret) {
0d1d7a664288f9c sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1122  		ret = mt8173_afe_runtime_resume(&pdev->dev);
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1123  		if (ret)
c1042de5f13fba4 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2024-01-11  1124  			return ret;
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1125  	}
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1126  
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1127  	afe->reg_back_up_list = mt8173_afe_backup_list;
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1128  	afe->reg_back_up_list_num = ARRAY_SIZE(mt8173_afe_backup_list);
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1129  	afe->runtime_resume = mt8173_afe_runtime_resume;
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1130  	afe->runtime_suspend = mt8173_afe_runtime_suspend;
6b1e19d91d0bf30 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1131  
6d3a9de1e62bd25 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2024-01-11  1132  	ret = devm_snd_soc_register_component(&pdev->dev, &mtk_afe_pcm_platform, NULL, 0);
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1133  	if (ret)
c1042de5f13fba4 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2024-01-11  1134  		return ret;
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1135  
6d3a9de1e62bd25 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2024-01-11  1136  	ret = devm_snd_soc_register_component(&pdev->dev, &mt8173_afe_pcm_dai_component,
0d1d7a664288f9c sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1137  					      mt8173_afe_pcm_dais,
0d1d7a664288f9c sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1138  					      ARRAY_SIZE(mt8173_afe_pcm_dais));
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1139  	if (ret)
c1042de5f13fba4 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2024-01-11  1140  		return ret;
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1141  
6d3a9de1e62bd25 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2024-01-11  1142  	ret = devm_snd_soc_register_component(&pdev->dev, &mt8173_afe_hdmi_dai_component,
0d1d7a664288f9c sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1143  					      mt8173_afe_hdmi_dais,
0d1d7a664288f9c sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1144  					      ARRAY_SIZE(mt8173_afe_hdmi_dais));
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1145  	if (ret)
6d3a9de1e62bd25 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2024-01-11  1146  		return ret;
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1147  
4cbb264d4e9136a sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda            2022-11-28  1148  	ret = devm_request_irq(afe->dev, irq_id, mt8173_afe_irq_handler,
4cbb264d4e9136a sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda            2022-11-28  1149  			       0, "Afe_ISR_Handle", (void *)afe);
4cbb264d4e9136a sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda            2022-11-28  1150  	if (ret) {
4cbb264d4e9136a sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda            2022-11-28  1151  		dev_err(afe->dev, "could not request_irq\n");
6d3a9de1e62bd25 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2024-01-11  1152  		return ret;
4cbb264d4e9136a sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda            2022-11-28  1153  	}
4cbb264d4e9136a sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda            2022-11-28  1154  
0d1d7a664288f9c sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1155  	dev_info(&pdev->dev, "MT8173 AFE driver initialized.\n");
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1156  	return 0;
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1157  }
ee0bcaff109f36d sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
