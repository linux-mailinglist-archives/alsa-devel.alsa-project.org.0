Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C682D04E2
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Dec 2020 13:48:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 749C6177C;
	Sun,  6 Dec 2020 13:47:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 749C6177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607258906;
	bh=JIX6E4Mp6T0Uuo8YZRKHw4wz5TOWCoYJT2n2vvarzJA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qLZYib4R+CZSWJ8FG1TsFpK8WT/hNEe4Q2OP+SKvA4Z/EXPb6tAX94KViD9ECe6sa
	 xesS4DiaRAVxwy0VqNCgl5wCZ2w+Mguyu9bqhGqWrRCELuiPKijbYF+G5NQvoACLbz
	 9N8VUbHvE3rKtUjBtzx0tAKJSDAGJGtUhXwSrSQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E76CEF80260;
	Sun,  6 Dec 2020 13:46:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E499AF8010A; Sun,  6 Dec 2020 13:46:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 507CFF800B4
 for <alsa-devel@alsa-project.org>; Sun,  6 Dec 2020 13:46:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 507CFF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="fdOygJ7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607258792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/V607JkOhR8k3AAl+w1NMdI/RQ/e9s6n6MXY6VyHDQk=;
 b=fdOygJ7+ZBbwgaiVfzsZUiUTZf42AkiqpE2t4TpL0B6Xibq1tGruIz913WNvXp6OqoClQg
 tiZ5pSzjkklAFx6+SlvKFC/t1xwmDEJJAVVbjWp2hN9l5mnAz5SfaBrRvRx2X927twLNma
 cUKa8rJqgceICl8urPmCbthTK35UQFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-_LJS9QkYNN2nkWD6KdTf0w-1; Sun, 06 Dec 2020 07:46:31 -0500
X-MC-Unique: _LJS9QkYNN2nkWD6KdTf0w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 634CB5201;
 Sun,  6 Dec 2020 12:46:30 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-98.ams2.redhat.com [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96EDF5D9DC;
 Sun,  6 Dec 2020 12:46:29 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC SOF 1/2] topology: Add sof-byt-codec-tdm4.m4 file
Date: Sun,  6 Dec 2020 13:46:25 +0100
Message-Id: <20201206124626.13932-2-hdegoede@redhat.com>
In-Reply-To: <20201206124626.13932-1-hdegoede@redhat.com>
References: <20201206124626.13932-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

Some BYT/CHT boards (mostly Cherry Trail) use TDM 4 slots 24 bit as
wire format to the codec, rather then standard I2S 2 channel 24 bit.

Add a new m4 file for this. This is a copy of sof-byt-codec.m4 with
the following changes:

@@ -1,4 +1,4 @@
-`# Topology for generic' PLATFORM `board with' CODEC `on SSP' SSP_NUM
+`# Topology for generic' PLATFORM `board with' CODEC `on SSP' SSP_NUM `using TDM 4 slots 24 bit'

 # Include topology builder
 include(`utils.m4')
