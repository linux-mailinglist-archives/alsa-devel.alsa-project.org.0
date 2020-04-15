Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E620C1AB2A1
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:42:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 920C71666;
	Wed, 15 Apr 2020 22:41:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 920C71666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586983340;
	bh=wUsQpC7M7VaIeVYyFrBIJMxudjto4aOrB0exoBug0mA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E0kdlm2xyisBCIE/zSYy+dnbtZkekHjbSQ9vGfv80BSB99UsuIHD29wkNmdwNup2W
	 HRN21avpd7gegG9cQLXCsvslIHDis5zxok1ckU9nbpv/p7MgXZFMzx5qOQsaxJ8FEo
	 LHyOvsaV/Nn0DOahN6qDVYsimoWSJnVn9zKE29/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBF7EF8035F;
	Wed, 15 Apr 2020 22:29:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BC63F802FF; Wed, 15 Apr 2020 22:29:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A89E1F802C3
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A89E1F802C3
IronPort-SDR: Srj5Yjoj/NlAwMC7jtFLboXz4Uncl67ipPd+RklmTWRwkBlqBXuxvGp0Cwzrbjc4S4ymmxRgGY
 zZZvJzp/0kRQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:29:19 -0700
IronPort-SDR: VNeerMDoEshj/b3++m67pp1smLgHCC07vwkghb5l/LvejTpiwhL4+vww7N1Szlf0EqjImaWxtn
 pnj1l+D97Jqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288656339"
Received: from jplam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.82.197])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 13:29:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 20/24] ASoC: SOF: topology: Get ALH rate amd channels from
 topology
Date: Wed, 15 Apr 2020 15:28:12 -0500
Message-Id: <20200415202816.934-21-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
References: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?S=C5=82awomir=20B=C5=82auciak?= <slawomir.blauciak@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

FW will need these params for synchronized playback over multiple
DAIs.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Sławomir Błauciak <slawomir.blauciak@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h |  4 ++++
 sound/soc/sof/topology.c        | 23 +++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 2a25cd8da503..b7ad1cd4526a 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -126,4 +126,8 @@
 #define SOF_TKN_MUTE_LED_USE			1300
 #define SOF_TKN_MUTE_LED_DIRECTION		1301
 
+/* ALH */
+#define SOF_TKN_INTEL_ALH_RATE			1400
+#define SOF_TKN_INTEL_ALH_CH			1401
+
 #endif
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 3670b4221ba6..f59c34bb085b 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -656,6 +656,16 @@ static const struct sof_topology_token ssp_tokens[] = {
 
 };
 
+/* ALH */
+static const struct sof_topology_token alh_tokens[] = {
+	{SOF_TKN_INTEL_ALH_RATE,
+		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_dai_alh_params, rate), 0},
+	{SOF_TKN_INTEL_ALH_CH,
+		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_dai_alh_params, channels), 0},
+};
+
 /* DMIC */
 static const struct sof_topology_token dmic_tokens[] = {
 	{SOF_TKN_INTEL_DMIC_DRIVER_VERSION,
@@ -3095,13 +3105,26 @@ static int sof_link_alh_load(struct snd_soc_component *scomp, int index,
 			     struct sof_ipc_dai_config *config)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct snd_soc_tplg_private *private = &cfg->priv;
 	struct sof_ipc_reply reply;
 	u32 size = sizeof(*config);
 	int ret;
 
+	ret = sof_parse_tokens(scomp, &config->alh, alh_tokens,
+			       ARRAY_SIZE(alh_tokens), private->array,
+			       le32_to_cpu(private->size));
+	if (ret != 0) {
+		dev_err(scomp->dev, "error: parse alh tokens failed %d\n",
+			le32_to_cpu(private->size));
+		return ret;
+	}
+
 	/* init IPC */
 	config->hdr.size = size;
 
+	dev_dbg(scomp->dev, "ALH config rate %d channels %d\n",
+		config->alh.rate, config->alh.channels);
+
 	/* send message to DSP */
 	ret = sof_ipc_tx_message(sdev->ipc,
 				 config->hdr.cmd, config, size, &reply,
-- 
2.20.1

