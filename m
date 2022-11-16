Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBA762BC34
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 12:40:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2F0816A9;
	Wed, 16 Nov 2022 12:39:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2F0816A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668598831;
	bh=Yr/0qBmCgbdb7d38WF85pkRxdBnyu9qE35POEXUdPMk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=txALfxZHfcO/b/gNwro4urSeyVKCskFRaIr0z+fO2IJwtIYhFB1CJovILUAy9Hg66
	 KdhwA7lu6CZ4f8Ayz2daNiNzq6UuqOlDPcWWQO740gI0OTSUX6khdQSBKALVHfMu5T
	 3zJDpJ4EQZDyFQdcM3mJ+fuep3aIow+4x3FbK8d4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16EE2F80558;
	Wed, 16 Nov 2022 12:38:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 314B7F804BC; Wed, 16 Nov 2022 12:38:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4023CF80163
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 12:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4023CF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="J7ZBuTgt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668598728; x=1700134728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yr/0qBmCgbdb7d38WF85pkRxdBnyu9qE35POEXUdPMk=;
 b=J7ZBuTgtueH+NhOtINvAMo9pQumpTQHZ/tyCxnc495roh/kZu7QjzFwn
 MPUXrlkxwAy+DM7wEscp0SdMJIzsTSvCrzI/4sEsjS69avcws3ph9DH9K
 YXJ0HQq2A/ryfwqMQ9qMYMDGKKckBYjWWGKHe8xYSHBE6+TbhIssb8ZDQ
 MnPELD5vx4DIknpQ8+mzHj03I24TRz4TuY71GPiTzBu3QAHOmpJgAcUdY
 QXossySgqgULkJf7N5vMVoO+VtR2Hd+fYWtUvrJnEorLeh5gVoMzsm3rk
 YnHNTE4Ba6jQVLmALGNfhkdsj6PXr6BSsCr52xGxzcuM1g3E/3EQIUr0G Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="314336795"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="314336795"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 03:38:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="764304477"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="764304477"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga004.jf.intel.com with ESMTP; 16 Nov 2022 03:38:42 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v3 2/2] ASoC: Intel: avs: Disconnect substream if suspend or
 resume fails
Date: Wed, 16 Nov 2022 12:55:50 +0100
Message-Id: <20221116115550.1100398-3-cezary.rojewski@intel.com>
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

To improve performance and overall system stability, suspend/resume
operations for ASoC cards always return success status and defer the
actual work.

Because of that, if a substream fails to resume, userspace may still
attempt to invoke commands on it as from their perspective the operation
completed successfully. Set substream's state to DISCONNECTED to ensure
no further commands are attempted.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Changes in v2:
- __snd_pcm_set_state() replaced direct assignments of PCM state

 sound/soc/intel/avs/pcm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index ca624fbb5c0d..70442b5212c2 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -934,8 +934,11 @@ static int avs_component_pm_op(struct snd_soc_component *component, bool be,
 			rtd = snd_pcm_substream_chip(data->substream);
 			if (rtd->dai_link->no_pcm == be && !rtd->dai_link->ignore_suspend) {
 				ret = op(dai, data);
-				if (ret < 0)
+				if (ret < 0) {
+					__snd_pcm_set_state(data->substream->runtime,
+							    SNDRV_PCM_STATE_DISCONNECTED);
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
+					__snd_pcm_set_state(data->substream->runtime,
+							    SNDRV_PCM_STATE_DISCONNECTED);
 					return ret;
+				}
 			}
 		}
 	}
-- 
2.25.1

