Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE85D7A5FA2
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:33:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52595E7F;
	Tue, 19 Sep 2023 12:32:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52595E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695119592;
	bh=qvW5azuNXvtpHNf//svPpcEGXeNfi1tNSfNSW0/6BTI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GXIcwbLOFyhEafu+JLKPCgoEkYavoUphzlyggI4B4iywgIs4D3oCeitrTJfTI5Tkh
	 AvhlNFSc4os5GIQPG8028g0fctDgQWCYxhNuTCi4haV8nxg3zo6W4GNYJh4P8OqM7G
	 +Y2pE39wnEu6FUDYZxxO1iCRcEVDQ22SSyAjFv4g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BEAEF8057E; Tue, 19 Sep 2023 12:31:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C54CF8057E;
	Tue, 19 Sep 2023 12:31:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90414F8055B; Tue, 19 Sep 2023 12:31:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 080AFF80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:31:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 080AFF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lqBggsyp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695119477; x=1726655477;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qvW5azuNXvtpHNf//svPpcEGXeNfi1tNSfNSW0/6BTI=;
  b=lqBggsyphPHxVh8xnL/nDo4uD9e+kvLhyhY3E4R8BUT9pVbG6/qtHydj
   Cjer3nQPg4VWQJCRIekv58dmnC8XsY13MsuFVff7p4+/DlIsljx89zghy
   /zfJ56eJ80eCcwGOQckdcpX2vmU/ddo8MXM8jYmhEfxFqp3BzhXC676i3
   3jcQYht3m33KUT0xv0kKpgeleZ437cisuc0kD3qi5pb4wODvaFQgLSix9
   JsiOaVyt/YwwWBL3zjpHLXdBcxzskTyk1ty8z9MLwwQ1hw210fCnFbXex
   +82Ax0ZErP7HTC6hRHlBecfTL9YKKPqQsLUVExeZPXx/u+68cyPpFaeGk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="443990493"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="443990493"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:31:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="861486831"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="861486831"
Received: from mokashi-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.50.26])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:31:07 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 0/3] ASoC: SOF: ipc4-control: Support for Switch and Enum
 controls
Date: Tue, 19 Sep 2023 13:31:12 +0300
Message-ID: <20230919103115.30783-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FC6YZR6MGIO6CJDWBZJI4CYZNA4MO4JF
X-Message-ID-Hash: FC6YZR6MGIO6CJDWBZJI4CYZNA4MO4JF
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FC6YZR6MGIO6CJDWBZJI4CYZNA4MO4JF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Currently IPC4 has no notion of a switch or enum type of control which is a
generic concept in ALSA.

The generic support for these control types will be as follows:

- large config is used to send the channel-value par array
- param_id of a SWITCH type is 200
- param_id of an ENUM type is 201

Each module need to support a switch or/and enum must handle these
universal param_ids.
The message payload is described by struct sof_ipc4_control_msg_payload.

Regards,
Peter
---
Peter Ujfalusi (3):
  ASoC: SOF: ipc4-topology: Add definition for generic switch/enum
    control
  ASoC: SOF: ipc4-control: Add support for ALSA switch control
  ASoC: SOF: ipc4-control: Add support for ALSA enum control

 sound/soc/sof/ipc4-control.c  | 175 +++++++++++++++++++++++++++++++++-
 sound/soc/sof/ipc4-topology.c |  49 +++++++++-
 sound/soc/sof/ipc4-topology.h |  19 +++-
 3 files changed, 237 insertions(+), 6 deletions(-)

-- 
2.42.0

