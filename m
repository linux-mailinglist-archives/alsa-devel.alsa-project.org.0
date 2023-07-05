Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B421748F16
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 22:42:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6BF83E8;
	Wed,  5 Jul 2023 22:41:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6BF83E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688589736;
	bh=2t+U+v5S5iDDlAA/C1t1HHtui8Mayz0uFr6zt8gdnuA=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=njvDQePqP+Bwnt0AxCiaRBYyWy7NWQ6A4lbHHatwPupytx3Gbc3324FtxFkUae4Mg
	 mbhMBD/6u0b3rc778Lr5jYCPY40xdkbcy4Y2b7QHyidwmjyILKF2P804kHSrwrdwLd
	 XivfRrToWM2Ft6Pvy8hFa+rhRifjbjIE//8nlt4k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03277F80535; Wed,  5 Jul 2023 22:41:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 887FCF80124;
	Wed,  5 Jul 2023 22:41:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C175FF80125; Wed,  5 Jul 2023 22:41:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8034F800E4
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 22:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8034F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lk6T5pz5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688589674; x=1720125674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2t+U+v5S5iDDlAA/C1t1HHtui8Mayz0uFr6zt8gdnuA=;
  b=lk6T5pz56podnYMeHye1vmxCAMoeYyUAZ8xFn5A5lOrReylJ1EjjIlsY
   Ouaix/t5/7JRXjzDbz+9AXutegkGBAfkqXqCnC6qbadsn4j/IQWrxxiGy
   I63kO+YxX/jXAMhu1oOjtd6/5vvEYAfXv2fnJ4XTgCtzoQGPVw2EhUvbS
   2JBbDweBccVT9LCIhHw7ryqcipnRZ02G8ZMxoRo4yO0Ggu5KYEZeALRM1
   TuLyiNqOshFCNeoH1Ko3sGlP6wLIYS/CsI+KpLLo48sigJkidWi+mQNQl
   fIK2yvtR6dQEktb51i4YDhoyXH27ZyQT6c5yRu4YwgwCTQwCvoGpspm+z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="427122230"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200";
   d="scan'208";a="427122230"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 13:41:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="832684313"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200";
   d="scan'208";a="832684313"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Jul 2023 13:41:06 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qH9JB-0000p4-2J;
	Wed, 05 Jul 2023 20:41:05 +0000
Date: Thu, 6 Jul 2023 04:40:30 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	linux-doc@vger.kernel.org
Subject: [tiwai-sound:topic/midi20-gadget 63/63] htmldocs:
 Documentation/usb/gadget-testing.rst:1019: WARNING: Malformed table.
Message-ID: <202307060422.HHYZIPqX-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 5O6DZ3HIMYARYDXAUVZVNOCIUKME65XJ
X-Message-ID-Hash: 5O6DZ3HIMYARYDXAUVZVNOCIUKME65XJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5O6DZ3HIMYARYDXAUVZVNOCIUKME65XJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/midi20-gadget
head:   be0c9761ecd79271d4a3efacaec6963a4010a297
commit: be0c9761ecd79271d4a3efacaec6963a4010a297 [63/63] usb: gadget: midi2: Add testing documentation
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307060422.HHYZIPqX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307060422.HHYZIPqX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/usb/gadget-testing.rst:1019: WARNING: Malformed table.

vim +1019 Documentation/usb/gadget-testing.rst

  1003	
  1004		===============	===============================================
  1005		name		Function Block name string
  1006		direction	Direction of this FB
  1007				1: input, 2: output, or 3: bidirectional
  1008		first_group	The first UMP Group number (0-15)
  1009		num_groups	The number of groups in this FB (1-16)
  1010		ui_hint		UI-hint of this FB
  1011				0: unknown, 1: receiver, 2: sender, 3: both
  1012		midi_ci_verison	Supported MIDI-CI version number (8 bit)
  1013		is_midi1	Legacy MIDI 1.0 device (0-2)
  1014				0: MIDI 2.0 device,
  1015				1: MIDI 1.0 without restriction, or
  1016				2: MIDI 1.0 with low speed
  1017		sysex8_streams	Max number of SysEx8 streams (8 bit)
  1018		active		Bool flag for FB activity (0 or 1)
> 1019		=============	===============================================
  1020	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
