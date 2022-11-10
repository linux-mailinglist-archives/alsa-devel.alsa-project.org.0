Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5226243BD
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 14:58:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEB111684;
	Thu, 10 Nov 2022 14:57:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEB111684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668088696;
	bh=GUmEIOXtvN+z2o1OxzbijVetP6gfiZV4MeH7b2vwM78=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mGDe67SauM1MAUq2JogNqN/uNDO8KaD2JcjSrKsjPqAAWcdFkqIhjBf+foRZ0GXnG
	 B8N/iW0+rl/5CmxBH3zK9yGcCSKcPt/z+ol8Ti7KM4YTu1nZh9P4UP2Xyni3QWEiDA
	 nX78y6UQy9LJF0dfQ9hCvkSWQaWwaumkbszkVmi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2080FF80557;
	Thu, 10 Nov 2022 14:56:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A3CEF80549; Thu, 10 Nov 2022 14:56:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65A98F8021D
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 14:56:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65A98F8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JeCWxhx+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668088589; x=1699624589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GUmEIOXtvN+z2o1OxzbijVetP6gfiZV4MeH7b2vwM78=;
 b=JeCWxhx+bYQwU5RSUS0VT4eYt7B5Y5PH0T2FY7XO4ibcDGevk3cG+iTn
 KTDWelWhFM94o8EscbZnBU22yY1+Ta/42NUZxmUNkjifpFn/YCNR0HTpz
 wzC9xw1F16Ko5Lou/MwjfeCr3WBlhOE80dC1HJdSMf0rPuxtQijLhA5tb
 AKy8Eo5I5UD8xq59FwuYzlg1HzQs3CgRqxaFAhUfmZhtvBbT1A8vO8L2m
 SaN6SLHiSu6NvCIJu2D84lZk6QsW7SysABn38WD4tVTe+MBq7nvFYK9wS
 jezss2v40i6ESqT5C5zhnNxkoRlAXGPyXUZ3YFUhVt/MFspo0qo2X2FtZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="373431554"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="373431554"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 05:56:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="966415012"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="966415012"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 10 Nov 2022 05:56:24 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/2] ASoC: Intel: avs: Disconnect substream if suspend or
 resume fails
Date: Thu, 10 Nov 2022 15:13:30 +0100
Message-Id: <20221110141330.740916-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110141330.740916-1-cezary.rojewski@intel.com>
References: <20221110141330.740916-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

To improve performance and overall system stability, suspend/resume
operations for ASoC cards always return success status and defer the
actual work.

Because of that, if a substream fails to resume, userspace may still
attempt to invoke commands on it as from their perspective the operation
completed successfully. Set substream's state to DISCONNECTED to ensure
no further commands are attempted.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index ca624fbb5c0d..f95c530ffeb1 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -934,8 +934,11 @@ static int avs_component_pm_op(struct snd_soc_component *component, bool be,
 			rtd = snd_pcm_substream_chip(data->substream);
 			if (rtd->dai_link->no_pcm == be && !rtd->dai_link->ignore_suspend) {
 				ret = op(dai, data);
-				if (ret < 0)
+				if (ret < 0) {
+					data->substream->runtime->status->state =
+						SNDRV_PCM_STATE_DISCONNECTED;
 					return ret;
+				}
 			}
 		}
 
@@ -944,8 +947,11 @@ static int avs_component_pm_op(struct snd_soc_component *component, bool be,
 			rtd = snd_pcm_substream_chip(data->substream);
 			if (rtd->dai_link->no_pcm == be && !rtd->dai_link->ignore_suspend) {
 				ret = op(dai, data);
-				if (ret < 0)
+				if (ret < 0) {
+					data->substream->runtime->status->state =
+						SNDRV_PCM_STATE_DISCONNECTED;
 					return ret;
+				}
 			}
 		}
 	}
-- 
2.25.1

