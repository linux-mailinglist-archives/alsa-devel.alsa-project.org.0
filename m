Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F67A6A36F
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Mar 2025 11:19:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C168602C8;
	Thu, 20 Mar 2025 11:19:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C168602C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742465983;
	bh=VCbjVFRFKHUQtXh4jUDXLuh9QdrNw/4gUGUKr4Oak5I=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=q/QWb30FyVRFEwO72gtqhMpfdMCRqpl31NngijPxaSMXmwMpyvDBUDkQoC5f9pUdV
	 BhG0mYfrqRoJV5UGiYB82Fv3P88HhzhYsRnjQ0s8D1LKmWVjlYUg5d9OASkUJOwFiK
	 m5wCFSm4SpETvUNg3nr4GHQfLhofiXXKM+UMMBeU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C04BF805B2; Thu, 20 Mar 2025 11:19:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 576D0F805BE;
	Thu, 20 Mar 2025 11:19:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED774F80134; Thu, 20 Mar 2025 11:19:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B29C1F800ED
	for <alsa-devel@alsa-project.org>; Thu, 20 Mar 2025 11:19:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B29C1F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kQ6lpdHW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742465955; x=1774001955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VCbjVFRFKHUQtXh4jUDXLuh9QdrNw/4gUGUKr4Oak5I=;
  b=kQ6lpdHWtIGUktFeSoVIHNMxIBXXRgFV2OoLA0mtUHJixchrWeJfx1hM
   DY5fcgAhWsph8T3yQATmcHc+Zdihk3Fd+D9LWRwBXziTfhhvxIupSZC6W
   72CSqYNONVrpjEwyf0yZ4MEyMapt9mDkHGy4A55YB+WtoYGX3oZEneHoc
   McK0tVZvzgJGXYjJVr4pj2Ov65RS3c3dd4/x1SovOgWPMYuRfqb8h43ID
   RICFF115CTtXpDgDK8RupX2tHKye6XAi5b9kX8vbU7HhhndBvI9DwgUfm
   fx4Bphb/D8lnycK2/KSU+QL8MKx7Q1rsj8rToineNiw58qfIdyCGDz1ld
   g==;
X-CSE-ConnectionGUID: FYk+EhcFTVikUiQIxFlIIA==
X-CSE-MsgGUID: 4A2ewb7ISjSHeV2oaqPpSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="66150341"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600";
   d="scan'208";a="66150341"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 03:19:09 -0700
X-CSE-ConnectionGUID: lSzX0AXsQeONzagg9aBlBw==
X-CSE-MsgGUID: bTdkHwDmR76rJwYPREMGLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600";
   d="scan'208";a="128143940"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 20 Mar 2025 03:19:09 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvCzS-0000Mr-26;
	Thu, 20 Mar 2025 10:19:06 +0000
Date: Thu, 20 Mar 2025 18:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:for-next 8/17] ld: vmlinux.o:undefined reference to
 `oxygen_pci_pm'
Message-ID: <202503201853.7kB0BPRw-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: QQZ43NNDUC2PPE2P6HGXBATKEFS4TMNV
X-Message-ID-Hash: QQZ43NNDUC2PPE2P6HGXBATKEFS4TMNV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QQZ43NNDUC2PPE2P6HGXBATKEFS4TMNV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   765fee28fe0e7d6a5ff8f2eeb7990b7d3ad20825
commit: 5ea0a2206b58356779cc686630b6548a3402991c [8/17] ALSA: oxygen: Convert to EXPORT_SIMPLE_DEV_PM_OPS()
config: x86_64-buildonly-randconfig-002-20250320 (https://download.01.org/0day-ci/archive/20250320/202503201853.7kB0BPRw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503201853.7kB0BPRw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503201853.7kB0BPRw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: vmlinux.o:(.data+0x57d120): undefined reference to `oxygen_pci_pm'
   ld: vmlinux.o:(.data+0x57d620): undefined reference to `oxygen_pci_pm'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
