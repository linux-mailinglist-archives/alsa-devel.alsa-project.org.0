Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E07366EBB27
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 22:27:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABB86EEE;
	Sat, 22 Apr 2023 22:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABB86EEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682195225;
	bh=jUhj8HqadENDGjPZzm8feptmxhCJkjiHf+gTzdVERm0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LU+qyX4G6nIlMgE3P+PidzDpnXuaixzE8hDXWc8v24q7YrsMrlOW4fgT3ka4Ta1HL
	 EEuiZ/ZfCbilPyXNfins4hnHqZ66uPdgqEBbuzzgzujJ/lrtTtS/jeTINNchSAQPQv
	 YTYOJIDJVtulxZbSzkZNsYW1N3sRdr08DOHT/uJY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E0AFF80053;
	Sat, 22 Apr 2023 22:26:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DCA7F80155; Sat, 22 Apr 2023 22:26:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F280F80053
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 22:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F280F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NhS4isFj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682195159; x=1713731159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jUhj8HqadENDGjPZzm8feptmxhCJkjiHf+gTzdVERm0=;
  b=NhS4isFjvtu+D5Le+7mL/uQodATF43CE8th1jM+HXv8iZTKqjTkI4e0I
   YFLWlE63VDLBXxpOah6WRC2eBbLwI0HnFEe5gFd3Yf2XplTFCHBlf5aF7
   VJoLJ+5VeQvMCP0ZQf0u3CcsfpYUz1DCAyJCQ3wd3cOyHrW4rVqkKsivP
   Miqx2wOGXsHQk9EJwGY2C63Cu9dwYeRAkGnnic8Z2FTim0oS7ioP6IG2u
   cYr9eQ8asndXpp880DzwwVDo0Xv86/esQxXMsxV9MDRScbF6Ni60PegLM
   02mJaUwcF7CGKPCuhlxK6dMNaw81mE54Hmyf/+4A30IamFZY3GZ2YGD8T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="346215724"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200";
   d="scan'208";a="346215724"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2023 13:25:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="804102969"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200";
   d="scan'208";a="804102969"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Apr 2023 13:25:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqJnr-000hU2-31;
	Sat, 22 Apr 2023 20:25:51 +0000
Date: Sun, 23 Apr 2023 04:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/2] ALSA: emu10k1: fix SNDRV_EMU10K1_IOCTL_SINGLE_STEP
Message-ID: <202304230435.xkjl2DgF-lkp@intel.com>
References: <20230422161021.1144004-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230422161021.1144004-1-oswald.buddenhagen@gmx.de>
Message-ID-Hash: 2YELPT7LTQ7TDRJCGXR22Z3U42OQZYJG
X-Message-ID-Hash: 2YELPT7LTQ7TDRJCGXR22Z3U42OQZYJG
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2YELPT7LTQ7TDRJCGXR22Z3U42OQZYJG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Oswald,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v6.3-rc7 next-20230421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oswald-Buddenhagen/ALSA-emu10k1-don-t-stop-DSP-in-_snd_emu10k1_-audigy_-init_efx/20230423-002213
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230422161021.1144004-1-oswald.buddenhagen%40gmx.de
patch subject: [PATCH 1/2] ALSA: emu10k1: fix SNDRV_EMU10K1_IOCTL_SINGLE_STEP
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230423/202304230435.xkjl2DgF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/dfbd3fc49e3b9ec81160caee29b1d41476d5a6aa
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oswald-Buddenhagen/ALSA-emu10k1-don-t-stop-DSP-in-_snd_emu10k1_-audigy_-init_efx/20230423-002213
        git checkout dfbd3fc49e3b9ec81160caee29b1d41476d5a6aa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304230435.xkjl2DgF-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/pci/emu10k1/emufx.c: In function 'snd_emu10k1_fx8010_ioctl':
