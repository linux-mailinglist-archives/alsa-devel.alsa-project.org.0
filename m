Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E47CD47E272
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:40:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86BA6189D;
	Thu, 23 Dec 2021 12:39:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86BA6189D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259636;
	bh=L7WQJyUd2G2LhxirZFDSTbrJVLabugGgZyySimp4/ko=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BrEfpkj/0OTo+bQPpiIFw7Cd1fst73qAroZOdnWBOZ/Xrrxq+M+k2TfvL7h96v3b8
	 2kP5UaGU95PFjYuMKUrn6TganuLOoThoTmOm2ACURCUsVvNMGTXmnFALf5TlUJqdqa
	 qoTDktS23uDWETzz/XXu5tmB4paU7d2bMSePDAxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FFA0F8053C;
	Thu, 23 Dec 2021 12:36:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1F73F80534; Thu, 23 Dec 2021 12:36:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66EB8F8051A
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66EB8F8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IHW+KlUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259395; x=1671795395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L7WQJyUd2G2LhxirZFDSTbrJVLabugGgZyySimp4/ko=;
 b=IHW+KlUx5vY7oiedGJFXE4AUdMeXBf3JVm1ixXGzICG1JsIj37THsvJk
 aboc9xmdqVTld83DFuz5qTkPV5LIr7lpP7pkff4u4+A8dLkV58yqgJyt4
 Jkg/UYzn0HAqYIX8p+JQ5MUrv4fftJq7GE/rDk3iINq4zx9TeheHaBiT6
 q+qphKbSiRoyypUlILwn4cCB5ZW7cCrHlErgWuX1tJoWkJ9Ww7gE6qlBm
 vlfukEIYE+yfrFcuClZ4KL+uWOc2lRFhnxbvDlJU3/6EjT0IHmRRUVob8
 ffq3kw91P7o/mTkfJf8bMiXoJnmqksatDXSJVVf0aO1YhlTK3HzTPV6Gf w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180832"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180832"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065147"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:31 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 10/20] ASoC: SOF: Rename 'enum snd_sof_fw_state' to 'enum
 sof_fw_state'
Date: Thu, 23 Dec 2021 13:36:18 +0200
Message-Id: <20211223113628.18582-11-peter.ujfalusi@linux.intel.com>
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

Since there is nothing SND about the firmware state, rename the enum
from `snd_sof_fw_state` to simply `sof_fw_state`

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
---
 include/sound/sof.h      | 4 ++--
 sound/soc/sof/debug.c    | 2 +-
 sound/soc/sof/sof-priv.h | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index b9131c01eefd..813680ab9aad 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -18,7 +18,7 @@
 struct snd_sof_dsp_ops;
 
 /**
- * enum snd_sof_fw_state - DSP firmware state definitions
+ * enum sof_fw_state - DSP firmware state definitions
  * @SOF_FW_BOOT_NOT_STARTED:	firmware boot is not yet started
  * @SOF_FW_BOOT_PREPARE:	preparing for boot (firmware loading for exaqmple)
  * @SOF_FW_BOOT_IN_PROGRESS:	firmware boot is in progress
@@ -28,7 +28,7 @@ struct snd_sof_dsp_ops;
  * @SOF_FW_BOOT_COMPLETE:	firmware is booted up and functional
  * @SOF_FW_CRASHED:		firmware crashed after successful boot
  */
-enum snd_sof_fw_state {
+enum sof_fw_state {
 	SOF_FW_BOOT_NOT_STARTED = 0,
 	SOF_FW_BOOT_PREPARE,
 	SOF_FW_BOOT_IN_PROGRESS,
diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 75aaf0da87a0..d3640ff33134 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -930,7 +930,7 @@ void snd_sof_free_debug(struct snd_sof_dev *sdev)
 EXPORT_SYMBOL_GPL(snd_sof_free_debug);
 
 static const struct soc_fw_state_info {
-	enum snd_sof_fw_state state;
+	enum sof_fw_state state;
 	const char *name;
 } fw_state_dbg[] = {
 	{SOF_FW_BOOT_NOT_STARTED, "SOF_FW_BOOT_NOT_STARTED"},
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index a1ebc89b216a..44ae8d8d1333 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -399,7 +399,7 @@ struct snd_sof_dev {
 
 	/* DSP firmware boot */
 	wait_queue_head_t boot_wait;
-	enum snd_sof_fw_state fw_state;
+	enum sof_fw_state fw_state;
 	bool first_boot;
 
 	/* work queue in case the probe is implemented in two steps */
@@ -591,7 +591,7 @@ extern const struct dsp_arch_ops sof_xtensa_arch_ops;
  * Firmware state tracking
  */
 static inline void sof_set_fw_state(struct snd_sof_dev *sdev,
-				    enum snd_sof_fw_state new_state)
+				    enum sof_fw_state new_state)
 {
 	if (sdev->fw_state == new_state)
 		return;
-- 
2.34.1

