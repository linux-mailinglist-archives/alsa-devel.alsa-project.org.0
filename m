Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B6D2C2F82
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 19:04:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 838AB176F;
	Tue, 24 Nov 2020 19:03:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 838AB176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606241077;
	bh=KbafvyFM18Nb9Lvhu4PNteY++CY4lsmRM7YNtcm8TT8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SY5bC5vPp40WI1oHQ51Mb/MER5tURUp01PFnvqLdaVca62hRhI5yPdRNpd4F2HKhm
	 RCvgQZnfnLWh9ZXkRb67/hfrHGtWRiZNlVTZWEfcuZ+TIGbgf0sORxt56HW/Vc/e8c
	 BfOrzg32kTkEa+Gj5z4BA5TVX12DRrO5nIepxteg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8851FF8015A;
	Tue, 24 Nov 2020 19:03:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6212F8027C; Tue, 24 Nov 2020 19:02:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BA14F800C1
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 19:02:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BA14F800C1
IronPort-SDR: sg3UO6hprVwX63xyUn8evb+Y1Ic8nSPj7EumRD/JdA3oAHrK5McMgmAMUXeIuWm8ta5oE0Gog/
 cEXNHlq8pGIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="151830588"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="151830588"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 10:02:49 -0800
IronPort-SDR: STMan9pSlAiWB/9FbEGnv54IUSNEgo+w4y132aSYvID6kEPZH7dM6uQeNnMrFOGTQvVcgxIDY8
 UFsmcLAGm8Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="478585014"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 24 Nov 2020 10:02:47 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/4] ASoC: SOF: ext_manifest: Parse firmware config dictionary
Date: Tue, 24 Nov 2020 20:00:14 +0200
Message-Id: <20201124180017.2232128-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201124180017.2232128-1-kai.vehmanen@linux.intel.com>
References: <20201124180017.2232128-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Karol Trzcinski <karolx.trzcinski@linux.intel.com>, daniel.baluta@nxp.com
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

Values given in this dictionary describes used firmware configuration,
like feature availability, buffer size limits and similar properties.

Signed-off-by: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof/ext_manifest.h | 19 +++++++++++++++
 sound/soc/sof/loader.c           | 41 ++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/include/sound/sof/ext_manifest.h b/include/sound/sof/ext_manifest.h
index 342e86e54db5..31da6e611c6e 100644
--- a/include/sound/sof/ext_manifest.h
+++ b/include/sound/sof/ext_manifest.h
@@ -61,6 +61,7 @@ enum sof_ext_man_elem_type {
 	SOF_EXT_MAN_ELEM_WINDOW			= SOF_IPC_EXT_WINDOW,
 	SOF_EXT_MAN_ELEM_CC_VERSION		= SOF_IPC_EXT_CC_INFO,
 	SOF_EXT_MAN_ELEM_DBG_ABI		= SOF_IPC_EXT_USER_ABI_INFO,
+	SOF_EXT_MAN_ELEM_CONFIG_DATA		= 5, /**< ABI3.17 */
 };
 
 /* extended manifest element header */
@@ -99,4 +100,22 @@ struct ext_man_dbg_abi {
 	struct sof_ipc_user_abi_version dbg_abi;
 } __packed;
 
+/* EXT_MAN_ELEM_CONFIG_DATA elements identificators, ABI3.17 */
+enum config_elem_type {
+	SOF_EXT_MAN_CONFIG_EMPTY		= 0,
+	SOF_EXT_MAN_CONFIG_IPC_MSG_SIZE		= 1,
+};
+
+struct sof_config_elem {
+	uint32_t token;
+	uint32_t value;
+} __packed;
+
+/* firmware configuration information */
+struct sof_ext_man_config_data {
+	struct sof_ext_man_elem_header hdr;
+
+	struct sof_config_elem elems[];
+} __packed;
+
 #endif /* __SOF_FIRMWARE_EXT_MANIFEST_H__ */
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index ce68d708fc6f..33d3be774380 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -197,6 +197,44 @@ static int ext_man_get_dbg_abi_info(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+static int ext_man_get_config_data(struct snd_sof_dev *sdev,
+				   const struct sof_ext_man_elem_header *hdr)
+{
+	const struct sof_ext_man_config_data *config =
+		container_of(hdr, struct sof_ext_man_config_data, hdr);
+	const struct sof_config_elem *elem;
+	int elems_counter;
+	int elems_size;
+	int i;
+
+	/* calculate elements counter */
+	elems_size = config->hdr.size - sizeof(struct sof_ext_man_elem_header);
+	elems_counter = elems_size / sizeof(struct sof_config_elem);
+
+	dev_dbg(sdev->dev, "%s can hold up to %d config elements\n",
+		__func__, elems_counter);
+
+	for (i = 0; i < elems_counter; ++i) {
+		elem = &config->elems[i];
+		dev_dbg(sdev->dev, "%s get index %d token %d val %d\n",
+			__func__, i, elem->token, elem->value);
+		switch (elem->token) {
+		case SOF_EXT_MAN_CONFIG_EMPTY:
+			/* unused memory space is zero filled - mapped to EMPTY elements */
+			break;
+		case SOF_EXT_MAN_CONFIG_IPC_MSG_SIZE:
+			/* TODO: use ipc msg size from config data */
+			break;
+		default:
+			dev_info(sdev->dev, "Unknown firmware configuration token %d value %d",
+				 elem->token, elem->value);
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static ssize_t snd_sof_ext_man_size(const struct firmware *fw)
 {
 	const struct sof_ext_man_header *head;
@@ -279,6 +317,9 @@ static int snd_sof_fw_ext_man_parse(struct snd_sof_dev *sdev,
 		case SOF_EXT_MAN_ELEM_DBG_ABI:
 			ret = ext_man_get_dbg_abi_info(sdev, elem_hdr);
 			break;
+		case SOF_EXT_MAN_ELEM_CONFIG_DATA:
+			ret = ext_man_get_config_data(sdev, elem_hdr);
+			break;
 		default:
 			dev_info(sdev->dev, "unknown sof_ext_man header type %d size 0x%X\n",
 				 elem_hdr->type, elem_hdr->size);
-- 
2.28.0

