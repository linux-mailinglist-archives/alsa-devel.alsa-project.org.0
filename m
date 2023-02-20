Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3380869C635
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Feb 2023 09:00:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02E5FE8B;
	Mon, 20 Feb 2023 08:59:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02E5FE8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676880031;
	bh=VUp3j0tzwsVGGP1iCzwzE2pSrtSrKetTqCcQHrhd9rY=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=G2UwbpZyb1o6rsd1+XeU+/f8ohvFOe3jh9wtPc0NQkQeZZZoh4/MO31zczeCWFYgF
	 OxrhkccF4fN9L4Coo5maCzwo7Z0whISUXdbP8OUOfx1zhbeWFcn6PniAs18rhTc06t
	 51MEFLHu4lyBHpjMPQReFSCZwetIyBi5EeW9kBsc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59679F8025A;
	Mon, 20 Feb 2023 08:59:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45116F80496; Mon, 20 Feb 2023 08:58:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E938CF80083
	for <alsa-devel@alsa-project.org>; Mon, 20 Feb 2023 08:57:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E938CF80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QgpviO0S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676879880; x=1708415880;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VUp3j0tzwsVGGP1iCzwzE2pSrtSrKetTqCcQHrhd9rY=;
  b=QgpviO0SCTrMr6FwN3PnwVmhw4lY46CNB9gcDYbncBacAlf1rxDHiM3Y
   B5sWK2c4ppuNsDzhg77Gu7bmKv7vqC0+sB9qFmZp8i1aH+Z4XPV34V7uE
   +3RVc8PJqB+RQfAqd9K2BSCYGMPwladrb8VIAuRFt/0lLefotT/fWXE8E
   jiULLPrP++2QaZTV2tc6K7yWKkhE+CazRtp97gAMYYjYAOwNTS93gL4BX
   GwxkDBmIvod8HeSbPLoB4wuSprBM85F5dFSD8pHcBTfNo9vtqvW37LkpU
   OoEoD3YVkmHmtbUJIclQ6gf1aspCXRQ6aJpML8lovGSlcgKGc5RadCgKT
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="394827720"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000";
   d="scan'208";a="394827720"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2023 23:57:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="845239703"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000";
   d="scan'208";a="845239703"
Received: from mmocanu-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.33])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2023 23:57:50 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 0/3] SoC: SOF: Intel: hda/mtl: Improve and enable DMI L1
 haldling
Date: Mon, 20 Feb 2023 09:58:01 +0200
Message-Id: <20230220075804.4829-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BHDZVJCV7TBHPUIIVMNTJQXKHVPGHMYN
X-Message-ID-Hash: BHDZVJCV7TBHPUIIVMNTJQXKHVPGHMYN
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BHDZVJCV7TBHPUIIVMNTJQXKHVPGHMYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

The first patch will improve the managing of DMI L1 by tracking it's
enabled/disabled state to avoid unconditional changes to it's state.

The remaining two patch will enable the DMI L1 for MTL platforms (ACE 1.0)

Regards,
Peter
---
Ranjani Sridharan (3):
  ASoC: SOF: Intel: hda: Do not re-enable L1 if disabled before suspend
  ASoC: SOF: Intel: hda: Restrict DMI L1 disable workaround
  ASoC: SOF: Intel: MTL: Enable DMI L1

 sound/soc/sof/intel/hda-ctrl.c   |  8 +++++---
 sound/soc/sof/intel/hda-dsp.c    | 10 ++++------
 sound/soc/sof/intel/hda-stream.c | 15 ++++++++++++---
 sound/soc/sof/intel/hda.h        |  2 +-
 sound/soc/sof/intel/mtl.c        |  3 +++
 sound/soc/sof/intel/mtl.h        |  2 ++
 6 files changed, 27 insertions(+), 13 deletions(-)

-- 
2.39.2