>> sound/pci/emu10k1/emufx.c:2654:80: error: 'A_DBG_STEP' undeclared (first use in this function); did you mean 'A_DBG_ZC'?
    2654 |                         snd_emu10k1_ptr_write(emu, A_DBG, 0, emu->fx8010.dbg | A_DBG_STEP | addr);
         |                                                                                ^~~~~~~~~~
         |                                                                                A_DBG_ZC
   sound/pci/emu10k1/emufx.c:2654:80: note: each undeclared identifier is reported only once for each function it appears in


vim +2654 sound/pci/emu10k1/emufx.c

  2541	
  2542	static int snd_emu10k1_fx8010_ioctl(struct snd_hwdep * hw, struct file *file, unsigned int cmd, unsigned long arg)
  2543	{
  2544		struct snd_emu10k1 *emu = hw->private_data;
  2545		struct snd_emu10k1_fx8010_info *info;
  2546		struct snd_emu10k1_fx8010_code *icode;
  2547		struct snd_emu10k1_fx8010_pcm_rec *ipcm;
  2548		unsigned int addr;
  2549		void __user *argp = (void __user *)arg;
  2550		int res;
  2551		
  2552		switch (cmd) {
  2553		case SNDRV_EMU10K1_IOCTL_PVERSION:
  2554			emu->support_tlv = 1;
  2555			return put_user(SNDRV_EMU10K1_VERSION, (int __user *)argp);
  2556		case SNDRV_EMU10K1_IOCTL_INFO:
  2557			info = kzalloc(sizeof(*info), GFP_KERNEL);
  2558			if (!info)
  2559				return -ENOMEM;
  2560			snd_emu10k1_fx8010_info(emu, info);
  2561			if (copy_to_user(argp, info, sizeof(*info))) {
  2562				kfree(info);
  2563				return -EFAULT;
  2564			}
  2565			kfree(info);
  2566			return 0;
  2567		case SNDRV_EMU10K1_IOCTL_CODE_POKE:
  2568			if (!capable(CAP_SYS_ADMIN))
  2569				return -EPERM;
  2570	
  2571			icode = memdup_user(argp, sizeof(*icode));
  2572			if (IS_ERR(icode))
  2573				return PTR_ERR(icode);
  2574			res = snd_emu10k1_icode_poke(emu, icode, false);
  2575			kfree(icode);
  2576			return res;
  2577		case SNDRV_EMU10K1_IOCTL_CODE_PEEK:
  2578			icode = memdup_user(argp, sizeof(*icode));
  2579			if (IS_ERR(icode))
  2580				return PTR_ERR(icode);
  2581			res = snd_emu10k1_icode_peek(emu, icode);
  2582			if (res == 0 && copy_to_user(argp, icode, sizeof(*icode))) {
  2583				kfree(icode);
  2584				return -EFAULT;
  2585			}
  2586			kfree(icode);
  2587			return res;
  2588		case SNDRV_EMU10K1_IOCTL_PCM_POKE:
  2589			ipcm = memdup_user(argp, sizeof(*ipcm));
  2590			if (IS_ERR(ipcm))
  2591				return PTR_ERR(ipcm);
  2592			res = snd_emu10k1_ipcm_poke(emu, ipcm);
  2593			kfree(ipcm);
  2594			return res;
  2595		case SNDRV_EMU10K1_IOCTL_PCM_PEEK:
  2596			ipcm = memdup_user(argp, sizeof(*ipcm));
  2597			if (IS_ERR(ipcm))
  2598				return PTR_ERR(ipcm);
  2599			res = snd_emu10k1_ipcm_peek(emu, ipcm);
  2600			if (res == 0 && copy_to_user(argp, ipcm, sizeof(*ipcm))) {
  2601				kfree(ipcm);
  2602				return -EFAULT;
  2603			}
  2604			kfree(ipcm);
  2605			return res;
  2606		case SNDRV_EMU10K1_IOCTL_TRAM_SETUP:
  2607			if (!capable(CAP_SYS_ADMIN))
  2608				return -EPERM;
  2609			if (get_user(addr, (unsigned int __user *)argp))
  2610				return -EFAULT;
  2611			mutex_lock(&emu->fx8010.lock);
  2612			res = snd_emu10k1_fx8010_tram_setup(emu, addr);
  2613			mutex_unlock(&emu->fx8010.lock);
  2614			return res;
  2615		case SNDRV_EMU10K1_IOCTL_STOP:
  2616			if (!capable(CAP_SYS_ADMIN))
  2617				return -EPERM;
  2618			if (emu->audigy)
  2619				snd_emu10k1_ptr_write(emu, A_DBG, 0, emu->fx8010.dbg |= A_DBG_SINGLE_STEP);
  2620			else
  2621				snd_emu10k1_ptr_write(emu, DBG, 0, emu->fx8010.dbg |= EMU10K1_DBG_SINGLE_STEP);
  2622			return 0;
  2623		case SNDRV_EMU10K1_IOCTL_CONTINUE:
  2624			if (!capable(CAP_SYS_ADMIN))
  2625				return -EPERM;
  2626			if (emu->audigy)
  2627				snd_emu10k1_ptr_write(emu, A_DBG, 0, emu->fx8010.dbg = 0);
  2628			else
  2629				snd_emu10k1_ptr_write(emu, DBG, 0, emu->fx8010.dbg = 0);
  2630			return 0;
  2631		case SNDRV_EMU10K1_IOCTL_ZERO_TRAM_COUNTER:
  2632			if (!capable(CAP_SYS_ADMIN))
  2633				return -EPERM;
  2634			if (emu->audigy)
  2635				snd_emu10k1_ptr_write(emu, A_DBG, 0, emu->fx8010.dbg | A_DBG_ZC);
  2636			else
  2637				snd_emu10k1_ptr_write(emu, DBG, 0, emu->fx8010.dbg | EMU10K1_DBG_ZC);
  2638			udelay(10);
  2639			if (emu->audigy)
  2640				snd_emu10k1_ptr_write(emu, A_DBG, 0, emu->fx8010.dbg);
  2641			else
  2642				snd_emu10k1_ptr_write(emu, DBG, 0, emu->fx8010.dbg);
  2643			return 0;
  2644		case SNDRV_EMU10K1_IOCTL_SINGLE_STEP:
  2645			if (!capable(CAP_SYS_ADMIN))
  2646				return -EPERM;
  2647			if (get_user(addr, (unsigned int __user *)argp))
  2648				return -EFAULT;
  2649			if (emu->audigy) {
  2650				if (addr > A_DBG_STEP_ADDR)
  2651					return -EINVAL;
  2652				snd_emu10k1_ptr_write(emu, A_DBG, 0, emu->fx8010.dbg |= A_DBG_SINGLE_STEP);
  2653				udelay(10);
> 2654				snd_emu10k1_ptr_write(emu, A_DBG, 0, emu->fx8010.dbg | A_DBG_STEP | addr);
  2655			} else {
  2656				if (addr > EMU10K1_DBG_SINGLE_STEP_ADDR)
  2657					return -EINVAL;
  2658				snd_emu10k1_ptr_write(emu, DBG, 0, emu->fx8010.dbg |= EMU10K1_DBG_SINGLE_STEP);
  2659				udelay(10);
  2660				snd_emu10k1_ptr_write(emu, DBG, 0, emu->fx8010.dbg | EMU10K1_DBG_STEP | addr);
  2661			}
  2662			return 0;
  2663		case SNDRV_EMU10K1_IOCTL_DBG_READ:
  2664			if (emu->audigy)
  2665				addr = snd_emu10k1_ptr_read(emu, A_DBG, 0);
  2666			else
  2667				addr = snd_emu10k1_ptr_read(emu, DBG, 0);
  2668			if (put_user(addr, (unsigned int __user *)argp))
  2669				return -EFAULT;
  2670			return 0;
  2671		}
  2672		return -ENOTTY;
  2673	}
  2674	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
