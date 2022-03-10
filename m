Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F40044D4052
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 05:31:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AD941820;
	Thu, 10 Mar 2022 05:30:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AD941820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646886678;
	bh=7OHrCJ0NJ0ZJTKjh3p8jbkOOXaaZSfn/roJlICXpeyo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y9XWTW5Xx+xdoDPkh1Yjg18QCgWdTg5w57wKhJPMPQhHstUzxSL9ZctmG0QEg0HTn
	 bQ3//rlA7m3l0YiBWE2gkIoWFfIjH3pN2hmlyWIxSPVXNU74gqG/QczV+9To0cH9Zd
	 sc9msFLzmNy5Gc075xtUpTNaSIrJ7Lsv4glHm5bA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04447F8053C;
	Thu, 10 Mar 2022 05:28:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00EB6F80525; Thu, 10 Mar 2022 05:27:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 355E0F8012F
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 05:27:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 355E0F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lk9XChS7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646886469; x=1678422469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7OHrCJ0NJ0ZJTKjh3p8jbkOOXaaZSfn/roJlICXpeyo=;
 b=lk9XChS7bboNHS9UiazSG74q8oknZh1OZLemOjLTNKXx6lQtfPhK0dpk
 Q2snN5erQfYn0h+/38kgKc/DuF68aS4hbnPZghSjtVEaRWIlNwMExQTYY
 xWgzDLfbO0Dyt+8FSMIukAKe3Z5Vn6CXQQ+UueRnV1d8L+/Q3/pWSG3UM
 BFuI3MNsVGtjdnk4tK6Rsr5AsJuUYCehSPzt3iYHltLMZmF9ZIQ54P2U/
 gOtWfxf7+lcq/naFuRda8RoO9EhyQDyw8bhsNUeJJgqNywFRFKjy09ATx
 zi1s1Wifu4+ZEPV5T0PRKOgiwn1NtNupWaJKsO4KZRXLm+u5yIJjt9y3d w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="318380895"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="318380895"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 20:27:32 -0800
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="547884689"
Received: from ttahmed-mobl2.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.50.225])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 20:27:32 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/10] ASoC: SOF: Intel: hda-ipc: Add
 hda_set_stream_data_offset()
Date: Wed,  9 Mar 2022 20:27:17 -0800
Message-Id: <20220310042720.976809-8-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310042720.976809-1-ranjani.sridharan@linux.intel.com>
References: <20220310042720.976809-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Add implementation for the generic set_stream_data_offset() callback to be
used by HDA platforms.

Convert the hda_ipc_pcm_params() to a wrapper for the new function.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-ipc.c | 15 ++++++++++-----
 sound/soc/sof/intel/hda.h     |  3 +++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index a8c452144168..317c3ab7e768 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -267,14 +267,12 @@ int hda_ipc_msg_data(struct snd_sof_dev *sdev,
 	return 0;
 }
 
-int hda_ipc_pcm_params(struct snd_sof_dev *sdev,
-		       struct snd_pcm_substream *substream,
-		       const struct sof_ipc_pcm_params_reply *reply)
+int hda_set_stream_data_offset(struct snd_sof_dev *sdev,
+			       struct snd_pcm_substream *substream,
+			       size_t posn_offset)
 {
 	struct hdac_stream *hstream = substream->runtime->private_data;
 	struct sof_intel_hda_stream *hda_stream;
-	/* validate offset */
-	size_t posn_offset = reply->posn_offset;
 
 	hda_stream = container_of(hstream, struct sof_intel_hda_stream,
 				  hext_stream.hstream);
@@ -291,3 +289,10 @@ int hda_ipc_pcm_params(struct snd_sof_dev *sdev,
 
 	return 0;
 }
+
+int hda_ipc_pcm_params(struct snd_sof_dev *sdev,
+		       struct snd_pcm_substream *substream,
+		       const struct sof_ipc_pcm_params_reply *reply)
+{
+	return hda_set_stream_data_offset(sdev, substream, reply->posn_offset);
+}
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 46641d31e9c5..1e0a6d7bde17 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -569,6 +569,9 @@ int hda_ipc_msg_data(struct snd_sof_dev *sdev,
 int hda_ipc_pcm_params(struct snd_sof_dev *sdev,
 		       struct snd_pcm_substream *substream,
 		       const struct sof_ipc_pcm_params_reply *reply);
+int hda_set_stream_data_offset(struct snd_sof_dev *sdev,
+			       struct snd_pcm_substream *substream,
+			       size_t posn_offset);
 
 /*
  * DSP IPC Operations.
-- 
2.25.1

