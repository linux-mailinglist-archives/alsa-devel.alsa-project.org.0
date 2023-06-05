Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9E1722ED2
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 20:37:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33C586C0;
	Mon,  5 Jun 2023 20:37:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33C586C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685990273;
	bh=UxuTBXyMznw+F+wdRlOGBW1X5FSgsoBb7veRn/CFfuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B583I+Aud0ftX1FGCZbchQQdA2ql2XKrF2Ga0kcBZ9yBmk1wWTkiGFG88Ti+qNdXP
	 6BtEU4aW6vi/izUizAPajdOtmrhhztaGxJYxDbr6csvYCXK7NSEvUKWgUfMS6VwPHH
	 RWmyJw2UH06+CFH4P38hl4r6+2kvo0smYNyiFoYA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AC0BF80130; Mon,  5 Jun 2023 20:37:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07BADF8016C;
	Mon,  5 Jun 2023 20:37:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31576F80199; Mon,  5 Jun 2023 20:36:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00C57F800ED
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 20:36:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00C57F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OfvJ6mky
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685990206; x=1717526206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UxuTBXyMznw+F+wdRlOGBW1X5FSgsoBb7veRn/CFfuY=;
  b=OfvJ6mky2zNHYDS9P8DuCX+sdER4vWxP1onLeoD8stHPK7DQOBSOoNGa
   xWU21H/QwMY3HbVIMJIrABtfmvnw9dXNDi0zG0Yfaa4TSNcMiqVAu8w9H
   IAgMo+PZnHsrOo7a/iIYj+jF0hZVDZY10e7mrTRy/kn/8yZyYDtc5kVQY
   Tas9Z0NLpGt3HPFeFaE/ga5XneJf9qND0FKPwskpVMXxhYaopkVTx77VZ
   z+333zWbVcT+NkCN3/1bgsyWZdC0Cqv5iqLUjuHLyPjA5Y5ANA8Ailyv8
   2yPUrJERAxizE40Hu2WP6o3kg7fapYM0Yo4nUAy4FzbTg5pcYzNAqCJh0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="353940841"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400";
   d="scan'208";a="353940841"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 11:36:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="821284370"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400";
   d="scan'208";a="821284370"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2023 11:36:20 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6F3z-0004MP-1V;
	Mon, 05 Jun 2023 18:36:19 +0000
Date: Tue, 6 Jun 2023 02:35:29 +0800
From: kernel test robot <lkp@intel.com>
To: YingKun Meng <mengyingkun@loongson.cn>, lgirdwood@gmail.com,
	broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn,
	Yingkun Meng <mengyingkun@loongson.cn>
Subject: Re: [PATCH 1/3] ASoC: Add support for Loongson I2S controller
Message-ID: <202306060223.9hdivLrx-lkp@intel.com>
References: <20230605120934.2306548-1-mengyingkun@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605120934.2306548-1-mengyingkun@loongson.cn>
Message-ID-Hash: VUP4NSJXEDIEPRHW5KY6547M35HBNANP
X-Message-ID-Hash: VUP4NSJXEDIEPRHW5KY6547M35HBNANP
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VUP4NSJXEDIEPRHW5KY6547M35HBNANP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi YingKun,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1fbcc5ab1c7a172ef1159b154c296fe1e9ce209b]

url:    https://github.com/intel-lab-lkp/linux/commits/YingKun-Meng/ASoC-loongson-Add-Loongson-Generic-ASoC-Sound-Card-Support/20230605-215940
base:   1fbcc5ab1c7a172ef1159b154c296fe1e9ce209b
patch link:    https://lore.kernel.org/r/20230605120934.2306548-1-mengyingkun%40loongson.cn
patch subject: [PATCH 1/3] ASoC: Add support for Loongson I2S controller
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230606/202306060223.9hdivLrx-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cb79a1df70a849f772428740eb3c155da83de25b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review YingKun-Meng/ASoC-loongson-Add-Loongson-Generic-ASoC-Sound-Card-Support/20230605-215940
        git checkout cb79a1df70a849f772428740eb3c155da83de25b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash sound/soc/loongson/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060223.9hdivLrx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/loongson/loongson_i2s_pci.c: In function 'dma_desc_save':
>> sound/soc/loongson/loongson_i2s_pci.c:82:17: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
      82 |         val |= (readq(order_reg) & DMA_ORDER_CTRL_MASK);
         |                 ^~~~~
         |                 readl
>> sound/soc/loongson/loongson_i2s_pci.c:84:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
      84 |         writeq(val, order_reg);
         |         ^~~~~~
         |         writel
   sound/soc/loongson/loongson_i2s_pci.c: In function 'loongson_pcm_hw_params':
>> sound/soc/loongson/loongson_i2s_pci.c:171:45: warning: right shift count >= width of type [-Wshift-count-overflow]
     171 |                 desc->order_hi = order_addr >> 32;
         |                                             ^~
   sound/soc/loongson/loongson_i2s_pci.c:174:43: warning: right shift count >= width of type [-Wshift-count-overflow]
     174 |                 desc->saddr_hi = mem_addr >> 32;
         |                                           ^~
   sound/soc/loongson/loongson_i2s_pci.c:190:57: warning: right shift count >= width of type [-Wshift-count-overflow]
     190 |                 desc->order_hi = prtd->dma_desc_arr_phy >> 32;
         |                                                         ^~
   sound/soc/loongson/loongson_i2s_pci.c: In function 'loongson_i2s_pci_probe':
