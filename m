Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E90602B6F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:13:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 666538988;
	Tue, 18 Oct 2022 14:13:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 666538988
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095233;
	bh=kQJ2AfBz113zvjUHzXsFb0AJBsjNzMxAJaogHFuPanU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O1LOT+AQYL5ALaZdQONU9pM5BJdDPd6dRmUP4KMfqM6zG3pFmHygPYeYn2IyH5ghe
	 CWnbg5z9kM9kX8tcZXB4uFOgUM8V+k6BYpj1t+ocJGcqxDDM5E/xXwxiYWnZjruk0W
	 CWHoc1JWc/VY4nLUgHccnyqhU16d7nFU+p4D+EH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4136FF805C8;
	Tue, 18 Oct 2022 14:09:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5953F805AC; Tue, 18 Oct 2022 14:09:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 511EEF8057C
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:09:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 511EEF8057C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KdEkEHlO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666094972; x=1697630972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kQJ2AfBz113zvjUHzXsFb0AJBsjNzMxAJaogHFuPanU=;
 b=KdEkEHlOHBlfTD+WD7rJ8sD3v++fYBmq7tU+bASEZZ21FuRXRK8PhqUp
 ITK76Z0lGa1OMrDW9YCsARvqKA6l1G3WmC78/TvEhSgudc0VFNGsj0E5i
 AOxCZz8ti71zGVBHBtsotsMoTqiXfHfw7FPa7zkfrvDYp4+AfZUOxAcko
 x2MTS7Ga2/hUwclq6X6ZHzuM4gPcs1iNHL9PDeln3+xY0UkTzwdGLB6cc
 FSJ6QhILcKi1BQsQFmUSWIQsRDdv3XNN19JmVmsVZgjpDKHiw2JIo0i6u
 S2C41n9ZSQkZ6G9SYyaWbPD90Bw+mvPro5u56FB/8Oz6jGK6V2vAlmxlO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="293452988"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="293452988"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:29 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579758000"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="579758000"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:27 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 13/19] ASoC: SOF: ipc4: Define platform dependent library
 loading callback
Date: Tue, 18 Oct 2022 15:09:10 +0300
Message-Id: <20221018120916.19820-14-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: chao.song@intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

Platforms where external libraries can be supported should set the
load_library callback to implement this functionality.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc4-priv.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index ecfa9f701ef1..7e7115ada2a2 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -66,6 +66,8 @@ struct sof_ipc4_fw_library {
  * @mtrace_log_bytes: log bytes as reported by the firmware via fw_config reply
  * @max_libs_count: Maximum number of libraries support by the FW including the
  *		    base firmware
+ *
+ * @load_library: Callback function for platform dependent library loading
  */
 struct sof_ipc4_fw_data {
 	u32 manifest_fw_hdr_offset;
@@ -74,6 +76,9 @@ struct sof_ipc4_fw_data {
 	enum sof_ipc4_mtrace_type mtrace_type;
 	u32 mtrace_log_bytes;
 	u32 max_libs_count;
+
+	int (*load_library)(struct snd_sof_dev *sdev,
+			    struct sof_ipc4_fw_library *fw_lib, bool reload);
 };
 
 extern const struct sof_ipc_fw_loader_ops ipc4_loader_ops;
-- 
2.38.0

