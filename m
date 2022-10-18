Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD33602BE7
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:41:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01BA38AB8;
	Tue, 18 Oct 2022 14:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01BA38AB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666096895;
	bh=q3TDQmsvXpHigZwd300mNQ4AnqgLcfawmb7ZEYDgiGk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a2k4Wt85gO3PzK0eiaJljN8jS3cFFCfEXEVf0UqcEmpG2+sXXy5tC5mndyAR2D+km
	 RaquhdtCbX0o3dgUsV+IlCn8kCcCxJPG5g/RXWRmvgID9K8JltW8s6+J9TnxKzDZD0
	 PohQns7bIjlpsFxyDi+YBgKt2ChklqUnvmmF+iaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8A9AF80552;
	Tue, 18 Oct 2022 14:40:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E38CF8053D; Tue, 18 Oct 2022 14:40:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73C50F8053D
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:39:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73C50F8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JLbTFAjC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666096797; x=1697632797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q3TDQmsvXpHigZwd300mNQ4AnqgLcfawmb7ZEYDgiGk=;
 b=JLbTFAjCrlBgUB+Vjcz0OOA4d+lBSgShq7Mem59Z/5NeLSoEO4KfbXu4
 AcjBkzRmMt84VXgqE989mQOYWL3nXNkbXw/R/zDkN02PCIM5UKJ0FSYIL
 gjeGeIWukIGzZE+w9BMAw0lsVAraBmKJdBQfdMRYyClECzYGKsEV6YBGD
 zqKzjq7FV8+LV0XPTOuVo6s4ixjdgL5ONxrHH6ENsQ5/lOCglbKxp7+nQ
 fi7L9owH5U9vPo1gDwZofGVXp9U/24im0sRM6AP/FB2RVFCbvleA4fmPG
 T9Tp6Ut2kFlTtxsMVpM6DLBU79rr4BmJDH4B/U2zTfARGPnuH8mQm3vwt Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="304828573"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="304828573"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:39:55 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="717912789"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="717912789"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:39:53 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 4/4] ASoC: SOF: Intel: ipc4: Ack a received reply or
 notification separately
Date: Tue, 18 Oct 2022 15:40:08 +0300
Message-Id: <20221018124008.6846-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018124008.6846-1-peter.ujfalusi@linux.intel.com>
References: <20221018124008.6846-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, rander.wang@intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

By acking a received message we tell the DSP that we have processed the
message (reply or notification) and we are open to receive a new one.

The original implementation did this in a common code after the received
message got handled as reply or notification.

With right timing this opens up a small window when we have processed the
reply and let the other thread proceed to send a new message to the DSP,
which is allowed as the DSP is free to receive message.
But when the message is received and processed by the DSP and it wants to
send a reply it will still see that the previous message has not been
acked, so it fails to send a reply. Later the first reply got acked by the
kernel, but it is too late and the in-flight message got a timeout due to
firmware not responding (which it tried, but could not).

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/cnl.c     | 7 ++++---
 sound/soc/sof/intel/hda-ipc.c | 7 ++++---
 sound/soc/sof/intel/mtl.c     | 5 +++--
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 4bf233787757..da26f0ce9abc 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -72,6 +72,7 @@ irqreturn_t cnl_ipc4_irq_thread(int irq, void *context)
 				spin_lock_irq(&sdev->ipc_lock);
 
 				snd_sof_ipc_get_reply(sdev);
+				cnl_ipc_host_done(sdev);
 				snd_sof_ipc_reply(sdev, data->primary);
 
 				spin_unlock_irq(&sdev->ipc_lock);
@@ -88,10 +89,10 @@ irqreturn_t cnl_ipc4_irq_thread(int irq, void *context)
 			sdev->ipc->msg.rx_data = &notification_data;
 			snd_sof_ipc_msgs_rx(sdev);
 			sdev->ipc->msg.rx_data = NULL;
-		}
 
-		/* Let DSP know that we have finished processing the message */
-		cnl_ipc_host_done(sdev);
+			/* Let DSP know that we have finished processing the message */
+			cnl_ipc_host_done(sdev);
+		}
 
 		ipc_irq = true;
 	}
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index b4668c969a29..a7c454e03952 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -169,6 +169,7 @@ irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context)
 				spin_lock_irq(&sdev->ipc_lock);
 
 				snd_sof_ipc_get_reply(sdev);
+				hda_dsp_ipc_host_done(sdev);
 				snd_sof_ipc_reply(sdev, data->primary);
 
 				spin_unlock_irq(&sdev->ipc_lock);
@@ -185,10 +186,10 @@ irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context)
 			sdev->ipc->msg.rx_data = &notification_data;
 			snd_sof_ipc_msgs_rx(sdev);
 			sdev->ipc->msg.rx_data = NULL;
-		}
 
-		/* Let DSP know that we have finished processing the message */
-		hda_dsp_ipc_host_done(sdev);
+			/* Let DSP know that we have finished processing the message */
+			hda_dsp_ipc_host_done(sdev);
+		}
 
 		ipc_irq = true;
 	}
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 9d1bc74395e7..054b9ab721ff 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -540,6 +540,7 @@ static irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
 				spin_lock_irq(&sdev->ipc_lock);
 
 				snd_sof_ipc_get_reply(sdev);
+				mtl_ipc_host_done(sdev);
 				snd_sof_ipc_reply(sdev, data->primary);
 
 				spin_unlock_irq(&sdev->ipc_lock);
@@ -556,9 +557,9 @@ static irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
 			sdev->ipc->msg.rx_data = &notification_data;
 			snd_sof_ipc_msgs_rx(sdev);
 			sdev->ipc->msg.rx_data = NULL;
-		}
 
-		mtl_ipc_host_done(sdev);
+			mtl_ipc_host_done(sdev);
+		}
 
 		ipc_irq = true;
 	}
-- 
2.38.0

