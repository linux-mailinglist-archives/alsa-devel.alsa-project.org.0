Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2066F9A3F
	for <lists+alsa-devel@lfdr.de>; Sun,  7 May 2023 18:51:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB9D61256;
	Sun,  7 May 2023 18:50:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB9D61256
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683478271;
	bh=Dsbo0UCqPyAX/ztHoW26Vj2EcL905wcNM7CMUDm8wGs=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QVfNZ8Jq6Tj88h2Ax1VlPW26V+jM3DoawaXbM78LZQqQF6Crw0hxDKIVBQN2jE6P6
	 Ml3fpFp7PPQMO47Lny8s4/pzg6DCgQwv7cnjlbV1qvOmM1fX9+dKCX4JJAl0eMbZqY
	 3h7WZ2f9OcjrQ4bm6MvkyX+lIRqbDLvPJwJ3K0S8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA43EF80310;
	Sun,  7 May 2023 18:49:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83299F8032D; Sun,  7 May 2023 18:48:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B20DF80217
	for <alsa-devel@alsa-project.org>; Sun,  7 May 2023 18:48:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B20DF80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bH15PyJR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683478122; x=1715014122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dsbo0UCqPyAX/ztHoW26Vj2EcL905wcNM7CMUDm8wGs=;
  b=bH15PyJR0ej7toyLO3sbOXR4BCwJfZRwfXF2CmD8aAAHJ2+p9ybzL1I7
   47Xpn8oXZQjPgTyWLKXIT+rxHH2lq9ZlVTA1f4jVuqfQeTf2YrrMu1xnH
   LZvWXMha4RUwccEh5bHPjZQ9WSdYtXbsph6lNreusrVdBnFf1f0h89lqz
   JGAoiHDCKa0Q8OJ5rVJxBUtykWR1TQ/QvztQPUnJng5vz0goHq5BSFEK6
   +Pk+0XhJDriM+xllhR2pnTtqOT45omtXQmm+5J3URA/JFK3mvb+wAesm6
   MwiYLZ1jlzJ6LwAnQ4tp6go7auJC7xjhwmCvzo491F1zIx5XpBlTBpfvj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="329121658"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200";
   d="scan'208";a="329121658"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2023 09:48:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="763114525"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200";
   d="scan'208";a="763114525"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 May 2023 09:48:35 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvhYp-0000o2-17;
	Sun, 07 May 2023 16:48:35 +0000
Date: Mon, 8 May 2023 00:47:36 +0800
From: kernel test robot <lkp@intel.com>
To: jack1989s@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: Re: [PATCH] Sound:last.c: fix code syle trailing white space -
 modify printk()->netdev_dbg() - Possible unnecessary KERN_INFO removed
Message-ID: <202305080037.fiQIAfoP-lkp@intel.com>
References: <20230507130021.48112-1-jack1989s@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230507130021.48112-1-jack1989s@gmail.com>
Message-ID-Hash: 6NGPRXLFFQD2DJJN7KC2LID4DLSDAP5K
X-Message-ID-Hash: 6NGPRXLFFQD2DJJN7KC2LID4DLSDAP5K
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Federico Di Lembo <jack1989s@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6NGPRXLFFQD2DJJN7KC2LID4DLSDAP5K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v6.3 next-20230505]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/jack1989s-gmail-com/Sound-last-c-fix-code-syle-trailing-white-space-modify-printk-netdev_dbg-Possible-unnecessary-KERN_INFO-removed/20230507-210152
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230507130021.48112-1-jack1989s%40gmail.com
patch subject: [PATCH] Sound:last.c: fix code syle trailing white space - modify printk()->netdev_dbg() - Possible unnecessary KERN_INFO removed
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230508/202305080037.fiQIAfoP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/467a3e6b911964a967ad7ce544c4426e4d95b14f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review jack1989s-gmail-com/Sound-last-c-fix-code-syle-trailing-white-space-modify-printk-netdev_dbg-Possible-unnecessary-KERN_INFO-removed/20230507-210152
        git checkout 467a3e6b911964a967ad7ce544c4426e4d95b14f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305080037.fiQIAfoP-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/last.c: In function 'alsa_sound_last_init':
>> sound/last.c:15:9: error: implicit declaration of function 'netdev_dbg'; did you mean 'dev_dbg'? [-Werror=implicit-function-declaration]
      15 |         netdev_dbg("ALSA device list:\n");
         |         ^~~~~~~~~~
         |         dev_dbg
   cc1: some warnings being treated as errors


vim +15 sound/last.c

     9	
    10	static int __init alsa_sound_last_init(void)
    11	{
    12		struct snd_card *card;
    13		int idx, ok = 0;
    14	
  > 15		netdev_dbg("ALSA device list:\n");
    16		for (idx = 0; idx < SNDRV_CARDS; idx++) {
    17			card = snd_card_ref(idx);
    18			if (card) {
    19				netdev_dbg("  #%i: %s\n", idx, card->longname);
    20				snd_card_unref(card);
    21				ok++;
    22			}
    23		}
    24		if (ok == 0)
    25			netdev_dbg("  No soundcards found.\n");
    26		return 0;
    27	}
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
