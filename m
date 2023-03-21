Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6DF6C2DCF
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 10:27:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E1BE1CF;
	Tue, 21 Mar 2023 10:26:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E1BE1CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679390858;
	bh=1sic1XddP64llB8HSWE4YHWQ2m+7tIGNvtUjG2haGHE=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KQJmfOr7eV7ml/L1qFcR3Iq5fDWhL0SvZOoGxUoOF1Le6k1esPQxf2WmYu7aGZqvH
	 xmI6R93mx2zOY3J9HKSXr1/g7g+z2XpoyS97sVC1Umy/7GKSnwMEkxrOHwQVn7HFTH
	 H18otI1m45VLAxOmSA6x9YgyE4u6KZOK4EHnK8yk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA040F802E8;
	Tue, 21 Mar 2023 10:26:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8609BF804B1; Tue, 21 Mar 2023 10:26:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F04A7F8024E
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 10:26:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F04A7F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZQI8yKoc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679390793; x=1710926793;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1sic1XddP64llB8HSWE4YHWQ2m+7tIGNvtUjG2haGHE=;
  b=ZQI8yKoc73yQ5E3ItO8YEPy/unftsNeTzm+A95iE++UnSzGW7KrQ6N/g
   BPdzF+9c7Ki9G+/rh9exB7POD81jFTl32ZQMxuyxJv+RqpCmpvly+ZsyE
   N4/I3U+7BpHRk+76qIPZYtA+BBiTuYXoI2E9LPSKdUepnZi+3n5IkLHoP
   LGbuIWnesDsQsgeE03umoGqK3XhzClGl8Pc9ObG97tKPbn/86o/p62TuA
   RobhIFqC0oUPWoO6uv3gmfz9JAxJDcJ9JgBJADTT+TNK6ichLlr/luHAk
   FNR7FyR7hjlA0oJiy+Bu/4FGsBY+5Rf7gPlWOVQEHy0NANPXn1nlhsvpo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="401462882"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400";
   d="scan'208";a="401462882"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 02:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="770559790"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400";
   d="scan'208";a="770559790"
Received: from markusbu-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.60.215])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 02:26:25 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 0/3] ASoC: SOF: ipc4/intel: Support for ChainDMA
Date: Tue, 21 Mar 2023 11:26:51 +0200
Message-Id: <20230321092654.7292-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I3NZXG2IP2XA4EJFQKMFFAMWRRF6KLNW
X-Message-ID-Hash: I3NZXG2IP2XA4EJFQKMFFAMWRRF6KLNW
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 jyri.sarha@intel.com, rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I3NZXG2IP2XA4EJFQKMFFAMWRRF6KLNW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

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
 sound/soc/sof/ipc4-topology.c     | 120 ++++++++++++++++++++++++++++-
 sound/soc/sof/ipc4-topology.h     |   2 +
 sound/soc/sof/topology.c          |  48 ++++++------
 7 files changed, 308 insertions(+), 32 deletions(-)

-- 
2.40.0

