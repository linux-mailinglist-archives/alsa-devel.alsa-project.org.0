Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FCC4E9D52
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 19:20:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBF0718F1;
	Mon, 28 Mar 2022 19:19:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBF0718F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648488003;
	bh=xNosrPZHUJjnGJG87FMN59AgoZRLfDjSyHsgNebB+1E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VBF47AkQ8o+NBGg9Uk/jLPRI8wfDspcIvMHaOsTH7VDXJeOdZ734fiK4pJyS3hJzz
	 0H0rYx48Kv/UQEE0GMRtNWhGpWh1Rv+3PYdzrMJ5iICYHCrGQpRARoXP507G4u6DOl
	 Z27bxZzbvDQPkTy2WHCBtek3MbfsNb8mCggOzSiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 993C3F80548;
	Mon, 28 Mar 2022 19:16:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED2D6F8052D; Mon, 28 Mar 2022 19:16:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A4DEF80121
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 19:16:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A4DEF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GF+K2JIk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648487784; x=1680023784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xNosrPZHUJjnGJG87FMN59AgoZRLfDjSyHsgNebB+1E=;
 b=GF+K2JIkGsuTcxTBhmOkl/o0bPRfqWUGH5NWBmgayDdZCjR7BVdL3wi9
 2IxBJPVk5pSraF/SJMgTDl+QHviQkbFgfiun33qE9uORtaRMcRB57hTGs
 n601Pk9tW8B1whKKvvyzJddViEsYKYqz9K4h0/WaUZvSM4szW+fBE09p+
 SBmro2KaiQXIpyaCVtEQfh57Dv5KPEE3RkFh8yIVzD5K/i26thtdAT9ZX
 Af7h2g0km0mRGlZfIRYzUujDbaBIR6ROsuvBdKqbZ7JOq0e2DMsyRtNtx
 s+aSQwN7+lqoU3UUfL1QUammAEpnYhMNZNJxXQ/vRsjFsuSuO7hw1Mq49 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="345494565"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="345494565"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:14:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="649141557"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2022 10:14:21 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 13/14] ASoC: Intel: avs: Prepare modules before bindings them
Date: Mon, 28 Mar 2022 19:24:09 +0200
Message-Id: <20220328172410.761309-14-cezary.rojewski@intel.com>
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

When binding modules to pins other than pin0, sometimes additional
preparations need to be made, depending on the module type.
Add function that prepares modules when necessary before binding them.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/path.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index abeb6921fcce..b5c0f89add4f 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -466,6 +466,37 @@ struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
 	return path;
 }
 
+static int avs_path_bind_prepare(struct avs_dev *adev,
+				 struct avs_path_binding *binding)
+{
+	const struct avs_audio_format *src_fmt, *sink_fmt;
+	struct avs_tplg_module *tsource = binding->source->template;
+	struct avs_path_module *source = binding->source;
+	int ret;
+
+	/*
+	 * only copier modules about to be bound
+	 * to output pin other than 0 need preparation
+	 */
+	if (!binding->source_pin)
+		return 0;
+	if (!guid_equal(&tsource->cfg_ext->type, &AVS_COPIER_MOD_UUID))
+		return 0;
+
+	src_fmt = tsource->in_fmt;
+	sink_fmt = binding->sink->template->in_fmt;
+
+	ret = avs_ipc_copier_set_sink_format(adev, source->module_id,
+					     source->instance_id, binding->source_pin,
+					     src_fmt, sink_fmt);
+	if (ret) {
+		dev_err(adev->dev, "config copier failed: %d\n", ret);
+		return AVS_IPC_RET(ret);
+	}
+
+	return 0;
+}
+
 int avs_path_bind(struct avs_path *path)
 {
 	struct avs_path_pipeline *ppl;
@@ -481,6 +512,10 @@ int avs_path_bind(struct avs_path *path)
 			source = binding->source;
 			sink = binding->sink;
 
+			ret = avs_path_bind_prepare(adev, binding);
+			if (ret < 0)
+				return ret;
+
 			ret = avs_ipc_bind(adev, source->module_id,
 					   source->instance_id, sink->module_id,
 					   sink->instance_id, binding->sink_pin,
-- 
2.25.1

