Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 559D2FF8C3
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Nov 2019 11:31:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A255E168D;
	Sun, 17 Nov 2019 11:31:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A255E168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573986711;
	bh=l2MbykoaTd2hj+G025fxrUli1qKo4TQ0u7LyAMH4Jhk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vOoE+0FXJfFtryg8g98MHGlh3oyu3SOpR0t6rdNZp1Ak2mJW275MKXI2DHYSYxKlv
	 SVhw+KPNPGBX39KsPe99Er+lHw0rnYzMKr8FIZVBfnUyTgfGR3tFPVpcqoJAqIxBPN
	 aGliQkCwM/LGugPh4i4BDUPCoiCEmqJupvCKkZZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21B9AF80132;
	Sun, 17 Nov 2019 11:30:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1990EF80131; Sun, 17 Nov 2019 11:29:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_14,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD431F800E6
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 11:29:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD431F800E6
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Nov 2019 02:29:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,315,1569308400"; 
 d="gz'50?scan'50,208,50";a="380371882"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 17 Nov 2019 02:29:44 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iWHoO-0009hi-1u; Sun, 17 Nov 2019 18:29:44 +0800
Date: Sun, 17 Nov 2019 18:28:49 +0800
From: kbuild test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <201911171818.hyLJKxvT%lkp@intel.com>
References: <20191117085308.23915-6-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ueszwvi4qoi6e7sh"
Content-Disposition: inline
In-Reply-To: <20191117085308.23915-6-tiwai@suse.de>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org
Subject: Re: [alsa-devel] [PATCH 5/8] ALSA: pcm: Move PCM_RUNTIME_CHECK()
 macro	into local header
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


--ueszwvi4qoi6e7sh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

I love your patch! Yet something to improve:

[auto build test ERROR on sound/for-next]
[also build test ERROR on next-20191115]
[cannot apply to v5.4-rc7]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Takashi-Iwai/ALSA-pcm-API-cleanups-and-extensions/20191117-170136
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: arc-randconfig-a0031-20191117 (attached as .config)
compiler: arc-elf-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=arc 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/init.h:5:0,
                    from include/linux/io.h:10,
                    from sound/core/pcm_memory.c:7:
   sound/core/pcm_memory.c: In function 'snd_pcm_lib_malloc_pages':
>> sound/core/pcm_memory.c:351:6: error: implicit declaration of function 'PCM_RUNTIME_CHECK' [-Werror=implicit-function-declaration]
     if (PCM_RUNTIME_CHECK(substream))
         ^
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                       ^~~~
>> sound/core/pcm_memory.c:351:2: note: in expansion of macro 'if'
     if (PCM_RUNTIME_CHECK(substream))
     ^~
   cc1: some warnings being treated as errors

vim +/PCM_RUNTIME_CHECK +351 sound/core/pcm_memory.c

