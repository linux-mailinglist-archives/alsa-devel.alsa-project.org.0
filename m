Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7B483F307
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jan 2024 03:34:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21C9084D;
	Sun, 28 Jan 2024 03:33:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21C9084D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706409241;
	bh=E0fa1VPQXbtcFEgKpTvAiX2TZvxe2F/4CpKfEvu9u7g=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Pc5kErNWbmtTmm85HdD3en1rtcLP+CqJjThjGUu5OlQmd5TBbneghTVobzFCS63GM
	 3xYPEZhKHVtOi+13lhu3DL/jWIUtAHnyBIY5SA/W+6RQ2lQ2TZZzHhXXQWILwb9Glm
	 9h3XIH6B41gsSfhutS46ILV3Q4UHVEjb9WRodPqo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29919F804F1; Sun, 28 Jan 2024 03:33:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB36AF8057E;
	Sun, 28 Jan 2024 03:33:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94E3BF80310; Sun, 28 Jan 2024 03:33:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0461F8017A
	for <alsa-devel@alsa-project.org>; Sun, 28 Jan 2024 03:33:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0461F8017A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=D0Y/RE8l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706409198; x=1737945198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E0fa1VPQXbtcFEgKpTvAiX2TZvxe2F/4CpKfEvu9u7g=;
  b=D0Y/RE8lT2PPpnvQrCUKHnBijGXgRiBlqx+BzTSa9oQtWQUuZv5B9T3s
   jC9NZGgDJc+0FH/9zvYWbBhTZR0gZutuxJOnKEamezxGjU++SepU+KycK
   UfOmTNwWdVCbF4jTKO8ZoQ+xvB9wa3rirC7dThtetw3IFw7es0cpZzxcr
   qONwOECs0/FYG/nxUzzqhPhLT04DjMZ5WbMp3nJKpXAz/MPxLiJIs5S9X
   D3ojuxDXAzlrUzyCDYCx8+GOusz4JSmYT3BbWdJ6etsXmsrD/O/fD2H6X
   1hhel72RFJPrDcRWqEQFwDXXDbtZ6QFF/zmXaNVH4lJb93HCLKxRWxNje
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="9847817"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400";
   d="scan'208";a="9847817"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2024 18:33:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="787475148"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400";
   d="scan'208";a="787475148"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Jan 2024 18:33:10 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTuyq-0002zH-1c;
	Sun, 28 Jan 2024 02:33:08 +0000
Date: Sun, 28 Jan 2024 10:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/pm-ops 5/29] include/sound/sb.h:294:20: error:
 two or more data types in declaration specifiers
Message-ID: <202401281001.74RRLOzP-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: NBSWPPJODC6CIAMUSMVAMBWHZ3E6YR3T
X-Message-ID-Hash: NBSWPPJODC6CIAMUSMVAMBWHZ3E6YR3T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NBSWPPJODC6CIAMUSMVAMBWHZ3E6YR3T/>
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
config: i386-randconfig-052-20240127 (https://download.01.org/0day-ci/archive/20240128/202401281001.74RRLOzP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401281001.74RRLOzP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401281001.74RRLOzP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/isa/sb/sb_common.c:17:
>> include/sound/sb.h:294:20: error: two or more data types in declaration specifiers
     294 | static inline void void snd_sbmixer_suspend(struct snd_sb *chip) {}
         |                    ^~~~
   include/sound/sb.h:295:20: error: two or more data types in declaration specifiers
     295 | static inline void void snd_sbmixer_resume(struct snd_sb *chip) {}
         |                    ^~~~


vim +294 include/sound/sb.h

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
