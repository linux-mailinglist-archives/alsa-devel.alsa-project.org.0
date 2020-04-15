Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F401AB28F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:36:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57A051666;
	Wed, 15 Apr 2020 22:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57A051666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586982986;
	bh=vmuOPC07jYbCcQw29aYvnqYayyZReJQub/EzSMyLqk0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DlkaHEtgUtg2uLiMFd48CeKJuyOGthKH/yu574hiGPcgCsVZ/3NQSz9YrK82AgNM9
	 qZqfR2A5EflDDYmnler1Tql0JkIkqXtO5+QGpElmxgrDbkH6f1/gUJumj5Dth2DGOi
	 ETh9XPII4SWd5povs8rvtoq9baGlrYgCq4Czn1I4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C54A6F802BD;
	Wed, 15 Apr 2020 22:29:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A15C8F802A1; Wed, 15 Apr 2020 22:29:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8972AF8028A
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:29:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8972AF8028A
IronPort-SDR: 7nBPpGOJ8vIEDqC/iQt96rV8tQxwUPBR6gTqA5Svvaa8LCl7DGRGNuo55KMzs5wIn4D7Syrgv0
 fHdbRik9OOOg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:29:03 -0700
IronPort-SDR: lEoizTaAsRrqtBxxH5inyl1GhdRT84I7U1i8rETWIfzYKrMz1l2fwtoZZQtSro6d3Eh0P45PTf
 XcUjPaOp68qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288656284"
Received: from jplam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.82.197])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 13:29:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/24] ASoC: SOF: add probe support extend data
Date: Wed, 15 Apr 2020 15:28:01 -0500
Message-Id: <20200415202816.934-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
References: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pan Xiuli <xiuli.pan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
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

From: Pan Xiuli <xiuli.pan@linux.intel.com>

Share how many injection probe DMAs and how many probe points
driver can request from FW.
injection_dmas_max 0 means injection is not supported
probe_points_max 0 means whole probes subsystem in FW is not enabled
and not compiled in.

ABI version change to 3.14.0

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/info.h     | 12 ++++++++++++
 include/uapi/sound/sof/abi.h |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof/info.h b/include/sound/sof/info.h
index 438a11fcf272..68e92b550439 100644
--- a/include/sound/sof/info.h
+++ b/include/sound/sof/info.h
@@ -31,6 +31,7 @@ enum sof_ipc_ext_data {
 	SOF_IPC_EXT_UNUSED		= 0,
 	SOF_IPC_EXT_WINDOW		= 1,
 	SOF_IPC_EXT_CC_INFO		= 2,
+	SOF_IPC_EXT_PROBE_INFO		= 3,
 };
 
 /* FW version - SOF_IPC_GLB_VERSION */
@@ -114,4 +115,15 @@ struct sof_ipc_cc_version {
 	char desc[]; /* null terminated compiler description */
 } __packed;
 
+/* extended data: Probe setup */
+struct sof_ipc_probe_support {
+	struct sof_ipc_ext_data_hdr ext_hdr;
+
+	uint32_t probe_points_max;
+	uint32_t injection_dmas_max;
+
+	/* reserved for future use */
+	uint32_t reserved[2];
+} __packed;
+
 #endif
diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index 5995b79d6df1..e0fa2939d49c 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -26,7 +26,7 @@
 
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
-#define SOF_ABI_MINOR 13
+#define SOF_ABI_MINOR 14
 #define SOF_ABI_PATCH 0
 
 /* SOF ABI version number. Format within 32bit word is MMmmmppp */
-- 
2.20.1

