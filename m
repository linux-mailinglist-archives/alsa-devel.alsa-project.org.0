Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7D550E924
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 21:07:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4E22183B;
	Mon, 25 Apr 2022 21:06:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4E22183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650913664;
	bh=9hMavWVX/mwCV1CHKoDtErsRb6ZkqH80fwJ8nCjOCW8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HqsDSdr8lQxcxKzpsAK32fOLENyTtF1q47GLE7m/hBLxy7OzwJT8Mj8UheogI/kX/
	 XQcyrA6BEULP6bDkNEHU9OsZvbiufHRTkTU/ZinWPMoTFJ1+0k2QEmNqdakP8Snl1I
	 IVUq0Pgo7ff8wOpB1o9sZjlv9A0cS+VcEqIvDwkw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44663F8016B;
	Mon, 25 Apr 2022 21:06:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 652D1F8016A; Mon, 25 Apr 2022 21:06:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D58FEF800FA
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 21:06:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D58FEF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CsmtTSDD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650913596; x=1682449596;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9hMavWVX/mwCV1CHKoDtErsRb6ZkqH80fwJ8nCjOCW8=;
 b=CsmtTSDDPZmwUqb5BRzOJvqcLFSzAXlWb5QWANHFWNOnoebPZQmmUPKC
 DnbePJXeptaqEuX2Bl5LqBf2yU6ky8rDarH5vcOaqPBgPSE9wmYtAJA9B
 RAGkDePlWtl5DbRRkCoZIjYSioc/96riAlj6+VsSZOAFs76f8aZTkszp5
 YZB2Atw44ywoKlJUYpvSJdoOzkbFEnC3lHv823hREYIyW4yTr+LbQdV5O
 4cjYOcXvISIDo/Nunj1eu0RhIihm4rFQJPEhm3eoyN+wlGIFsrD3N93hV
 C9hIGLsjtjtiSkHslEbafepulIX7VFbpND/jdCr4KJ1+5JVkWGk7RxtHQ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="265504857"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="265504857"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 12:06:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="704696431"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 25 Apr 2022 12:06:28 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nj42V-0002nO-MQ;
 Mon, 25 Apr 2022 19:06:27 +0000
Date: Tue, 26 Apr 2022 03:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, tiwai@suse.de
Subject: Re: [PATCH] ALSA: memalloc: Add fallback SG-buffer free if fallback
 is used for noncontig
Message-ID: <202204260255.k5hl4BYG-lkp@intel.com>
References: <20220425122814.751-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425122814.751-1-peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, llvm@lists.linux.dev, kbuild-all@lists.01.org,
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
config: riscv-randconfig-r035-20220425 (https://download.01.org/0day-ci/archive/20220426/202204260255.k5hl4BYG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/bf91cb1cd103c5f1e78fa154c30f1436be2723ac
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Peter-Ujfalusi/ALSA-memalloc-Add-fallback-SG-buffer-free-if-fallback-is-used-for-noncontig/20220425-203012
        git checkout bf91cb1cd103c5f1e78fa154c30f1436be2723ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash sound/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/core/memalloc.c:540:24: error: use of undeclared identifier 'SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK'
           if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK ||
                                 ^
>> sound/core/memalloc.c:541:24: error: use of undeclared identifier 'SNDRV_DMA_TYPE_DEV_SG_FALLBACK'
               dmab->dev.type == SNDRV_DMA_TYPE_DEV_SG_FALLBACK) {
                                 ^
>> sound/core/memalloc.c:543:3: error: call to undeclared function 'snd_dma_sg_fallback_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   snd_dma_sg_fallback_free(dmab);
                   ^
   sound/core/memalloc.c:543:3: note: did you mean 'snd_dma_vmalloc_free'?
   sound/core/memalloc.c:312:13: note: 'snd_dma_vmalloc_free' declared here
   static void snd_dma_vmalloc_free(struct snd_dma_buffer *dmab)
               ^
   3 errors generated.


vim +/SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK +540 sound/core/memalloc.c

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
