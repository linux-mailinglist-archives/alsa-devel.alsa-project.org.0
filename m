Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A785F2C699E
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 17:44:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FC621862;
	Fri, 27 Nov 2020 17:43:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FC621862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606495485;
	bh=X7v3Cx353N0W9PKu7NIZ5jG3EMlzqXQqwA+LUtjyvaU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B2EmiHhmQhbGsNUKSDoXRgyNy9+SoQ3en6axDN6uMhsm0wsRPPArtoTj2TziOAkgo
	 4rNQ5WnYSn/fnJyBcP07PSqEtJS+0A9+Rel5wsJ13r/VFTffgq7EBPy4tc05BDDVKU
	 rU6nOAVyA16sbYe1WH6Bfwb5s38wHfjXhBAaMWBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B41A1F802C4;
	Fri, 27 Nov 2020 17:43:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8F6CF8029B; Fri, 27 Nov 2020 17:43:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A007F800EA
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 17:42:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A007F800EA
IronPort-SDR: iLIu9jqB8VUeprrABylIFVsZ3lpFZLx0Rn/KtJSbUluZJs+6VvBoFihybacJ0cItGT7o3UTrZs
 st5ftRtl0flQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="234020270"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="234020270"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 08:42:53 -0800
IronPort-SDR: 3QSX9kWrvVLjvf+SBa9jngB2Rzsz2uDxCx0/0eF/+Wfl8yvWr3RgyJTPaWxkTgh0JcAAqTFnQI
 OSSBl53x8uaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="403933343"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga001.jf.intel.com with ESMTP; 27 Nov 2020 08:42:51 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/5] ASoC: SOF: ops: add parse_platform_ext_manifest() op
Date: Fri, 27 Nov 2020 18:40:18 +0200
Message-Id: <20201127164022.2498406-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201127164022.2498406-1-kai.vehmanen@linux.intel.com>
References: <20201127164022.2498406-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, Fred Oh <fred.oh@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

From: Fred Oh <fred.oh@linux.intel.com>

Add parse_platform_ext_manifest() op to parse platform-specific config
data in the extended manifest.

Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof/ext_manifest.h |  1 +
 sound/soc/sof/loader.c           |  3 +++
 sound/soc/sof/ops.h              | 10 ++++++++++
 sound/soc/sof/sof-priv.h         |  5 +++++
 4 files changed, 19 insertions(+)

diff --git a/include/sound/sof/ext_manifest.h b/include/sound/sof/ext_manifest.h
index e05cb21023e5..7abc4f0bd3ad 100644
--- a/include/sound/sof/ext_manifest.h
+++ b/include/sound/sof/ext_manifest.h
@@ -62,6 +62,7 @@ enum sof_ext_man_elem_type {
 	SOF_EXT_MAN_ELEM_CC_VERSION		= SOF_IPC_EXT_CC_INFO,
 	SOF_EXT_MAN_ELEM_DBG_ABI		= SOF_IPC_EXT_USER_ABI_INFO,
 	SOF_EXT_MAN_ELEM_CONFIG_DATA		= 5, /**< ABI3.17 */
+	SOF_EXT_MAN_ELEM_PLATFORM_CONFIG_DATA   = 6,
 };
 
 /* extended manifest element header */
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 2a8c9bff9963..cbce484b6469 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -330,6 +330,9 @@ static int snd_sof_fw_ext_man_parse(struct snd_sof_dev *sdev,
 		case SOF_EXT_MAN_ELEM_CONFIG_DATA:
 			ret = ext_man_get_config_data(sdev, elem_hdr);
 			break;
+		case SOF_EXT_MAN_ELEM_PLATFORM_CONFIG_DATA:
+			ret = snd_sof_dsp_parse_platform_ext_manifest(sdev, elem_hdr);
+			break;
 		default:
 			dev_info(sdev->dev, "unknown sof_ext_man header type %d size 0x%X\n",
 				 elem_hdr->type, elem_hdr->size);
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index b21632f5511a..77a6ac157d37 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -100,6 +100,16 @@ static inline int snd_sof_dsp_post_fw_run(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+/* parse platform specific extended manifest */
+static inline int snd_sof_dsp_parse_platform_ext_manifest(struct snd_sof_dev *sdev,
+							  const struct sof_ext_man_elem_header *hdr)
+{
+	if (sof_ops(sdev)->parse_platform_ext_manifest)
+		return sof_ops(sdev)->parse_platform_ext_manifest(sdev, hdr);
+
+	return 0;
+}
+
 /* misc */
 
 /**
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index d8bc0178dc89..32d6ceb41fdd 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -18,6 +18,7 @@
 #include <sound/sof/pm.h>
 #include <sound/sof/trace.h>
 #include <uapi/sound/sof/fw.h>
+#include <sound/sof/ext_manifest.h>
 
 /* debug flags */
 #define SOF_DBG_ENABLE_TRACE	BIT(0)
@@ -208,6 +209,10 @@ struct snd_sof_dsp_ops {
 	int (*pre_fw_run)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*post_fw_run)(struct snd_sof_dev *sof_dev); /* optional */
 
+	/* parse platform specific extended manifest, optional */
+	int (*parse_platform_ext_manifest)(struct snd_sof_dev *sof_dev,
+					   const struct sof_ext_man_elem_header *hdr);
+
 	/* DSP PM */
 	int (*suspend)(struct snd_sof_dev *sof_dev,
 		       u32 target_state); /* optional */
-- 
2.28.0

