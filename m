Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 402CA545E0C
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 10:01:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E3281B67;
	Fri, 10 Jun 2022 10:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E3281B67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654848106;
	bh=JYheVmdR/4jIgllgclhRX79e6nkizhDGgcOwJwoa6kE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZYrnyT9tZ0Iwqv8oFLm5KKNvf25vWnbwP8VpkAsrJ70QF1epIj3UWgtyjYKxUCKDY
	 xfcRnKixo7+3Ac1GSTxixPi3MBXBB+sXpMcqxKBmjuackm4vWiQPOxbWCfEkPXftb4
	 kF1N74Vm9scSuiWQdA0B8+2AdjEaTfAPt+a8Ja9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D362F804D8;
	Fri, 10 Jun 2022 10:00:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5661FF800E5; Fri, 10 Jun 2022 10:00:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27FD8F800E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 10:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27FD8F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="i1/Fvxde"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654848052; x=1686384052;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JYheVmdR/4jIgllgclhRX79e6nkizhDGgcOwJwoa6kE=;
 b=i1/FvxdeuGBgpV2IAqF3qwu2WDW2oZiqoWQ95OYd710UFxQI907kbgwT
 VgIwwhNg+wjEzibp89j2mLKXuF8Lti1ugoWCi89r9Yai/b/XLr37EUyRw
 4/41jGK73v+nEV+GChzo47hSa9aGg+cTFYsjOndS/9NHdw279Rbv28Pii
 gPUi1x/KLxdq7se9QYB1os5mPMdfJdRxylw/7Y6rvB/Xl5wi3m2/itovD
 rlS3fCmXwZ5pDMUxQbd0ab0lLIo2rIzPrKE3OpuJ/JL30O7DSXtb9zoRb
 MmeEqTafu655gi0EiCMkqv6g3zX+g0U/xWv71jqJC96LLHYBflMUwrJPT Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="339305514"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="339305514"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:00:46 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="638007932"
Received: from nuribebu-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.215.108])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:00:44 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com
Subject: [PATCH 0/3] ASoC: SOF: ipc3-dtrace: Handle race during initialization
Date: Fri, 10 Jun 2022 11:01:16 +0300
Message-Id: <20220610080119.30880-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

Hi,

This series handles the race which can result missing the first position update
after the trace is enabled.
In short: the firmware might send the position update (if we have enough
trace data generated) after the dma-trace is enabled by the TRACE_DMA_PARAMS_EXT
message. Depending on scheduling, load, preemption on Linux side we have seen
that occasionally this first position update got missed and we missed reading it
out.

A new state and more strict handling of host_offset can overcome this issue,
making the dtrace more reliable.

Regards,
Peter
---
Peter Ujfalusi (3):
  ASoC: SOF: ipc3-dtrace: Introduce SOF_DTRACE_INITIALIZING state
  ASoC: SOF: ipc3-dtrace: Add helper function to update the
    sdev->host_offset
  ASoC: SOF: ipc3-dtrace: Return from dtrace_read if there is no new
    data available

 sound/soc/sof/ipc3-dtrace.c | 47 ++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 9 deletions(-)

-- 
2.36.1

