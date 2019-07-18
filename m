Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDA56C53F
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 05:07:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 795521680;
	Thu, 18 Jul 2019 05:06:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 795521680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563419267;
	bh=2xtXUnTy/lzTH2kDfYBq0Yjq4PlQ+Op0WQ6hrsRk4bY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RhMXbJlD+6NTKW637wm0dv8hZI47SctGLKiwfrlNTp8qbPIWz/nHTJyZwN7yYKWx6
	 HWxstfJQghve6W8WF+nOpU9IkPbYKPDt0wdlaH7XtoYt1ui9H8Q4G6NTDSPjDPUr9R
	 jejSllR/kZeJ1C8QkSTBeTdKlwuDku8bBvAH86Vo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC4C7F802BC;
	Thu, 18 Jul 2019 05:06:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46C1FF80376; Thu, 18 Jul 2019 05:05:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4A3DF802BC
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 05:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4A3DF802BC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 20:05:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="158654230"
Received: from keyon-x299.sh.intel.com ([10.239.159.75])
 by orsmga007.jf.intel.com with ESMTP; 17 Jul 2019 20:05:46 -0700
From: Keyon Jie <yang.jie@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 18 Jul 2019 11:11:12 +0800
Message-Id: <20190718031113.25040-1-yang.jie@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: kai.vehmanen@linux.intel.com, Marcin Rajwa <marcin.rajwa@linux.intel.com>,
 marcin.rajwa@intel.com, Keyon Jie <yang.jie@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH v3 1/2] ASoC: SOF: add flag for position update
	ipc
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

From: Marcin Rajwa <marcin.rajwa@linux.intel.com>

In some cases, FW might need to use the host_period_bytes field to
synchronize the DMA copying (with host side) but the driver does not
need any position information returned over the IPC channel by the
firmware. The current IPC definition prevents this capability, so add
new field.

Signed-off-by: Marcin Rajwa <marcin.rajwa@linux.intel.com>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/sound/sof/stream.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/sof/stream.h b/include/sound/sof/stream.h
index 643f175cb479..06af4ecb2584 100644
--- a/include/sound/sof/stream.h
+++ b/include/sound/sof/stream.h
@@ -83,10 +83,10 @@ struct sof_ipc_stream_params {
 	uint16_t sample_valid_bytes;
 	uint16_t sample_container_bytes;
 
-	/* for notifying host period has completed - 0 means no period IRQ */
 	uint32_t host_period_bytes;
+	uint32_t no_position_ipc; /* 1 means no IPC for position upadte */
 
-	uint32_t reserved[2];
+	uint16_t reserved[3];
 	uint16_t chmap[SOF_IPC_MAX_CHANNELS];	/**< channel map - SOF_CHMAP_ */
 } __packed;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
