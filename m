Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E287FA4D2
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:36:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69945844;
	Mon, 27 Nov 2023 16:35:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69945844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099362;
	bh=DnuZYLWYd8c/ZxtUMdiIWIakOzys/wENomS92f8ugsQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=J6bEY93wCmO8uPUWYdY8yGIwzIcC+casxzfjXTVy23garaYEaqf7k8nGkGhB++mpx
	 LrLSsoCdq2LWjHGwr5isH8DGK7b95+iOQMb07HB1OjcVf4VGIH6wVS2Fp5nrEktvJ1
	 GdRw2pdvPymrlKxfSVFpTEMa+1yr7mr2rad+GyG0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAE12F80564; Mon, 27 Nov 2023 16:35:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6D66F80587;
	Mon, 27 Nov 2023 16:35:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F9B0F8025A; Mon, 27 Nov 2023 16:35:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B654FF8007E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B654FF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EAKXQ+of
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099320; x=1732635320;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DnuZYLWYd8c/ZxtUMdiIWIakOzys/wENomS92f8ugsQ=;
  b=EAKXQ+ofecX6zusH293HMVpnaO1BXvainH0TXLzOMWX1TVNFH63BKmIC
   2H75oKKUFOwmj8Dd6n0dRJLSfHMG06pQCxUW+UkcZrxBBbkDjWb5o2ZhX
   RoQ7zqoTtZqk/SJb8P6uWRtDlSM5pxo/+biVKCoqSFpDgjVUUjpw7L0QQ
   nK5i8wDakEXnQRgCTNDgbl+RuRqymptbIF7dXZsYKF2ia6MGKWXJxu9oW
   yuhcpJUqMoYQ/e9u12mL1eAL4uHgYK4fErru2Gg+NPX+TvLk/JSvQFLul
   4ia85OQuzAQNWCQzDtdFO8ZxegKlxfZQybeQF+CqSO98Mj6RMCYxLZAiz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894355"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894355"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956122"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771956122"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:19 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 00/27] ASoC: Intel: Link handling rework and fixes
Date: Mon, 27 Nov 2023 17:26:27 +0200
Message-ID: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LQYSSPR5US2KKLOGYOKGJ3UZBKEXEXZP
X-Message-ID-Hash: LQYSSPR5US2KKLOGYOKGJ3UZBKEXEXZP
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LQYSSPR5US2KKLOGYOKGJ3UZBKEXEXZP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

SOF board updates for 6.8 including few small fix and the majority is to add
generic helpers for codec, amp, BT offload, HDMI-In and DAI link generation
among various machine drivers.

Regards,
Peter
---
Bard Liao (2):
  ASoC: Intel: sof_maxim_common: add else between 2 if test
  ASoC: Intel: sof_maxim_common: check return value

Brent Lu (24):
  ASoC: Intel: sof_ssp_amp: remove dead code
  ASoC: Intel: ssp-common: get codec name function
  ASoC: Intel: board_helpers: support codec link initialization
  ASoC: Intel: sof_cs42l42: use common module for codec link
  ASoC: Intel: sof_nau8825: use common module for codec link
  ASoC: Intel: sof_rt5682: use common module for codec link
  ASoC: Intel: board_helpers: support amp link initialization
  ASoC: Intel: sof_cs42l42: use common module for amp link
  ASoC: Intel: sof_nau8825: use common module for amp link
  ASoC: Intel: sof_rt5682: use common module for amp link
  ASoC: Intel: sof_ssp_amp: use common module for amp link
  ASoC: Intel: sof_ssp_amp: rename function parameter
  ASoC: Intel: board_helpers: support BT offload link initialization
  ASoC: Intel: sof_cs42l42: use common module for BT offload link
  ASoC: Intel: sof_nau8825: use common module for BT offload link
  ASoC: Intel: sof_rt5682: use common module for BT offload link
  ASoC: Intel: sof_ssp_amp: use common module for BT offload link
  ASoC: Intel: sof_ssp_amp: simplify HDMI-In quirks
  ASoC: Intel: board_helpers: support HDMI-In link initialization
  ASoC: Intel: sof_rt5682: use common module for HDMI-In link
  ASoC: Intel: sof_ssp_amp: use common module for HDMI-In link
  ASoC: Intel: board_helpers: support DAI link array generation
  ASoC: Intel: sof_nau8825: use common module for DAI link generation
  ASoC: Intel: sof_rt5682: use common module for DAI link generation

Chao Song (1):
  ASoC: Intel: cht_bsw_rt5672: check return value

 sound/soc/intel/boards/cht_bsw_rt5672.c    |   8 +-
 sound/soc/intel/boards/sof_board_helpers.c | 330 +++++++++++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h |  31 ++
 sound/soc/intel/boards/sof_cs42l42.c       | 229 ++++----------
 sound/soc/intel/boards/sof_maxim_common.c  |  13 +-
 sound/soc/intel/boards/sof_nau8825.c       | 224 ++++----------
 sound/soc/intel/boards/sof_rt5682.c        | 328 ++++++--------------
 sound/soc/intel/boards/sof_ssp_amp.c       | 160 ++++------
 sound/soc/intel/boards/sof_ssp_common.c    |  21 ++
 sound/soc/intel/boards/sof_ssp_common.h    |   1 +
 10 files changed, 653 insertions(+), 692 deletions(-)

-- 
2.43.0

