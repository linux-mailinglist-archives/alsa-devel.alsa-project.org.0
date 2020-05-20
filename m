Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C4D1DBA74
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 19:02:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A243217F4;
	Wed, 20 May 2020 19:01:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A243217F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589994141;
	bh=9gA7cc3aO+lrIEEumzEoK1sj97bLGb4dqtWj5opbimg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EebuLwWWibbqOgnF13Eb/SWgH3sLEkqnnXvDpgiuo6WsmoEDFYOaSjuTsyA6YMolX
	 YySbdZiTNygZHp+UDEFDWBRmTN25tchqw5XcBJUmVWlidqUUF+k9yqFRUfJW263BzO
	 1pOkrLgo5BAIPnDz7pVqO9xFzt0b6cr768z2hs2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B1D3F8028E;
	Wed, 20 May 2020 18:59:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F34C2F80274; Wed, 20 May 2020 18:59:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A29F8F801DA
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 18:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A29F8F801DA
IronPort-SDR: 6zu4LJpFJnByRzbRiRTDQvZkmKtB8fftKSHraceNTib2MareCkzEWO2sbbcIHXPpb4GZr+Cyp5
 aZfO55CqUJvA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 09:59:24 -0700
IronPort-SDR: t/HqF9wvxIaNGCD0aeMxgGYT0hwEMxB27bIY2Tel2Zq+rljSJe46HlvxJP0ewVkd81ggR8z2cB
 EPhSwsvNRbTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; d="scan'208";a="412085923"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 20 May 2020 09:59:22 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/5] ASoC: SOF: ext_manifest: parse firmware version
Date: Wed, 20 May 2020 19:59:09 +0300
Message-Id: <20200520165911.21696-4-kai.vehmanen@linux.intel.com>
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

The firmware version can be extracted from the extended
manifest content. This information known at build time
does not need to be provided in a mailbox.

Signed-off-by: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof/ext_manifest.h | 14 ++++++++++++++
 sound/soc/sof/loader.c           | 16 ++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/include/sound/sof/ext_manifest.h b/include/sound/sof/ext_manifest.h
index 5c1f03603919..6ed787eb788c 100644
--- a/include/sound/sof/ext_manifest.h
+++ b/include/sound/sof/ext_manifest.h
@@ -19,6 +19,7 @@
 #include <linux/bits.h>
 #include <linux/compiler.h>
 #include <linux/types.h>
+#include <sound/sof/info.h>
 
 /* In ASCII `XMan` */
 #define SOF_EXT_MAN_MAGIC_NUMBER	0x6e614d58
@@ -54,6 +55,11 @@ struct sof_ext_man_header {
 
 /* Now define extended manifest elements */
 
+/* Extended manifest elements types */
+enum sof_ext_man_elem_type {
+	SOF_EXT_MAN_ELEM_FW_VERSION		= 0,
+};
+
 /* extended manifest element header */
 struct sof_ext_man_elem_header {
 	uint32_t type;		/*< SOF_EXT_MAN_ELEM_ */
@@ -62,4 +68,12 @@ struct sof_ext_man_elem_header {
 	/* just after this header should be type dependent content */
 } __packed;
 
+/* FW version */
+struct sof_ext_man_fw_version {
+	struct sof_ext_man_elem_header hdr;
+	/* use sof_ipc struct because of code re-use */
+	struct sof_ipc_fw_version version;
+	uint32_t flags;
+} __packed;
+
 #endif /* __SOF_FIRMWARE_EXT_MANIFEST_H__ */
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index a2c2dc17e9ab..8b42613304a7 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -127,6 +127,19 @@ int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offset)
 }
 EXPORT_SYMBOL(snd_sof_fw_parse_ext_data);
 
+static int ext_man_get_fw_version(struct snd_sof_dev *sdev,
+				  const struct sof_ext_man_elem_header *hdr)
+{
+	const struct sof_ext_man_fw_version *v =
+		container_of(hdr, struct sof_ext_man_fw_version, hdr);
+
+	memcpy(&sdev->fw_ready.version, &v->version, sizeof(v->version));
+	sdev->fw_ready.flags = v->flags;
+
+	/* log ABI versions and check FW compatibility */
+	return snd_sof_ipc_valid(sdev);
+}
+
 static ssize_t snd_sof_ext_man_size(const struct firmware *fw)
 {
 	const struct sof_ext_man_header *head;
@@ -197,6 +210,9 @@ static int snd_sof_fw_ext_man_parse(struct snd_sof_dev *sdev,
 
 		/* process structure data */
 		switch (elem_hdr->type) {
+		case SOF_EXT_MAN_ELEM_FW_VERSION:
+			ret = ext_man_get_fw_version(sdev, elem_hdr);
+			break;
 		default:
 			dev_warn(sdev->dev, "warning: unknown sof_ext_man header type %d size 0x%X\n",
 				 elem_hdr->type, elem_hdr->size);
-- 
2.26.2

