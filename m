Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F6B78A10E
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 20:43:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1FA9741;
	Sun, 27 Aug 2023 20:42:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1FA9741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693161821;
	bh=E+Xe1qY1yediGEnxZQBbwggRf92hdVXCrGSaiOFSOdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mAJE5iSZcuc4bi6ArUQqlI1ytFVZKhMEzbx/U5SdR3faXmdLK+Z6AiBgifIoZ8rjn
	 JIofjZAhvYBBY07yNUSS43ydXmuM7+dN7kNRLUtU9E/BOZCsblWi4pYOe9H+Gljtdx
	 Tek4yD3oxMuvjfLfQexrnEODpDo18ALKULo1o7qk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D62DFF800F5; Sun, 27 Aug 2023 20:42:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E92EF80155;
	Sun, 27 Aug 2023 20:42:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1653FF80158; Sun, 27 Aug 2023 20:42:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4632F800F5
	for <alsa-devel@alsa-project.org>; Sun, 27 Aug 2023 20:42:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4632F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dpa13WQ3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693161758; x=1724697758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E+Xe1qY1yediGEnxZQBbwggRf92hdVXCrGSaiOFSOdo=;
  b=dpa13WQ34r2c4BiYz63AJ8SDtqm4ANlXTLAT+LFhstLi/HiXrYU/RbuT
   7L7I/3aq9fjgugUYhrfRh0u70rG2UkaoijXQfq6CFPYHwXlEGYRyVss2p
   hLjzuiv6uzzS8rXOvJ42RlktMbD8BKozj/r0UQ8hMBi5bqUDHZ9KAQaLH
   +GFCJbsw1/Xm9ED6gYF+Oqm6jn1v0yPy/ZT+uwVOvOudXEE1SHvdyhVGP
   lfcJsuj46KpEcGuJhNaCgRT4kB13dMs4k8yeGXtocpkrJraKJtOjJnP8Z
   0XyTQCW2WzBMuCX7+IxHM/pENoOKMZS6GY5MwkQv8UImZ1B0QH22NwBBl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="359958081"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000";
   d="scan'208";a="359958081"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2023 11:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200";
   d="scan'208";a="881696805"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 27 Aug 2023 11:42:35 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaKiT-00066X-3A;
	Sun, 27 Aug 2023 18:42:29 +0000
Date: Mon, 28 Aug 2023 02:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	alsa-devel@alsa-project.org
Cc: oe-kbuild-all@lists.linux.dev, Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v5 1/8] ALSA: add snd_ctl_add_locked() & export
 snd_ctl_remove_locked()
Message-ID: <202308280222.TknsCq1k-lkp@intel.com>
References: <20230825222158.171007-2-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825222158.171007-2-oswald.buddenhagen@gmx.de>
Message-ID-Hash: GALKAFPFMCEVLLZORRYAHQG55UTWCUSC
X-Message-ID-Hash: GALKAFPFMCEVLLZORRYAHQG55UTWCUSC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GALKAFPFMCEVLLZORRYAHQG55UTWCUSC/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Oswald,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c5baafafd8411c19e27c6a2c7237538a34b8ca31]

url:    https://github.com/intel-lab-lkp/linux/commits/Oswald-Buddenhagen/ALSA-add-snd_ctl_add_locked-export-snd_ctl_remove_locked/20230828-011105
base:   c5baafafd8411c19e27c6a2c7237538a34b8ca31
patch link:    https://lore.kernel.org/r/20230825222158.171007-2-oswald.buddenhagen%40gmx.de
patch subject: [PATCH v5 1/8] ALSA: add snd_ctl_add_locked() & export snd_ctl_remove_locked()
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230828/202308280222.TknsCq1k-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280222.TknsCq1k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308280222.TknsCq1k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/core/control.c:558: warning: Function parameter or member 'card' not described in 'snd_ctl_add_locked'
>> sound/core/control.c:558: warning: Function parameter or member 'kcontrol' not described in 'snd_ctl_add_locked'
>> sound/core/control.c:633: warning: Function parameter or member 'card' not described in 'snd_ctl_remove_locked'
>> sound/core/control.c:633: warning: Function parameter or member 'kcontrol' not described in 'snd_ctl_remove_locked'