>> sound/soc/loongson/loongson_i2s_pci.c:397:29: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     397 |         tx_data->dev_addr = (u64)i2s->reg_base + LS_I2S_TX_DATA;
         |                             ^
   sound/soc/loongson/loongson_i2s_pci.c:400:29: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     400 |         rx_data->dev_addr = (u64)i2s->reg_base + LS_I2S_RX_DATA;
         |                             ^
   cc1: some warnings being treated as errors


vim +82 sound/soc/loongson/loongson_i2s_pci.c

    74	
    75	static struct
    76	loongson_dma_desc *dma_desc_save(struct loongson_runtime_data *prtd)
    77	{
    78		void __iomem *order_reg = prtd->dma_data->order_addr;
    79		u64 val;
    80	
    81		val = (u64)prtd->dma_pos_desc_phy & DMA_ORDER_ASK_MASK;
  > 82		val |= (readq(order_reg) & DMA_ORDER_CTRL_MASK);
    83		val |= DMA_ORDER_ASK_VALID;
  > 84		writeq(val, order_reg);
    85	
    86		while (readl(order_reg) & DMA_ORDER_ASK_VALID)
    87			udelay(2);
    88	
    89		return prtd->dma_pos_desc;
    90	}
    91	
    92	static int loongson_pcm_trigger(struct snd_soc_component *component,
    93					struct snd_pcm_substream *substream, int cmd)
    94	{
    95		struct loongson_runtime_data *prtd = substream->runtime->private_data;
    96		struct device *dev = substream->pcm->card->dev;
    97		void __iomem *order_reg = prtd->dma_data->order_addr;
    98		u64 val;
    99		int ret = 0;
   100	
   101		switch (cmd) {
   102		case SNDRV_PCM_TRIGGER_START:
   103		case SNDRV_PCM_TRIGGER_RESUME:
   104		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
   105			val = prtd->dma_pos_desc_phy & DMA_ORDER_ASK_MASK;
   106			if (dev->coherent_dma_mask == DMA_BIT_MASK(64))
   107				val |= DMA_ORDER_ADDR_64;
   108			else
   109				val &= ~DMA_ORDER_ADDR_64;
   110			val |= (readq(order_reg) & DMA_ORDER_CTRL_MASK);
   111			val |= DMA_ORDER_START;
   112			writeq(val, order_reg);
   113	
   114			while ((readl(order_reg) & DMA_ORDER_START))
   115				udelay(2);
   116			break;
   117		case SNDRV_PCM_TRIGGER_STOP:
   118		case SNDRV_PCM_TRIGGER_SUSPEND:
   119		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
   120			dma_desc_save(prtd);
   121	
   122			/* dma stop */
   123			val = readq(order_reg) | DMA_ORDER_STOP;
   124			writeq(val, order_reg);
   125			udelay(1000);
   126	
   127			break;
   128		default:
   129			ret = -EINVAL;
   130		}
   131	
   132		return ret;
   133	}
   134	
   135	static int loongson_pcm_hw_params(struct snd_soc_component *component,
   136					  struct snd_pcm_substream *substream,
   137					  struct snd_pcm_hw_params *params)
   138	{
   139		struct snd_pcm_runtime *runtime = substream->runtime;
   140		struct loongson_runtime_data *prtd = runtime->private_data;
   141		size_t buf_len = params_buffer_bytes(params);
   142		size_t period_len = params_period_bytes(params);
   143		dma_addr_t order_addr, mem_addr;
   144		struct loongson_dma_desc *desc;
   145		u32 num_periods;
   146		int i;
   147	
   148		if (buf_len % period_len) {
   149			pr_err("buf len not multiply of period len\n");
   150			return -EINVAL;
   151		}
   152	
   153		num_periods = buf_len / period_len;
   154		if (!num_periods) {
   155			pr_err("dma data too small\n");
   156			return -EINVAL;
   157		}
   158	
   159		snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
   160		runtime->dma_bytes = buf_len;
   161	
   162		/* initialize dma descriptor array */
   163		mem_addr = runtime->dma_addr;
   164		order_addr = prtd->dma_desc_arr_phy;
   165		for (i = 0; i < num_periods; i++) {
   166			desc = &prtd->dma_desc_arr[i];
   167	
   168			/* next descriptor physical address */
   169			order_addr += sizeof(*desc);
   170			desc->order = order_addr | BIT(0);
 > 171			desc->order_hi = order_addr >> 32;
   172	
   173			desc->saddr = mem_addr;
   174			desc->saddr_hi = mem_addr >> 32;
   175			desc->daddr = prtd->dma_data->dev_addr;
   176	
   177			desc->cmd = BIT(0);
   178			if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
   179				desc->cmd |= BIT(12);
   180	
   181			desc->length = period_len >> 2;
   182			desc->step_length = 0;
   183			desc->step_times = 1;
   184	
   185			mem_addr += period_len;
   186		}
   187		if (num_periods > 0) {
   188			desc = &prtd->dma_desc_arr[num_periods - 1];
   189			desc->order = prtd->dma_desc_arr_phy | BIT(0);
   190			desc->order_hi = prtd->dma_desc_arr_phy >> 32;
   191		}
   192	
   193		/* init position descriptor */
   194		*prtd->dma_pos_desc = *prtd->dma_desc_arr;
   195	
   196		return 0;
   197	}
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
