Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D161742F1
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Feb 2020 00:21:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0D3515E0;
	Sat, 29 Feb 2020 00:20:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0D3515E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582932100;
	bh=vk5rZxf7HNDPAN28w4rhp62K5Cuof4YtcdTApnnDfCM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=atAyRKnn3aHIT6R2x5DT8e4/5nh+m/Dc1qqwMQl+HVXJBdZ6Ytg7Lc3HyoRGBVCtZ
	 P/048rhAZGa4vls+vt8yHpAFfc40nKB3BOnuvqjuvii24m6t7Fi8Ms8cfjWkqKfRCw
	 aa8D/lKU7YM7PLAOSkyghRcDUdgSJriyt+PrFVEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BAAAF80292;
	Sat, 29 Feb 2020 00:19:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 002CAF80246; Sat, 29 Feb 2020 00:19:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D64CF8016F
 for <alsa-devel@alsa-project.org>; Sat, 29 Feb 2020 00:18:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D64CF8016F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2020 15:18:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,497,1574150400"; d="scan'208";a="272826569"
Received: from billycla-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.95.100])
 by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2020 15:18:56 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: SOF: add core id to sof_ipc_comp
Date: Fri, 28 Feb 2020 17:18:50 -0600
Message-Id: <20200228231850.9226-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228231850.9226-1-pierre-louis.bossart@linux.intel.com>
References: <20200228231850.9226-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Tomasz Lauda <tomasz.lauda@linux.intel.com>
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

From: Tomasz Lauda <tomasz.lauda@linux.intel.com>

Adds core id to sof_ipc_comp. The intention of this change
is to inform FW on which core that particular component
should run. Right now core id is only passed when pipeline
is created, which is not flexible enough and doesn't allow
for FW to handle this the right way.

Signed-off-by: Tomasz Lauda <tomasz.lauda@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/topology.h | 3 ++-
 include/uapi/sound/sof/abi.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
index 8e76178fedf0..402e0250c508 100644
--- a/include/sound/sof/topology.h
+++ b/include/sound/sof/topology.h
@@ -53,9 +53,10 @@ struct sof_ipc_comp {
 	uint32_t id;
 	enum sof_comp_type type;
 	uint32_t pipeline_id;
+	uint32_t core;
 
 	/* reserved for future use */
-	uint32_t reserved[2];
+	uint32_t reserved[1];
 } __packed;
 
 /*
diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index c0ef1643c753..5995b79d6df1 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -26,7 +26,7 @@
 
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
-#define SOF_ABI_MINOR 12
+#define SOF_ABI_MINOR 13
 #define SOF_ABI_PATCH 0
 
 /* SOF ABI version number. Format within 32bit word is MMmmmppp */
-- 
2.20.1

