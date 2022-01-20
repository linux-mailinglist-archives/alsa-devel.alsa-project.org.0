Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF604956A4
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 00:17:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D6592DE9;
	Fri, 21 Jan 2022 00:16:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D6592DE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642720653;
	bh=IXR2tP+xX2UU3+lsa7DI0Rkhk6v9h0hXuyvorLrDifA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NhLMVKDH4efGSDi9lDhfJf90wJrlVnyT+8GpAm7YpqYx0pxZMKMHmCLsio8kJynjV
	 NA3UNZMiaJoALc0qQ2cwMVCI4/3TP7DdWZdQcM6gDF/roqkti3SW5dE17HNDnuA7Ce
	 gw4JIXFFymI6mkarOjFcrRJTYXl8Ayb748IfNEAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1E31F80515;
	Fri, 21 Jan 2022 00:15:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2C6FF800F2; Fri, 21 Jan 2022 00:15:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABAF9F8012E
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 00:15:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABAF9F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Z9vF8pr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642720549; x=1674256549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IXR2tP+xX2UU3+lsa7DI0Rkhk6v9h0hXuyvorLrDifA=;
 b=Z9vF8pr3yU9KkO3T6Bhs1CHdzBzp7J0opGxNbYDNzWQIU0SopvtjE3pm
 /TxdU0Aa1gp3c5iJxUJ9Js7rcWv/vgOfxTkuQdoNiSXNl5S/0cMLMmD3t
 3VKAgQEFqZn3Nqqg9W7Fa30MCNnIK12MdzJNGfALuKW5WIO/bVmGoWAGK
 PECmXmHn/BvjQcXvarOwMFX5yEC7HhAkiX7+nrMNNWsFGmcytZ7B4mE4f
 WBdFWc898jqskmQ/WrysUjz9yP3tFkb/XWlJqNmIa6QieKyHl4N5sMYjZ
 khJ/iuhyBdIyt9fMbnz6QM0qgljNIuF8Wrh4GreLOycYwQAxK8rI7b8O5 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245460645"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="245460645"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:15:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="672741385"
Received: from sthambit-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.44])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:15:40 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ASoC: SOF: add _D3_PERSISTENT flag to fw_ready message
Date: Thu, 20 Jan 2022 17:15:28 -0600
Message-Id: <20220120231532.196926-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120231532.196926-1-pierre-louis.bossart@linux.intel.com>
References: <20220120231532.196926-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Keyon Jie <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Keyon Jie <yang.jie@linux.intel.com>

Add a bit definition to the fw_ready message, to denote if the FW
supports the IMR (Isolated Memory Region) restoring feature.

If the bit is set, the driver can skip downloading the firmware again
during system resume or runtime resume.

Bump the ABI version to 3.19 to make it aligned with FW side.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/info.h     | 1 +
 include/uapi/sound/sof/abi.h | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof/info.h b/include/sound/sof/info.h
index 0b7101aef596..65e86e4e9fd8 100644
--- a/include/sound/sof/info.h
+++ b/include/sound/sof/info.h
@@ -25,6 +25,7 @@
 #define SOF_IPC_INFO_LOCKS		BIT(1)
 #define SOF_IPC_INFO_LOCKSV		BIT(2)
 #define SOF_IPC_INFO_GDB		BIT(3)
+#define SOF_IPC_INFO_D3_PERSISTENT	BIT(4)
 
 /* extended data types that can be appended onto end of sof_ipc_fw_ready */
 enum sof_ipc_ext_data {
diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index fe2cfae94b45..f4232d289a22 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -26,7 +26,7 @@
 
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
-#define SOF_ABI_MINOR 18
+#define SOF_ABI_MINOR 19
 #define SOF_ABI_PATCH 0
 
 /* SOF ABI version number. Format within 32bit word is MMmmmppp */
-- 
2.25.1

