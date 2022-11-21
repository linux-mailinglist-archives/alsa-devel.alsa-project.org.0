Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8767632431
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Nov 2022 14:48:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96B2A1607;
	Mon, 21 Nov 2022 14:47:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96B2A1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669038487;
	bh=YhMUvmSn60afuseyyGAh3o011Cq0ZmSMs/ZYCFLwzlo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KgFsmmrrIhIkOjj8iTu4rCrUq/SpFcO2Fc2wOLi2tSxdw+ytLA+eug+SJIkKDl9zV
	 s8Qylzt9Wl+MdOPb9cJFOxCGEOQ7iJSIFBmD9NMyfiH5vuvpz+3k7sSRkMC4b0vm0k
	 YY9kRnNsLp8+cKr16L7ivvwfDqYWjh1OZIhIr2K8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C7D7F80563;
	Mon, 21 Nov 2022 14:46:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A1A5F8055C; Mon, 21 Nov 2022 14:46:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54D19F8028D
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 14:46:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54D19F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZDRtbm1K"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AL502xG029046; Mon, 21 Nov 2022 07:46:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=UZC5mSInUPPVK4ycYDZHi2KangYy7tVfWs8dGEHSWEs=;
 b=ZDRtbm1KcnZrqBwVElN8vhivn9wQInQFsZ/CdOV5BFu5FVtedIY3vuRmxGXU35/Z3B7p
 P20LUANlFTJBGSkx39vaL/F53vC/k3Tlgak9tt+UoXMd3tjfn6iDsXpGk0pBs2BeoxgP
 DKdawjzQsrDMk3r78WRxm60y06zL05oYVbQ3Iawkm8NiV5tiXxI6IfJU/+raeedQcs8+
 Bs/f40lmGM2cVPDaubcwsYJ2stXEMjVjQUoU1MEoy41K/LunpZdu2C/d6FyXtGvCKBLS
 Ot3oadkvUsJTYn3M5bcZTLv1UCPcfYI8Mi9xVkZDFnVBg8J67aS5u/r4IOMs5ztbSH2f WA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kxvet271t-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Nov 2022 07:46:10 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Mon, 21 Nov
 2022 07:46:08 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Mon, 21 Nov 2022 07:46:08 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 942CA468;
 Mon, 21 Nov 2022 13:46:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>
Subject: [PATCH 1/9] sound: sdw: Add hw_params to SoundWire config helper
 function
Date: Mon, 21 Nov 2022 13:46:00 +0000
Message-ID: <20221121134608.3713033-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Vaz_jm_2uXxRfe0ey1WuXc-e0wmr1EsW
X-Proofpoint-GUID: Vaz_jm_2uXxRfe0ey1WuXc-e0wmr1EsW
X-Proofpoint-Spam-Reason: safe
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com
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

The vast majority of the current users of the SoundWire framework
have almost identical code for converting from hw_params to SoundWire
configuration. Whilst complex devices might require more, it is very
likely that most new devices will follow the same pattern. Save a
little code by factoring this out into a helper function.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

I was a little bit two minds about whether to make this an inline or
not, so any thoughts on that would be super welcome. The function does
very little, especially given that SNDRV_PCM_STREAM_PLAYBACK ==
SDW_DATA_DIR_RX so the if is also really just an assignment.

Thanks,
Charles

 include/sound/sdw.h | 49 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 include/sound/sdw.h

diff --git a/include/sound/sdw.h b/include/sound/sdw.h
new file mode 100644
index 0000000000000..6dcdb3228dba6
--- /dev/null
+++ b/include/sound/sdw.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * linux/sound/sdw.h -- SoundWire helpers for ALSA/ASoC
+ *
+ * Copyright (c) 2022 Cirrus Logic Inc.
+ *
+ * Author: Charles Keepax <ckeepax@opensource.cirrus.com>
+ */
+
+#include <linux/soundwire/sdw.h>
+#include <sound/asound.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+
+#ifndef __INCLUDE_SOUND_SDW_H
+#define __INCLUDE_SOUND_SDW_H
+
+/**
+ * snd_sdw_params_to_config() - Conversion from hw_params to SoundWire config
+ *
+ * @substream: Pointer to the PCM substream structure
+ * @params: Pointer to the hardware params structure
+ * @stream_config: Stream configuration for the SoundWire audio stream
+ * @port_config: Port configuration for the SoundWire audio stream
+ *
+ * This function provides a basic conversion from the hw_params structure to
+ * SoundWire configuration structures. The user will at a minimum need to also
+ * set the port number in the port config, but may also override more of the
+ * setup, or in the case of a complex user, not use this helper at all and
+ * open-code everything.
+ */
+static inline void snd_sdw_params_to_config(struct snd_pcm_substream *substream,
+					    struct snd_pcm_hw_params *params,
+					    struct sdw_stream_config *stream_config,
+					    struct sdw_port_config *port_config)
+{
+	stream_config->frame_rate = params_rate(params);
+	stream_config->ch_count = params_channels(params);
+	stream_config->bps = snd_pcm_format_width(params_format(params));
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		stream_config->direction = SDW_DATA_DIR_RX;
+	else
+		stream_config->direction = SDW_DATA_DIR_TX;
+
+	port_config->ch_mask = GENMASK(stream_config->ch_count - 1, 0);
+}
+
+#endif
-- 
2.30.2