vim +558 sound/core/control.c

   552	
   553	/**
   554	 * snd_ctl_add_locked - same as snd_ctl_add(), but card->controls_rwsem
   555	 * is expected to be already locked if necessary.
   556	 */
   557	int snd_ctl_add_locked(struct snd_card *card, struct snd_kcontrol *kcontrol)
 > 558	{
   559		return snd_ctl_add_replace_locked(card, kcontrol, CTL_ADD_EXCLUSIVE);
   560	}
   561	EXPORT_SYMBOL_GPL(snd_ctl_add_locked);
   562	
   563	/**
   564	 * snd_ctl_add - add the control instance to the card
   565	 * @card: the card instance
   566	 * @kcontrol: the control instance to add
   567	 *
   568	 * Adds the control instance created via snd_ctl_new() or
   569	 * snd_ctl_new1() to the given card. Assigns also an unique
   570	 * numid used for fast search.
   571	 *
   572	 * It frees automatically the control which cannot be added.
   573	 *
   574	 * Return: Zero if successful, or a negative error code on failure.
   575	 *
   576	 */
   577	int snd_ctl_add(struct snd_card *card, struct snd_kcontrol *kcontrol)
   578	{
   579		return snd_ctl_add_replace(card, kcontrol, CTL_ADD_EXCLUSIVE);
   580	}
   581	EXPORT_SYMBOL(snd_ctl_add);
   582	
   583	/**
   584	 * snd_ctl_replace - replace the control instance of the card
   585	 * @card: the card instance
   586	 * @kcontrol: the control instance to replace
   587	 * @add_on_replace: add the control if not already added
   588	 *
   589	 * Replaces the given control.  If the given control does not exist
   590	 * and the add_on_replace flag is set, the control is added.  If the
   591	 * control exists, it is destroyed first.
   592	 *
   593	 * It frees automatically the control which cannot be added or replaced.
   594	 *
   595	 * Return: Zero if successful, or a negative error code on failure.
   596	 */
   597	int snd_ctl_replace(struct snd_card *card, struct snd_kcontrol *kcontrol,
   598			    bool add_on_replace)
   599	{
   600		return snd_ctl_add_replace(card, kcontrol,
   601					   add_on_replace ? CTL_ADD_ON_REPLACE : CTL_REPLACE);
   602	}
   603	EXPORT_SYMBOL(snd_ctl_replace);
   604	
   605	static int __snd_ctl_remove(struct snd_card *card,
   606				    struct snd_kcontrol *kcontrol,
   607				    bool remove_hash)
   608	{
   609		unsigned int idx;
   610	
   611		lockdep_assert_held_write(&card->controls_rwsem);
   612	
   613		if (snd_BUG_ON(!card || !kcontrol))
   614			return -EINVAL;
   615		list_del(&kcontrol->list);
   616	
   617		if (remove_hash)
   618			remove_hash_entries(card, kcontrol);
   619	
   620		card->controls_count -= kcontrol->count;
   621		for (idx = 0; idx < kcontrol->count; idx++)
   622			snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_REMOVE, kcontrol, idx);
   623		snd_ctl_free_one(kcontrol);
   624		return 0;
   625	}
   626	
   627	/**
   628	 * snd_ctl_remove_locked - same as snd_ctl_remove(), but card->controls_rwsem
   629	 * is expected to be already locked if necessary.
   630	 */
   631	int snd_ctl_remove_locked(struct snd_card *card,
   632				  struct snd_kcontrol *kcontrol)
 > 633	{
   634		return __snd_ctl_remove(card, kcontrol, true);
   635	}
   636	EXPORT_SYMBOL_GPL(snd_ctl_remove_locked);
   637	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
