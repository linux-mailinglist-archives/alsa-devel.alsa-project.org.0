Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 892DDE569A
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Oct 2019 00:48:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEBED190C;
	Sat, 26 Oct 2019 00:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEBED190C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572043718;
	bh=HpKmlDlaK4sZIaOcaJGh+L5gwNIocLKkYaEvuRfTlD8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SSmdEk1VPQuuDapZqib4HCjFUUjiVBnc+E07bBa/fNl9iiF1bJI9DhsMLuiCYXjXB
	 crdaSpaGMXBWpOCWQsD5UeHTlTb+CWKGNrmuxYs6mpztBPbCw3u2+SSFvpHryrvgXd
	 znWd5hweNCWaCPTluPIltIflcDvkrA7iyPn/ifN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3482AF80673;
	Sat, 26 Oct 2019 00:42:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14512F803D7; Sat, 26 Oct 2019 00:41:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5632F8045D
 for <alsa-devel@alsa-project.org>; Sat, 26 Oct 2019 00:41:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5632F8045D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 15:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,230,1569308400"; d="scan'208";a="210458195"
Received: from archagam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.139.180])
 by fmsmga001.fm.intel.com with ESMTP; 25 Oct 2019 15:41:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 25 Oct 2019 17:41:04 -0500
Message-Id: <20191025224122.7718-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
References: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 08/26] ASoC: SOF: token: add tokens for PCM
	compatible with D0i3 substate
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Keyon Jie <yang.jie@linux.intel.com>

Add stream token SOF_TKN_STREAM_PLAYBACK_COMPATIBLE_D0I3 and
SOF_TKN_STREAM_CAPTURE_COMPATIBLE_D0I3 to denote if the stream can be
opened at low power d0i3 status or not.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h |  4 ++++
 sound/soc/sof/topology.c        | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index d65406f34361..76883e6fb750 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -113,6 +113,10 @@
 /* ESAI */
 #define SOF_TKN_IMX_ESAI_MCLK_ID		1100
 
+/* Stream */
+#define SOF_TKN_STREAM_PLAYBACK_COMPATIBLE_D0I3	1200
+#define SOF_TKN_STREAM_CAPTURE_COMPATIBLE_D0I3	1201
+
 /* Led control for mute switches */
 #define SOF_TKN_MUTE_LED_USE			1300
 #define SOF_TKN_MUTE_LED_DIRECTION		1301
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index b3ab6f23fc93..121e5d6f8477 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -567,6 +567,16 @@ static const struct sof_topology_token pcm_tokens[] = {
 		offsetof(struct sof_ipc_comp_host, dmac_config), 0},
 };
 
+/* PCM */
+static const struct sof_topology_token stream_tokens[] = {
+	{SOF_TKN_STREAM_PLAYBACK_COMPATIBLE_D0I3,
+		SND_SOC_TPLG_TUPLE_TYPE_BOOL, get_token_u16,
+		offsetof(struct snd_sof_pcm, stream[0].d0i3_compatible), 0},
+	{SOF_TKN_STREAM_CAPTURE_COMPATIBLE_D0I3,
+		SND_SOC_TPLG_TUPLE_TYPE_BOOL, get_token_u16,
+		offsetof(struct snd_sof_pcm, stream[1].d0i3_compatible), 0},
+};
+
 /* Generic components */
 static const struct sof_topology_token comp_tokens[] = {
 	{SOF_TKN_COMP_PERIOD_SINK_COUNT,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
