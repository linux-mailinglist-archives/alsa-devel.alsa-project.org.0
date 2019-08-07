Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 164FE84F6E
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 17:06:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98BFF839;
	Wed,  7 Aug 2019 17:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98BFF839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565190365;
	bh=uMOQsGMqrVQQmj6lNM2HfFUqjAUIjXjx7qVimwfEKaU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tyhvYMyx+0SM5H0hKU58AA51h3AleuK0pz0peNqu3O/kYcEzTuGt4hfCc34X5QwgB
	 6TrAutdlmeiQM/rGRv1/tNe7Y4liVUJzkCUfQNfkWhFASDvODkoP4UFRD4KStAqlEk
	 2+X8dLrF6f8PN+xgAPZ4No2grQRxs6TTHLBEaoLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7B61F80600;
	Wed,  7 Aug 2019 17:02:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C376F805F5; Wed,  7 Aug 2019 17:02:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1413AF804CB
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 17:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1413AF804CB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 08:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,357,1559545200"; d="scan'208";a="182305858"
Received: from knguye7-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.255.81.127])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Aug 2019 08:02:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  7 Aug 2019 10:02:00 -0500
Message-Id: <20190807150203.26359-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190807150203.26359-1-pierre-louis.bossart@linux.intel.com>
References: <20190807150203.26359-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 3/6] ASoC: SOF: Introduce
	snd_sof_dsp_get_window_offset
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

This will allow us to export the offset for a memory window.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ops.h      | 9 +++++++++
 sound/soc/sof/sof-priv.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index c820606f19a1..824d36fe59fd 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -128,6 +128,15 @@ static inline int snd_sof_dsp_get_mailbox_offset(struct snd_sof_dev *sdev)
 	return -ENOTSUPP;
 }
 
+static inline int snd_sof_dsp_get_window_offset(struct snd_sof_dev *sdev,
+						u32 id)
+{
+	if (sof_ops(sdev)->get_window_offset)
+		return sof_ops(sdev)->get_window_offset(sdev, id);
+
+	dev_err(sdev->dev, "error: %s not defined\n", __func__);
+	return -ENOTSUPP;
+}
 /* power management */
 static inline int snd_sof_dsp_resume(struct snd_sof_dev *sdev)
 {
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 3aefb8ec3ef9..de11f28bae3a 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -199,6 +199,8 @@ struct snd_sof_dsp_ops {
 	int (*get_bar_index)(struct snd_sof_dev *sdev,
 			     u32 type); /* optional */
 	int (*get_mailbox_offset)(struct snd_sof_dev *sdev);/* mandatory for common loader code */
+	int (*get_window_offset)(struct snd_sof_dev *sdev,
+				 u32 id);/* mandatory for common loader code */
 
 	/* DAI ops */
 	struct snd_soc_dai_driver *drv;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
