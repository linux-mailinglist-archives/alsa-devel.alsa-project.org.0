Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C7D89CC8B
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 21:42:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDB7623E3;
	Mon,  8 Apr 2024 21:42:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDB7623E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712605367;
	bh=TIadecTE3985GwTBQfEGz7kUZ3pqi8fCWoZggG5Z3LU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MJ+vHfdkR/iQHPtYwvREM9y0gLiMx9vYR9ypQUuBZGnXtdFQFrmd9qrdYiko4REcw
	 4cgm334wwa8IjUZK5eSpHbj6UWYkvBAOkpyqBJOfJUIrgc66nQyTlVknfTiybpOr0g
	 zmNkSHe2twEfIrzTYQx0bDebUDLk55QBYea32KdA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5B2AF80571; Mon,  8 Apr 2024 21:42:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80D4AF8059F;
	Mon,  8 Apr 2024 21:42:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D16EF8055C; Mon,  8 Apr 2024 21:42:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21F98F8013D
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 21:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21F98F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LhqHTmjv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712605323; x=1744141323;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TIadecTE3985GwTBQfEGz7kUZ3pqi8fCWoZggG5Z3LU=;
  b=LhqHTmjvRIrzWGidk6LCeWHgBu02cp849gkQ+KgiawXVt/DrKJAgNE55
   SYbsIDwNG8ZW0Vnvq6PjRAmJlXBf5VLklHXMZmuooNeRhE6IDTmOmPHeO
   CcQ1Gtv5EmN8QMRSdL/zT2rGvmE/BTvhgDzQqdn3qYveMlVL4okGO1+Zy
   9BxBhX9f2SUSgDz1bM3lw3suxf0ChMl6PdMq9FYL7NUkH2epe3SdpJVuw
   e/w6osVUPfbQzm4Er53TpW27bz7wtvJU3uk0DO/QIbvaj0dgTnQQfv3Iu
   F+Q0RxZUqHpJsSkw47rawjKxwjDryRA0j1o/kfJyiHPmwfXlP6ByxTNDg
   Q==;
X-CSE-ConnectionGUID: RHpGZyK9SF+mwOTKNFE1uQ==
X-CSE-MsgGUID: 8jkA5Va5TlyC9eOWSFVBYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="30390450"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000";
   d="scan'208";a="30390450"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 12:41:56 -0700
X-CSE-ConnectionGUID: e4fToc17SeCIgDvnxJFXHg==
X-CSE-MsgGUID: B3r9OxdmQWG6U9mmR3TZHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000";
   d="scan'208";a="24776953"
Received: from aikuseru-mobl1.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.40.188])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 12:41:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/3] ASoC: SOF: misc fixes
Date: Mon,  8 Apr 2024 14:41:44 -0500
Message-Id: <20240408194147.28919-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 77WH7O67AOWSLSZZYPMXID64MG7SPB7G
X-Message-ID-Hash: 77WH7O67AOWSLSZZYPMXID64MG7SPB7G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/77WH7O67AOWSLSZZYPMXID64MG7SPB7G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We somehow missed the default path for DSP libraries for LNL, and need
to restrict support for D0i3 w/ IPC4. Also add debugfs support for
firmware profile information so that sof-test scripts can show what is
being tested.

Pierre-Louis Bossart (2):
  ASoC: SOF: Intel: add default firmware library path for LNL
  ASoC: SOF: debug: show firmware/topology prefix/names

Ranjani Sridharan (1):
  ASoC: SOF: pcm: Restrict DSP D0i3 during S0ix to IPC3

 sound/soc/sof/debug.c         | 18 ++++++++++++++++++
 sound/soc/sof/intel/pci-lnl.c |  3 +++
 sound/soc/sof/ipc3-pcm.c      |  1 +
 sound/soc/sof/pcm.c           | 13 ++++++-------
 sound/soc/sof/sof-audio.h     |  2 ++
 5 files changed, 30 insertions(+), 7 deletions(-)

-- 
2.40.1

