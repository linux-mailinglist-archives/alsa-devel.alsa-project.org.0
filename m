Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5544EDAD7
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 15:47:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FDCC1A00;
	Thu, 31 Mar 2022 15:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FDCC1A00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648734438;
	bh=CYzl3iYtaka6CKARZWtlHQwm89zP/O27w2Oz1peGsWU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QrDprQJoGe/pXW3M3m3Sd5ENoZ/tdD4kC1fAA3otGofY1guNxfBI2pPgOiUDPUssM
	 Ky6HvkdibAEwlsYHoJUx290JVB/WuBYGxjlu0VLh8lihbPtoXB9bAOaA3I+JdnKlEQ
	 tbUDfHZ+EkGszIiMvDLT5AD9CjgGbqfZ075efheI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28FB8F80564;
	Thu, 31 Mar 2022 15:43:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E8A1F80589; Thu, 31 Mar 2022 15:42:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5C81F80564
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 15:42:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5C81F80564
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ADF3YsVB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648734174; x=1680270174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CYzl3iYtaka6CKARZWtlHQwm89zP/O27w2Oz1peGsWU=;
 b=ADF3YsVBgJncW7fAms8guJ8WTsKwJPCNhvtYem0bHhqyEOK8qkEkPsHr
 0zEOEGp3QF+jre84Sv/PF5FlT3Ervbyc2wC/5cnsPvmA2IwA+0F0zDlMl
 Ul3Cj8mcLOy7AqrMsFEz9G/vMauWJKFu7V8oHYphKoeKOfZvhrnecSBgA
 gxzFp6DSZD6DQeEkidoGjntyLRSUXlpm3Ods21+U4wOS2RvVf8QQhsDFD
 WEo7lxA4uNHXfx6VKfOCZEwVaVbVXv260kATHgizu6MzWQRuHRyQIaHNz
 456b947rF0zlJtyXqTiJ5DH6piYODRK+1+kdcBOsfZnNHHrlq/tHEiHY+ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259819222"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="259819222"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:42:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="522349290"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 31 Mar 2022 06:42:49 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 13/14] ASoC: Intel: avs: Prepare modules before bindings
 them
Date: Thu, 31 Mar 2022 15:52:45 +0200
Message-Id: <20220331135246.993089-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331135246.993089-1-cezary.rojewski@intel.com>
References: <20220331135246.993089-1-cezary.rojewski@intel.com>
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
index 13006c24ebf8..916a4f25636e 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -463,6 +463,37 @@ struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
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
@@ -478,6 +509,10 @@ int avs_path_bind(struct avs_path *path)
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

