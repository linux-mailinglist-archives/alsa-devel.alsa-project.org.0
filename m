Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE3D252497
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 02:03:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C467016FB;
	Wed, 26 Aug 2020 02:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C467016FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598400200;
	bh=tffTb950Xlosy8m97UB5faQ0iQuP7rC6ppLAeU6DRqU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EAUO+md6Y0PySKyxB3RiuAthggb10H25jvIhp9BCypsJJTbTefArIcpJrKBhBIsE1
	 IqLHGwWAigL9pI/V648KZJZl2FeaOn+zy8hXAK1tNzozbniaStBVPtQkT5qTlVsr2y
	 AxDXLJb25Y8+3EwnooIIBjslkdcPlwA0UMouzYao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F5C6F802DF;
	Wed, 26 Aug 2020 01:59:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62334F802C3; Wed, 26 Aug 2020 01:59:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 814C8F8025A
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 01:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 814C8F8025A
IronPort-SDR: 5AUvcLwVNgEXguHmMrIXTKq/MHM60IGHbF0AkIDjPoP5TytVWix7PGNRbqgyHf2KqebaBefqRi
 wYmQRWFd+DHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="135764554"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="135764554"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:59:05 -0700
IronPort-SDR: BPgxL4fYTDfaQwDct3caqiaN52gl0XZg17kSy478Y6c95bq5HbtaXRDPDPhoBHYpztvIQRjbVj
 0P3E3VAk/pHA==
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="474558911"
Received: from cdurvasu-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.42.42])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:59:04 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ASoC: SOF: ext_manifest: Parse debug ABI version
Date: Tue, 25 Aug 2020 16:58:53 -0700
Message-Id: <20200825235854.1588034-4-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825235854.1588034-1-ranjani.sridharan@linux.intel.com>
References: <20200825235854.1588034-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Karol Trzcinski <karolx.trzcinski@linux.intel.com>
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

The debug ABI can be extracted from the extended manifest content.
This information known at build time does not need to be provided
in a mailbox.

Signed-off-by: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/sound/sof/ext_manifest.h |  7 +++++++
 sound/soc/sof/loader.c           | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/sound/sof/ext_manifest.h b/include/sound/sof/ext_manifest.h
index 04359cda92dc..342e86e54db5 100644
--- a/include/sound/sof/ext_manifest.h
+++ b/include/sound/sof/ext_manifest.h
@@ -60,6 +60,7 @@ enum sof_ext_man_elem_type {
 	SOF_EXT_MAN_ELEM_FW_VERSION		= 0,
 	SOF_EXT_MAN_ELEM_WINDOW			= SOF_IPC_EXT_WINDOW,
 	SOF_EXT_MAN_ELEM_CC_VERSION		= SOF_IPC_EXT_CC_INFO,
+	SOF_EXT_MAN_ELEM_DBG_ABI		= SOF_IPC_EXT_USER_ABI_INFO,
 };
 
 /* extended manifest element header */
@@ -92,4 +93,10 @@ struct sof_ext_man_cc_version {
 	struct sof_ipc_cc_version cc_version;
 } __packed;
 
+struct ext_man_dbg_abi {
+	struct sof_ext_man_elem_header hdr;
+	/* use sof_ipc struct because of code re-use */
+	struct sof_ipc_user_abi_version dbg_abi;
+} __packed;
+
 #endif /* __SOF_FIRMWARE_EXT_MANIFEST_H__ */
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 42e0e3e58869..b8e72084dfeb 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -176,6 +176,22 @@ static int ext_man_get_cc_info(struct snd_sof_dev *sdev,
 	return get_cc_info(sdev, &cc->cc_version.ext_hdr);
 }
 
+static int ext_man_get_dbg_abi_info(struct snd_sof_dev *sdev,
+				    const struct sof_ext_man_elem_header *hdr)
+{
+	const struct ext_man_dbg_abi *dbg_abi =
+		container_of(hdr, struct ext_man_dbg_abi, hdr);
+
+	if (sdev->first_boot)
+		dev_dbg(sdev->dev,
+			"Firmware: DBG_ABI %d:%d:%d\n",
+			SOF_ABI_VERSION_MAJOR(dbg_abi->dbg_abi.abi_dbg_version),
+			SOF_ABI_VERSION_MINOR(dbg_abi->dbg_abi.abi_dbg_version),
+			SOF_ABI_VERSION_PATCH(dbg_abi->dbg_abi.abi_dbg_version));
+
+	return 0;
+}
+
 static ssize_t snd_sof_ext_man_size(const struct firmware *fw)
 {
 	const struct sof_ext_man_header *head;
@@ -255,6 +271,9 @@ static int snd_sof_fw_ext_man_parse(struct snd_sof_dev *sdev,
 		case SOF_EXT_MAN_ELEM_CC_VERSION:
 			ret = ext_man_get_cc_info(sdev, elem_hdr);
 			break;
+		case SOF_EXT_MAN_ELEM_DBG_ABI:
+			ret = ext_man_get_dbg_abi_info(sdev, elem_hdr);
+			break;
 		default:
 			dev_warn(sdev->dev, "warning: unknown sof_ext_man header type %d size 0x%X\n",
 				 elem_hdr->type, elem_hdr->size);
-- 
2.25.1

