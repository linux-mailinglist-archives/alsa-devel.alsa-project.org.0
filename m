Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A138A6B39A
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Mar 2025 05:06:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80EA360307;
	Fri, 21 Mar 2025 05:06:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80EA360307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742529981;
	bh=0hvDeP86lkRm47thC0zjITDdCflRq64zFpmGUht90eo=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pazrwLWYM7iVRV+vgZrL/Ng1/ni6DOiTNBecFCJL0dMBHMq0sgtl2Rniurw1xGu2u
	 dyrGORwbu22XIiqFR9fesgEOp8WgtJBCAJYzl1h8nh8oGCmxrOU9hlUGxZd9jeOEDS
	 9+P/NNOm83cyMpgBiXQnINeAhNFGM9dE7KvSQnNQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8652F805C1; Fri, 21 Mar 2025 05:05:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DD35F805BB;
	Fri, 21 Mar 2025 05:05:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9D24F8013D; Fri, 21 Mar 2025 05:05:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05E69F800D2
	for <alsa-devel@alsa-project.org>; Fri, 21 Mar 2025 05:05:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05E69F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Bva/m+Ep
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742529932; x=1774065932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0hvDeP86lkRm47thC0zjITDdCflRq64zFpmGUht90eo=;
  b=Bva/m+EpPVBsNviGKTtLMv/bo3WKJoDFO029yTTHCNAIZdexKyk5hG8j
   85qs1nbZ/mHlVegffcRet6cTfeQxSgGDhXI5ovWMfNaqx4VkLa2BbdtzK
   dRibSTf5kUkp4ESH7MREETPhIJeoalT+PI/Gx7W5o+Z+25drNudBle/rb
   AWYKpnrLYim4MnYy4x0vJjwfTrWRRxZQOmf7typmI3e5YejYF/5qcVlRj
   bA01FnJEHEBuT4xoVbwYc6oSJzb37ZaMJ9MWwfjMU34AEXg2kvufog9VK
   hXJkff8FORtVP+erWWAGEAeqy9aK8OE08YyNowwZIzi8M8isi2RH/kGG9
   A==;
X-CSE-ConnectionGUID: CCQW6CKTT0KEYPYuuhBMlA==
X-CSE-MsgGUID: nOF7g4hIQ1WaSh5N8dhIWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="47664953"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600";
   d="scan'208";a="47664953"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 21:05:26 -0700
X-CSE-ConnectionGUID: 0TYdp1Y+Qxio/Epz+G9xYg==
X-CSE-MsgGUID: UNXSX9JXRmqdc9jlOcvlxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600";
   d="scan'208";a="128513481"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 Mar 2025 21:05:25 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvTdH-00011R-2a;
	Fri, 21 Mar 2025 04:05:20 +0000
Date: Fri, 21 Mar 2025 12:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:for-next 8/18] ld: sound/pci/oxygen/oxygen.o:undefined
 reference to `oxygen_pci_pm'
Message-ID: <202503211242.zaTMusOT-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: AV5BI563PNZWZE34XZXZF4PM2WNIKOYM
X-Message-ID-Hash: AV5BI563PNZWZE34XZXZF4PM2WNIKOYM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AV5BI563PNZWZE34XZXZF4PM2WNIKOYM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   ee3d1f09e04643b1b48bd894de1de3c600a01c05
commit: 5ea0a2206b58356779cc686630b6548a3402991c [8/18] ALSA: oxygen: Convert to EXPORT_SIMPLE_DEV_PM_OPS()
config: i386-randconfig-061-20250320 (https://download.01.org/0day-ci/archive/20250321/202503211242.zaTMusOT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503211242.zaTMusOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503211242.zaTMusOT-lkp@intel.com/

Note: the tiwai-sound/for-next HEAD ee3d1f09e04643b1b48bd894de1de3c600a01c05 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld: sound/pci/oxygen/oxygen.o:(.data+0x454): undefined reference to `oxygen_pci_pm'
>> ld: sound/pci/oxygen/virtuoso.o:(.data+0xf4): undefined reference to `oxygen_pci_pm'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
