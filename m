Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE014C1B05
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 19:36:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1258B191E;
	Wed, 23 Feb 2022 19:35:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1258B191E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645641366;
	bh=hYE64FDl6K6kQJWJlpwZ7YzJ0HVW33P+k3nNd98unpw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ucZTR3XGo1zxkU8Dpy38zBh9cjQDuarUxamumSRKIVBqjM/OnsZHZy5UMFhsz4Z80
	 tDq1ecIJzVmUMbGyPT5TD7SCDXasuo++AcV25xqdSrDMV3fj33g50mHjvf6nnwXX1y
	 b8pbC77zyn3qnNI3n9xM6ELRy7jtV8KArdd235zE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49432F8025D;
	Wed, 23 Feb 2022 19:34:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27F78F80237; Wed, 23 Feb 2022 19:34:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E31A7F80118
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 19:34:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E31A7F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WXfdRAib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645641294; x=1677177294;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hYE64FDl6K6kQJWJlpwZ7YzJ0HVW33P+k3nNd98unpw=;
 b=WXfdRAibgXIrqeCcJQ6XcMmWeUs/OMoD9eUPCQAW+ElQ26c3f+w9wsNx
 N0MbGXfWAaLmy48uJ8smo/MJGzoOwepQSIue1pipEV8lQ5v0e5u+bIhYK
 FVyGARGgnIe+/OB6GcxCSguvI7y7REs85tqwDc6VpUjw9ctg/c/MROIYw
 yeCZ7w3+XsWUX5oLDfn1vSg5bZAoyFfl5hpDESdJy2k306WtEHg4z8eMN
 ocZ1INdha/8LgoJukGBnwxLjH0lmEfq5P11tywWz8jSGRM1YwggZ1hxo1
 9Vh/puGYXcEp4eLvkZTjHcLyiz62cju5swU44H4Xcn3BG8sUUw1ekxz8W Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="251788725"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="251788725"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 10:34:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="628190773"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Feb 2022 10:34:42 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nMwTJ-0001hU-Nb; Wed, 23 Feb 2022 18:34:41 +0000
Date: Thu, 24 Feb 2022 02:34:29 +0800
From: kernel test robot <lkp@intel.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/9] ASoC: amd: vg: fix for pm resume callback sequence
Message-ID: <202202240237.RkL3TEe3-lkp@intel.com>
References: <20220223071959.13539-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223071959.13539-1-Vijendar.Mukunda@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, kbuild-all@lists.01.org, wtli@nuvoton.com,
 open list <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Takashi Iwai <tiwai@suse.com>, krisman@collabora.com
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

Hi Vijendar,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on v5.17-rc5 next-20220222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Vijendar-Mukunda/ASoC-amd-vg-fix-for-pm-resume-callback-sequence/20220223-152636
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220224/202202240237.RkL3TEe3-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/43c5f728cf59371b29569d941fb2ef2bdc3a279d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Vijendar-Mukunda/ASoC-amd-vg-fix-for-pm-resume-callback-sequence/20220223-152636
        git checkout 43c5f728cf59371b29569d941fb2ef2bdc3a279d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/amd/vangogh/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/amd/vangogh/acp5x-pcm-dma.c:430:20: warning: variable 'frmt_val' set but not used [-Wunused-but-set-variable]
           u32 val, reg_val, frmt_val;
                             ^
>> sound/soc/amd/vangogh/acp5x-pcm-dma.c:430:11: warning: variable 'reg_val' set but not used [-Wunused-but-set-variable]
           u32 val, reg_val, frmt_val;
                    ^
   2 warnings generated.


vim +/frmt_val +430 sound/soc/amd/vangogh/acp5x-pcm-dma.c

