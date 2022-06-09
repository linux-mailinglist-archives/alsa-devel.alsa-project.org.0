Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F13A5441FD
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:33:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B8AA209E;
	Thu,  9 Jun 2022 05:33:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B8AA209E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745632;
	bh=vm/n6KCC+FRStIw79oP7k40Z4KYc5jDHU5nmHbYPYlc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jwGxbbG+OwRVI5fTNgCbJFsLheenTavPd0vT24TTINE1KRcV3GUJPS0GhO20s1eZh
	 MzMek/o0wne8eIzJ1vHXpw/3W8SLbKJ8f/WR6bZDZRKMElkEyIe8Z5+Df5bMCrbYNS
	 nai4ewllMLgyEgUoYh/f+8RHJpAZPMHvBJxdUHhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82C8EF805DA;
	Thu,  9 Jun 2022 05:27:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA430F80544; Thu,  9 Jun 2022 05:27:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B492F80544
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B492F80544
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eQSiznYz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745242; x=1686281242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vm/n6KCC+FRStIw79oP7k40Z4KYc5jDHU5nmHbYPYlc=;
 b=eQSiznYzTEujxDhp4hCMVgcdIvk4Ai45QOEEX8S/RpDSiK6WrabEGqyh
 EbX5OkMJxXWzqgdKO6b4bARHWJICkWuoI9ZhVDx2Fw+ceg+lwCMlA18GE
 OhruIPlmN08SeCaNfhw/jl487blEV78hBwO00zAtXOCy7P9hIAZQuU1cV
 tOakYpEqarlRO/9jnMpQbzzqGq5LNkEzXvPm7XEH3fh4EF/VyMAXjYHB3
 P/UZA5Jdi/Jn7fx1B05CSnDMYe34gzYGloMfQgC1Fqol2JzwAklRm85gL
 s8O8ldSKnnnXTBTKHiqllgAR3FQaHpNy/5h5s18dqCP8NTeBRVuWUN4Io w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219568"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219568"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260251"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:00 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 17/23] ASoC: SOF: Add ops_free
Date: Wed,  8 Jun 2022 20:26:37 -0700
Message-Id: <20220609032643.916882-18-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

Add the ops_free callback in struct sof_dev_desc.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/sof.h  | 1 +
 sound/soc/sof/core.c | 7 ++++++-
 sound/soc/sof/ops.h  | 6 ++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 1a82a0db5e7f..367dccfea7ad 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -138,6 +138,7 @@ struct sof_dev_desc {
 
 	struct snd_sof_dsp_ops *ops;
 	int (*ops_init)(struct snd_sof_dev *sdev);
+	void (*ops_free)(struct snd_sof_dev *sdev);
 };
 
 int sof_dai_get_mclk(struct snd_soc_pcm_runtime *rtd);
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 53719c04658f..c99b5e6c026c 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -189,7 +189,7 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	ret = snd_sof_probe(sdev);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to probe DSP %d\n", ret);
-		return ret;
+		goto probe_err;
 	}
 
 	sof_set_fw_state(sdev, SOF_FW_BOOT_PREPARE);
@@ -317,6 +317,8 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	snd_sof_free_debug(sdev);
 dsp_err:
 	snd_sof_remove(sdev);
+probe_err:
+	sof_ops_free(sdev);
 
 	/* all resources freed, update state to match */
 	sof_set_fw_state(sdev, SOF_FW_BOOT_NOT_STARTED);
@@ -374,6 +376,7 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 	    !sof_ops(sdev)->block_read || !sof_ops(sdev)->block_write ||
 	    !sof_ops(sdev)->send_msg || !sof_ops(sdev)->load_firmware ||
 	    !sof_ops(sdev)->ipc_msg_data) {
+		sof_ops_free(sdev);
 		dev_err(dev, "error: missing mandatory ops\n");
 		return -EINVAL;
 	}
@@ -457,6 +460,8 @@ int snd_sof_device_remove(struct device *dev)
 		snd_sof_remove(sdev);
 	}
 
+	sof_ops_free(sdev);
+
 	/* release firmware */
 	snd_sof_fw_unload(sdev);
 
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index b79ae4f66eba..55d43adb6a29 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -29,6 +29,12 @@ static inline int sof_ops_init(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static inline void sof_ops_free(struct snd_sof_dev *sdev)
+{
+	if (sdev->pdata->desc->ops_free)
+		sdev->pdata->desc->ops_free(sdev);
+}
+
 /* Mandatory operations are verified during probing */
 
 /* init */
-- 
2.25.1

