Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDA059B397
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Aug 2022 13:49:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE1C11655;
	Sun, 21 Aug 2022 13:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE1C11655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661082598;
	bh=slkhOb+kghvwsjRO/rtJvxXma9D499tLTQpiwkDFyqc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A+0a6IFMuahBazIelJDaKWlmbzm2qHIesZsgpkKzQJXCy6BKj0RzquW6h/FMi3IxK
	 1nkBsiyYTHdJ6ELQLHVD0oIoy0NdC5s8meL1d7nzUZBpepcqHhHc2GLbJxXloijsif
	 XbHKcaLs1jqtkdR8+Ib+v5JFFcbY238ooDkkjoLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B46FF80128;
	Sun, 21 Aug 2022 13:48:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13027F804AC; Sun, 21 Aug 2022 13:48:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4FBCF80163
 for <alsa-devel@alsa-project.org>; Sun, 21 Aug 2022 13:48:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4FBCF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RKDXEqlW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661082532; x=1692618532;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=slkhOb+kghvwsjRO/rtJvxXma9D499tLTQpiwkDFyqc=;
 b=RKDXEqlWpLDR8FaPQZFjLlhj1YqbX9n0WMbPO1VINPyEhQpuJFCOU47g
 85p8HAgia9exKAigQMticeyEA27YCvahLWL0XWZty/iDsVyrWbuOXhZ7Z
 QdHitgGlMlnF6I20jtDJEHpflOSdVSdtlUOpPtiGbplqW4EpFAZbFI9B2
 OkpPyqzRb32XSit8aZrNGN29lK5nrTkShDU0bz1h1BS6wA9toWcAFg05p
 hvvY/Rw81ZnG+ePhk+rZPVCBFOWtPixIkWviQuqAwVXttn8o2NO9QBH2q
 bDELgH9l9Wkp0etZ73U534uBDcgLW/ut80iEI3v3LLgrBu3vSmgFLzGV+ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10445"; a="280213556"
X-IronPort-AV: E=Sophos;i="5.93,252,1654585200"; d="scan'208";a="280213556"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2022 04:48:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,252,1654585200"; d="scan'208";a="585167650"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 21 Aug 2022 04:48:45 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oPjRc-00041h-1v;
 Sun, 21 Aug 2022 11:48:44 +0000
Date: Sun, 21 Aug 2022 19:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: memalloc: Revive x86-specific WC page allocations
 again
Message-ID: <202208211945.6Lmqeudy-lkp@intel.com>
References: <20220821082241.23722-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220821082241.23722-1-tiwai@suse.de>
Cc: kbuild-all@lists.01.org
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

Hi Takashi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on linus/master v6.0-rc1 next-20220819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Iwai/ALSA-memalloc-Revive-x86-specific-WC-page-allocations-again/20220821-162443
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: openrisc-randconfig-s052-20220821 (https://download.01.org/0day-ci/archive/20220821/202208211945.6Lmqeudy-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/86072b28544f52618e4ce8336ba80be1d67f38d9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Takashi-Iwai/ALSA-memalloc-Revive-x86-specific-WC-page-allocations-again/20220821-162443
        git checkout 86072b28544f52618e4ce8336ba80be1d67f38d9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash sound/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> sound/core/memalloc.c:289:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted gfp_t [usertype] gfp_mask @@     got unsigned long gfp @@
   sound/core/memalloc.c:289:43: sparse:     expected restricted gfp_t [usertype] gfp_mask
   sound/core/memalloc.c:289:43: sparse:     got unsigned long gfp
>> sound/core/memalloc.c:299:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long gfp @@     got restricted gfp_t @@
   sound/core/memalloc.c:299:52: sparse:     expected unsigned long gfp
   sound/core/memalloc.c:299:52: sparse:     got restricted gfp_t

vim +289 sound/core/memalloc.c

37af81c5998f4b Takashi Iwai 2021-06-09  283  
37af81c5998f4b Takashi Iwai 2021-06-09  284  /*
37af81c5998f4b Takashi Iwai 2021-06-09  285   * Continuous pages allocator
37af81c5998f4b Takashi Iwai 2021-06-09  286   */
86072b28544f52 Takashi Iwai 2022-08-21  287  static void *do_alloc_pages(size_t size, dma_addr_t *addr, unsigned long gfp)
37af81c5998f4b Takashi Iwai 2021-06-09  288  {
f84ba106a0185b Takashi Iwai 2021-08-04 @289  	void *p = alloc_pages_exact(size, gfp);
37af81c5998f4b Takashi Iwai 2021-06-09  290  
f84ba106a0185b Takashi Iwai 2021-08-04  291  	if (p)
86072b28544f52 Takashi Iwai 2022-08-21  292  		*addr = page_to_phys(virt_to_page(p));
f84ba106a0185b Takashi Iwai 2021-08-04  293  	return p;
37af81c5998f4b Takashi Iwai 2021-06-09  294  }
37af81c5998f4b Takashi Iwai 2021-06-09  295  
86072b28544f52 Takashi Iwai 2022-08-21  296  static void *snd_dma_continuous_alloc(struct snd_dma_buffer *dmab, size_t size)
86072b28544f52 Takashi Iwai 2022-08-21  297  {
86072b28544f52 Takashi Iwai 2022-08-21  298  	return do_alloc_pages(size, &dmab->addr,
86072b28544f52 Takashi Iwai 2022-08-21 @299  			      snd_mem_get_gfp_flags(dmab, GFP_KERNEL));
86072b28544f52 Takashi Iwai 2022-08-21  300  }
86072b28544f52 Takashi Iwai 2022-08-21  301  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
