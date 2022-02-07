Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2D04ABF92
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 14:27:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78D5C17C5;
	Mon,  7 Feb 2022 14:26:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78D5C17C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644240452;
	bh=bx+biTR478P3DRyuWqj8CaWyVTGCXSLPf4Id2RyeGX8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CbX22byEsOHWihS7xlWAaCsznU6ztoenLWTrQcXnXfc3Oa7Q2eHk6w7mdGFIm8JlV
	 J+nKzjMjYjaZAUn1H9bVTEfd5gmMzgv3bqr4lWYF8Z0oWkOKu65pfpfdJn1o3765FC
	 52huCOCvyO8ZyErFmvxkOBUejbfOV9MIkECKMPi4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 948A6F80551;
	Mon,  7 Feb 2022 14:24:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86E10F80542; Mon,  7 Feb 2022 14:24:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A91BF8052E
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 14:24:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A91BF8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="A6EiAdJH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644240255; x=1675776255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bx+biTR478P3DRyuWqj8CaWyVTGCXSLPf4Id2RyeGX8=;
 b=A6EiAdJHiMrukPRRjHslCPNYgxuKMp+AQelScXc8/VUPKwD64HlTPCeh
 y0ItBAp0EyTAcSaP6lL8OYUUnBlAVXNgTE/kV2Rz+ayX8s8HLCrYxc2Gk
 JAVlvhaqldmVwWYuP240WKFsFfjBtAvgIp49Ocvj/pCv5I9TyVGz8NIGb
 N7SJib8RBqDwsF7X0CVTdJszpc6clgZKiYUkzt/42QYNPF0C6kj8LJQYh
 QdSU4oXX/pvExH2eljKnjMvbfvZByqXrg1IByYMBh0xKSbwYxA+VVgOVu
 A8E3XeW0LjUXGupcMlZgu+KQROZ2PvJvP+gUfPaKPfkuPgQStS2kJX9wk Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="312011575"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="312011575"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 05:24:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="677751332"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2022 05:24:11 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 08/13] ASoC: Intel: avs: Declare path and its components
Date: Mon,  7 Feb 2022 14:25:26 +0100
Message-Id: <20220207132532.3782412-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207132532.3782412-1-cezary.rojewski@intel.com>
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Declare representatives for all crucial elements which stream on ADSP
side is made of. That covers pipelines and modules subject which are
presented by struct avs_path_pipeline and avs_path_module respetively.
While struct avs_path_binding and struct avs_path do not represent any
object on firmware side directly, they are needed to help track the
interconnections and membership of every pipeline and module created.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/path.h | 60 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 sound/soc/intel/avs/path.h

diff --git a/sound/soc/intel/avs/path.h b/sound/soc/intel/avs/path.h
new file mode 100644
index 000000000000..ecfb687fdf36
--- /dev/null
+++ b/sound/soc/intel/avs/path.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2021 Intel Corporation. All rights reserved.
+ *
+ * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+ *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+ */
+
+#ifndef __SOUND_SOC_INTEL_AVS_PATH_H
+#define __SOUND_SOC_INTEL_AVS_PATH_H
+
+#include <linux/list.h>
+#include "avs.h"
+#include "topology.h"
+
+struct avs_path {
+	u32 dma_id;
+	struct list_head ppl_list;
+	u32 state;
+
+	struct avs_tplg_path *template;
+	struct avs_dev *owner;
+	/* device path management */
+	struct list_head node;
+};
+
+struct avs_path_pipeline {
+	u8 instance_id;
+	struct list_head mod_list;
+	struct list_head binding_list;
+
+	struct avs_tplg_pipeline *template;
+	struct avs_path *owner;
+	/* path pipelines management */
+	struct list_head node;
+};
+
+struct avs_path_module {
+	u16 module_id;
+	u16 instance_id;
+
+	struct avs_tplg_module *template;
+	struct avs_path_pipeline *owner;
+	/* pipeline modules management */
+	struct list_head node;
+};
+
+struct avs_path_binding {
+	struct avs_path_module *source;
+	u8 source_pin;
+	struct avs_path_module *sink;
+	u8 sink_pin;
+
+	struct avs_tplg_binding *template;
+	struct avs_path_pipeline *owner;
+	/* pipeline bindings management */
+	struct list_head node;
+};
+
+#endif
-- 
2.25.1

