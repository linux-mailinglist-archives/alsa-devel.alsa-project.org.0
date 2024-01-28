Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F141D83F40B
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jan 2024 06:31:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EFE5826;
	Sun, 28 Jan 2024 06:31:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EFE5826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706419919;
	bh=MZNID/oj4RHslckb5p6X9sJ1ePsSg9O2KLRuoVBnrbA=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U/fO+C3RK/2UgLQzI2Che7D9rlhglxlcxekuE/CiBiFNRdkeU8KAR6r75AKJPNDuf
	 iI/L38DuNQOvU/N9Pr1x0nTiaA3tBBdCQqOqLf1YeFm9DQHlWnmlmbu1s7SWygbGGR
	 UEZN7YrJhtAASf4VdGEHGt52+8D8eXkEDcVBaEak=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C313F80568; Sun, 28 Jan 2024 06:31:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DEC7FF80431;
	Sun, 28 Jan 2024 06:31:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0354F80425; Sun, 28 Jan 2024 06:26:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F41DF80053
	for <alsa-devel@alsa-project.org>; Sun, 28 Jan 2024 06:23:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F41DF80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FtKSzqrx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706419402; x=1737955402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MZNID/oj4RHslckb5p6X9sJ1ePsSg9O2KLRuoVBnrbA=;
  b=FtKSzqrxZN8XpdHjspC2NFEz7iAoSYWcFoa9/1TpLMqdoTwhafCFWXx/
   CnuUxrSR/Iv+nobrIYZJVmu9o1qsdOkiDU/ywl9uqq9NlcUrCJxER+OFw
   tRNariesMoCVe2gETiHn5re2IexkHpTRW81dedWg2AsRg48Ffy2MZfwHc
   /OCQDiKHiW2zxGPPoLRm1S09O5b1Iu5LCX3nR9j27BLRVW9uLdDXNMI7x
   R+UUOVkdnAVWRA5kGNsp0uglRSl4ua9wjUWCiV04QFqJdUD97voFUJy91
   oJf/+4k1ZN7j/iPI5018MqL5kFBJVPpMBbEbwCFvW5ixG/pNJgZyQ/sga
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="16267686"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400";
   d="scan'208";a="16267686"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2024 21:23:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="910725632"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400";
   d="scan'208";a="910725632"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Jan 2024 21:23:14 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTxdQ-00036c-1Q;
	Sun, 28 Jan 2024 05:23:12 +0000
Date: Sun, 28 Jan 2024 13:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/pm-ops 5/29] include/sound/sb.h:294:20: error:
 cannot combine with previous 'void' declaration specifier
Message-ID: <202401281302.usiU86hP-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: O5YRADJPWSVFJKLS5TX3WHQ63QM6O7VS
X-Message-ID-Hash: O5YRADJPWSVFJKLS5TX3WHQ63QM6O7VS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O5YRADJPWSVFJKLS5TX3WHQ63QM6O7VS/>
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
head:   2fe6ffd7c79f740b73533d44de3ae0e542674857
commit: 9757c2b93cfed03065a14a6cd817474891eb55fe [5/29] ALSA: als4000: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
config: i386-randconfig-141-20240128 (https://download.01.org/0day-ci/archive/20240128/202401281302.usiU86hP-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401281302.usiU86hP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401281302.usiU86hP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/isa/als100.c:24:
>> include/sound/sb.h:294:20: error: cannot combine with previous 'void' declaration specifier
     294 | static inline void void snd_sbmixer_suspend(struct snd_sb *chip) {}
         |                    ^
   include/sound/sb.h:295:20: error: cannot combine with previous 'void' declaration specifier
     295 | static inline void void snd_sbmixer_resume(struct snd_sb *chip) {}
         |                    ^
   2 errors generated.


vim +/void +294 include/sound/sb.h

   274	
   275	/* sb_common.c */
   276	int snd_sbdsp_command(struct snd_sb *chip, unsigned char val);
   277	int snd_sbdsp_get_byte(struct snd_sb *chip);
   278	int snd_sbdsp_reset(struct snd_sb *chip);
   279	int snd_sbdsp_create(struct snd_card *card,
   280			     unsigned long port,
   281			     int irq,
   282			     irq_handler_t irq_handler,
   283			     int dma8, int dma16,
   284			     unsigned short hardware,
   285			     struct snd_sb **r_chip);
   286	/* sb_mixer.c */
   287	void snd_sbmixer_write(struct snd_sb *chip, unsigned char reg, unsigned char data);
   288	unsigned char snd_sbmixer_read(struct snd_sb *chip, unsigned char reg);
   289	int snd_sbmixer_new(struct snd_sb *chip);
   290	#ifdef CONFIG_PM
   291	void snd_sbmixer_suspend(struct snd_sb *chip);
   292	void snd_sbmixer_resume(struct snd_sb *chip);
   293	#else
 > 294	static inline void void snd_sbmixer_suspend(struct snd_sb *chip) {}
   295	static inline void void snd_sbmixer_resume(struct snd_sb *chip) {}
   296	#endif
   297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
