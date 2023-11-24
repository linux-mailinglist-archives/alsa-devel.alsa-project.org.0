Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE3E7F774F
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Nov 2023 16:09:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A571EE76;
	Fri, 24 Nov 2023 16:09:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A571EE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700838555;
	bh=foCso91LWcsKZgmNc1lRmkzfnoe8b8XHwcibymER+ME=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aJscB2CmxRD+T0fQZv7bw/QYXh4WkNjYkDWRytFpYqazUOs7iTeSmQ1zTVGFs7TqQ
	 fvcdPU60Ege3kt5m9bS+xHObm81grO7nGBIvsUy8M19eBuDW4x6AUldy4AUyIuNI8p
	 3JriQIzH3XU6ehvvU8g+Y2Q87VNzIRj5vMbXoxOQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD1CDF80580; Fri, 24 Nov 2023 16:08:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42FE2F80549;
	Fri, 24 Nov 2023 16:08:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12BAEF80551; Fri, 24 Nov 2023 16:08:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B63ADF80246
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 16:08:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B63ADF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=G/VGucsl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700838512; x=1732374512;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=foCso91LWcsKZgmNc1lRmkzfnoe8b8XHwcibymER+ME=;
  b=G/VGucslY5FGLDbwjSMwV1jz1XwlULK8wJtaZPVH6AmTnkKWL+1P57oH
   8cO3ovJMh+fpwHexpCQwipDc3nJMk/trv5S8iBVK9w2y8KvhVT7jNux6n
   boK7Ihzt847FVGgZVf3p1I7BJI/q4htPi0H/4DObOQQZi9RMToaUaeewb
   NzjhGDSCJHgBuhWgZq9+qHzd1DqGyRATxZfLPYPXfvF7OeFszpjFCZjGu
   ayPULwkWUUi0GtSXmUpQas1xyST1nWDGJ1ubGnYlvB9F+lMpuPtj9aCr2
   fYxXJaNv2UQHf5xkVsONfR6ZMRCznzk1ykvTqcOom6Eqj/jwwB5idqGpD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="377477023"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600";
   d="scan'208";a="377477023"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:08:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="743915673"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600";
   d="scan'208";a="743915673"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.182])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:08:20 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 0/4] ASoC: SOF: ipc4: Add support for control change
 notification
Date: Fri, 24 Nov 2023 17:08:49 +0200
Message-ID: <20231124150853.18648-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HLNZZZPWKYKIK5OKK4MAOORXF65EODGQ
X-Message-ID-Hash: HLNZZZPWKYKIK5OKK4MAOORXF65EODGQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HLNZZZPWKYKIK5OKK4MAOORXF65EODGQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

This series adds support for handling control (switch/enum) change notifications
sent by the firmware.
The use case is similar to what is already used by IPC3 version: the firmware
can update the value of an enum or switch and sends notification to the kernel,
which in turn will notify the user space of a change.

Regards,
Peter
---
Peter Ujfalusi (4):
  ASoC: SOF: ipc4-topology: Helper to find an swidget by module/instance
    id
  ASoC: SOF: ipc4: Add data struct for module notification message from
    firmware
  ASoC: SOF: ipc4-control: Implement control update for switch/enum
    controls
  ASoC: SOF: ipc4: Handle ALSA kcontrol change notification from
    firmware

 include/sound/sof/ipc4/header.h |  29 ++++++
 sound/soc/sof/ipc4-control.c    | 179 ++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-priv.h       |   3 +
 sound/soc/sof/ipc4-topology.c   |  20 ++++
 sound/soc/sof/ipc4.c            |  57 ++++++++++
 5 files changed, 288 insertions(+)

-- 
2.42.1

