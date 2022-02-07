Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E265F4ABF9D
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 14:28:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F4CE17DC;
	Mon,  7 Feb 2022 14:27:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F4CE17DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644240507;
	bh=xNosrPZHUJjnGJG87FMN59AgoZRLfDjSyHsgNebB+1E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JXak68ZXCbenl9gFEVszr/w4iT7xinRVXXICuqutXumTtG4/d8OHKM8/7ESm6WOWP
	 Ic6fR9kGBIqA3SH5j2M3dUSMkaB66Fo/OGTefXH+z5l8q4lEonxTljYBwMWGLegkeP
	 A8xjZZhOA/S5Gwz1syrCIdZ7pqK0Cf4fbfKbklbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9801F80578;
	Mon,  7 Feb 2022 14:24:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9997DF80571; Mon,  7 Feb 2022 14:24:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E4CEF80566
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 14:24:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E4CEF80566
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GwT79dy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644240267; x=1675776267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xNosrPZHUJjnGJG87FMN59AgoZRLfDjSyHsgNebB+1E=;
 b=GwT79dy4z33IQv6AvjdRPrL8QijdNnUbcXU5jrc/lSMcgem/hMdPRGRv
 49xbRsZ+9B5Z1i2Zl1Q0ESftb0cC7QTCHOZdTBmwb4l8Xzi8+TUu1QsBp
 4qmzniHh6j6Il7G9RYIQB+vwp/oRcW/LQJrlDi+kaR65p6dA/Mvqk0+Qb
 ++FWozn1z5/gkD5UL3vY7ANiGe5HBeFom0HJqNgsnQwL3JxEGicav/E1S
 W0hCAfewhmpFdefWtPm1QQunCStZ9FtpTDcW2mNLyKidBH488zNKdwNfc
 7iuGdhjlgPzK1pTJ5UEoXNKHxqJt0NvtYVTdlPGUVps1bsbxr9cPwMMJy g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="312011621"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="312011621"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 05:24:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="677751376"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2022 05:24:23 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 12/13] ASoC: Intel: avs: Prepare modules before bindings them
Date: Mon,  7 Feb 2022 14:25:30 +0100
Message-Id: <20220207132532.3782412-13-cezary.rojewski@intel.com>
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

