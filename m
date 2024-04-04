Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 179E1898E97
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 21:04:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC81D2CEE;
	Thu,  4 Apr 2024 21:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC81D2CEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712257492;
	bh=5PXai1ELdJMCIV3le8QrsuCjyQcUu0kNXQzg+DVqnkw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JSd1VsuYRb88FX4nG3m8ssdstmIDb4J2z3loh+1ouBojfi3mlAHfqHL/eO/tPhvlk
	 7XryUZrnxUYn3BxUp2Cjd52jPEaHbux20nMkY7iqa96Uj5so1DbjeAWCS+xU2rzM5s
	 CwcHVfqWCy2dZqRKINzEXxVTqpaxK2P2BGvUhB2k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9A8BF805BF; Thu,  4 Apr 2024 21:04:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71202F805AB;
	Thu,  4 Apr 2024 21:04:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF02FF80568; Thu,  4 Apr 2024 21:04:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 131B8F80007
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 21:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 131B8F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VqGaZmb5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712257448; x=1743793448;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5PXai1ELdJMCIV3le8QrsuCjyQcUu0kNXQzg+DVqnkw=;
  b=VqGaZmb5RRwevzsKPLEvx6A4e5HZS1k4UT0jk0j3VzW/2ynVzQZIbQlk
   QUgRauL2wvLQl3x5rEzkFglpY3TH3aQKsbWq/MR1lMvyb+aSUgRKukm6f
   g551rJdGy4jJKYA/9p5PwSWkZ7mgOvirlhZINUWIyRR8PZbWlQkIyzrCl
   ANFOJcQC9QlOF4lAhaSn+ALprOD8O7/ojuMLrJ/EWkFBfu9Pw54HXNNee
   rjJ79bgaz+dCO2MDbQUDnigZ1tTJj20RwgJALRA1Qa/wyLH0kelESxm4x
   nVGoYpKnkIVwoRMX3KF7BJ5s7A8NzC9BstiftldJ3qtABdHOs7Fy76qXu
   g==;
X-CSE-ConnectionGUID: odHpGw9pR/ihznXcZYed8A==
X-CSE-MsgGUID: UWYugmbGRAq4R2WsK3aFdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7433855"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="7433855"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 12:04:04 -0700
X-CSE-ConnectionGUID: WdkdDkcbTMadF2e63i5eCA==
X-CSE-MsgGUID: jcVqJTJlQEiKYNvdXqfUuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="19492305"
Received: from sparrish-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.119.106])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 12:04:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/4] ASoC: SOF: Intel: improve and extend HDaudio-based wakes
Date: Thu,  4 Apr 2024 14:03:53 -0500
Message-Id: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OMDUYQT3X2XTR7AFMZKEL7JFFGWX3TBJ
X-Message-ID-Hash: OMDUYQT3X2XTR7AFMZKEL7JFFGWX3TBJ
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OMDUYQT3X2XTR7AFMZKEL7JFFGWX3TBJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For LunarLake, the SoundWire in-band wake detection is reported with
the HDAudio WAKE_EN/WAKE_STS registers. In the existing code, these
registers are only handled for HDaudio codecs. Now the same registers
have to be handled with care as shared resources.

The in-band wake detection mainly used for jack detection. Without
this patchset, the SoundWire headset codecs signal an event that would
be ignored and not reported.

Pierre-Louis Bossart (4):
  ASoC: SOF: Intel: hda-ctrl: add missing WAKE_STS clear
  ASoC: SOF: Intel: lnl: add helper to detect SoundWire wakes
  ASoC: SOF: Intel: hda-codec: preserve WAKEEN values
  ASoC: SOF: Intel: hda-ctrl: only clear WAKESTS for HDaudio codecs

 sound/soc/sof/intel/hda-codec.c | 15 ++++++++++++---
 sound/soc/sof/intel/hda-ctrl.c  |  9 ++++++++-
 sound/soc/sof/intel/lnl.c       | 18 ++++++++++++++++++
 3 files changed, 38 insertions(+), 4 deletions(-)

-- 
2.40.1

