Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9F0510534
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:20:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB47818CD;
	Tue, 26 Apr 2022 19:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB47818CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650993629;
	bh=p2iTmelhXb4eD8KKtDOWsE0zTmet+cVT6iMf43k+MMo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rNllYcjmCvMrZ8l5lE5TVDaiDNLXTL+N2o+I5lwal6azwswj8M7BgqGZw0i8yUNXS
	 KU7OLweQy0ZlHNnD1PUPLpYnRSSzumPKMGMcZYypHGD1+vz8DVAa61E/N7ktLVmYNv
	 YUgBSq4R8ReAF1/TCyanRZI76zdmvg+EFp/XjeN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66725F80510;
	Tue, 26 Apr 2022 19:17:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8A58F801D5; Tue, 26 Apr 2022 19:17:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 655A8F80507
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:17:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 655A8F80507
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nfh8Dd9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650993472; x=1682529472;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p2iTmelhXb4eD8KKtDOWsE0zTmet+cVT6iMf43k+MMo=;
 b=nfh8Dd9t9pQ06mVKMFLSU1pqDd9YC3GoU7qz6I8iePtQIcVnD5pPdEem
 aVHDRwsuIa6QxD1T82MYS9IoTJZKgcPL4LfQQTtD4zpWz2vWPJrVNmF5J
 NK2FMk+UelOwT9lgHXQ54wKooUNI9+VdfPfZPa/f/21URLP6/t9VecmHG
 TbU9uzzAA1bazjHE/Rbpx6+M3Nmc2IrWTVt5rPvFmCMqu2nXZV2SqlV5b
 5OnQ6Yollmu2lcW2WgiUXsvQW++87EVD0gotORSquCe6fxRa8FxDMqSkf
 ywWXXViJk6RJhyxtk6Xy/iCPpPdxtTyiy2HKQjDvHjPE1qEo4Ko5GW7Om g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="326150579"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="326150579"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:48 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="558431186"
Received: from shashinx-mobl.gar.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.0.53])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:48 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/11] ASoC: SOF: Miscellaneous preparatory patches for IPC4
Date: Tue, 26 Apr 2022 10:17:32 -0700
Message-Id: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: broonie@kernel.org, tiwai@suse.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This series includes last few remaining miscellaneous patches to prepare
for the introduction of new IPC version, IPC4, in the SOF driver. The changes
include new IPC ops for topology parsing to set up the volume table, prepare
the widgets for set up and free the routes. The remaining patches introduce
new fields in the existing data structures for use in IPC4 and align the flows
for widget/route set up so that they are common for both IPC3 and IPC4.

Ranjani Sridharan (11):
  ASoC: SOF: Add a new op to set up volume table
  ASoC: SOF: sof-audio: reset route status before freeing widget
  ASoC: SOF: sof-audio: Set up widgets from source to sink
  ASoC: SOF: pcm: Move the call to snd_sof_pcm_platform_hw_params()
  ASoC: SOF: expose a couple of functions
  ASoC: SOF: Add a route_free op in struct sof_ipc_tplg_ops
  ASoC: SOF: Add two new fields to struct snd_sof_widget
  ASoC: SOF: pcm: remove unnecessary function declaration
  ASoC: SOF: topology: Skip parsing DAI link tokens if not needed
  ASoC: SOF: clarify use of widget complete flag
  ASoC: SOF: Add a prepare op to IPC topology widget ops

 sound/soc/sof/ipc3-control.c |  38 +++--
 sound/soc/sof/pcm.c          |  23 +--
 sound/soc/sof/sof-audio.c    | 302 +++++++++++++++++++++++++++++------
 sound/soc/sof/sof-audio.h    |  68 +++++++-
 sound/soc/sof/topology.c     |  44 +++--
 5 files changed, 368 insertions(+), 107 deletions(-)

-- 
2.25.1

