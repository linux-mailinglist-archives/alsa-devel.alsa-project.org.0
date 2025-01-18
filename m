Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B1CA15EE0
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Jan 2025 22:17:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A72E604E0;
	Sat, 18 Jan 2025 22:16:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A72E604E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737235019;
	bh=dr4YDSDNJkmVcet6NYSK0BD7RdBaTbEDMGXHZHUsXg4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UdqZ5UuK9adgbknlmOjbBfTwcopHsjNz1rQi4WwHtWKXcafDAaAs42OP7RlB25qWT
	 VABXC7lAJGFIqH+8WKcan1Q36+WeQm7QbIh14PV5DHBQwhR1r3JZ5dBJ0ODDl34YXx
	 2u+iAKhjuvTSwX4HMtcHvZWumc0Qb7UPz5HPA6o4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A305F805BA; Sat, 18 Jan 2025 22:16:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 158D0F805B2;
	Sat, 18 Jan 2025 22:16:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB78EF80246; Sat, 18 Jan 2025 22:16:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2835F800B6
	for <alsa-devel@alsa-project.org>; Sat, 18 Jan 2025 22:16:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2835F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ukm6FrAT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737234970; x=1768770970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dr4YDSDNJkmVcet6NYSK0BD7RdBaTbEDMGXHZHUsXg4=;
  b=Ukm6FrATyWHrJZrXy5D3QHRLURt3LZ/G5ppyDVBrs2KW+dIiB75lDyv9
   p6BatEu4btkkLFTrek5maaGxg3Mwg2S8rJoIlz8rKZQ1FyZKPrYAk6jTV
   c8crZDO9Xu78oDa33IOSFCVH1WsUtpXnaMaPPRx7efD71Ld/l2hT5rqFn
   9m8ikrpyrZTiS9LJg/wb72R3d3D8fWNX7RS0eQtXL3hOeOqJsZfdAiBEt
   VTTmbcGtjB7RN/AES9S7m4INpo2HNCRnCQCrFtP533OJ4Fvul+wnXMO4I
   ZcPJ7SUnyhwk/MqaE4wpff2/vHRL6qNSW13YAaWNUzcOJPUUuQw4pBJkq
   g==;
X-CSE-ConnectionGUID: OI5IjsQOR0qKcCXFMJQ9kQ==
X-CSE-MsgGUID: nRkNSjNWSsSg0o+Fa1kiHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="37881553"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000";
   d="scan'208";a="37881553"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2025 13:16:04 -0800
X-CSE-ConnectionGUID: mGG/A8y1SoOPizn9o1ICZw==
X-CSE-MsgGUID: NM2HquAlTOiEVlfHKKi71A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000";
   d="scan'208";a="136952119"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jan 2025 13:16:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZGAi-000Uop-1Z;
	Sat, 18 Jan 2025 21:16:00 +0000
Date: Sun, 19 Jan 2025 05:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 50/51] sound/usb/fcp.c:889:22: error:
 assignment to 'long int (*)(struct snd_hwdep *, char *, long int,  loff_t
 *)' {aka 'long int (*)(struct snd_hwdep *, char *, long int,  long long int
 *)'} from incompatible pointer type 'ssize_t (*)(struct snd_hwdep *, char
 ...
Message-ID: <202501190536.A2CiOP0a-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: EE3YFJYO5YNEP4INSYHWNYYTIYL6XUGP
X-Message-ID-Hash: EE3YFJYO5YNEP4INSYHWNYYTIYL6XUGP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EE3YFJYO5YNEP4INSYHWNYYTIYL6XUGP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   0ce204d3af3beca1825018e9ca128635ccc8aa85
commit: 46757a3e7d50dac923888e7fbe68377736f13c70 [50/51] ALSA: FCP: Add Focusrite Control Protocol driver
config: i386-buildonly-randconfig-004-20250119 (https://download.01.org/0day-ci/archive/20250119/202501190536.A2CiOP0a-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501190536.A2CiOP0a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501190536.A2CiOP0a-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/usb/fcp.c: In function 'fcp_hwdep_init':
>> sound/usb/fcp.c:889:22: error: assignment to 'long int (*)(struct snd_hwdep *, char *, long int,  loff_t *)' {aka 'long int (*)(struct snd_hwdep *, char *, long int,  long long int *)'} from incompatible pointer type 'ssize_t (*)(struct snd_hwdep *, char *, ssize_t,  loff_t *)' {aka 'int (*)(struct snd_hwdep *, char *, int,  long long int *)'} [-Werror=incompatible-pointer-types]
     889 |         hw->ops.read = fcp_hwdep_read;
         |                      ^
   cc1: some warnings being treated as errors


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
