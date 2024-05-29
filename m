Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A2A8D3CF7
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2024 18:40:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA32BB6A;
	Wed, 29 May 2024 18:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA32BB6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717000814;
	bh=ykTtw6vKDQHUEg7QWmim2oDDVh/AapNP1ApfV4SD5iQ=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XNSMuNO/rD747s5eW1LcgKOOAQ8uuoaazYRVKJ/oOJfDW2+x4G6J4eqv343QUB0CS
	 YONFB5rAyIxY3QKiNu1Xo+jMef6C9pLIFJ4c7cQmUY0XLfSjX2hVlj1D8WiR4l4Y1E
	 QCW1waxoQpyZwSmCPAkra6UOQrTbrPNZTZOUnkc0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D435FF804B2; Wed, 29 May 2024 18:39:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27FF9F8058C;
	Wed, 29 May 2024 18:39:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E71BCF80149; Wed, 29 May 2024 18:39:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C8FAF80051
	for <alsa-devel@alsa-project.org>; Wed, 29 May 2024 18:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C8FAF80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fEy3VYpA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717000773; x=1748536773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ykTtw6vKDQHUEg7QWmim2oDDVh/AapNP1ApfV4SD5iQ=;
  b=fEy3VYpAV252l0LUvK6v8BBA7eYhuJ75l6Y/IujliOqndPvWwZTuIhR0
   prHMG7KLX7xAe4MO5Y+64HOmNwBXbTgHvj9awZkHF2Y4jNDGylBrvJMFX
   FKNxzGNdXMesMG/xsXu1lnObs9oMcaf1Zch0ggsLHN3k1MlFPnWOXBC7V
   w9ADjpHZ6eiOLldVYUUvJ2zu/NcA99CR3zmHeaADUkMrwV3oU/v2ixjVW
   jLdAfhHHubXRTChb8JWGyvt8o1v36VehdiIimzr3dUjilbCOixC2l9VWd
   NvdUEmTbx534Su5JwbX888sqqAUTQxqntrxkQCl2TgQ/fYgeySJAkHw2Y
   A==;
X-CSE-ConnectionGUID: HBbj4cwBSoepDIKV/6ihAg==
X-CSE-MsgGUID: q5JQJXNUQ0mUn6HsCSZS8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13269262"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000";
   d="scan'208";a="13269262"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 09:39:30 -0700
X-CSE-ConnectionGUID: 7r1iJnGZRQqOCkUmzRhFrA==
X-CSE-MsgGUID: ErXgLbakTSKS+cFV2AjYBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000";
   d="scan'208";a="40390968"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 May 2024 09:39:29 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCMKk-000Dx7-1p;
	Wed, 29 May 2024 16:39:26 +0000
Date: Thu, 30 May 2024 00:39:01 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:for-next 9/10] sound/core/ump.c:694:6: warning:
 variable 'type' is uninitialized when used here
Message-ID: <202405300035.Fz3pTUG4-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 3HUBK2NGALCCPKJNEFUYLKGG56YEDVJB
X-Message-ID-Hash: 3HUBK2NGALCCPKJNEFUYLKGG56YEDVJB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3HUBK2NGALCCPKJNEFUYLKGG56YEDVJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   e472ffe6ae48ba80461ff1a7bb40f73665a856f0
commit: 42db3930d4d7384d4e241c928e8cb2a0cdc5589c [9/10] ALSA: ump: Don't accept an invalid UMP protocol number
config: i386-randconfig-011-20240529 (https://download.01.org/0day-ci/archive/20240530/202405300035.Fz3pTUG4-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300035.Fz3pTUG4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300035.Fz3pTUG4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/core/ump.c:694:6: warning: variable 'type' is uninitialized when used here [-Wuninitialized]
     694 |         if (type != SNDRV_UMP_EP_INFO_PROTO_MIDI1 &&
         |             ^~~~
   sound/core/ump.c:688:19: note: initialize the variable 'type' to silence this warning
     688 |         unsigned int type;
         |                          ^
         |                           = 0
   1 warning generated.


vim +/type +694 sound/core/ump.c

   678	
   679	/**
   680	 * snd_ump_switch_protocol - switch MIDI protocol
   681	 * @ump: UMP endpoint
   682	 * @protocol: protocol to switch to
   683	 *
   684	 * Returns 1 if the protocol is actually switched, 0 if unchanged
   685	 */
   686	int snd_ump_switch_protocol(struct snd_ump_endpoint *ump, unsigned int protocol)
   687	{
   688		unsigned int type;
   689	
   690		protocol &= ump->info.protocol_caps;
   691		if (protocol == ump->info.protocol)
   692			return 0;
   693	
 > 694		if (type != SNDRV_UMP_EP_INFO_PROTO_MIDI1 &&
   695		    type != SNDRV_UMP_EP_INFO_PROTO_MIDI2)
   696			return 0;
   697	
   698		ump->info.protocol = protocol;
   699		ump_dbg(ump, "New protocol = %x (caps = %x)\n",
   700			protocol, ump->info.protocol_caps);
   701		seq_notify_protocol(ump);
   702		return 1;
   703	}
   704	EXPORT_SYMBOL_GPL(snd_ump_switch_protocol);
   705	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
