Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B081AB29B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:40:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C48B167C;
	Wed, 15 Apr 2020 22:39:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C48B167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586983216;
	bh=qzWXwqC8Votutm/HTTozwrA7dWD20ya0bIuJk8O3XpM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eseCyKDKip26Hi7sb4iW8d81i76DLCAE+638ASkpIAtd1BItY7HB+4E3Adj6DX+t0
	 r9CxX43Gi2kaRfPHdqjTIMo1tbF1wNBuWIStIPWp0bWIW8rzbWHsuOtY3syiz3cp3b
	 EfwLfmb/996d6hzAbd8gl0iSGxbZ8PL/hUwXQ1rU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AD89F8032A;
	Wed, 15 Apr 2020 22:29:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAB3FF802EC; Wed, 15 Apr 2020 22:29:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D846F8029A
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:29:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D846F8029A
IronPort-SDR: hPCX33bGLCRhVKBbhPcVlu3qDaHBYRKqEpSKOQwru67W0rsu0AJ3j5QxKA+YPILDm8lvWA948F
 rgq8i/IjxvZQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:29:16 -0700
IronPort-SDR: +HPEYfK6btPyhgeikKO5+7HSK5I9G2ydfUT7gUyt20SRT1IZwKKJYGMBKihjwGWYZ3i50ZafHQ
 fgm6Hm5KgXPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288656331"
Received: from jplam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.82.197])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 13:29:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 18/24] ASoC: SOF: Intel: Rename deprecated DMIC IPC struct
 field
Date: Wed, 15 Apr 2020 15:28:10 -0500
Message-Id: <20200415202816.934-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
References: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>,
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

From: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>

This patch restores the field name to fifo_bits_b since the
legacy firmware compatibility code (for firmware ABI 3.0.0 or earlier)
sets it in sof_link_dmic_load() function in topology.c. Setting of
reserved_2 didn't look appropriate.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/dai-intel.h |  2 +-
 sound/soc/sof/topology.c      | 10 ++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/sound/sof/dai-intel.h b/include/sound/sof/dai-intel.h
index 59fa73f3e34d..4dcea5aed878 100644
--- a/include/sound/sof/dai-intel.h
+++ b/include/sound/sof/dai-intel.h
@@ -173,7 +173,7 @@ struct sof_ipc_dai_dmic_params {
 	uint32_t fifo_fs;	/**< FIFO sample rate in Hz (8000..96000) */
 	uint32_t reserved_1;	/**< Reserved */
 	uint16_t fifo_bits;	/**< FIFO word length (16 or 32) */
-	uint16_t reserved_2;	/**< Reserved */
+	uint16_t fifo_bits_b;	/**< Deprecated since firmware ABI 3.0.1 */
 
 	uint16_t duty_min;	/**< Min. mic clock duty cycle in % (20..80) */
 	uint16_t duty_max;	/**< Max. mic clock duty cycle in % (min..80) */
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 602406ff8e4c..3670b4221ba6 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2957,10 +2957,12 @@ static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 			config->dmic.pdm[j].skew);
 	}
 
-	if (SOF_ABI_VER(v->major, v->minor, v->micro) < SOF_ABI_VER(3, 0, 1)) {
-		/* this takes care of backwards compatible handling of fifo_bits_b */
-		config->dmic.reserved_2 = config->dmic.fifo_bits;
-	}
+	/*
+	 * this takes care of backwards compatible handling of fifo_bits_b.
+	 * It is deprecated since firmware ABI version 3.0.1.
+	 */
+	if (SOF_ABI_VER(v->major, v->minor, v->micro) < SOF_ABI_VER(3, 0, 1))
+		config->dmic.fifo_bits_b = config->dmic.fifo_bits;
 
 	/* send message to DSP */
 	ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, size,
-- 
2.20.1

