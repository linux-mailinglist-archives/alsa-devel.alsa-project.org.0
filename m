Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0026A123B98
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 01:30:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 919A11675;
	Wed, 18 Dec 2019 01:30:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 919A11675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576629057;
	bh=fewJ/LxEhVU17ZhJ0H7+b7fOAft/cZr4DSStInozPRw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WgrDn5ErIMPZTs44YBByM4NsgPNYqCkOSlkX2UpKRX1VExhqxgnz6IOfqy7IN8eWW
	 hqn0te9EMogkH+6xP44fQ6lO7TFI+6V2VdM14o5oKafFvI64mxiBEduSAet5ZgGhsj
	 wSmkuY3IPz8p7cMqIOmTX5RJUeoxc4yezRP7f9b8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AFA1F80290;
	Wed, 18 Dec 2019 01:26:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C903EF80273; Wed, 18 Dec 2019 01:26:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB18CF8023F
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 01:26:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB18CF8023F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 16:26:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,327,1571727600"; d="scan'208";a="217974224"
Received: from dshoemak-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.3.243])
 by orsmga003.jf.intel.com with ESMTP; 17 Dec 2019 16:26:31 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 17 Dec 2019 18:26:11 -0600
Message-Id: <20191218002616.7652-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191218002616.7652-1-pierre-louis.bossart@linux.intel.com>
References: <20191218002616.7652-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Karol Trzcinski <karolx.trzcinski@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 3/8] ASoC: SOF: log compiler name and version
	information
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Karol Trzcinski <karolx.trzcinski@linux.intel.com>

Log information about used compilator and optimization level
in sof firmware to host system.
It will be helful to catch some compiler dependent bugs.

Signed-off-by: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/loader.c   | 39 +++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-priv.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 31847aa3975d..235be4fc0862 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -32,6 +32,42 @@ static int get_ext_windows(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+static int get_cc_info(struct snd_sof_dev *sdev,
+		       struct sof_ipc_ext_data_hdr *ext_hdr)
+{
+	int ret;
+
+	struct sof_ipc_cc_version *cc =
+		container_of(ext_hdr, struct sof_ipc_cc_version, ext_hdr);
+
+	dev_dbg(sdev->dev, "Firmware info: used compiler %s %d:%d:%d%s used optimization flags %s\n",
+		cc->name, cc->major, cc->minor, cc->micro, cc->desc,
+		cc->optim);
+
+	/* create read-only cc_version debugfs to store compiler version info */
+	/* use local copy of the cc_version to prevent data corruption */
+	if (sdev->first_boot) {
+		sdev->cc_version = devm_kmalloc(sdev->dev, cc->ext_hdr.hdr.size,
+						GFP_KERNEL);
+
+		if (!sdev->cc_version)
+			return -ENOMEM;
+
+		memcpy(sdev->cc_version, cc, cc->ext_hdr.hdr.size);
+		ret = snd_sof_debugfs_buf_item(sdev, sdev->cc_version,
+					       cc->ext_hdr.hdr.size,
+					       "cc_version", 0444);
+
+		/* errors are only due to memory allocation, not debugfs */
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: snd_sof_debugfs_buf_item failed\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 /* parse the extended FW boot data structures from FW boot message */
 int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offset)
 {
@@ -65,6 +101,9 @@ int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offset)
 		case SOF_IPC_EXT_WINDOW:
 			ret = get_ext_windows(sdev, ext_hdr);
 			break;
+		case SOF_IPC_EXT_CC_INFO:
+			ret = get_cc_info(sdev, ext_hdr);
+			break;
 		default:
 			dev_warn(sdev->dev, "warning: unknown ext header type %d size 0x%x\n",
 				 ext_hdr->type, ext_hdr->hdr.size);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 220b35141c34..3f1e1eb7c55f 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -361,6 +361,7 @@ struct snd_sof_dev {
 	struct snd_dma_buffer dmab_bdl;
 	struct sof_ipc_fw_ready fw_ready;
 	struct sof_ipc_fw_version fw_version;
+	struct sof_ipc_cc_version *cc_version;
 
 	/* topology */
 	struct snd_soc_tplg_ops *tplg_ops;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
