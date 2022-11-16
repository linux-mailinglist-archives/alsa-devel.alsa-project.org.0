Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D7D62BC33
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 12:40:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CBAD16A0;
	Wed, 16 Nov 2022 12:39:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CBAD16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668598810;
	bh=iXxWBfZWTqQV4C6XUkYcLHv5pKsPUEC8r9c+mmlfPxY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lL+bazm0cm2oRcUIXqh20WrdqWcj869DVRKpjxhuOnmppZnrEhm9J8oDPHaPLeu1V
	 ZcvIJRTLCvaD6WxPgMUGYF+hgc3F14YaGRLdqSSWZZPCqBFnItcE06kbj/nnFXHyOs
	 pOsbza3q3hrpIg5K6kAwhaipOoNN2o+KIWigcKQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 693A4F804A9;
	Wed, 16 Nov 2022 12:38:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A0E3F800B8; Wed, 16 Nov 2022 12:38:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 952E9F800B8
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 12:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 952E9F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="liEdwaQ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668598727; x=1700134727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iXxWBfZWTqQV4C6XUkYcLHv5pKsPUEC8r9c+mmlfPxY=;
 b=liEdwaQ8vADlMUJ35fTjVi18FmhKQu3F8vZfP8oT0yp3xkCX1orSNJB3
 uT7pGiKdVEoSYzt9Sd7a+AzqPnA9k99UHn5ib2N3c5iLaZ9+HU5TFLk5b
 t80Qw450M3ZzWO7XZA9D+J6NrJV63FCSUUeGNgB//CyXXj0N8wtzm8d2Y
 sMuhTHHQFITtmrmHUev2B5+848SnrsYtjMXuX8XL3o1nSoQC0esUpvDn5
 TBJMsHHOVVHQ8wvWVygh8J5LVgXSQJq1iRVFM1OGwAer2dN1FpXFB+w9W
 oYaXOHJhCwCK3tzenIO3f1joOfopeXR8B/9ehie/Gxsk8qkxk3Y/tDaBG w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="314336792"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="314336792"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 03:38:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="764304450"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="764304450"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga004.jf.intel.com with ESMTP; 16 Nov 2022 03:38:40 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v3 1/2] ASoC: Intel: avs: Lock substream before snd_pcm_stop()
Date: Wed, 16 Nov 2022 12:55:49 +0100
Message-Id: <20221116115550.1100398-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221116115550.1100398-1-cezary.rojewski@intel.com>
References: <20221116115550.1100398-1-cezary.rojewski@intel.com>
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

snd_pcm_stop() shall be called with stream lock held to prevent any
races between nonatomic streaming operations.

Fixes: 2f1f570cd730 ("ASoC: Intel: avs: Coredump and recovery flow")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Changes in v3:
- added a comment why non-_irq() locking is used around snd_pcm_stop()

 sound/soc/intel/avs/ipc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index 152f8d0bdf8e..af8a260093f4 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -123,7 +123,10 @@ static void avs_dsp_recovery(struct avs_dev *adev)
 				if (!substream || !substream->runtime)
 					continue;
 
+				/* No need for _irq() as we are in nonatomic context. */
+				snd_pcm_stream_lock(substream);
 				snd_pcm_stop(substream, SNDRV_PCM_STATE_DISCONNECTED);
+				snd_pcm_stream_unlock(substream);
 			}
 		}
 	}
-- 
2.25.1

