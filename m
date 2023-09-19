Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 259D17A5DDC
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 11:27:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FAB0DF1;
	Tue, 19 Sep 2023 11:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FAB0DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695115665;
	bh=gqNqMU8X/cQOZ4VnxAWLkfXuNoHeEY4XAUAXlvMoSRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B81mzJ3LU9C/GD7rkGOYDX9YrAKD+4UJTq6sn9NZk4nsO1giZkfLIlKGXIgDhmNGo
	 foNPZFcJ9IwCCVXItcE9BsWxgUW9J858kuoBsZiaR6YaFMXQ9namQ7cJ6MFBGk2R4L
	 Hzxkd7W4S9qIvFOq90mbTMHDUk/RkKCNJYck9EAo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F5B3F805E4; Tue, 19 Sep 2023 11:24:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97EEBF805C4;
	Tue, 19 Sep 2023 11:24:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB8EEF805B0; Tue, 19 Sep 2023 11:24:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66BF0F80125
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 11:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66BF0F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XFni7Gfe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695115470; x=1726651470;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gqNqMU8X/cQOZ4VnxAWLkfXuNoHeEY4XAUAXlvMoSRA=;
  b=XFni7GfeouvWFVhd9yxc/3R/VEj6EIlDE4IgF9t/xw+3RjC5fwt9Pvqc
   BBnH0HEp7czGzNGKqL/v3gex/OEGB6A/zYJktFiy+UsS+02G3OmgQbCTn
   0NDk0oi+ojlWIWkpvzIGrfbfWMQR7dvoxzUtqAkVt1rW+Tai9eHA++qVT
   Hvk2/xTu/y0JDaAH5lsamtOHTX8w1zN5Y1oXeXxvH28ptBYoSHu+zQWpw
   GN+4s4uM1uM5QbPIFEaUinw83FcMPm1H2xKTQwClT1rveFf+DoV47vmgz
   BCFy4WmWSHYERjiJKXio03+LBDQk6XBxF1fGpY6+t1QkqJcoz7WOJqVdW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377205257"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="377205257"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:24:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="861460308"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="861460308"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.47.169])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:24:25 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	rander.wang@intel.com,
	guennadi.liakhovetski@linux.intel.com
Subject: [PATCH 7/9] ASoC: SOF: Intel: mtl: dump dsp stack
Date: Tue, 19 Sep 2023 12:24:14 +0300
Message-ID: <20230919092416.4137-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919092416.4137-1-peter.ujfalusi@linux.intel.com>
References: <20230919092416.4137-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2TVEIFMKXFZSN7PBZUMGH4HSU25DDH4P
X-Message-ID-Hash: 2TVEIFMKXFZSN7PBZUMGH4HSU25DDH4P
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2TVEIFMKXFZSN7PBZUMGH4HSU25DDH4P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Dump dsp stack with sof_ipc4_intel_dump_telemetry_state since dsp stack
information is included by telemetry data. This also supports lnl since
the mtl code is reused.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index f9412517eaf2..254dbbeac1d0 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -18,6 +18,7 @@
 #include "hda-ipc.h"
 #include "../sof-audio.h"
 #include "mtl.h"
+#include "telemetry.h"
 
 static const struct snd_sof_debugfs_map mtl_dsp_debugfs[] = {
 	{"hda", HDA_DSP_HDA_BAR, 0, 0x4000, SOF_DEBUGFS_ACCESS_ALWAYS},
@@ -320,6 +321,8 @@ void mtl_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 	romdbgsts = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HFFLGPXQWY + 0x8 * 3);
 	dev_printk(level, sdev->dev, "ROM feature bit%s enabled\n",
 		   romdbgsts & BIT(24) ? "" : " not");
+
+	sof_ipc4_intel_dump_telemetry_state(sdev, flags);
 }
 
 static bool mtl_dsp_primary_core_is_enabled(struct snd_sof_dev *sdev)
-- 
2.42.0