@@ -97,8 +97,8 @@
 # BE configurations - overrides config in ACPI if present
 #
 DAI_CONFIG(SSP, SSP_NUM, 0, SSP2-Codec,
-	   SSP_CONFIG(I2S, SSP_CLOCK(mclk, 19200000, codec_mclk_in),
-		      SSP_CLOCK(bclk, 2400000, codec_slave),
+	   SSP_CONFIG(DSP_B, SSP_CLOCK(mclk, 19200000, codec_mclk_in),
+		      SSP_CLOCK(bclk, 4800000, codec_slave),
 		      SSP_CLOCK(fsync, 48000, codec_slave),
-		      SSP_TDM(2, 25, 3, 3),
+		      SSP_TDM(4, 25, 3, 3),
 		      SSP_CONFIG_DATA(SSP, SSP_NUM, 24)))

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 tools/topology/sof-byt-codec-tdm4.m4 | 104 +++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 tools/topology/sof-byt-codec-tdm4.m4

diff --git a/tools/topology/sof-byt-codec-tdm4.m4 b/tools/topology/sof-byt-codec-tdm4.m4
new file mode 100644
index 000000000..dabf8342b
--- /dev/null
+++ b/tools/topology/sof-byt-codec-tdm4.m4
@@ -0,0 +1,104 @@
+`# Topology for generic' PLATFORM `board with' CODEC `on SSP' SSP_NUM `using TDM 4 slots 24 bit'
+
+# Include topology builder
+include(`utils.m4')
+include(`dai.m4')
+include(`pipeline.m4')
+include(`ssp.m4')
+
+# Include TLV library
+include(`common/tlv.m4')
+
+# Include Token library
+include(`sof/tokens.m4')
+
+# Include DSP configuration
+include(`platform/intel/'PLATFORM`.m4')
+
+#
+# Define the pipelines
+#
+# PCM0 -----> volume -------v
+#                            low latency mixer ----> volume ---->  SSP2
+# PCM1 -----> volume -------^
+# PCM0 <---- Volume <---- SSP2
+#
+
+# Low Latency capture pipeline 2 on PCM 0 using max 2 channels of s32le.
+# 1000us deadline on core 0 with priority 0
+PIPELINE_PCM_ADD(sof/pipe-low-latency-capture.m4,
+	2, 0, 2, s32le,
+	1000, 0, 0,
+	48000, 48000, 48000)
+
+#
+# DAI configuration
+#
+# SSP port 2 is our only pipeline DAI
+#
+
+# playback DAI is SSP2 using 2 periods
+# Buffers use s24le format, 1000us deadline on core 0 with priority 1
+# this defines pipeline 1. The 'NOT_USED_IGNORED' is due to dependencies
+# and is adjusted later with an explicit dapm line.
+DAI_ADD(sof/pipe-mixer-dai-playback.m4,
+	1, SSP, SSP_NUM, SSP2-Codec,
+	NOT_USED_IGNORED, 2, s24le,
+	1000, 1, 0, SCHEDULE_TIME_DOMAIN_DMA,
+	2, 48000)
+
+# PCM Playback pipeline 3 on PCM 0 using max 2 channels of s32le.
+# 1000us deadline on core 0 with priority 0
+# this is connected to pipeline DAI 1
+PIPELINE_PCM_ADD(sof/pipe-host-volume-playback.m4,
+	3, 0, 2, s32le,
+	1000, 0, 0,
+	48000, 48000, 48000,
+	SCHEDULE_TIME_DOMAIN_DMA,
+	PIPELINE_PLAYBACK_SCHED_COMP_1)
+
+# PCM Playback pipeline 4 on PCM 1 using max 2 channels of s32le.
+# 10ms deadline on core 0 with priority 0
+# this is connected to pipeline DAI 1
+PIPELINE_PCM_ADD(sof/pipe-host-volume-playback.m4,
+	4, 1, 2, s32le,
+	5000, 0, 0,
+	48000, 48000, 48000,
+	SCHEDULE_TIME_DOMAIN_DMA,
+	PIPELINE_PLAYBACK_SCHED_COMP_1)
+
+# Connect pipelines together
+SectionGraph."PIPE_NAME" {
+	index "0"
+
+	lines [
+		# PCM pipeline 3 to DAI pipeline 1
+		dapm(PIPELINE_MIXER_1, PIPELINE_SOURCE_3)
+		# PCM pipeline 4 to DAI pipeline 1
+		dapm(PIPELINE_MIXER_1, PIPELINE_SOURCE_4)
+
+	]
+}
+
+# capture DAI is SSP2 using 2 periods
+# Buffers use s24le format, 1000us deadline on core 0 with priority 0
+# this is part of pipeline 2
+DAI_ADD(sof/pipe-dai-capture.m4,
+	2, SSP, SSP_NUM, SSP2-Codec,
+	PIPELINE_SINK_2, 2, s24le,
+	1000, 0, 0, SCHEDULE_TIME_DOMAIN_DMA)
+
+
+# PCM definitions
+PCM_DUPLEX_ADD(PCM, 0, PIPELINE_PCM_3, PIPELINE_PCM_2)
+PCM_PLAYBACK_ADD(PCM Deep Buffer, 1, PIPELINE_PCM_4)
+
+#
+# BE configurations - overrides config in ACPI if present
+#
+DAI_CONFIG(SSP, SSP_NUM, 0, SSP2-Codec,
+	   SSP_CONFIG(DSP_B, SSP_CLOCK(mclk, 19200000, codec_mclk_in),
+		      SSP_CLOCK(bclk, 4800000, codec_slave),
+		      SSP_CLOCK(fsync, 48000, codec_slave),
+		      SSP_TDM(4, 25, 3, 3),
+		      SSP_CONFIG_DATA(SSP, SSP_NUM, 24)))
-- 
2.28.0