361414dc1f07b7 Vijendar Mukunda 2021-07-21  425  
361414dc1f07b7 Vijendar Mukunda 2021-07-21  426  static int __maybe_unused acp5x_pcm_resume(struct device *dev)
361414dc1f07b7 Vijendar Mukunda 2021-07-21  427  {
361414dc1f07b7 Vijendar Mukunda 2021-07-21  428  	struct i2s_dev_data *adata;
43c5f728cf5937 Vijendar Mukunda 2022-02-23  429  	struct i2s_stream_instance *rtd;
361414dc1f07b7 Vijendar Mukunda 2021-07-21 @430  	u32 val, reg_val, frmt_val;
361414dc1f07b7 Vijendar Mukunda 2021-07-21  431  
361414dc1f07b7 Vijendar Mukunda 2021-07-21  432  	reg_val = 0;
361414dc1f07b7 Vijendar Mukunda 2021-07-21  433  	frmt_val = 0;
361414dc1f07b7 Vijendar Mukunda 2021-07-21  434  	adata = dev_get_drvdata(dev);
361414dc1f07b7 Vijendar Mukunda 2021-07-21  435  
361414dc1f07b7 Vijendar Mukunda 2021-07-21  436  	if (adata->play_stream && adata->play_stream->runtime) {
43c5f728cf5937 Vijendar Mukunda 2022-02-23  437  		rtd = adata->play_stream->runtime->private_data;
361414dc1f07b7 Vijendar Mukunda 2021-07-21  438  		config_acp5x_dma(rtd, SNDRV_PCM_STREAM_PLAYBACK);
43c5f728cf5937 Vijendar Mukunda 2022-02-23  439  		acp_writel((rtd->xfer_resolution  << 3), rtd->acp5x_base + ACP_HSTDM_ITER);
43c5f728cf5937 Vijendar Mukunda 2022-02-23  440  		if (adata->tdm_mode == TDM_ENABLE) {
43c5f728cf5937 Vijendar Mukunda 2022-02-23  441  			acp_writel(adata->tdm_fmt, adata->acp5x_base + ACP_HSTDM_TXFRMT);
43c5f728cf5937 Vijendar Mukunda 2022-02-23  442  			val = acp_readl(adata->acp5x_base + ACP_HSTDM_ITER);
43c5f728cf5937 Vijendar Mukunda 2022-02-23  443  			acp_writel(val | 0x2, adata->acp5x_base + ACP_HSTDM_ITER);
43c5f728cf5937 Vijendar Mukunda 2022-02-23  444  		}
43c5f728cf5937 Vijendar Mukunda 2022-02-23  445  	}
43c5f728cf5937 Vijendar Mukunda 2022-02-23  446  	if (adata->i2ssp_play_stream && adata->i2ssp_play_stream->runtime) {
43c5f728cf5937 Vijendar Mukunda 2022-02-23  447  		rtd = adata->i2ssp_play_stream->runtime->private_data;
43c5f728cf5937 Vijendar Mukunda 2022-02-23  448  		config_acp5x_dma(rtd, SNDRV_PCM_STREAM_PLAYBACK);
43c5f728cf5937 Vijendar Mukunda 2022-02-23  449  		acp_writel((rtd->xfer_resolution  << 3), rtd->acp5x_base + ACP_I2STDM_ITER);
43c5f728cf5937 Vijendar Mukunda 2022-02-23  450  		if (adata->tdm_mode == TDM_ENABLE) {
43c5f728cf5937 Vijendar Mukunda 2022-02-23  451  			acp_writel(adata->tdm_fmt, adata->acp5x_base + ACP_I2STDM_TXFRMT);
43c5f728cf5937 Vijendar Mukunda 2022-02-23  452  			val = acp_readl(adata->acp5x_base + ACP_I2STDM_ITER);
43c5f728cf5937 Vijendar Mukunda 2022-02-23  453  			acp_writel(val | 0x2, adata->acp5x_base + ACP_I2STDM_ITER);
361414dc1f07b7 Vijendar Mukunda 2021-07-21  454  		}
361414dc1f07b7 Vijendar Mukunda 2021-07-21  455  	}
361414dc1f07b7 Vijendar Mukunda 2021-07-21  456  
361414dc1f07b7 Vijendar Mukunda 2021-07-21  457  	if (adata->capture_stream && adata->capture_stream->runtime) {
43c5f728cf5937 Vijendar Mukunda 2022-02-23  458  		rtd = adata->capture_stream->runtime->private_data;
361414dc1f07b7 Vijendar Mukunda 2021-07-21  459  		config_acp5x_dma(rtd, SNDRV_PCM_STREAM_CAPTURE);
43c5f728cf5937 Vijendar Mukunda 2022-02-23  460  		acp_writel((rtd->xfer_resolution  << 3), rtd->acp5x_base + ACP_HSTDM_IRER);
43c5f728cf5937 Vijendar Mukunda 2022-02-23  461  		if (adata->tdm_mode == TDM_ENABLE) {
43c5f728cf5937 Vijendar Mukunda 2022-02-23  462  			acp_writel(adata->tdm_fmt, adata->acp5x_base + ACP_HSTDM_RXFRMT);
43c5f728cf5937 Vijendar Mukunda 2022-02-23  463  			val = acp_readl(adata->acp5x_base + ACP_HSTDM_IRER);
43c5f728cf5937 Vijendar Mukunda 2022-02-23  464  			acp_writel(val | 0x2, adata->acp5x_base + ACP_HSTDM_IRER);
361414dc1f07b7 Vijendar Mukunda 2021-07-21  465  		}
361414dc1f07b7 Vijendar Mukunda 2021-07-21  466  	}
43c5f728cf5937 Vijendar Mukunda 2022-02-23  467  	if (adata->i2ssp_capture_stream && adata->i2ssp_capture_stream->runtime) {
43c5f728cf5937 Vijendar Mukunda 2022-02-23  468  		rtd = adata->i2ssp_capture_stream->runtime->private_data;
43c5f728cf5937 Vijendar Mukunda 2022-02-23  469  		config_acp5x_dma(rtd, SNDRV_PCM_STREAM_CAPTURE);
43c5f728cf5937 Vijendar Mukunda 2022-02-23  470  		acp_writel((rtd->xfer_resolution  << 3), rtd->acp5x_base + ACP_I2STDM_IRER);
361414dc1f07b7 Vijendar Mukunda 2021-07-21  471  		if (adata->tdm_mode == TDM_ENABLE) {
43c5f728cf5937 Vijendar Mukunda 2022-02-23  472  			acp_writel(adata->tdm_fmt, adata->acp5x_base + ACP_I2STDM_RXFRMT);
43c5f728cf5937 Vijendar Mukunda 2022-02-23  473  			val = acp_readl(adata->acp5x_base + ACP_I2STDM_IRER);
43c5f728cf5937 Vijendar Mukunda 2022-02-23  474  			acp_writel(val | 0x2, adata->acp5x_base + ACP_I2STDM_IRER);
43c5f728cf5937 Vijendar Mukunda 2022-02-23  475  		}
361414dc1f07b7 Vijendar Mukunda 2021-07-21  476  	}
361414dc1f07b7 Vijendar Mukunda 2021-07-21  477  	acp_writel(1, adata->acp5x_base + ACP_EXTERNAL_INTR_ENB);
361414dc1f07b7 Vijendar Mukunda 2021-07-21  478  	return 0;
361414dc1f07b7 Vijendar Mukunda 2021-07-21  479  }
361414dc1f07b7 Vijendar Mukunda 2021-07-21  480  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
