Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF0A581CFA
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 03:16:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA3D6846;
	Wed, 27 Jul 2022 03:16:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA3D6846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658884610;
	bh=c9iaGwvpaOHQ2V3/DdyBghEBEeximZm7m2rLZBSaxjo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RiFMKzkDVOHhBveuxkas5E3ut0Z42+GETfs3g3lpCzHx3Ltk4hyc8EQyRyNQnmy6i
	 uRH4rgKvJD8IhP5qqPLcLZKJMgKDytBnR/yCE7EPR8BEauP0OceDUCSyNWrKl1Kn0M
	 FjG3HS3etpmTJBY0/eYCBdHay9IiEJ7ifR1CXeCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42A52F80238;
	Wed, 27 Jul 2022 03:15:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD936F8025A; Wed, 27 Jul 2022 03:15:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F79EF800FA
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 03:15:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F79EF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eE5MKNkN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658884540; x=1690420540;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c9iaGwvpaOHQ2V3/DdyBghEBEeximZm7m2rLZBSaxjo=;
 b=eE5MKNkNj/b3KuFGOZoZSbZVFuSNDeqWM+LE5SwQONR/p7wX7h5rNirq
 QcOVzibrSPB7hWzc2sxGxAoDQfh2QbAASYdTc1EkCjT8+WIqNOZc7W2Vs
 q6OuJKWTYOM3lU3fBuG5UiswbNVZNo9+Gb1yVBcT0qJGj3t0gtcz8lSkL
 1Tx2V0u8xwNzC3Dp3QZSfbSuHWF30WDFy1YmgRel46l3KZAyfWW2MzK3L
 76o+UUa7dI+SXQc9MD6rAmw6tTEQ9WUwU8svbaSpAmMevAYbv6vwIM1/Z
 iqoofqYweRxmlk9r5OD6fbmn/7X+Mr7QPuaWCOmZ5kNMpZTxK6NyK98jS Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="289307544"
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; d="scan'208";a="289307544"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2022 18:15:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; d="scan'208";a="633011079"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 26 Jul 2022 18:15:33 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oGVe8-00088s-1y;
 Wed, 27 Jul 2022 01:15:32 +0000
Date: Wed, 27 Jul 2022 09:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/4] ALSA: core: Add async signal helpers
Message-ID: <202207270950.zWfcvyEK-lkp@intel.com>
References: <20220726153420.3403-2-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726153420.3403-2-tiwai@suse.de>
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

I love your patch! Yet something to improve:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on linus/master v5.19-rc8 next-20220726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Iwai/ALSA-Defer-async-signal-handling/20220726-233840
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: csky-randconfig-r014-20220726 (https://download.01.org/0day-ci/archive/20220727/202207270950.zWfcvyEK-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e5977c421331e16237bf3ebd283981757e03f433
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Takashi-Iwai/ALSA-Defer-async-signal-handling/20220726-233840
        git checkout e5977c421331e16237bf3ebd283981757e03f433
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash sound/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   sound/core/misc.c: In function 'snd_fasync_work_fn':
>> sound/core/misc.c:180:25: error: implicit declaration of function 'kill_fasync'; did you mean 'snd_kill_fasync'? [-Werror=implicit-function-declaration]
     180 |                         kill_fasync(&fasync->fasync, fasync->signal, fasync->poll);
         |                         ^~~~~~~~~~~
         |                         snd_kill_fasync
   sound/core/misc.c: In function 'snd_fasync_helper':
>> sound/core/misc.c:213:16: error: implicit declaration of function 'fasync_helper'; did you mean 'snd_fasync_helper'? [-Werror=implicit-function-declaration]
     213 |         return fasync_helper(fd, file, on, &fasync->fasync);
         |                ^~~~~~~~~~~~~
         |                snd_fasync_helper
   cc1: some warnings being treated as errors


vim +180 sound/core/misc.c

   169	
   170	static void snd_fasync_work_fn(struct work_struct *work)
   171	{
   172		struct snd_fasync *fasync;
   173	
   174		spin_lock_irq(&snd_fasync_lock);
   175		while (!list_empty(&snd_fasync_list)) {
   176			fasync = list_first_entry(&snd_fasync_list, struct snd_fasync, list);
   177			list_del_init(&fasync->list);
   178			spin_unlock_irq(&snd_fasync_lock);
   179			if (fasync->on)
 > 180				kill_fasync(&fasync->fasync, fasync->signal, fasync->poll);
   181			spin_lock_irq(&snd_fasync_lock);
   182		}
   183		spin_unlock_irq(&snd_fasync_lock);
   184	}
   185	
   186	static DECLARE_WORK(snd_fasync_work, snd_fasync_work_fn);
   187	
   188	int snd_fasync_helper(int fd, struct file *file, int on,
   189			      struct snd_fasync **fasyncp)
   190	{
   191		struct snd_fasync *fasync = NULL;
   192	
   193		if (on) {
   194			fasync = kzalloc(sizeof(*fasync), GFP_KERNEL);
   195			if (!fasync)
   196				return -ENOMEM;
   197			INIT_LIST_HEAD(&fasync->list);
   198		}
   199	
   200		spin_lock_irq(&snd_fasync_lock);
   201		if (*fasyncp) {
   202			kfree(fasync);
   203			fasync = *fasyncp;
   204		} else {
   205			if (!fasync) {
   206				spin_unlock_irq(&snd_fasync_lock);
   207				return 0;
   208			}
   209			*fasyncp = fasync;
   210		}
   211		fasync->on = on;
   212		spin_unlock_irq(&snd_fasync_lock);
 > 213		return fasync_helper(fd, file, on, &fasync->fasync);
   214	}
   215	EXPORT_SYMBOL_GPL(snd_fasync_helper);
   216	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
