Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 095A26ADEDA
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 13:36:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C351144B;
	Tue,  7 Mar 2023 13:35:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C351144B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678192606;
	bh=0w5StcIv7JrIw2dYJR9PXOs9iPVVlQMoWcUCrLH6kHc=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=o6oM3Oui00oyM7+k+Fu0P+t6QaLyKrVIfsEDDmKoeQib45r2hHReT0tELVX1X4X1y
	 UHq8MTFLbO3LKdyofob+HZiHlTpFZkapUBrj2g/6F6jP1mZcJX0BgSHzn7njuS7c9q
	 NJwdfqklfracz60ZwmAN09C8CVOpUlpQuJ1AogI4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FEA5F80236;
	Tue,  7 Mar 2023 13:35:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 757E8F8042F; Tue,  7 Mar 2023 13:35:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7130F80093
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 13:35:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7130F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=b4N3g5tb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678192543; x=1709728543;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0w5StcIv7JrIw2dYJR9PXOs9iPVVlQMoWcUCrLH6kHc=;
  b=b4N3g5tbTPxSYJ2sUj7nsow7VGoyk9qvjlZhrOmEIi70f7Nh4yFL1kTK
   ugl7FRwFgIpsZc+M4Csh/DuXzSu7ElNPa4o8B3GJKebF3a4hbzkz11JQg
   kIWUVEUGkoL+5IYK2vh6mXkISt8o82Me0mdO3b2/TmSXtpf7/XwCz+vNk
   kQYNdKa/pb/dEi/tRd1BQmi6NNdLd2ByY++RUyrbxcaFKWKOjcxWK3+6c
   rjxzbXhmpT+F2DKzJHZXj3W2b8k/T6w+tUrvHGFzYaTzCIEvGDaJrlP72
   YlsUdSE6wVs1RclsdK1j+THS0vAuqY/IxgvE+18LXIi0QFCMYlZn696bT
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315492787"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="315492787"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 04:35:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="745444348"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="745444348"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 04:35:34 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 0/3] ASoC: SOF: ipc4: Add core_id support from topology
Date: Tue,  7 Mar 2023 14:35:53 +0200
Message-Id: <20230307123556.31328-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KDM6BNF6XP2LYCMXSIQDXWMNKDFVVWG5
X-Message-ID-Hash: KDM6BNF6XP2LYCMXSIQDXWMNKDFVVWG5
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, chao.song@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KDM6BNF6XP2LYCMXSIQDXWMNKDFVVWG5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

The following series will add support for handling the core_id token which is
needed for supporting multiple cores with complex topologies.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: SOF: ipc4: Add macro to set the core_id in create_pipe message
  ASoC: SOF: ipc4-topology: Add support for core_id for pipelines

Rander Wang (1):
  ASoC: SOF: ipc4-topology: add core token in each module extended token
    list

 include/sound/sof/ipc4/header.h |  4 ++++
 sound/soc/sof/ipc4-topology.c   | 13 ++++++++++---
 sound/soc/sof/ipc4-topology.h   |  2 ++
 3 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.39.2

