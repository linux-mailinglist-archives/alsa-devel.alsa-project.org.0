Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9D54E9D53
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 19:20:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C7AC18E8;
	Mon, 28 Mar 2022 19:19:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C7AC18E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648488030;
	bh=6t4BVgiNwXM6MOf7z76xDBWIimSZbQvEhznZmbs2Hfo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qqb5LqIcdSyrNQzDObmWm5tMOxt1vHzcmqt6u7UIaqPUAxW7WeydKNgHlMX1qOHtF
	 cjwk++oTWh0Wip8Gp3gI4CMqQxa6hkBzYhKKPrdUK/AmbkLTOLGQhm+oIbY3QgAwox
	 h2dnrb5W5O6cMH6fJAiOMTE6byt3L0gKXksljtjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CCDAF80564;
	Mon, 28 Mar 2022 19:16:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60AF6F8052D; Mon, 28 Mar 2022 19:16:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC63EF80517
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 19:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC63EF80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Kce6i7nK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648487782; x=1680023782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6t4BVgiNwXM6MOf7z76xDBWIimSZbQvEhznZmbs2Hfo=;
 b=Kce6i7nK0NiWnbdziuBjw8FSvKLcPNJcgcUSRrOPV110ZreOBEM3/a9h
 pQ9Tf6b9Ckn8epPpVfh8tUKHbj6knn9snts32Sxcgk8iuwZ+A1uUW0bu3
 W0/xEtx60VXpPkWMxSmZpyxgy8u/FvIyMHjKp/USxoxhAQ7H0hM9YbdiA
 Oc6xFXl37Q1dMbUc+mrqG6d4qC0rMLwTiv9P3dvLOI7WXy8lgF7aeBNTE
 /jaASw4xooSiZ5X3mIq2kyI4yAUy6DsDTFtUuWrUoboXGTI4NcZItxJ89
 LL/YbcmG6UXpJpuR3z4xMUyho3P74ajcsaRj5fRdirDdZcbqEPGAUBKQa w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="345494532"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="345494532"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:14:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="649141527"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2022 10:14:10 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 09/14] ASoC: Intel: avs: Declare path and its components
Date: Mon, 28 Mar 2022 19:24:05 +0200
Message-Id: <20220328172410.761309-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328172410.761309-1-cezary.rojewski@intel.com>
References: <20220328172410.761309-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
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
presented by struct avs_path_pipeline and avs_path_module respectively.
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

