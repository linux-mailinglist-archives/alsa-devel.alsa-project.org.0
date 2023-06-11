Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 407B372B289
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Jun 2023 17:48:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B43A06C1;
	Sun, 11 Jun 2023 17:47:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B43A06C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686498498;
	bh=TAUH8I5bV0rLJjyIBLInv5sGrB6yke/WZq0UwXQC80Y=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=k+Nc1UF9E+Iz49MFF15idEb/cL96HWXTEYQdiDpFEr/QpdKK49i1uELtWy7aGwlDm
	 JPelBW0DMMKog8S935CdZsw08y8sDTK6que+Ujm3ASAKJJ6oXqskEVUxE1WLnk3VXA
	 oWFWYM2oy5vPvJ2sKco3T5iB2Z1/skBG/ySmvQBA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A49BBF80301; Sun, 11 Jun 2023 17:47:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DF89F80093;
	Sun, 11 Jun 2023 17:47:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33F13F80149; Sun, 11 Jun 2023 17:47:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F214FF80130
	for <alsa-devel@alsa-project.org>; Sun, 11 Jun 2023 17:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F214FF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FLBqR4pP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686498433; x=1718034433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TAUH8I5bV0rLJjyIBLInv5sGrB6yke/WZq0UwXQC80Y=;
  b=FLBqR4pP56FhtiWkmQtHloTxkP83h+86AlvhvGnISO876vTNs8NWh6PX
   JYgUK8wsZbtrdk7XY2iKxyBziu8AoUvUHCuiu+p4DNgZrV5E/ldP3Vsdi
   G7Cw2AxBFapn0sJhdul78Y/DK1zpvqcbJaZ2dZPDTpM/KfK/fzQj7Isca
   cSDKI/VD/+2vaMtU4oXBpTpMhhWXVy2O/uEocSElMsaKqgDG0cGtNqm54
   S68Ai06nzaiNC8T4Y3MupS2qNn5A+SQKpK0QbtLgdD1ew83F7xsM4ZXz1
   rvpoEBq1HwP62lwbCi7cYp6oiKppyViusOH7ROifQ8wxQ7D+zlRw0PK7I
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="361237891"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400";
   d="scan'208";a="361237891"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2023 08:47:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="1041060701"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400";
   d="scan'208";a="1041060701"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Jun 2023 08:47:05 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8NHV-000Aua-08;
	Sun, 11 Jun 2023 15:47:05 +0000
Date: Sun, 11 Jun 2023 23:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: [tiwai-sound:for-next 14/74] include/sound/ump_msg.h:196:13: error:
 duplicate member 'reserved'
Message-ID: <202306112301.dMok4XSA-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: ZOUVLV2ZVWMEHS56GLST3Q4P3CDBV26V
X-Message-ID-Hash: ZOUVLV2ZVWMEHS56GLST3Q4P3CDBV26V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZOUVLV2ZVWMEHS56GLST3Q4P3CDBV26V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   15253079ca300160c92c9c0ee2541836463043f6
commit: 0b5288f5fe63eab687c14e5940b9e0d532b129f2 [14/74] ALSA: ump: Add legacy raw MIDI support
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230611/202306112301.dMok4XSA-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=0b5288f5fe63eab687c14e5940b9e0d532b129f2
        git remote add tiwai-sound https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
        git fetch --no-tags tiwai-sound for-next
        git checkout 0b5288f5fe63eab687c14e5940b9e0d532b129f2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306112301.dMok4XSA-lkp@intel.com/

Note: the tiwai-sound/for-next HEAD 15253079ca300160c92c9c0ee2541836463043f6 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from sound/core/ump_convert.h:5,
                    from sound/core/ump.c:14:
>> include/sound/ump_msg.h:196:13: error: duplicate member 'reserved'
     196 |         u32 reserved:8;
         |             ^~~~~~~~
>> include/sound/ump_msg.h:197:13: error: duplicate member 'program'
     197 |         u32 program:8;
         |             ^~~~~~~
>> include/sound/ump_msg.h:198:13: error: duplicate member 'channel'
     198 |         u32 channel:4;
         |             ^~~~~~~
>> include/sound/ump_msg.h:199:13: error: duplicate member 'status'
     199 |         u32 status:4;
         |             ^~~~~~
>> include/sound/ump_msg.h:200:13: error: duplicate member 'group'
     200 |         u32 group:4;
         |             ^~~~~
>> include/sound/ump_msg.h:201:13: error: duplicate member 'type'
     201 |         u32 type:4;
         |             ^~~~


vim +/reserved +196 include/sound/ump_msg.h

   184	
   185	/* MIDI 1.0 Program Change (32bit) */
   186	struct snd_ump_midi1_msg_program {
   187	#ifdef __BIG_ENDIAN_BITFIELD
   188		u32 type:4;
   189		u32 group:4;
   190		u32 status:4;
   191		u32 channel:4;
   192		u32 program:8;
   193		u32 reserved:8;
   194	#else
   195	#endif
 > 196		u32 reserved:8;
 > 197		u32 program:8;
 > 198		u32 channel:4;
 > 199		u32 status:4;
 > 200		u32 group:4;
 > 201		u32 type:4;
   202	} __packed;
   203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
