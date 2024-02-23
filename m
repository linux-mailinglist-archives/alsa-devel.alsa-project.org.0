Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DC2860A01
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 05:51:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7696E7F;
	Fri, 23 Feb 2024 05:51:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7696E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708663907;
	bh=+haZ0qgmxCz0nbmY7lAIgz86Y4wP+pnN78uBr4Lkrwg=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UvNQW18Hnq6C4S8PZ536/JwwKPTS3kb4rz12Y+9RRKeeVE3t3SdkCoHLD4hRUcVrL
	 2JEyzW8zebARhY8cDf/6/yBHrWwjXc6AT5QkE4G7g4PocDxB93eOmDBe0Q+/g7cf3h
	 M/VRJwgmFuZzfzUhw6y97wWaEbHPU3KUMeXQv1ag=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69E79F805A8; Fri, 23 Feb 2024 05:50:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52958F80589;
	Fri, 23 Feb 2024 05:50:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EF01F80496; Fri, 23 Feb 2024 05:48:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F82AF800EE
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 05:47:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F82AF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=W66v+Wi/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708663677; x=1740199677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+haZ0qgmxCz0nbmY7lAIgz86Y4wP+pnN78uBr4Lkrwg=;
  b=W66v+Wi/ic3fQbEvqD9+qcnu8rsqNJE5allJYDoTWl014qg0pWJXDWRN
   8F/IDE4/x1htuW/QHbAFCODIp0FqygQag8VpDO3QPqkHr/4HPmSEHXVtK
   1zNLPlhJR3iPk5Cwqe2tgaeVD6cu4rMPrGT0qaBYXu/cX0pPHznIh1IxC
   BIc0xwqewm9nqkHG1lfgBX3f1+a2XoPX2R0KEghrAyrJwesuRFiltZGjV
   5aUPY3mk8dFEPXK6eGfUPdFIOgX56ZTbiXa0mXkvP3aYkr4WtYGVD9T81
   UhPmHMVYEBINiymZQz5xTl7t5I1Hb/c9j/h7/DUdG6Qv4/XNgaCycqWVU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20402495"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="20402495"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 20:47:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="10548713"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Feb 2024 20:47:50 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdNTM-000752-2v;
	Fri, 23 Feb 2024 04:47:45 +0000
Date: Fri, 23 Feb 2024 12:47:02 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/guard 44/62] sound/core/oss/mixer_oss.c:819:3:
 error: cannot jump from this goto statement to its label
Message-ID: <202402231259.Tx6bs1or-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 6YP7UOMXSQZNRVEDLLINSVKKL5CDDNYK
X-Message-ID-Hash: 6YP7UOMXSQZNRVEDLLINSVKKL5CDDNYK
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6YP7UOMXSQZNRVEDLLINSVKKL5CDDNYK/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/guard
head:   e4545d528ae658c35d02593567613c06f1386ffa
commit: b398454ce784b8a931d9fe80a0c1fb9dec644d29 [44/62] ALSA: mixer_oss: Use guard() for locking
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240223/202402231259.Tx6bs1or-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402231259.Tx6bs1or-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402231259.Tx6bs1or-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/core/oss/mixer_oss.c:819:3: error: cannot jump from this goto statement to its label
     819 |                 goto error;
         |                 ^
   sound/core/oss/mixer_oss.c:821:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     821 |         guard(rwsem_read)(&card->controls_rwsem);
         |         ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:36:1: note: expanded from here
      36 | __UNIQUE_ID_guard239
         | ^
   sound/core/oss/mixer_oss.c:870:3: error: cannot jump from this goto statement to its label
     870 |                 goto error;
         |                 ^
   sound/core/oss/mixer_oss.c:872:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     872 |         guard(rwsem_read)(&card->controls_rwsem);
         |         ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:45:1: note: expanded from here
      45 | __UNIQUE_ID_guard240
         | ^
   2 errors generated.


vim +819 sound/core/oss/mixer_oss.c

   803	
   804	static int snd_mixer_oss_get_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned int *active_index)
   805	{
   806		struct snd_card *card = fmixer->card;
   807		struct snd_mixer_oss *mixer = fmixer->mixer;
   808		struct snd_kcontrol *kctl;
   809		struct snd_mixer_oss_slot *pslot;
   810		struct slot *slot;
   811		struct snd_ctl_elem_info *uinfo;
   812		struct snd_ctl_elem_value *uctl;
   813		int err, idx;
   814		
   815		uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
   816		uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
   817		if (uinfo == NULL || uctl == NULL) {
   818			err = -ENOMEM;
 > 819			goto error;
   820		}
   821		guard(rwsem_read)(&card->controls_rwsem);
   822		kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0);
   823		if (! kctl) {
   824			err = -ENOENT;
   825			goto error;
   826		}
   827		err = kctl->info(kctl, uinfo);
   828		if (err < 0)
   829			goto error;
   830		err = kctl->get(kctl, uctl);
   831		if (err < 0)
   832			goto error;
   833		for (idx = 0; idx < 32; idx++) {
   834			if (!(mixer->mask_recsrc & (1 << idx)))
   835				continue;
   836			pslot = &mixer->slots[idx];
   837			slot = pslot->private_data;
   838			if (slot->signature != SNDRV_MIXER_OSS_SIGNATURE)
   839				continue;
   840			if (!(slot->present & SNDRV_MIXER_OSS_PRESENT_CAPTURE))
   841				continue;
   842			if (slot->capture_item == uctl->value.enumerated.item[0]) {
   843				*active_index = idx;
   844				break;
   845			}
   846		}
   847		err = 0;
   848	error:
   849	      	kfree(uctl);
   850	      	kfree(uinfo);
   851	      	return err;
   852	}
   853	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
