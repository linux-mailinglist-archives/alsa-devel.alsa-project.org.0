Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F66279D9D7
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 22:00:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F1BC93A;
	Tue, 12 Sep 2023 21:59:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F1BC93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694548803;
	bh=9aolbvVGXe/o5wJcSDgi7kIHANgfNpY59ibfl3KF8d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FVVZMcFRrUr6tUifX+U114BldFU2uePsroQ/9wzNPl+rXNisSDQeIU3K7hmxeBKln
	 3mkkg2YiTOCKHKKB7jnAt+GibIPk1UfWmBySHVSUnrTE3+o3D4RG08gBxOHgtqfOU7
	 XKD6IdL9UVY7PEY1PW2Vagzs2tLq1sjkT4QG2Tbs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EF03F80549; Tue, 12 Sep 2023 21:58:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E504BF80246;
	Tue, 12 Sep 2023 21:58:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCEF8F80425; Tue, 12 Sep 2023 21:58:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 728D8F8007C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 21:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 728D8F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NxKn67Qt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694548725; x=1726084725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9aolbvVGXe/o5wJcSDgi7kIHANgfNpY59ibfl3KF8d8=;
  b=NxKn67QtGayMOS09YaSgj6/PvOkt57RLWDajssTjtp5CV9DywY/j/jVV
   W4jZBs+HsNCMKXYyekaKMYeOEKjD7qP25YKyihL5+j28aqiWiL03O6Zn2
   ci5murBIgzMLauvhL1N5K+sepCTfVbjjQZ+TxOVDTfDw8bkExZtxoWG4/
   3qb4qMSjwJlfoOd56MLJ70tYYnJVOyIGXdXzJjM+xZGFYEnBmf6xLJqrW
   DxbC6KPgwHQUz+knXumFusPF7f6gknGVWMGCHJ1Bh0KCUyNnlMVY72jlD
   3NhQFeDkHuCzH+LrDM8SLjy3nQWcQYuSipjHbYx3IuxwXiRo1UL6pMGWX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="382287539"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000";
   d="scan'208";a="382287539"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 12:54:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="693604621"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000";
   d="scan'208";a="693604621"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 12 Sep 2023 12:54:22 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg9Sj-0000D1-1x;
	Tue, 12 Sep 2023 19:54:18 +0000
Date: Wed, 13 Sep 2023 03:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ma Ke <make_ruc2021@163.com>, perex@perex.cz, tiwai@suse.com,
	cujomalainey@chromium.org, maciej.szmigiero@oracle.com,
	clecigne@google.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: control: do not access controls without possession
 of r_w lock
Message-ID: <202309130328.UdCL3yzt-lkp@intel.com>
References: <20230912084530.3307329-1-make_ruc2021@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912084530.3307329-1-make_ruc2021@163.com>
Message-ID-Hash: TDUGMQ6H33HYM637X5MQCS7RQVGKYC4R
X-Message-ID-Hash: TDUGMQ6H33HYM637X5MQCS7RQVGKYC4R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TDUGMQ6H33HYM637X5MQCS7RQVGKYC4R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Ma,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v6.6-rc1 next-20230912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-Ke/ALSA-control-do-not-access-controls-without-possession-of-r_w-lock/20230912-164832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230912084530.3307329-1-make_ruc2021%40163.com
patch subject: [PATCH] ALSA: control: do not access controls without possession of r_w lock
config: arm-randconfig-r032-20230913 (https://download.01.org/0day-ci/archive/20230913/202309130328.UdCL3yzt-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130328.UdCL3yzt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130328.UdCL3yzt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/core/control.c:593:2: error: use of undeclared identifier 'count'
     593 |         count = kcontrol->count;
         |         ^
   sound/core/control.c:594:22: error: use of undeclared identifier 'count'
     594 |         for (idx = 0; idx < count; idx++)
         |                             ^
   2 errors generated.


vim +/count +593 sound/core/control.c

   576	
   577	static int __snd_ctl_remove(struct snd_card *card,
   578				    struct snd_kcontrol *kcontrol,
   579				    bool remove_hash)
   580	{
   581		unsigned int idx;
   582	
   583		lockdep_assert_held_write(&card->controls_rwsem);
   584	
   585		if (snd_BUG_ON(!card || !kcontrol))
   586			return -EINVAL;
   587		list_del(&kcontrol->list);
   588	
   589		if (remove_hash)
   590			remove_hash_entries(card, kcontrol);
   591	
   592		card->controls_count -= kcontrol->count;
 > 593		count = kcontrol->count;
   594		for (idx = 0; idx < count; idx++)
   595			snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_REMOVE, kcontrol, idx);
   596		snd_ctl_free_one(kcontrol);
   597		return 0;
   598	}
   599	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
