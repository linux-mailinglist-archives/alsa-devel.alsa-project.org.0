Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF6B45D5DC
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 08:59:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B733B1843;
	Thu, 25 Nov 2021 08:58:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B733B1843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637827144;
	bh=sJ8Txe4SoEA9uCaOjye83wBldQa/ifsK2uHBvvIdnGs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lf/Tu7GvyaCPsNd9PV9ZbeLzEgdnPPQGd3nCaQdFxHd79ldPPHg3JgMNMHA4S4MLD
	 48AaUoCbotNz4YXHNuOVqXfCo4ny+S1CUJ7rLSOkxbh7XurUGZfRsyMd16bxxVIPM3
	 NyNkQP6Z2GFoEfxzrBwtfXzkxihe89YjhDj6lSY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49329F804AB;
	Thu, 25 Nov 2021 08:57:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04B8AF8049E; Thu, 25 Nov 2021 08:57:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_14,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FFE9F80302
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 08:57:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FFE9F80302
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="215491145"
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; d="scan'208";a="215491145"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 23:57:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; d="scan'208";a="741636594"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 24 Nov 2021 23:57:28 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mq9dG-000607-RJ; Thu, 25 Nov 2021 07:57:26 +0000
Date: Thu, 25 Nov 2021 15:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 07/11] dmaengine: qcom-adm: stop abusing slave_id config
Message-ID: <202111251538.x6sJNCka-lkp@intel.com>
References: <20211115085403.360194-8-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115085403.360194-8-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, linux-spi@vger.kernel.org,
 Robert Jarzmik <robert.jarzmik@free.fr>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Arnd,

I love your patch! Perhaps something to improve:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on tiwai-sound/for-next staging/staging-testing linus/master v5.16-rc2 next-20211125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Arnd-Bergmann/dmaengine-kill-off-dma_slave_config-slave_id/20211115-165731
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
config: riscv-randconfig-r016-20211115 (https://download.01.org/0day-ci/archive/20211125/202111251538.x6sJNCka-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project fbe72e41b99dc7994daac300d208a955be3e4a0a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/f2e7f9ee67ce784864f75db39f20d1060c932279
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Arnd-Bergmann/dmaengine-kill-off-dma_slave_config-slave_id/20211115-165731
        git checkout f2e7f9ee67ce784864f75db39f20d1060c932279
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=riscv 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/dma/qcom/qcom_adm.c:712:18: warning: no previous prototype for function 'adm_dma_xlate' [-Wmissing-prototypes]
   struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
                    ^
   drivers/dma/qcom/qcom_adm.c:712:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
   ^
   static 
   1 warning generated.


vim +/adm_dma_xlate +712 drivers/dma/qcom/qcom_adm.c

   700	
   701	/**
   702	 * adm_dma_xlate
   703	 * @dma_spec:	pointer to DMA specifier as found in the device tree
   704	 * @ofdma:	pointer to DMA controller data
   705	 *
   706	 * This can use either 1-cell or 2-cell formats, the first cell
   707	 * identifies the slave device, while the optional second cell
   708	 * contains the crci value.
   709	 *
   710	 * Returns pointer to appropriate dma channel on success or NULL on error.
   711	 */
 > 712	struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
   713				       struct of_dma *ofdma)
   714	{
   715		struct dma_device *dev = ofdma->of_dma_data;
   716		struct dma_chan *chan, *candidate = NULL;
   717		struct adm_chan *achan;
   718	
   719		if (!dev || dma_spec->args_count > 2)
   720			return NULL;
   721	
   722		list_for_each_entry(chan, &dev->channels, device_node)
   723			if (chan->chan_id == dma_spec->args[0]) {
   724				candidate = chan;
   725				break;
   726			}
   727	
   728		if (!candidate)
   729			return NULL;
   730	
   731		achan = to_adm_chan(candidate);
   732		if (dma_spec->args_count == 2)
   733			achan->crci = dma_spec->args[1];
   734		else
   735			achan->crci = 0;
   736	
   737		return dma_get_slave_channel(candidate);
   738	}
   739	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
