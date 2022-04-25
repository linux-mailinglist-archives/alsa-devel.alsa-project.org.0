Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 276E850E961
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 21:18:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8F191865;
	Mon, 25 Apr 2022 21:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8F191865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650914320;
	bh=yViJOkZnsqckBbTkyZ90SnXrgeHTmvv/ta1oNYoitnE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K+ra6cNSXYcH8kpk63c9YDhCWsYu9oNBD6alDgGptapwFX4Y/lHotDKNHgHd/ZZ5w
	 gHDCt2zhct0u3+HTTEc7L0BtIbhcMh62WcN5+GNljathihXp9Hx8jlLCb/n1CYozCc
	 FLaxD5WkDhCxiDZKY/AF+vYWRHAfvKVveKynG8rs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77C98F80152;
	Mon, 25 Apr 2022 21:17:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22E5AF8016B; Mon, 25 Apr 2022 21:17:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFD2AF800FA
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 21:17:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFD2AF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NoSzLVh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650914255; x=1682450255;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yViJOkZnsqckBbTkyZ90SnXrgeHTmvv/ta1oNYoitnE=;
 b=NoSzLVh22TRel8v81NB56TN0toxlk98JmeRwEOOJVUvRbOssCt8qv2jk
 LeCueiBKFaRk8oK+UJKjuiA0bj27MafQlvpbhF551+PiZwJ1qiJmsTdhS
 9DpTwh2IA3i+56evIjKH7rHyUg1DJF7YrxZuPnl2IPf/OAeVsZRUgzDtd
 jAJr9s8liloQavg+apXx3JJJTXRF3jb9Zn7XiU3bFQMfFTgdXYj2Ox0I3
 Z1Mqg7Jte/fLAJDrgVKR13g6GyQ4n8lZjsMAL8+qb4jvy5PwehfflfaFX
 Q4Ej/WVmOte4Wc+jU02OgP1fHQ9JeW1FQr9o7Arfd4Ps+uHYBZVg8WCLC Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="264861574"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="264861574"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 12:17:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="677365608"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 25 Apr 2022 12:17:28 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nj4DA-0002nw-2O;
 Mon, 25 Apr 2022 19:17:28 +0000
Date: Tue, 26 Apr 2022 03:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, tiwai@suse.de
Subject: Re: [PATCH] ALSA: memalloc: Add fallback SG-buffer free if fallback
 is used for noncontig
Message-ID: <202204260301.TAt89QGn-lkp@intel.com>
References: <20220425122814.751-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425122814.751-1-peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org,
 pierre-louis.bossart@linux.intel.com
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

Hi Peter,

I love your patch! Yet something to improve:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on v5.18-rc4 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Ujfalusi/ALSA-memalloc-Add-fallback-SG-buffer-free-if-fallback-is-used-for-noncontig/20220425-203012
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: arm-randconfig-r033-20220425 (https://download.01.org/0day-ci/archive/20220426/202204260301.TAt89QGn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/bf91cb1cd103c5f1e78fa154c30f1436be2723ac
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Peter-Ujfalusi/ALSA-memalloc-Add-fallback-SG-buffer-free-if-fallback-is-used-for-noncontig/20220425-203012
        git checkout bf91cb1cd103c5f1e78fa154c30f1436be2723ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash sound/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   sound/core/memalloc.c: In function 'snd_dma_noncontig_free':
>> sound/core/memalloc.c:540:31: error: 'SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK' undeclared (first use in this function); did you mean 'SNDRV_DMA_TYPE_DEV_WC_SG'?
     540 |         if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK ||
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               SNDRV_DMA_TYPE_DEV_WC_SG
   sound/core/memalloc.c:540:31: note: each undeclared identifier is reported only once for each function it appears in
>> sound/core/memalloc.c:541:31: error: 'SNDRV_DMA_TYPE_DEV_SG_FALLBACK' undeclared (first use in this function); did you mean 'SNDRV_DMA_TYPE_DEV_SG'?
     541 |             dmab->dev.type == SNDRV_DMA_TYPE_DEV_SG_FALLBACK) {
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               SNDRV_DMA_TYPE_DEV_SG
>> sound/core/memalloc.c:543:17: error: implicit declaration of function 'snd_dma_sg_fallback_free'; did you mean 'snd_dma_vmalloc_free'? [-Werror=implicit-function-declaration]
     543 |                 snd_dma_sg_fallback_free(dmab);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
         |                 snd_dma_vmalloc_free
   cc1: some warnings being treated as errors


vim +540 sound/core/memalloc.c

   537	
   538	static void snd_dma_noncontig_free(struct snd_dma_buffer *dmab)
   539	{
 > 540		if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK ||
 > 541		    dmab->dev.type == SNDRV_DMA_TYPE_DEV_SG_FALLBACK) {
   542			/* The allocation is done with a fallback, use the matching free */
 > 543			snd_dma_sg_fallback_free(dmab);
   544			return;
   545		}
   546	
   547		dma_vunmap_noncontiguous(dmab->dev.dev, dmab->area);
   548		dma_free_noncontiguous(dmab->dev.dev, dmab->bytes, dmab->private_data,
   549				       dmab->dev.dir);
   550	}
   551	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
