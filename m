Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 557A55441FB
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:33:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF03A2084;
	Thu,  9 Jun 2022 05:32:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF03A2084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745616;
	bh=n0RQiEUXNvDkoRxkZG3vqRRBF0CrqXHorh2bT2wBysc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EAxji3UHrGdSNNe3+g3ciireP5C1cXd3gbM6Ek+M4nLaqDjNVavXfCBHrD+9Esmv0
	 Y8bLy+GSTTZFX9UyIvByP+RB1m/5xlBFcclshv59viO3nZ2yjpyIIcNSt8ZujHfxjD
	 yjvw1uvXCbC/U2TNCrMCF2LsRYAwr1+1FHBo+4ic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3DBAF805D9;
	Thu,  9 Jun 2022 05:27:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DF21F805C2; Thu,  9 Jun 2022 05:27:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1022BF80557
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1022BF80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Y6ljQZnW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745244; x=1686281244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n0RQiEUXNvDkoRxkZG3vqRRBF0CrqXHorh2bT2wBysc=;
 b=Y6ljQZnW/gnA++gydZAsSN7CbUQWIJwtVA8uVL/zBddzqR8ndg26Nkp6
 K9TySe6+VQQvhmSnfIRF0QjO+DQ9w1opQKu9YOd2e0oFrPNGqSqPzePVN
 sGhUeobrSdPAOIztoRurRBD6Pq2ya+BHAgKgN/glOqU4tfwGcEMS5PB8Y
 b9im+DP21RKSC6IzSji12h0IJBq9HCY3Cn+ABulfDyTbhYKHNQ4btF55z
 BBrwn6M0rClg9KaRy0m5M2+XQuN7YYYa03bCN3wmESqa/mC6B8npgfgvW
 sihWEmrQIPkL7O+ZYRgRIw4VvmFriuWhnZLAngFDJVjhjyrDMzqKk0cg3 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219570"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219570"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260254"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:00 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 19/23] ASoC: SOF: Add two new structures for topology manifest
 data
Date: Wed,  8 Jun 2022 20:26:39 -0700
Message-Id: <20220609032643.916882-20-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>
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

Add a couple of structures for parsing and saving the topology manifest
data.

Co-developed-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/uapi/sound/sof/abi.h    |  2 ++
 include/uapi/sound/sof/header.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index 0e7dccdc25fd..c88f467374ae 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -24,6 +24,8 @@
 #ifndef __INCLUDE_UAPI_SOUND_SOF_ABI_H__
 #define __INCLUDE_UAPI_SOUND_SOF_ABI_H__
 
+#include <linux/types.h>
+
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
 #define SOF_ABI_MINOR 21
diff --git a/include/uapi/sound/sof/header.h b/include/uapi/sound/sof/header.h
index 5f4518e7a972..f125f7772ee7 100644
--- a/include/uapi/sound/sof/header.h
+++ b/include/uapi/sound/sof/header.h
@@ -26,4 +26,34 @@ struct sof_abi_hdr {
 	__u32 data[0];		/**< Component data - opaque to core */
 }  __packed;
 
+#define SOF_MANIFEST_DATA_TYPE_NHLT 1
+
+/**
+ * struct sof_manifest_tlv - SOF manifest TLV data
+ * @type: type of data
+ * @size: data size (not including the size of this struct)
+ * @data: payload data
+ */
+struct sof_manifest_tlv {
+	__le32 type;
+	__le32 size;
+	__u8 data[];
+};
+
+/**
+ * struct sof_manifest - SOF topology manifest
+ * @abi_major: Major ABI version
+ * @abi_minor: Minor ABI version
+ * @abi_patch: ABI patch
+ * @count: count of tlv items
+ * @items: consecutive variable size tlv items
+ */
+struct sof_manifest {
+	__le16 abi_major;
+	__le16 abi_minor;
+	__le16 abi_patch;
+	__le16 count;
+	struct sof_manifest_tlv items[];
+};
+
 #endif
-- 
2.25.1

