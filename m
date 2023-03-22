Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 546136C4CC7
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 15:03:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3DE8E7E;
	Wed, 22 Mar 2023 15:02:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3DE8E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679493797;
	bh=JBasbFI/uq7f/ElgY+UaW6HR6Jc6pFScoGpMzD6+wvY=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=G4ny7H1sFVVwyKzU+C8CrFdMZgxGewH5NBeOKSVzI5ZWgDlXa4/nsU7XtiTDIlBCb
	 PAeWYuledW7n+rJvE9Im0u7dCoaMDDs3JgqCxYYus2achDjtm2kAaLKDKiNgeCDueA
	 6lzlOZXoV9tq+xsbYTjwJga+Z/LWeNREyuihFNj4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 924F8F80551;
	Wed, 22 Mar 2023 15:01:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D64F2F8051B; Wed, 22 Mar 2023 15:00:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69187F8024E
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 15:00:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69187F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EFQ0vEKo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679493650; x=1711029650;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JBasbFI/uq7f/ElgY+UaW6HR6Jc6pFScoGpMzD6+wvY=;
  b=EFQ0vEKotIRCEIaCL18O7MH7mU2h9tnVz3Um68MZwXfU8vWHm3d6Do4U
   +Ut6xKFqX5jNdPI669AT67/fliCKGP9zQHm1JHaGB4E0njgxWszzPUbOe
   0Kj9rTf0ysAaWsTwJRjjhvSclnsI0+QMOHSop600H7Lj4vXmgc5lluDd6
   VdAUZJcWisH4z1OG5CghH8wZOis8lwzUEyHNPqhvBe8Z7Yt3qdERuF3+U
   EhtgVH2btHoCfBlR2Cvbv9NyrtpRCMyFt+O/m5MSqQbTtKfMsJcRaCdm+
   JmENCqLq80AA3znCZweu+bTvgYDqgZk2A72UQJB1EfsoNJSBJW+uJE3TA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341576110"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400";
   d="scan'208";a="341576110"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 06:59:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="659197951"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400";
   d="scan'208";a="659197951"
Received: from cmelen-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.222.142])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 06:58:57 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 0/3] ASoC: SOF: ipc4/intel: Support for ChainDMA
Date: Wed, 22 Mar 2023 15:59:24 +0200
Message-Id: <20230322135927.7668-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OVEBXS5VXKHXUDEQQZEDKLNP4LMLJ6GH
X-Message-ID-Hash: OVEBXS5VXKHXUDEQQZEDKLNP4LMLJ6GH
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 jyri.sarha@intel.com, rander.wang@intel.com, error27@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OVEBXS5VXKHXUDEQQZEDKLNP4LMLJ6GH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Changes since v1:
- Fix missed mutex unlocking in sof_ipc4_widget_free()
  Reported by Dan Carpenter (thank you!)

On a platform when the DSP is in use, we cannot select individual links to use
or not use the DSP, it is either all or none.
On some audio endpoint, like HDMI/DP, it is preferred to not use any processing
in DSP to reduce the latency and to allow bytestream pass-through (DTS, DD, etc)

IPC4 introduces a new type of end-to-end connection within the DSP which is using
the host DMA and link DMA in a single buffer, working back-to-back, passing the
received data without looking at it or trying to understand the format, content.

This mode reduces the latency and allows non PCM streams to be sent from
userspace.

The feature is enabled per PCM bases, signalled in topology.

Regards,
Peter
---

*** BLURB HERE ***

Jyri Sarha (2):
  ASoC: SOF: ipc4: Add macros for chain-dma message bits
  ASoC: SOF: ipc4/intel: Add support for chained DMA

Ranjani Sridharan (1):
  ASoC: SOF: topology: Set pipeline widget before updating IPC
    structures

 include/sound/sof/ipc4/header.h   |  29 +++++++
 include/uapi/sound/sof/tokens.h   |   1 +
 sound/soc/sof/intel/hda-dai-ops.c |  18 ++++-
 sound/soc/sof/ipc4-pcm.c          | 122 +++++++++++++++++++++++++++++-
 sound/soc/sof/ipc4-topology.c     | 122 +++++++++++++++++++++++++++++-
 sound/soc/sof/ipc4-topology.h     |   2 +
 sound/soc/sof/topology.c          |  48 ++++++------
 7 files changed, 310 insertions(+), 32 deletions(-)

-- 
2.40.0

