Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 394ED6865FF
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 13:34:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93592E10;
	Wed,  1 Feb 2023 13:34:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93592E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675254895;
	bh=vBHxm0ECjItpDsr4NygqyeYSNweCZZ0kvTU94VSrlDA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KV0BwAqB68FK7iiPQirvfehPAp3W3+9zN2JZls6VRw42ONMZuACKEXxEXS80ahs8e
	 mFegy4lVjBDCOMlDKsQYuPNs0exsQVCowxGivU+J7A2l+mS7u29wdkxZTzVf2HQj6y
	 v5igeo7ccprWKnBsd6JRYzYsvzEeQKmVmzDsMHO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E789CF80568;
	Wed,  1 Feb 2023 13:32:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B73BFF8055B; Wed,  1 Feb 2023 13:32:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02142F80528
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 13:32:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02142F80528
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=E81ydIld
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675254760; x=1706790760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vBHxm0ECjItpDsr4NygqyeYSNweCZZ0kvTU94VSrlDA=;
 b=E81ydIldiblBgGw1/r0cxgY24BmXMaydNrNRXy/kmHaEZ4MwXdueVV1A
 ibmDNP/qVBu2YlMDqA8V60p4yTh9q5rciRviApDHok+hnJXSD9kouajtn
 nyH5NXOlh0lOyCS2hgTsLn1mkwm/0Mq3MMxXhd6aSfaPZDeTyf7PPDuGN
 Rh8B3IkAcudTL59rfkkRubXUNh4swZSqUaZWOr9CBXojUrHuryODEgcSV
 93Bb2K6D7XCVQkmTPRawa08x6GmoVF2waxSw/CiJ2e/4GkjqPyYi2r/Fe
 qgnzCi8M3UHhg49Mno1IqNFsoSgtf8m7eNG7b14ui+M/gey8XsSSfcdI5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="328143559"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="328143559"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 04:32:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="788865696"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="788865696"
Received: from jehdildi-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.31.67])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 04:32:32 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 4/9] ASoC: SOF: ipc4-pcm: allocate time info for pcm delay
 feature
Date: Wed,  1 Feb 2023 14:32:26 +0200
Message-Id: <20230201123231.26361-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201123231.26361-1-peter.ujfalusi@linux.intel.com>
References: <20230201123231.26361-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Allocate time info when pcm is loaded by topology
and free it when pcm is unloaded by topology.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 521090d4498d..8071db487815 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -12,6 +12,7 @@
 #include "sof-priv.h"
 #include "ipc4-priv.h"
 #include "ipc4-topology.h"
+#include "ipc4-fw-reg.h"
 
 static int sof_ipc4_set_multi_pipeline_state(struct snd_sof_dev *sdev, u32 state,
 					     struct ipc4_pipeline_set_state_data *trigger_list)
@@ -410,6 +411,8 @@ static void sof_ipc4_pcm_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm
 		pipeline_list = &spcm->stream[stream].pipeline_list;
 		kfree(pipeline_list->pipelines);
 		pipeline_list->pipelines = NULL;
+		kfree(spcm->stream[stream].private);
+		spcm->stream[stream].private = NULL;
 	}
 }
 
@@ -417,8 +420,19 @@ static int sof_ipc4_pcm_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm
 {
 	struct snd_sof_pcm_stream_pipeline_list *pipeline_list;
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	struct sof_ipc4_timestamp_info *stream_info;
+	bool support_info = true;
+	u32 abi_version;
+	u32 abi_offset;
 	int stream;
 
+	abi_offset = offsetof(struct sof_ipc4_fw_registers, abi_ver);
+	sof_mailbox_read(sdev, sdev->fw_info_box.offset + abi_offset, &abi_version,
+			 sizeof(abi_version));
+
+	if (abi_version < SOF_IPC4_FW_REGS_ABI_VER)
+		support_info = false;
+
 	for_each_pcm_streams(stream) {
 		pipeline_list = &spcm->stream[stream].pipeline_list;
 
@@ -429,6 +443,17 @@ static int sof_ipc4_pcm_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm
 			sof_ipc4_pcm_free(sdev, spcm);
 			return -ENOMEM;
 		}
+
+		if (!support_info)
+			continue;
+
+		stream_info = kzalloc(sizeof(*stream_info), GFP_KERNEL);
+		if (!stream_info) {
+			sof_ipc4_pcm_free(sdev, spcm);
+			return -ENOMEM;
+		}
+
+		spcm->stream[stream].private = stream_info;
 	}
 
 	return 0;
-- 
2.39.1

