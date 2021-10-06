Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 124A9423C4B
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 13:13:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68A9A1691;
	Wed,  6 Oct 2021 13:12:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68A9A1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633518800;
	bh=/ozXSSj+nYFc9krA/fAzoFQgYtAabUPNcPZUZ72hXUg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VgXXlco4yIRaUxLgDGPd5BPysF0BqnTxkoCyqJRuLthN6zjrFHoxuPS4AqP0zOvj1
	 moDDRJfqEIqrczh/GyO8JiMZW9zrdGKAaMNHwUzunoNJ//riv8zQEQzdp3fb1ee6Kq
	 J+B7bwPC7BG6Y2Go2EwdCK4p0OX45SaXEz7hBR2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44C79F80516;
	Wed,  6 Oct 2021 13:07:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0854BF8052D; Wed,  6 Oct 2021 13:07:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46A5FF804ED
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 13:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46A5FF804ED
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="223366459"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="223366459"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:07:00 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="439081050"
Received: from byurovit-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.39.239])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:06:58 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 08/19] ASoC: SOF: debug: Add SOF_DBG_DUMP_OPTIONAL flag for
 DSP dumping
Date: Wed,  6 Oct 2021 14:06:34 +0300
Message-Id: <20211006110645.26679-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006110645.26679-1-peter.ujfalusi@linux.intel.com>
References: <20211006110645.26679-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

The new SOF_DBG_DUMP_OPTIONAL flag can be used to mark a DSP dump that
should only be printed when the SOF_DBG_PRINT_ALL_DUMPS sof_core_debug
flag is set, otherwise it should be ignored and not printed.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/debug.c    | 7 ++++++-
 sound/soc/sof/sof-priv.h | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 9ed6728c2017..bcd381f495c0 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -824,11 +824,16 @@ EXPORT_SYMBOL_GPL(snd_sof_free_debug);
 
 void snd_sof_dsp_dbg_dump(struct snd_sof_dev *sdev, u32 flags)
 {
+	bool print_all = !!(sof_core_debug & SOF_DBG_PRINT_ALL_DUMPS);
+
+	if (flags & SOF_DBG_DUMP_OPTIONAL && !print_all)
+		return;
+
 	if (sof_ops(sdev)->dbg_dump && !sdev->dbg_dump_printed) {
 		dev_err(sdev->dev, "------------[ DSP dump start ]------------\n");
 		sof_ops(sdev)->dbg_dump(sdev, flags);
 		dev_err(sdev->dev, "------------[ DSP dump end ]------------\n");
-		if (!(sof_core_debug & SOF_DBG_PRINT_ALL_DUMPS))
+		if (!print_all)
 			sdev->dbg_dump_printed = true;
 	}
 }
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index bb6de1c1e3ec..d20ead47be1b 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -40,7 +40,7 @@
 #define SOF_DBG_DUMP_TEXT		BIT(2)
 #define SOF_DBG_DUMP_PCI		BIT(3)
 #define SOF_DBG_DUMP_FORCE_ERR_LEVEL	BIT(4) /* used to dump dsp status with error log level */
-
+#define SOF_DBG_DUMP_OPTIONAL		BIT(5) /* only dump if SOF_DBG_PRINT_ALL_DUMPS is set */
 
 /* global debug state set by SOF_DBG_ flags */
 extern int sof_core_debug;
-- 
2.33.0

