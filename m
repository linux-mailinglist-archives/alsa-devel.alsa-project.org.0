Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D319B6BF766
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Mar 2023 03:31:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E90AF886;
	Sat, 18 Mar 2023 03:30:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E90AF886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679106700;
	bh=GvmzAJef4m3BJVSEAGAssA83vtoA9QXJ2aaMijbn1ok=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K2s1qb8zTeQQc44EEzETmNrJb6tH9Qe3Gmy1DaU0TRh0aGjhiDVQcJZznhLkx+IVI
	 trU0qk55HjNpIYYSDlNjH6NlNBrXAUE+tsPZ64zy5kBUfG3ICj9+E6RWa30g3Azx4W
	 svFWLSGH6/KSqCJ3cYEmf66PjZxeSmDTmOY64B74=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 566A7F8032D;
	Sat, 18 Mar 2023 03:30:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78B28F80423; Sat, 18 Mar 2023 03:30:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4F5EF80093
	for <alsa-devel@alsa-project.org>; Sat, 18 Mar 2023 03:30:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4F5EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XAMpXpps
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679106636; x=1710642636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GvmzAJef4m3BJVSEAGAssA83vtoA9QXJ2aaMijbn1ok=;
  b=XAMpXppsjQzErn1JSoUdNAgPK0t0p7VO17aCGVjgPppjn9eDxfdF3Oo1
   Hxmj+Ekn0wWlrdvOX5yWEtEY5Yr9s4Z3xENQnDqSIpZcu2iEleH8O13J1
   GFPVtr3aX2I0FhrXuJz+wirncr2Yx3BxMpv9vka72fgb3A/Opny2Uk2rz
   d9xL455sv/TYmnwTtKeajoSzXhcbBxY/VIf2KMTF6C4Apgqg3PMPEKRWp
   kvJZZTie5cAYe8cw6ltIf/zpghzxrCXfiryK+T31sc+243yyZR0FewL6+
   smn9gxwQADknHNKslDHb+fAuKDtDUiNrgT2ovN7uMB/zASdgItEN73ZwH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="335894895"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400";
   d="scan'208";a="335894895"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 19:30:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="673775340"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400";
   d="scan'208";a="673775340"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Mar 2023 19:30:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdMKy-0009js-2F;
	Sat, 18 Mar 2023 02:30:28 +0000
Date: Sat, 18 Mar 2023 10:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: John Keeping <john@metanate.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ALSA: usb-audio: Fix recursive locking on XRUN
Message-ID: <202303181006.qGZbdrAN-lkp@intel.com>
References: <20230317195128.3911155-1-john@metanate.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317195128.3911155-1-john@metanate.com>
Message-ID-Hash: C2IQ73XCZUUCSAQCCDWAMAQLRTKQ4FBR
X-Message-ID-Hash: C2IQ73XCZUUCSAQCCDWAMAQLRTKQ4FBR
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, John Keeping <john@metanate.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C2IQ73XCZUUCSAQCCDWAMAQLRTKQ4FBR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi John,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus v6.3-rc2 next-20230317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Keeping/ALSA-usb-audio-Fix-recursive-locking-on-XRUN/20230318-035430
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230317195128.3911155-1-john%40metanate.com
patch subject: [PATCH] ALSA: usb-audio: Fix recursive locking on XRUN
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230318/202303181006.qGZbdrAN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/21bbf1266d22cbc0e1ec7c8d535738f66bbc9801
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review John-Keeping/ALSA-usb-audio-Fix-recursive-locking-on-XRUN/20230318-035430
        git checkout 21bbf1266d22cbc0e1ec7c8d535738f66bbc9801
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181006.qGZbdrAN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "snd_pcm_stop_xrun_under_stream_lock" [sound/usb/snd-usb-audio.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
