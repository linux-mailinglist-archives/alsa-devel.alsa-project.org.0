Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A5FA1620B
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jan 2025 14:37:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 310C1603CD;
	Sun, 19 Jan 2025 14:37:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 310C1603CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737293872;
	bh=rp2zxmK7qT7G2nJZhbsisz5AiYOdSAk6sWo+oRoq+uw=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Xgoo3WvGtzmwEmbc21ogNAP+A57ZV7isiNwe94ryAolOozmQhzQnK4zPEKnLTcejd
	 /dDM26k++xRXvQUus6jSpn30VM/N/Mig8byxGLlDfpgvJwRn6YJqWIfaHEsQEHL1aj
	 v10kNLBvAYYTqcOUpl5tmWhhMTEH0oSNihqOQ2Rk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18DEAF80557; Sun, 19 Jan 2025 14:37:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AEC0F805B3;
	Sun, 19 Jan 2025 14:37:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA907F804F3; Sun, 19 Jan 2025 14:37:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88C43F800C1
	for <alsa-devel@alsa-project.org>; Sun, 19 Jan 2025 14:36:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88C43F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mVj8dkmW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737293817; x=1768829817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rp2zxmK7qT7G2nJZhbsisz5AiYOdSAk6sWo+oRoq+uw=;
  b=mVj8dkmWsJVzO5bnBtwpA33NKDNdFCVDhZct1ts6zWGbNtLVOh1F3JBg
   1PrbVYu6Kbny4vQJ2sYnMswPy5JESMlL0KGz5dRcNV1toRRtBsXDIVcxJ
   wqRC6jfWhuxHYxUz2luMb2tKsShLxLSYM5R6at0/7h/dDNDPQU30xgiK2
   qgDhfS+z12nVhHfYC0iLB7N3Xf6mUdXjdYfpeCmpKBRKEesl1EcKAyMjo
   QTuWenaT+jXjjFOnHFv9U1uxyuJpzFUIjnUw7a+Yk2P/lL/h9xq/RMjOg
   Q0TkFC/E9zi+w38GuSs5IRtbFdQtK/F1Dgp91BgYO4Tm+aFEFC6Wkv0+j
   A==;
X-CSE-ConnectionGUID: hiuYovqBR46u+joz1g3Z6g==
X-CSE-MsgGUID: uOdKeVeFTu+c3H24rYZCQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="41427870"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000";
   d="scan'208";a="41427870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 05:36:46 -0800
X-CSE-ConnectionGUID: jflZGsDaQtaT8+8nr/XkGg==
X-CSE-MsgGUID: 8BxCOC04RKWT6jIzw8aPfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600";
   d="scan'208";a="106692499"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jan 2025 05:36:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZVTm-000VUJ-0L;
	Sun, 19 Jan 2025 13:36:42 +0000
Date: Sun, 19 Jan 2025 21:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 50/52] sound/usb/fcp.c:889:15: error:
 incompatible function pointer types assigning to 'long (*)(struct snd_hwdep
 *, char *, long, loff_t *)' (aka 'long (*)(struct snd_hwdep *, char *, long,
 long long *)') from 'ssize_t (struct snd_hwdep *, char *, ssize_t, loff...
Message-ID: <202501192122.ngosycnT-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: YUHSLTWKGN3ZD3LZEK2CWJMFTRKUBDHO
X-Message-ID-Hash: YUHSLTWKGN3ZD3LZEK2CWJMFTRKUBDHO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YUHSLTWKGN3ZD3LZEK2CWJMFTRKUBDHO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   dd85bbb7fc482b5cdb78f8b5e8f9ef7a3919d6ef
commit: 46757a3e7d50dac923888e7fbe68377736f13c70 [50/52] ALSA: FCP: Add Focusrite Control Protocol driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250119/202501192122.ngosycnT-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501192122.ngosycnT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501192122.ngosycnT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/usb/fcp.c:889:15: error: incompatible function pointer types assigning to 'long (*)(struct snd_hwdep *, char *, long, loff_t *)' (aka 'long (*)(struct snd_hwdep *, char *, long, long long *)') from 'ssize_t (struct snd_hwdep *, char *, ssize_t, loff_t *)' (aka 'int (struct snd_hwdep *, char *, int, long long *)') [-Wincompatible-function-pointer-types]
     889 |         hw->ops.read = fcp_hwdep_read;
         |                      ^ ~~~~~~~~~~~~~~
   1 error generated.


vim +889 sound/usb/fcp.c

   874	
   875	static int fcp_hwdep_init(struct usb_mixer_interface *mixer)
   876	{
   877		struct snd_hwdep *hw;
   878		int err;
   879	
   880		err = snd_hwdep_new(mixer->chip->card, "Focusrite Control", 0, &hw);
   881		if (err < 0)
   882			return err;
   883	
   884		hw->private_data = mixer;
   885		hw->exclusive = 1;
   886		hw->ops.open = fcp_hwdep_open;
   887		hw->ops.ioctl = fcp_hwdep_ioctl;
   888		hw->ops.ioctl_compat = fcp_hwdep_ioctl;
 > 889		hw->ops.read = fcp_hwdep_read;
   890		hw->ops.poll = fcp_hwdep_poll;
   891		hw->ops.release = fcp_hwdep_release;
   892	
   893		return 0;
   894	}
   895	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
