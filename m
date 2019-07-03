Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F5E5E764
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 17:07:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B72D16AE;
	Wed,  3 Jul 2019 17:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B72D16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562166424;
	bh=JofTWrrq6zd3ivqJ5PjjgGYpbqHWw1ExiX2UDsaB88E=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PFT+QEiWRof9vJTc56W57iPmdR403cPtQi5LjZ4BlBnk+YV9uj8ZWFwqZ9Auu0BFm
	 /NNOZipRK/BaKb/SxCsMgkscDjJT9mIeEHvdfSTFq/69ci/AjCxtXgbpWROEvDKdRG
	 GQaZIsyf0e2RQCsjQAPqcXyFRUBcF/myKclFgBNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9707F800F2;
	Wed,  3 Jul 2019 17:05:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03A45F800E8; Wed,  3 Jul 2019 17:05:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D5DFF800E8
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 17:05:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D5DFF800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jul 2019 08:05:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,446,1557212400"; d="scan'208";a="172161460"
Received: from keyon-x299.sh.intel.com ([10.239.159.75])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Jul 2019 08:05:12 -0700
From: Keyon Jie <yang.jie@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  3 Jul 2019 23:10:22 +0800
Message-Id: <20190703151023.30313-1-yang.jie@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Keyon Jie <yang.jie@linux.intel.com>, ranjani.sridharan@linux.intel.com,
 Marcin Rajwa <marcin.rajwa@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH v2 1/2] ASoC: SOF: add flag for position update
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

In some cases, FW might need use the host_period_bytes even no position
update ipc reqiured from driver, here add another flag for position update,
and preserve host_period_bytes for FW to use.

This might require corresponding FW change and ABI alignment.

Signed-off-by: Marcin Rajwa <marcin.rajwa@linux.intel.com>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
---
 include/sound/sof/stream.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/sof/stream.h b/include/sound/sof/stream.h
index 643f175cb479..44acfa62fa69 100644
--- a/include/sound/sof/stream.h
+++ b/include/sound/sof/stream.h
@@ -83,10 +83,10 @@ struct sof_ipc_stream_params {
 	uint16_t sample_valid_bytes;
 	uint16_t sample_container_bytes;
 
-	/* for notifying host period has completed - 0 means no period IRQ */
 	uint32_t host_period_bytes;
+	uint16_t no_period_irq; /* 1 means period IRQ mode OFF */
 
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
