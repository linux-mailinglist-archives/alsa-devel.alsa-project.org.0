Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DD983CF6A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 23:33:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F236822;
	Thu, 25 Jan 2024 23:32:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F236822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706221982;
	bh=o+K8/I7KsjMILeiYonhcP/n00EIdVaQPmHILADXMNQo=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lEoqUkWBtlla6jWrMpjtVwKhIrWQjoFsADXslK03quTFIhoBRlx3Zpr5E1Vw1n4yP
	 XmFC0jdQBmnspga+AdtfYhi8xgPj3pqvOtJyorczrnOKdLJGoLHOWLmKL1/wMKGRNK
	 zxZjqTpLnBA07BsrfnZgY/HwwYD/c1Zfcd9T/sOY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85DDBF8055C; Thu, 25 Jan 2024 23:32:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BEE1F8057D;
	Thu, 25 Jan 2024 23:32:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFC0FF8028D; Thu, 25 Jan 2024 23:30:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1CF40F800C1
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 23:30:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CF40F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CqG43H9a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706221831; x=1737757831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o+K8/I7KsjMILeiYonhcP/n00EIdVaQPmHILADXMNQo=;
  b=CqG43H9a65d8M8JZgvjn9Az0Z+F63XRO9FIf9hTd6IS2wiLjChs/OOWG
   b2LLx2SkljAeDnB3dB8ITRAlrvA6L9X5ON12pl50TDOUx7GRP36eFs+S2
   vC1Iu4/QY0wTLRJEyiJpE6XSIfEjy3Q0w2w+0R25P+DGuKt7/hp3EPtrp
   L27Ns7IR32xm37XtsL6iTLQhfizUD015dHSRnkX86duJG1EaCt2FYzDJy
   4TD3n05Ia8A5+3nunuFzGlVCs5VU6kUJCGE96iKqGpk3OMyVzy1X+xPJR
   2Ii7q8hMFEdxAxfF3C+iPNVaPjdKiFdfVT/fD0PQlBqCIxUcTzuTWQnH0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="401977594"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400";
   d="scan'208";a="401977594"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 14:30:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="820941674"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400";
   d="scan'208";a="820941674"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Jan 2024 14:30:21 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rT8El-0000Sa-1D;
	Thu, 25 Jan 2024 22:30:19 +0000
Date: Fri, 26 Jan 2024 06:30:11 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/pm-ops 7/31] sound/pci/als4000.c:947:2: error:
 call to undeclared function 'snd_sbmixer_suspend'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202401260641.blzmb4QO-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: JESE7H7MJ4BBFLLZ2SZSOEVMCLGZQ4BJ
X-Message-ID-Hash: JESE7H7MJ4BBFLLZ2SZSOEVMCLGZQ4BJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JESE7H7MJ4BBFLLZ2SZSOEVMCLGZQ4BJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/pm-ops
head:   623b2f6110ff118b84628595d53e4947f2883329
commit: 6dae83b64fac25af472e718bf086b43a1f209674 [7/31] ALSA: als4000: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
config: i386-randconfig-012-20240125 (https://download.01.org/0day-ci/archive/20240126/202401260641.blzmb4QO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401260641.blzmb4QO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401260641.blzmb4QO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/pci/als4000.c:947:2: error: call to undeclared function 'snd_sbmixer_suspend'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     947 |         snd_sbmixer_suspend(chip);
         |         ^
   sound/pci/als4000.c:947:2: note: did you mean 'snd_sbmixer_read'?
   include/sound/sb.h:288:15: note: 'snd_sbmixer_read' declared here
     288 | unsigned char snd_sbmixer_read(struct snd_sb *chip, unsigned char reg);
         |               ^
>> sound/pci/als4000.c:959:2: error: call to undeclared function 'snd_sbmixer_resume'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     959 |         snd_sbmixer_resume(chip);
         |         ^
   sound/pci/als4000.c:959:2: note: did you mean 'snd_sbmixer_read'?
   include/sound/sb.h:288:15: note: 'snd_sbmixer_read' declared here
     288 | unsigned char snd_sbmixer_read(struct snd_sb *chip, unsigned char reg);
         |               ^
   2 errors generated.


vim +/snd_sbmixer_suspend +947 sound/pci/als4000.c

d616a0246da88d Takashi Iwai 2022-04-12  938  
68cb2b55927885 Takashi Iwai 2012-07-02  939  static int snd_als4000_suspend(struct device *dev)
703529140cfb77 Takashi Iwai 2005-11-17  940  {
68cb2b55927885 Takashi Iwai 2012-07-02  941  	struct snd_card *card = dev_get_drvdata(dev);
703529140cfb77 Takashi Iwai 2005-11-17  942  	struct snd_card_als4000 *acard = card->private_data;
703529140cfb77 Takashi Iwai 2005-11-17  943  	struct snd_sb *chip = acard->chip;
703529140cfb77 Takashi Iwai 2005-11-17  944  
703529140cfb77 Takashi Iwai 2005-11-17  945  	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
703529140cfb77 Takashi Iwai 2005-11-17  946  	
703529140cfb77 Takashi Iwai 2005-11-17 @947  	snd_sbmixer_suspend(chip);
703529140cfb77 Takashi Iwai 2005-11-17  948  	return 0;
703529140cfb77 Takashi Iwai 2005-11-17  949  }
703529140cfb77 Takashi Iwai 2005-11-17  950  
68cb2b55927885 Takashi Iwai 2012-07-02  951  static int snd_als4000_resume(struct device *dev)
703529140cfb77 Takashi Iwai 2005-11-17  952  {
68cb2b55927885 Takashi Iwai 2012-07-02  953  	struct snd_card *card = dev_get_drvdata(dev);
703529140cfb77 Takashi Iwai 2005-11-17  954  	struct snd_card_als4000 *acard = card->private_data;
703529140cfb77 Takashi Iwai 2005-11-17  955  	struct snd_sb *chip = acard->chip;
703529140cfb77 Takashi Iwai 2005-11-17  956  
703529140cfb77 Takashi Iwai 2005-11-17  957  	snd_als4000_configure(chip);
703529140cfb77 Takashi Iwai 2005-11-17  958  	snd_sbdsp_reset(chip);
703529140cfb77 Takashi Iwai 2005-11-17 @959  	snd_sbmixer_resume(chip);
703529140cfb77 Takashi Iwai 2005-11-17  960  

:::::: The code at line 947 was first introduced by commit
:::::: 703529140cfb774366b839f38f027f283cb948b4 [ALSA] als4000 - Add PM support

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Jaroslav Kysela <perex@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
