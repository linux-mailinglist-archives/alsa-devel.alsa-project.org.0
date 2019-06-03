Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 645A9334DC
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 18:24:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0452B84D;
	Mon,  3 Jun 2019 18:24:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0452B84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559579092;
	bh=S3miFfXATuMOPaBIwloV5m/jrDn/NbXS/bOou1Wh3D8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ngw8Ir35TYfaBnEMYemLPXOzZEwBTrPn8T7Mg3ptprKPlLe1tKGnw3v09MgGP3/sX
	 e/GV2/oeJKQWbvHIxMF/GwPSHeTka2YCHPzNlryKEZyRAdSCkv/ONLzPyJMKA09YZF
	 f/3C6H3god7wAAkvZO0QNZ8C+/G1F2feN8BbyzOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A57C8F89749;
	Mon,  3 Jun 2019 18:18:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C295DF89730; Mon,  3 Jun 2019 18:18:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9ACEBF8972E
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 18:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ACEBF8972E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 09:18:32 -0700
X-ExtLoop1: 1
Received: from chiannaa-mobl6.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.97.98])
 by orsmga008.jf.intel.com with ESMTP; 03 Jun 2019 09:18:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  3 Jun 2019 11:18:19 -0500
Message-Id: <20190603161821.7486-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190603161821.7486-1-pierre-louis.bossart@linux.intel.com>
References: <20190603161821.7486-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 7/9] ASoC: SOF: ipc: Introduce
	SOF_IPC_GLB_TEST_MSG IPC command
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add a new class of IPC command along with the first
test type, IPC_FLOOD, which will be used for flooding the DSP
with IPCs.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/header.h | 6 +++++-
 sound/soc/sof/ipc.c        | 9 +++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index ab5862d80afe..12867bbd4372 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -49,6 +49,7 @@
 #define SOF_IPC_GLB_DAI_MSG			SOF_GLB_TYPE(0x8U)
 #define SOF_IPC_GLB_TRACE_MSG			SOF_GLB_TYPE(0x9U)
 #define SOF_IPC_GLB_GDB_DEBUG                   SOF_GLB_TYPE(0xAU)
+#define SOF_IPC_GLB_TEST_MSG			SOF_GLB_TYPE(0xBU)
 
 /*
  * DSP Command Message Types
@@ -99,11 +100,14 @@
 #define SOF_IPC_STREAM_VORBIS_PARAMS		SOF_CMD_TYPE(0x010)
 #define SOF_IPC_STREAM_VORBIS_FREE		SOF_CMD_TYPE(0x011)
 
-/* trace and debug */
+/* trace */
 #define SOF_IPC_TRACE_DMA_PARAMS		SOF_CMD_TYPE(0x001)
 #define SOF_IPC_TRACE_DMA_POSITION		SOF_CMD_TYPE(0x002)
 #define SOF_IPC_TRACE_DMA_PARAMS_EXT		SOF_CMD_TYPE(0x003)
 
+/* debug */
+#define SOF_IPC_TEST_IPC_FLOOD                  SOF_CMD_TYPE(0x001)
+
 /* Get message component id */
 #define SOF_IPC_MESSAGE_ID(x)			((x) & 0xffff)
 
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 996ac19986b7..f3eb46bc808b 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -175,6 +175,15 @@ static void ipc_log_header(struct device *dev, u8 *text, u32 cmd)
 		break;
 	case SOF_IPC_GLB_TRACE_MSG:
 		str = "GLB_TRACE_MSG"; break;
+	case SOF_IPC_GLB_TEST_MSG:
+		str = "GLB_TEST_MSG";
+		switch (type) {
+		case SOF_IPC_TEST_IPC_FLOOD:
+			str2 = "IPC_FLOOD"; break;
+		default:
+			str2 = "unknown type"; break;
+		}
+		break;
 	default:
 		str = "unknown GLB command"; break;
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
