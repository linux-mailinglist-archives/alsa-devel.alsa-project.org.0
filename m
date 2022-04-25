Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3814550EB7F
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 00:14:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCACA189F;
	Tue, 26 Apr 2022 00:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCACA189F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650924864;
	bh=QKgDegJZTwyhoDhdqz38NcVCpxRuUqGeH2pkbhY8Nls=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g9pfbTA7vxHcML1glS0o/5wvl69zou+1xRfYT4HsvNiLmBotg1PyKFPXhgaWUYFSP
	 PiIUYMWkjCJHTy5GQ1EKjczmfCqI/Z7uAyia9PXSlmJ6B9NAS3Ovr/Ej9FOMo+7xJX
	 UnHD4bslSAhe6a9272iAN4ERjNcomsf9W3dNtVH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 676ADF8052F;
	Tue, 26 Apr 2022 00:12:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D36C2F8050F; Tue, 26 Apr 2022 00:11:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF679F8016B
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 00:11:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF679F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aGnfrim0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650924714; x=1682460714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QKgDegJZTwyhoDhdqz38NcVCpxRuUqGeH2pkbhY8Nls=;
 b=aGnfrim01N9Pn43UZHJRGfCrPMbNOQ3Htu6AmzNVK9yFDDHV9wb89Y6f
 cPvN32ML3ZTr9td2RxgM8v0iqU9Fxbd3sueD5GTik5mkqy5+CKkHAYyAh
 a2Fsnsne5P7Kb6n6KjbddThnkBo5X+ldjYHcS+/0hjKGZGCZr5Inzs/Jq
 v5ry9kczOYskEvtBGyaZUb7DJnMIvUEa1CrNxJqIGoXw6vACk2ZsQi9Fo
 OLKzyeobSAXMigVEX46ZecCEZYhf3t4KzgO7EOT3r5SrGjeMtEgAi1q2/
 YeDgKuGiuQiX31ncKM9nBPMyo5qrae0v59lhhDYPldAtrVzOxQ5neSsKe w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="245942138"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="245942138"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:11:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="729939905"
Received: from shivakax-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.59.189])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:11:35 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/10] ASoC: SOF: Introduce IPC dependent ops for firmware
 handling, loading
Date: Mon, 25 Apr 2022 15:11:20 -0700
Message-Id: <20220425221129.124615-2-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425221129.124615-1-ranjani.sridharan@linux.intel.com>
References: <20220425221129.124615-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, tiwai@suse.com,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

The parsing and loading of firmware modules/components are IPC dependent
operations as the organization of the firmware depends on the IPC it is
supporting.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 382187e89e54..1df0b1473661 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -364,6 +364,25 @@ struct sof_ipc_pm_ops {
 	int (*ctx_restore)(struct snd_sof_dev *sdev);
 };
 
+/**
+ * struct sof_ipc_fw_loader_ops - IPC/FW-specific loader ops
+ * @validate:		Function pointer for validating the firmware image
+ * @parse_ext_manifest:	Function pointer for parsing the manifest of the firmware
+ * @load_fw_to_dsp:	Optional function pointer for loading the firmware to the
+ *			DSP.
+ *			The function implements generic, hardware independent way
+ *			of loading the initial firmware and its modules (if any).
+ * @query_fw_configuration: Optional function pointer to query information and
+ *			configuration from the booted firmware.
+ *			Executed after the first successful firmware boot.
+ */
+struct sof_ipc_fw_loader_ops {
+	int (*validate)(struct snd_sof_dev *sdev);
+	size_t (*parse_ext_manifest)(struct snd_sof_dev *sdev);
+	int (*load_fw_to_dsp)(struct snd_sof_dev *sdev);
+	int (*query_fw_configuration)(struct snd_sof_dev *sdev);
+};
+
 struct sof_ipc_tplg_ops;
 struct sof_ipc_pcm_ops;
 
@@ -372,6 +391,7 @@ struct sof_ipc_pcm_ops;
  * @tplg:	Pointer to IPC-specific topology ops
  * @pm:		Pointer to PM ops
  * @pcm:	Pointer to PCM ops
+ * @fw_loader:	Pointer to Firmware Loader ops
  *
  * @tx_msg:	Function pointer for sending a 'short' IPC message
  * @set_get_data: Function pointer for set/get data ('large' IPC message). This
@@ -391,6 +411,7 @@ struct sof_ipc_ops {
 	const struct sof_ipc_tplg_ops *tplg;
 	const struct sof_ipc_pm_ops *pm;
 	const struct sof_ipc_pcm_ops *pcm;
+	const struct sof_ipc_fw_loader_ops *fw_loader;
 
 	int (*tx_msg)(struct snd_sof_dev *sdev, void *msg_data, size_t msg_bytes,
 		      void *reply_data, size_t reply_bytes, bool no_pm);
-- 
2.25.1

