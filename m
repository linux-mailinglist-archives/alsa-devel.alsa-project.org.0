Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5416870215
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 16:19:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E62D217FE;
	Mon, 22 Jul 2019 16:18:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E62D217FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563805163;
	bh=FMzFGZzOL3vIZFJYcGyPDRWm4EPHvXFUfHzUG5uvsbk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iUvXKtrdTHKT9P0A9Il1oaGF7bCzPXyxrfeW2yu2y0xeRu/DNaq4N9d8/euR5lpKa
	 UGBBUoJiXG0V7Z99PZ/5hQyJ4VSJbmfpP4fWtIuGhBoDgXUVACvkPWOcPh37QZaxyn
	 MDtOQ85b4cbpSuZXnp+CcPMAsfubWfFtlECsocxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FF83F8048E;
	Mon, 22 Jul 2019 16:14:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E21FF804CF; Mon, 22 Jul 2019 16:14:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6C7AF80482
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 16:14:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6C7AF80482
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 07:14:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="192733279"
Received: from agalla-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.103.46])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2019 07:14:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 22 Jul 2019 09:13:47 -0500
Message-Id: <20190722141402.7194-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
References: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 06/21] ASoC: SOF: Introduce
	snd_sof_dsp_get_bar_index ops
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

From: Daniel Baluta <daniel.baluta@nxp.com>

FW encapsulates information about section types (e.g DRAM, IRAM)
inside module block header. This information can be used in order
to correctly load the section to the appropriate place in memory.

SOF Linux driver needs to know for each platform how to map the
section type with the corresponding memory BAR. So, this patch
introduces get_bar_index, a new operation inside snd_sof_dsp_ops.

Intel platforms, usually load all the section in a contiguous memory
area (usually denoted by sdev->mmio_bar) so things are relatively
simple there. Anyhow, on i.MX8 IRAM and DRAM for example are mapped
to distinct BARs.

By default, if no get_bar function is provided the core implementation
will always return sdev->mmio_bar so that there will be no need for
a change to existing Intel code.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ops.h      | 19 +++++++++++++++++++
 sound/soc/sof/sof-priv.h |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index b9bdf45889da..ee87053953ff 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -100,6 +100,25 @@ static inline int snd_sof_dsp_post_fw_run(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+/* misc */
+
+/**
+ * snd_sof_dsp_get_bar_index - Maps a section type with a BAR index
+ *
+ * @sdev: sof device
+ * @type: section type as described by snd_sof_fw_blk_type
+ *
+ * Returns the corresponding BAR index (a positive integer) or -EINVAL
+ * in case there is no mapping
+ */
+static inline int snd_sof_dsp_get_bar_index(struct snd_sof_dev *sdev, u32 type)
+{
+	if (sof_ops(sdev)->get_bar_index)
+		return sof_ops(sdev)->get_bar_index(sdev, type);
+
+	return sdev->mmio_bar;
+}
+
 /* power management */
 static inline int snd_sof_dsp_resume(struct snd_sof_dev *sdev)
 {
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index fa5cb7d2a660..a6ec9115a9fb 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -196,6 +196,9 @@ struct snd_sof_dsp_ops {
 	int (*trace_trigger)(struct snd_sof_dev *sdev,
 			     int cmd); /* optional */
 
+	/* misc */
+	int (*get_bar_index)(struct snd_sof_dev *sdev,
+			     u32 type); /* optional */
 	/* DAI ops */
 	struct snd_soc_dai_driver *drv;
 	int num_drv;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
