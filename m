Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1A01DBA7B
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 19:03:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14E84180B;
	Wed, 20 May 2020 19:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14E84180B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589994180;
	bh=RNZbed4QxEFQ//CldDPEJhrds/gcw7tGhaJ9C9FSBSs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oPxRYiRBM9augy5tyW9Q9XYWdJEBOKeUMA40dch6bjDGuAHD/92dcy9xoSOXLX4IZ
	 lBmAXbjlVjV/fkbF9AgjaWYw8MWKBghKlXMtgGNfHnfy4lnhIC/IQI9QN/h/xt32tY
	 +wrAiWgqIMw4Ni9ERS8ANKJISkdiuqR4oePeXEu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82AD5F80291;
	Wed, 20 May 2020 18:59:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F1C1F801DA; Wed, 20 May 2020 18:59:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A531CF8025E
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 18:59:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A531CF8025E
IronPort-SDR: pvveplYW/nzgP7Vi073UojMcYXbBStX8SJjfkS5aGJ5G3g7kagIl4Cm4vjLAlb1EnZHYXVP54a
 3GN6J9+LMuWQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 09:59:29 -0700
IronPort-SDR: 3upNoxWm2KMQan/N7EpQOk1n3bWXS9lGjI/UV/I39mvoIEEbxe657gjS6KXTuIT0FhYXRE0a83
 sP/h+wOyjomg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; d="scan'208";a="412085943"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 20 May 2020 09:59:28 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 5/5] ASoC: SOF: ext_manifest: parse compiler version
Date: Wed, 20 May 2020 19:59:11 +0300
Message-Id: <20200520165911.21696-6-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520165911.21696-1-kai.vehmanen@linux.intel.com>
References: <20200520165911.21696-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Karol Trzcinski <karolx.trzcinski@linux.intel.com>,
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

From: Karol Trzcinski <karolx.trzcinski@linux.intel.com>

The compiler version and description can be extracted from the
extended manifest content. This information known at build time
does not need to be provided in a mailbox.

Signed-off-by: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof/ext_manifest.h |  8 ++++++++
 sound/soc/sof/loader.c           | 21 +++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/sound/sof/ext_manifest.h b/include/sound/sof/ext_manifest.h
index 0001fc5779ef..04359cda92dc 100644
--- a/include/sound/sof/ext_manifest.h
+++ b/include/sound/sof/ext_manifest.h
@@ -59,6 +59,7 @@ struct sof_ext_man_header {
 enum sof_ext_man_elem_type {
 	SOF_EXT_MAN_ELEM_FW_VERSION		= 0,
 	SOF_EXT_MAN_ELEM_WINDOW			= SOF_IPC_EXT_WINDOW,
+	SOF_EXT_MAN_ELEM_CC_VERSION		= SOF_IPC_EXT_CC_INFO,
 };
 
 /* extended manifest element header */
@@ -84,4 +85,11 @@ struct sof_ext_man_window {
 	struct sof_ipc_window ipc_window;
 } __packed;
 
+/* Used C compiler description */
+struct sof_ext_man_cc_version {
+	struct sof_ext_man_elem_header hdr;
+	/* use sof_ipc struct because of code re-use */
+	struct sof_ipc_cc_version cc_version;
+} __packed;
+
 #endif /* __SOF_FIRMWARE_EXT_MANIFEST_H__ */
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 6e92a1285b91..b94fa5f5d480 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -49,6 +49,14 @@ static int get_cc_info(struct snd_sof_dev *sdev,
 	const struct sof_ipc_cc_version *cc =
 		container_of(ext_hdr, struct sof_ipc_cc_version, ext_hdr);
 
+	if (sdev->cc_version) {
+		if (memcmp(sdev->cc_version, cc, cc->ext_hdr.hdr.size)) {
+			dev_err(sdev->dev, "error: receive diverged cc_version descriptions");
+			return -EINVAL;
+		}
+		return 0;
+	}
+
 	dev_dbg(sdev->dev, "Firmware info: used compiler %s %d:%d:%d%s used optimization flags %s\n",
 		cc->name, cc->major, cc->minor, cc->micro, cc->desc,
 		cc->optim);
@@ -158,6 +166,16 @@ static int ext_man_get_windows(struct snd_sof_dev *sdev,
 	return get_ext_windows(sdev, &w->ipc_window.ext_hdr);
 }
 
+static int ext_man_get_cc_info(struct snd_sof_dev *sdev,
+			       const struct sof_ext_man_elem_header *hdr)
+{
+	const struct sof_ext_man_cc_version *cc;
+
+	cc = container_of(hdr, struct sof_ext_man_cc_version, hdr);
+
+	return get_cc_info(sdev, &cc->cc_version.ext_hdr);
+}
+
 static ssize_t snd_sof_ext_man_size(const struct firmware *fw)
 {
 	const struct sof_ext_man_header *head;
@@ -234,6 +252,9 @@ static int snd_sof_fw_ext_man_parse(struct snd_sof_dev *sdev,
 		case SOF_EXT_MAN_ELEM_WINDOW:
 			ret = ext_man_get_windows(sdev, elem_hdr);
 			break;
+		case SOF_EXT_MAN_ELEM_CC_VERSION:
+			ret = ext_man_get_cc_info(sdev, elem_hdr);
+			break;
 		default:
 			dev_warn(sdev->dev, "warning: unknown sof_ext_man header type %d size 0x%X\n",
 				 elem_hdr->type, elem_hdr->size);
-- 
2.26.2

