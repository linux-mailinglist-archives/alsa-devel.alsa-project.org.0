Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB77B50EF4D
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 05:36:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60A99189A;
	Tue, 26 Apr 2022 05:35:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60A99189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650944198;
	bh=MjXF2xNWqn2PnWleKt/UTmSxTuSJ2Z3BRA7oM/q4WTI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kNpLF4s+9c+z562SfM0y6tNfhee1QXH+d8WMAHiCLhXCi3uSuQ3rQttOccPUE43U7
	 j4ZORu+yIJrIB/oBfVawF0Jh2nTRXq9N1B1ud6MwriJ0Vc0SfK3PzB2u9Dox8v/5gz
	 PVOGOQX96su6ZukmEloeRB3mMPyFgA8aphvAXhc4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3C42F80171;
	Tue, 26 Apr 2022 05:35:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DA16F800FA; Tue, 26 Apr 2022 05:35:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EB45F800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 05:35:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EB45F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nzDxYH2A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650944131; x=1682480131;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MjXF2xNWqn2PnWleKt/UTmSxTuSJ2Z3BRA7oM/q4WTI=;
 b=nzDxYH2Au2LeKNt+xUZuzX4+1g6/eKVDORVOP79hvA41ifpEOHqv5HJj
 1RHeOb06wT6P4ocOdkIYcB332idfJKy7lKAppcfIV//RMZ0DtNwrQzjix
 LWn3w8TpprnyrGUNyCF0LOSFV5E8MZ54r3CAP7McWZRSp09uPPRckO9fj
 v7b5Q9Uu/+oJ0KEBD4AEv1FdJwUqN7KFhi9IqZ9JVmNyLLwdRNl6cF9uW
 vdJmUN0lWrqa+SM8uBAawwMyULfb0R0Q5figUt81Y43VSRcxeDhsTCAey
 /FBaEND1TKyqha7P+NONxkvDp48Wh2Hw5HYE+eiyFU/PvprOpWl+pWm3f w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="290578772"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="290578772"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 20:35:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="616800027"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 25 Apr 2022 20:35:20 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1njByx-0003BO-B2;
 Tue, 26 Apr 2022 03:35:19 +0000
Date: Tue, 26 Apr 2022 11:35:13 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, tiwai@suse.de
Subject: Re: [PATCH] ALSA: memalloc: Add fallback SG-buffer free if fallback
 is used for noncontig
Message-ID: <202204261147.hFS8RozR-lkp@intel.com>
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

I love your patch! Perhaps something to improve:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on v5.18-rc4 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Ujfalusi/ALSA-memalloc-Add-fallback-SG-buffer-free-if-fallback-is-used-for-noncontig/20220425-203012
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20220426/202204261147.hFS8RozR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/bf91cb1cd103c5f1e78fa154c30f1436be2723ac
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Peter-Ujfalusi/ALSA-memalloc-Add-fallback-SG-buffer-free-if-fallback-is-used-for-noncontig/20220425-203012
        git checkout bf91cb1cd103c5f1e78fa154c30f1436be2723ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   sound/core/memalloc.c: In function 'snd_dma_noncontig_free':
   sound/core/memalloc.c:543:17: error: implicit declaration of function 'snd_dma_sg_fallback_free'; did you mean 'snd_dma_sg_fallback_alloc'? [-Werror=implicit-function-declaration]
     543 |                 snd_dma_sg_fallback_free(dmab);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
         |                 snd_dma_sg_fallback_alloc
   sound/core/memalloc.c: At top level:
>> sound/core/memalloc.c:755:13: warning: conflicting types for 'snd_dma_sg_fallback_free'; have 'void(struct snd_dma_buffer *)'
     755 | static void snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/memalloc.c:755:13: error: static declaration of 'snd_dma_sg_fallback_free' follows non-static declaration
   sound/core/memalloc.c:543:17: note: previous implicit declaration of 'snd_dma_sg_fallback_free' with type 'void(struct snd_dma_buffer *)'
     543 |                 snd_dma_sg_fallback_free(dmab);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +755 sound/core/memalloc.c

925ca893b4a651 Takashi Iwai 2022-04-13  754  
925ca893b4a651 Takashi Iwai 2022-04-13 @755  static void snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab)
925ca893b4a651 Takashi Iwai 2022-04-13  756  {
925ca893b4a651 Takashi Iwai 2022-04-13  757  	vunmap(dmab->area);
925ca893b4a651 Takashi Iwai 2022-04-13  758  	__snd_dma_sg_fallback_free(dmab, dmab->private_data);
925ca893b4a651 Takashi Iwai 2022-04-13  759  }
925ca893b4a651 Takashi Iwai 2022-04-13  760  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
