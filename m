Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E85591AB287
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:33:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D7051614;
	Wed, 15 Apr 2020 22:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D7051614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586982809;
	bh=/n3aqcshHRyjhQJHERn5s3guw0TFxsieODzO/Jck7Vc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iVFe4CiGI7mPCzHelGBuvuyIMz3tIIZHTU7S1q4VqlBossUYLJzYQm85WkmfPkxKY
	 57EFTpBI6SNpVdtLuldsBaYJQg5mQp4hfAFtM4URqmaExgn4KAMc7Lc7UMOhfBY4Lv
	 RdA7Fc/BQd5IMSHePlbObzNkR3d/PXG+M+0/boU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0101BF8027D;
	Wed, 15 Apr 2020 22:29:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F370F80290; Wed, 15 Apr 2020 22:29:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BA3FF80264
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:29:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BA3FF80264
IronPort-SDR: MRCFoYAN3g0V/HTnGqnZfmdMsSfTRL9z73AZIDfoxE1O9DkuU7N6co/R6Q4SvwsuhjOH/AEqCy
 U5Anc7DTNnnQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:29:00 -0700
IronPort-SDR: OCbadVmMJMNH02iKsXVWujeslOAfPbM4kjaRf6ATWVmvrzQbqVAJOSgzBx1LLcvCETz3nYfI2T
 /MkSJgtnE+JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288656266"
Received: from jplam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.82.197])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 13:28:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/24] ASoC: SOF: ext_manifest: parse compiler version
Date: Wed, 15 Apr 2020 15:27:59 -0500
Message-Id: <20200415202816.934-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
References: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Karol Trzcinski <karolx.trzcinski@linux.intel.com>
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

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/uapi/sound/sof/ext_manifest.h |  8 ++++++++
 sound/soc/sof/loader.c                | 23 +++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/uapi/sound/sof/ext_manifest.h b/include/uapi/sound/sof/ext_manifest.h
index 203c203f6531..d49c47d08c7f 100644
--- a/include/uapi/sound/sof/ext_manifest.h
+++ b/include/uapi/sound/sof/ext_manifest.h
@@ -56,6 +56,7 @@ struct sof_ext_man_header {
 enum sof_ext_man_elem_type {
 	SOF_EXT_MAN_ELEM_FW_VERSION		= 0,
 	SOF_EXT_MAN_ELEM_WINDOW			= SOF_IPC_EXT_WINDOW,
+	SOF_EXT_MAN_ELEM_CC_VERSION		= SOF_IPC_EXT_CC_INFO,
 };
 
 /* extended manifest element header */
@@ -80,4 +81,11 @@ struct sof_ext_man_window {
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
index bbfdf07fa6f5..8be30cd5e038 100644
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
@@ -161,6 +169,18 @@ static int ext_man_get_windows(struct snd_sof_dev *sdev,
 	return get_ext_windows(sdev, w_ipc);
 }
 
+static int ext_man_get_cc_info(struct snd_sof_dev *sdev,
+			       const struct sof_ext_man_elem_header *hdr)
+{
+	const struct sof_ext_man_cc_version *cc;
+	const struct sof_ipc_ext_data_hdr *cc_version;
+
+	cc = container_of(hdr, struct sof_ext_man_cc_version, hdr);
+	cc_version = (const struct sof_ipc_ext_data_hdr *)&cc->cc_version;
+
+	return get_cc_info(sdev, cc_version);
+}
+
 static ssize_t snd_sof_ext_man_size(const struct firmware *fw)
 {
 	const struct sof_ext_man_header *head = (void *)fw->data;
@@ -241,6 +261,9 @@ static int snd_sof_fw_ext_man_parse(struct snd_sof_dev *sdev,
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
2.20.1