51e9f2e665bf2b Takashi Iwai   2008-07-30  334  
^1da177e4c3f41 Linus Torvalds 2005-04-16  335  /**
^1da177e4c3f41 Linus Torvalds 2005-04-16  336   * snd_pcm_lib_malloc_pages - allocate the DMA buffer
^1da177e4c3f41 Linus Torvalds 2005-04-16  337   * @substream: the substream to allocate the DMA buffer to
^1da177e4c3f41 Linus Torvalds 2005-04-16  338   * @size: the requested buffer size in bytes
^1da177e4c3f41 Linus Torvalds 2005-04-16  339   *
^1da177e4c3f41 Linus Torvalds 2005-04-16  340   * Allocates the DMA buffer on the BUS type given earlier to
^1da177e4c3f41 Linus Torvalds 2005-04-16  341   * snd_pcm_lib_preallocate_xxx_pages().
^1da177e4c3f41 Linus Torvalds 2005-04-16  342   *
eb7c06e8e9c93b Yacine Belkadi 2013-03-11  343   * Return: 1 if the buffer is changed, 0 if not changed, or a negative
^1da177e4c3f41 Linus Torvalds 2005-04-16  344   * code on failure.
^1da177e4c3f41 Linus Torvalds 2005-04-16  345   */
877211f5e1b119 Takashi Iwai   2005-11-17  346  int snd_pcm_lib_malloc_pages(struct snd_pcm_substream *substream, size_t size)
^1da177e4c3f41 Linus Torvalds 2005-04-16  347  {
877211f5e1b119 Takashi Iwai   2005-11-17  348  	struct snd_pcm_runtime *runtime;
^1da177e4c3f41 Linus Torvalds 2005-04-16  349  	struct snd_dma_buffer *dmab = NULL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  350  
7eaa943c8ed8e9 Takashi Iwai   2008-08-08 @351  	if (PCM_RUNTIME_CHECK(substream))
7eaa943c8ed8e9 Takashi Iwai   2008-08-08  352  		return -EINVAL;
7eaa943c8ed8e9 Takashi Iwai   2008-08-08  353  	if (snd_BUG_ON(substream->dma_buffer.dev.type ==
7eaa943c8ed8e9 Takashi Iwai   2008-08-08  354  		       SNDRV_DMA_TYPE_UNKNOWN))
7eaa943c8ed8e9 Takashi Iwai   2008-08-08  355  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  356  	runtime = substream->runtime;
^1da177e4c3f41 Linus Torvalds 2005-04-16  357  
^1da177e4c3f41 Linus Torvalds 2005-04-16  358  	if (runtime->dma_buffer_p) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  359  		/* perphaps, we might free the large DMA memory region
^1da177e4c3f41 Linus Torvalds 2005-04-16  360  		   to save some space here, but the actual solution
^1da177e4c3f41 Linus Torvalds 2005-04-16  361  		   costs us less time */
^1da177e4c3f41 Linus Torvalds 2005-04-16  362  		if (runtime->dma_buffer_p->bytes >= size) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  363  			runtime->dma_bytes = size;
^1da177e4c3f41 Linus Torvalds 2005-04-16  364  			return 0;	/* ok, do not change */
^1da177e4c3f41 Linus Torvalds 2005-04-16  365  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  366  		snd_pcm_lib_free_pages(substream);
^1da177e4c3f41 Linus Torvalds 2005-04-16  367  	}
877211f5e1b119 Takashi Iwai   2005-11-17  368  	if (substream->dma_buffer.area != NULL &&
877211f5e1b119 Takashi Iwai   2005-11-17  369  	    substream->dma_buffer.bytes >= size) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  370  		dmab = &substream->dma_buffer; /* use the pre-allocated buffer */
^1da177e4c3f41 Linus Torvalds 2005-04-16  371  	} else {
ca2c0966562cfb Takashi Iwai   2005-09-09  372  		dmab = kzalloc(sizeof(*dmab), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds 2005-04-16  373  		if (! dmab)
^1da177e4c3f41 Linus Torvalds 2005-04-16  374  			return -ENOMEM;
^1da177e4c3f41 Linus Torvalds 2005-04-16  375  		dmab->dev = substream->dma_buffer.dev;
^1da177e4c3f41 Linus Torvalds 2005-04-16  376  		if (snd_dma_alloc_pages(substream->dma_buffer.dev.type,
^1da177e4c3f41 Linus Torvalds 2005-04-16  377  					substream->dma_buffer.dev.dev,
^1da177e4c3f41 Linus Torvalds 2005-04-16  378  					size, dmab) < 0) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  379  			kfree(dmab);
^1da177e4c3f41 Linus Torvalds 2005-04-16  380  			return -ENOMEM;
^1da177e4c3f41 Linus Torvalds 2005-04-16  381  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  382  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  383  	snd_pcm_set_runtime_buffer(substream, dmab);
^1da177e4c3f41 Linus Torvalds 2005-04-16  384  	runtime->dma_bytes = size;
^1da177e4c3f41 Linus Torvalds 2005-04-16  385  	return 1;			/* area was changed */
^1da177e4c3f41 Linus Torvalds 2005-04-16  386  }
e88e8ae639a490 Takashi Iwai   2006-04-28  387  EXPORT_SYMBOL(snd_pcm_lib_malloc_pages);
e88e8ae639a490 Takashi Iwai   2006-04-28  388  

:::::: The code at line 351 was first introduced by commit
:::::: 7eaa943c8ed8e91e05d0f5d0dc7a18e3319b45cf ALSA: Kill snd_assert() in sound/core/*

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Jaroslav Kysela <perex@perex.cz>

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--ueszwvi4qoi6e7sh
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
sbMBAA==

--ueszwvi4qoi6e7sh
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--ueszwvi4qoi6e7sh--
