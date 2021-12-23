Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E806447E271
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:40:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89A76184C;
	Thu, 23 Dec 2021 12:39:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89A76184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259618;
	bh=gTVIVUvLyvio4gONRnxrZAIcE1pseKxzeHjvTphmkp4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ESEPAJNeLvxSfrcUCftiCR/tb3bkOZTfQe7mfL9LpOM88f45Tpd4OKvyz9D3yOa4B
	 Nr6OgkYpO3VPSkaSmluEFFLVKSjegvEe26MemCAl2oeM+BYlK4A30kKzyCPv2L8WkU
	 4jNc22rFSQ3/GTXjOaSDu4hYAzOVWzuwcIjZhqv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B633F8053B;
	Thu, 23 Dec 2021 12:36:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E735F80528; Thu, 23 Dec 2021 12:36:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10158F80104
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10158F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XFvhhQ+X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259393; x=1671795393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gTVIVUvLyvio4gONRnxrZAIcE1pseKxzeHjvTphmkp4=;
 b=XFvhhQ+Xn0+591F6dcMWQNBY8MVf8aQx14EcKAcdlDlBq4K8Jeay+LeQ
 li02hZNX1FQpp6zSZfVq7LEvFaEKAfrEJmgZ9ZkPSAmE6lDBaM97GGkuZ
 ovAa7TAGfPw5KyxbyNHeemGtxQXTIn2Y+2dc4VChKYtmILWSRIwPowLWx
 L5qnEa+v9hRV1y0iqlEYxvOYZmsfyMIRxxY5QKWSA6g6eESWujkzoqA/6
 32mr5+Zc3zrTsN2DOf71yvIxeLTC/+Qaz7M4D8su3GYtwCkqSNkqBab1C
 RCGiYuvArem3D6aGdUmrK4FNb55c/ojHwHTG2AayE4qANsskiEkFffsUd w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180829"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180829"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065138"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:29 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 09/20] ASoC: SOF: Move the definition of enum snd_sof_fw_state
 to global header
Date: Thu, 23 Dec 2021 13:36:17 +0200
Message-Id: <20211223113628.18582-10-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
References: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 chao.song@intel.com, daniel.baluta@nxp.com
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

Move the enum snd_sof_fw_state to include/sound/sof.h to be accessible
outside of the core SOF stack.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
---
 include/sound/sof.h      | 22 ++++++++++++++++++++++
 sound/soc/sof/sof-priv.h | 11 -----------
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 23b374311d16..b9131c01eefd 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -17,6 +17,28 @@
 
 struct snd_sof_dsp_ops;
 
+/**
+ * enum snd_sof_fw_state - DSP firmware state definitions
+ * @SOF_FW_BOOT_NOT_STARTED:	firmware boot is not yet started
+ * @SOF_FW_BOOT_PREPARE:	preparing for boot (firmware loading for exaqmple)
+ * @SOF_FW_BOOT_IN_PROGRESS:	firmware boot is in progress
+ * @SOF_FW_BOOT_FAILED:		firmware boot failed
+ * @SOF_FW_BOOT_READY_FAILED:	firmware booted but fw_ready op failed
+ * @SOF_FW_BOOT_READY_OK:	firmware booted and fw_ready op passed
+ * @SOF_FW_BOOT_COMPLETE:	firmware is booted up and functional
+ * @SOF_FW_CRASHED:		firmware crashed after successful boot
+ */
+enum snd_sof_fw_state {
+	SOF_FW_BOOT_NOT_STARTED = 0,
+	SOF_FW_BOOT_PREPARE,
+	SOF_FW_BOOT_IN_PROGRESS,
+	SOF_FW_BOOT_FAILED,
+	SOF_FW_BOOT_READY_FAILED,
+	SOF_FW_BOOT_READY_OK,
+	SOF_FW_BOOT_COMPLETE,
+	SOF_FW_CRASHED,
+};
+
 /*
  * SOF Platform data.
  */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index c92103a028ff..a1ebc89b216a 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -375,17 +375,6 @@ struct snd_sof_ipc_msg {
 	bool ipc_complete;
 };
 
-enum snd_sof_fw_state {
-	SOF_FW_BOOT_NOT_STARTED = 0,
-	SOF_FW_BOOT_PREPARE,
-	SOF_FW_BOOT_IN_PROGRESS,
-	SOF_FW_BOOT_FAILED,
-	SOF_FW_BOOT_READY_FAILED, /* firmware booted but fw_ready op failed */
-	SOF_FW_BOOT_READY_OK,
-	SOF_FW_BOOT_COMPLETE,
-	SOF_FW_CRASHED,
-};
-
 /*
  * SOF Device Level.
  */
-- 
2.34.1

