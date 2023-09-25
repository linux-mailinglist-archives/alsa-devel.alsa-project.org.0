Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F417ACE16
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 04:28:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CC35A4C;
	Mon, 25 Sep 2023 04:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CC35A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695608891;
	bh=IQrxVgl8y8yaPgVD3QfYOV/eCDXVY3Nhh6n5sv8QaGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XMa7MPBjD29bCZpQR+pP+sFw7fl9kd+iZkt4+vStmQOChSrlpH3rt2GKx4ZDYEsZL
	 PCFAl7Tg4NhM2pJekK2D9x/N8EitV48SZu7tO2csbtEWjDIsrpB8jeiEKW0AwcN6oG
	 xXN6SfHlATcoNvleXrqh9bXom4vwyUu+38EbQbaY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB116F8016A; Mon, 25 Sep 2023 04:26:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FCBAF80166;
	Mon, 25 Sep 2023 04:26:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0F26F8016A; Mon, 25 Sep 2023 04:26:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A97AF800AA
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 04:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A97AF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nh48jK+J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695608791; x=1727144791;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IQrxVgl8y8yaPgVD3QfYOV/eCDXVY3Nhh6n5sv8QaGQ=;
  b=nh48jK+JHiZ9OzDJMtfuQYfp7PaUHmSUlfu7jWyjfgTqNS5bh8RmLUcN
   oUQMfKQtDIj17ibWUcIyvPAvWJgGzYj3derH9FK0ddA7aMCUmLr5AVDiZ
   iVCwgF1AGkfq4kO9l4XHfOYUfN9mmyjf1/Xn2VykeEN5Z63Yc/qWHfq5p
   ZfvGMBZ9LzMHY7WK1Lm7KdTV7X4TPS/Up7IzYUnht0s1GlfzjqhkPaB/p
   QoxIbcLS5ZxLgEF86Ow1gkcpE2bTlwR2ytq9m1Al/tKBU+Db530YDhQKo
   YSJmz3GdpSw8STSv4XA3WMN9d7GhgTtfbV+kIZLbRYAhlqK3Hx2znMUHX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="384980188"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200";
   d="scan'208";a="384980188"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2023 19:26:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="891494260"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200";
   d="scan'208";a="891494260"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 24 Sep 2023 19:25:15 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkbIc-0000nF-26;
	Mon, 25 Sep 2023 02:26:14 +0000
Date: Mon, 25 Sep 2023 10:25:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ma Ke <make_ruc2021@163.com>, perex@perex.cz, tiwai@suse.com,
	cujomalainey@chromium.org, maciej.szmigiero@oracle.com,
	clecigne@google.com
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: control: do not access controls without possession
 of r_w lock
Message-ID: <202309251036.Yjiuc0Lq-lkp@intel.com>
References: <20230912084530.3307329-1-make_ruc2021@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912084530.3307329-1-make_ruc2021@163.com>
Message-ID-Hash: Y2H2GVSAI2BNAPQ7HWFCNKAXDXAONLSE
X-Message-ID-Hash: Y2H2GVSAI2BNAPQ7HWFCNKAXDXAONLSE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y2H2GVSAI2BNAPQ7HWFCNKAXDXAONLSE/>
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
[also build test ERROR on tiwai-sound/for-linus linus/master v6.6-rc3 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-Ke/ALSA-control-do-not-access-controls-without-possession-of-r_w-lock/20230912-164832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230912084530.3307329-1-make_ruc2021%40163.com
patch subject: [PATCH] ALSA: control: do not access controls without possession of r_w lock
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20230925/202309251036.Yjiuc0Lq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309251036.Yjiuc0Lq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309251036.Yjiuc0Lq-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/core/control.c: In function '__snd_ctl_remove':
>> sound/core/control.c:593:9: error: 'count' undeclared (first use in this function); did you mean 'd_count'?
     593 |         count = kcontrol->count;
         |         ^~~~~
         |         d_count
   sound/core/control.c:593:9: note: each undeclared identifier is reported only once for each function it appears in


vim +593 sound/core/control.c

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
