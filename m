Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DEB6A98E5
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Mar 2023 14:51:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 843ABA4A;
	Fri,  3 Mar 2023 14:50:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 843ABA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677851488;
	bh=SXdaFd0DfsYzTiTeHm+fudxCVI58R5GreWavxdI1474=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=phUHTXFKmsyLZAVh1ex5wZUJAsU+0jEikF1XxNADkgB5nClE+GIC2tx4X0ZHK0SU7
	 rRDh8LB1uXWPiBwpK7aIEbpM+54eo8RM9nWUTn7MxvL+wBR52Lk2nLfpMeLqWJz6j6
	 6eCGo/hESCq7V4TnJg2idJJLfwRlLEFxA5VgSwlo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19829F800BA;
	Fri,  3 Mar 2023 14:50:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C059F80310; Fri,  3 Mar 2023 14:50:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0DE89F80236
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 14:50:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DE89F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=br81HUbV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677851428; x=1709387428;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SXdaFd0DfsYzTiTeHm+fudxCVI58R5GreWavxdI1474=;
  b=br81HUbV25M8p/OylEBeNiUauqvxq31fL3DO02OJJGMu4YI8Kz9i2g7w
   NaBbklgvR1HSXD83s52wCv6aM3u48Ovk3krhewZ9Dbmn4FN7D2Rf/Fh7A
   JCYKRst6Kr0zjFhJnLMPKeW9cLl10jJM4Jfm41XPbdyGzfBJTALmKhYsN
   bPrh+Z5ead6d7nPrvSguOybnjQJZ/AP/MuawD96gcrC6EMxwjDzfJp76m
   sxqSJ1KvnqBE9xS7h4M/xpW0fUFU/OoVt1724wsISrqTQubLrjIcLxASM
   eXTFz5pBf6OHWg+o8R48vAT+/XqJ/Av18KlRPeHjGhLD/PRnsRJXKCtQP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="336564395"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400";
   d="scan'208";a="336564395"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 05:49:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="668660657"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400";
   d="scan'208";a="668660657"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2023 05:49:20 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/5] ASoC: Intel: avs: Machine board fixes
Date: Fri,  3 Mar 2023 14:48:49 +0100
Message-Id: <20230303134854.2277146-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ON3GP7MVZ5WJWNJSWRVPL6ABG3GN4GKR
X-Message-ID-Hash: ON3GP7MVZ5WJWNJSWRVPL6ABG3GN4GKR
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ON3GP7MVZ5WJWNJSWRVPL6ABG3GN4GKR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Series of adjustments to machine board files. Use fixed format in boards
that were not using one. Fix clock handling.

Amadeusz Sławiński (3):
  ASoC: Intel: avs: max98357a: Explicitly define codec format
  ASoC: Intel: avs: da7219: Explicitly define codec format
  ASoC: Intel: avs: rt5682: Explicitly define codec format

Cezary Rojewski (2):
  ASoC: Intel: avs: ssm4567: Remove nau8825 bits
  ASoC: Intel: avs: nau8825: Adjust clock control

 sound/soc/intel/avs/boards/da7219.c    | 21 +++++++++++++++++
 sound/soc/intel/avs/boards/max98357a.c | 22 ++++++++++++++++++
 sound/soc/intel/avs/boards/nau8825.c   | 14 ++++++------
 sound/soc/intel/avs/boards/rt5682.c    | 22 ++++++++++++++++++
 sound/soc/intel/avs/boards/ssm4567.c   | 31 --------------------------
 5 files changed, 72 insertions(+), 38 deletions(-)

-- 
2.34.1

