Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED178545F58
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 10:37:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AF931FB5;
	Fri, 10 Jun 2022 10:36:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AF931FB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654850247;
	bh=Ac9RcOALAJHuuz0xIu5r+lShdI1sr34SCBDJUiNzuZI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qkqay8o2obZ+sVNGC0rq3u/M2Iu1JGHOcnnU1KZ852MuG12SEmgx72h9lGRkBwtzr
	 HGlGJr2SupWMkAVDH0jbChoGU9BqwW/2JRtq6mxrr2rxYfHy/QHpDzrSO9vmztOBZQ
	 LV7Qnu5sdCeXS/WoMh1nYXJAt0yEARXfoi3kgyXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D738F80536;
	Fri, 10 Jun 2022 10:35:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CC5DF8053A; Fri, 10 Jun 2022 10:35:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A31A9F804DA
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 10:35:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A31A9F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dmSIMO+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654850126; x=1686386126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ac9RcOALAJHuuz0xIu5r+lShdI1sr34SCBDJUiNzuZI=;
 b=dmSIMO+lK18kYejPYk8Sp+YCDY5/m3DBKnTGOS/xpwkbSUanCoNCVycj
 V3uVXFB37hl8Sj8egeZG+lMYu56wc+mdiv3Kn4c0fBJGzbaa5DP9zXDl7
 rJP9L6E5sNfqg2VupGY48S8KHN9tvolu6YnWEd/6bCEQih4v6FPqrfB6r
 2KWXYsB9Xi2VanehG1s5hMjyHjnypl/G0ZvRgxkET3rm0i/L7v9Hdu8IC
 nY13wI9jTlmmJwkrUvEY37GVZ2JpKfRChrqJ3LhussV2N60mxqRdwZm+r
 BLfqTggl9CIqQlO1yKzO2zcQhszgjEa20P0/Wfag4vTVUhSoZgVN3jng5 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="302936604"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="302936604"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:35:20 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="638020836"
Received: from nuribebu-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.215.108])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:35:18 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 2/6] ASoC: SOF: sof_ipc_pm_ops: Add support for DSP core power
 management
Date: Fri, 10 Jun 2022 11:35:45 +0300
Message-Id: <20220610083549.16773-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610083549.16773-1-peter.ujfalusi@linux.intel.com>
References: <20220610083549.16773-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
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

Add a new ops for handling DSP core power state which can be used to tell
the DSP to turn on/off a core (or to inform it that a core is going to be
turned on/off if the core is host managed).

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 58bcb8d6f72b..0544eb6a2322 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -378,10 +378,12 @@ struct sof_ipc_fw_tracing_ops {
  * struct sof_ipc_pm_ops - IPC-specific PM ops
  * @ctx_save:		Optional function pointer for context save
  * @ctx_restore:	Optional function pointer for context restore
+ * @set_core_state:	Optional function pointer for turning on/off a DSP core
  */
 struct sof_ipc_pm_ops {
 	int (*ctx_save)(struct snd_sof_dev *sdev);
 	int (*ctx_restore)(struct snd_sof_dev *sdev);
+	int (*set_core_state)(struct snd_sof_dev *sdev, int core_idx, bool on);
 };
 
 /**
-- 
2.36.1

