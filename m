Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C13559B477
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Aug 2022 16:33:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C72E8161E;
	Sun, 21 Aug 2022 16:32:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C72E8161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661092386;
	bh=5FrxNbC1vRlh1FAzafksLnU4XwyfVLR+tKZwiEt/j+w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l9Kb//4vyOJVNjQ5IU6yxC9F0yru0mKGLti6zUXHE/khz8INJdbtKpLaNa84RPFmd
	 7F4d+GHnCjFNinkjDaDqAD7ls5beRTXMXDFl9Ca9pqRRoxwQ3f6ToeZabfMOYZy5bw
	 RvD4S7Uil4GJXxx1G3SgRGds/Af2UdzS0oLtwNso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F316F8051C;
	Sun, 21 Aug 2022 16:32:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54CB4F804AC; Sun, 21 Aug 2022 16:32:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43593F80154
 for <alsa-devel@alsa-project.org>; Sun, 21 Aug 2022 16:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43593F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nv28qNtJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661092319; x=1692628319;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5FrxNbC1vRlh1FAzafksLnU4XwyfVLR+tKZwiEt/j+w=;
 b=nv28qNtJF7UeqcrZ+V1ziT4nqRE3c4ccj65qbuv+wEQUe1rKSwwJgzhh
 WcKmy6EDeajXEriiq1GLhOsT3X2niMUnQOs+QNV42doq7V5/2OeQDJ7Q1
 Svw/X1MEkdPq7JN2BPgCGlb56RztyQQbHFhKbxnhaow70GH6wj0WwHzWD
 rHiyyAgQ7Zac5u6ZU2XoqfKRol7ngbWV1c1P6IkqAQgb1Z6otTPUKWtG2
 Dt0D1wIMAwCVbl8OHAfQkpYjrAha7/w5pu85NYo23cw7HBaDWe00vPD4T
 zYvrTTH8z5J2UTpuDvoTmSMX6WuGPiTBvz1yzvuld1bXhb3G/W7aq53/b A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10446"; a="276286588"
X-IronPort-AV: E=Sophos;i="5.93,252,1654585200"; d="scan'208";a="276286588"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2022 07:31:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,252,1654585200"; d="scan'208";a="641745409"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 21 Aug 2022 07:31:52 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oPlzT-0004Bz-19;
 Sun, 21 Aug 2022 14:31:51 +0000
Date: Sun, 21 Aug 2022 22:31:25 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: memalloc: Revive x86-specific WC page allocations
 again
Message-ID: <202208212226.7Ji4ZW8k-lkp@intel.com>
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
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20220821/202208212226.7Ji4ZW8k-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/86072b28544f52618e4ce8336ba80be1d67f38d9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Takashi-Iwai/ALSA-memalloc-Revive-x86-specific-WC-page-allocations-again/20220821-162443
        git checkout 86072b28544f52618e4ce8336ba80be1d67f38d9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash sound/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> sound/core/memalloc.c:705:41: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long gfp @@     got restricted gfp_t @@
   sound/core/memalloc.c:705:41: sparse:     expected unsigned long gfp
   sound/core/memalloc.c:705:41: sparse:     got restricted gfp_t
>> sound/core/memalloc.c:710:62: sparse: sparse: restricted gfp_t degrades to integer
>> sound/core/memalloc.c:711:29: sparse: sparse: invalid assignment: |=
>> sound/core/memalloc.c:711:29: sparse:    left side has type unsigned long
>> sound/core/memalloc.c:711:29: sparse:    right side has type restricted gfp_t
   sound/core/memalloc.c:714:60: sparse: sparse: restricted gfp_t degrades to integer
   sound/core/memalloc.c:715:38: sparse: sparse: restricted gfp_t degrades to integer
   sound/core/memalloc.c:715:52: sparse: sparse: restricted gfp_t degrades to integer
   sound/core/memalloc.c:289:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted gfp_t [usertype] gfp_mask @@     got unsigned long gfp @@
   sound/core/memalloc.c:289:43: sparse:     expected restricted gfp_t [usertype] gfp_mask
   sound/core/memalloc.c:289:43: sparse:     got unsigned long gfp
   sound/core/memalloc.c:299:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long gfp @@     got restricted gfp_t @@
   sound/core/memalloc.c:299:52: sparse:     expected unsigned long gfp
   sound/core/memalloc.c:299:52: sparse:     got restricted gfp_t

vim +705 sound/core/memalloc.c

   699	
   700	/* manual page allocations with wc setup */
   701	static void *do_alloc_fallback_pages(struct device *dev, size_t size,
   702					     dma_addr_t *addr, bool wc)
   703	{
   704		void *p;
 > 705		unsigned long gfp = DEFAULT_GFP & ~__GFP_COMP;
   706	
   707	 again:
   708		p = do_alloc_pages(size, addr, gfp);
   709		if (!p || (*addr + size - 1) & ~dev->coherent_dma_mask) {
 > 710			if (IS_ENABLED(CONFIG_ZONE_DMA32) && !(gfp & GFP_DMA32)) {
 > 711				gfp |= GFP_DMA32;
   712				goto again;
   713			}
   714			if (IS_ENABLED(CONFIG_ZONE_DMA) && !(gfp & GFP_DMA)) {
   715				gfp = (gfp & ~GFP_DMA32) | GFP_DMA;
   716				goto again;
   717			}
   718		}
   719		if (p && wc)
   720			set_memory_wc((unsigned long)(p), size >> PAGE_SHIFT);
   721		return p;
   722	}
   723	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
