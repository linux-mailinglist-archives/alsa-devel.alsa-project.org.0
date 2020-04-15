Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 963F81AB29A
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:39:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DE301669;
	Wed, 15 Apr 2020 22:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DE301669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586983176;
	bh=mdW3O3vbW9Ngd7ViM5bA5gNK2T0DNNg3KJ8e7CwwfP0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z/1CEgQudq5T6ob+AOWlnawnjv3rnXDpzj7v3vENuyUrn9DmNf1K5/goTHxQuNPl0
	 p+zT9ygwV6HSKxx09vLuM4W49+ULts/QoDmrWCNiQ6Hv0a/fv7+ZIIISwndThvl9sa
	 wd8dvjTyRF7/VJ8uquo1BRn09hcvLaZq++symR9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C316F80321;
	Wed, 15 Apr 2020 22:29:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20DE3F8029B; Wed, 15 Apr 2020 22:29:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 432B0F802BC
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:29:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 432B0F802BC
IronPort-SDR: qV3Er59W6S+I2iQU1940XPZ8r+bE93R5nZlSyT8wQe5VVRiQbhsaE+PFGCX+JUwJwNtHMmJfaR
 Kc7fY1xim1mQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:29:11 -0700
IronPort-SDR: pMkQenf13uke2zT5uqVPQtJIvYpNIQDGeQEkbP+AE0hgxS3a0WA3mMrv+x0pYws08KHkoAEuUR
 okJltFH3nI8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288656316"
Received: from jplam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.82.197])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 13:29:09 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 15/24] ASoC: SOF: Add XRUN flags field to struct
 sof_ipc_buffer.
Date: Wed, 15 Apr 2020 15:28:07 -0500
Message-Id: <20200415202816.934-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
References: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Artur Kloniecki <arturx.kloniecki@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
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

From: Artur Kloniecki <arturx.kloniecki@linux.intel.com>

Currently if a component source buffer underruns or a component sink
buffer overruns the pipeline will enter an XRUN status and attempt
recovery. This is desired in most pipelines but some topologies need to
support use cases where we expect buffers to underrun or overrun.

Host ---> Proc----> Selector0 --> Buf0 ---- > DAI Playback
                      |
                      v
                     Buf1
                      |
                      v
Host <---------------Selector1 <----- Buf2 <----- Echo Ref DAI

In the example above we two host PCMs that can be independently
started/stopped thereby causing buf1 to either underrun or overrun
(and stop the pipelines). Buf1 should be permitted to underrun or overrun
without invoking pipeline XRUN logic and should over write oldest data
(for overrun) and readback 0s (for underrun).

2 flags have been added for use during buffer instantiation:
SOF_BUF_OVERRUN_PERMITTED and SOF_BUF_UNDERRUN_PERMITTED,
along with struct sof_ipc_buffer member fields: flags and reserved.
Flags field is supposed to hold the above-mentioned flags to allow
some control over XRUN behaviour.
Also added reserved field to the structure in case it comes in handy
some time in the future.

This is an incremental ABI change as the new fields are ignored by older
versions of the firmware.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Artur Kloniecki <arturx.kloniecki@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/topology.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
index 6a6b4791eaf6..08267d284edc 100644
--- a/include/sound/sof/topology.h
+++ b/include/sound/sof/topology.h
@@ -76,11 +76,23 @@ struct sof_ipc_comp {
 #define SOF_MEM_CAPS_CACHE			(1 << 6) /**< cacheable */
 #define SOF_MEM_CAPS_EXEC			(1 << 7) /**< executable */
 
+/*
+ * overrun will cause ring buffer overwrite, instead of XRUN.
+ */
+#define SOF_BUF_OVERRUN_PERMITTED	BIT(0)
+
+/*
+ * underrun will cause readback of 0s, instead of XRUN.
+ */
+#define SOF_BUF_UNDERRUN_PERMITTED	BIT(1)
+
 /* create new component buffer - SOF_IPC_TPLG_BUFFER_NEW */
 struct sof_ipc_buffer {
 	struct sof_ipc_comp comp;
 	uint32_t size;		/**< buffer size in bytes */
 	uint32_t caps;		/**< SOF_MEM_CAPS_ */
+	uint32_t flags;		/**< SOF_BUF_ flags defined above */
+	uint32_t reserved;	/**< reserved for future use */
 } __packed;
 
 /* generic component config data - must always be after struct sof_ipc_comp */
-- 
2.20.1

