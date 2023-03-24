Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C76AD6C7509
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 02:31:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2891BEE5;
	Fri, 24 Mar 2023 02:31:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2891BEE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679621511;
	bh=lRbNssYAu75q3WNYc+et1KrEUH9fnr6g1KllQLa/v9Q=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lXd8PaX7fEQBwDwwCCaErSOVTxu1WaD/t76FVvZ9vP05/Y4/JCPpsjh31Hx1go0uv
	 IB64UVSHrGInUyR/QiSlR+UAAU0KvOvC4dn9jtkgrWIq1kVTZMaIxt1paLmPC7+Lk+
	 AbH+ncWOSqfTRbnajarp/tG31jfqEK5sUNjsRSZc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E246AF8055B;
	Fri, 24 Mar 2023 02:29:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25B1FF8055C; Fri, 24 Mar 2023 02:29:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37996F80482
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 02:29:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37996F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Bsn7sqWk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679621346; x=1711157346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lRbNssYAu75q3WNYc+et1KrEUH9fnr6g1KllQLa/v9Q=;
  b=Bsn7sqWklYn/rhVmqfT8I1kOTkfyyiNTk2k4Zr2uCzbjjGwgBOI6+Dns
   bhsbbmmASanyycXkwiGbOzwiJZ84WTP9aeXDLjRhtVuE+AyUbI1TnoRA1
   OqPQQDzZh6qvA1tB6wYNztVXf9co9dqzEuHZ6SKzLmZwE/JXXZ4pvQfrF
   ncVw+xhMolU8uJB+v+td+CzysfDoOlDsucpt+y5AeTjpSKkDlNlQ1Rfi/
   N4z3pyWT4EZUWJRRUZN7wUlY9bYp64yBUHhagnGnWFZGDq14F/Lp2+i+Y
   UvM56vYiF1iPoOXFJTzOd3e1IA5GmCZKOXEg6pvdZbeRC/jvF25pZ573v
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404584878"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="404584878"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:29:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="659873026"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="659873026"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:29:01 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 05/13] ASoC: codecs: rt1316-sdw: simplify set_stream
Date: Fri, 24 Mar 2023 09:44:00 +0800
Message-Id: <20230324014408.1677505-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
References: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6CLUHUXLFPYMGPDOEUE7YD4X4W7YCEYG
X-Message-ID-Hash: 6CLUHUXLFPYMGPDOEUE7YD4X4W7YCEYG
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 vkoul@kernel.org, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6CLUHUXLFPYMGPDOEUE7YD4X4W7YCEYG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Using a dynamic allocation to store a single pointer is not very
efficient/useful.

Worse, the memory is released in the SoundWire stream.c file, but
still accessed in the DAI shutdown, leading to kmemleak reports.

And last the API requires the previous stream information to be
cleared when the argument is NULL.

Simplify the code to address all 3 problems.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/rt1316-sdw.c | 30 +++++++-----------------------
 sound/soc/codecs/rt1316-sdw.h |  4 ----
 2 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index b45121ee7533..2ee5e763e345 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -494,19 +494,7 @@ static const struct snd_soc_dapm_route rt1316_dapm_routes[] = {
 static int rt1316_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 				int direction)
 {
-	struct sdw_stream_data *stream;
-
-	if (!sdw_stream)
-		return 0;
-
-	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
-	if (!stream)
-		return -ENOMEM;
-
-	stream->sdw_stream = sdw_stream;
-
-	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	snd_soc_dai_dma_data_set(dai, direction, stream);
+	snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
 
 	return 0;
 }
@@ -514,11 +502,7 @@ static int rt1316_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 static void rt1316_sdw_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	struct sdw_stream_data *stream;
-
-	stream = snd_soc_dai_get_dma_data(dai, substream);
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
-	kfree(stream);
 }
 
 static int rt1316_sdw_hw_params(struct snd_pcm_substream *substream,
@@ -529,13 +513,13 @@ static int rt1316_sdw_hw_params(struct snd_pcm_substream *substream,
 		snd_soc_component_get_drvdata(component);
 	struct sdw_stream_config stream_config = {0};
 	struct sdw_port_config port_config = {0};
-	struct sdw_stream_data *stream;
+	struct sdw_stream_runtime *sdw_stream;
 	int retval;
 
 	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
-	stream = snd_soc_dai_get_dma_data(dai, substream);
+	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
 
-	if (!stream)
+	if (!sdw_stream)
 		return -EINVAL;
 
 	if (!rt1316->sdw_slave)
@@ -551,7 +535,7 @@ static int rt1316_sdw_hw_params(struct snd_pcm_substream *substream,
 		port_config.num = 2;
 
 	retval = sdw_stream_add_slave(rt1316->sdw_slave, &stream_config,
-				&port_config, 1, stream->sdw_stream);
+				&port_config, 1, sdw_stream);
 	if (retval) {
 		dev_err(dai->dev, "Unable to configure port\n");
 		return retval;
@@ -566,13 +550,13 @@ static int rt1316_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct rt1316_sdw_priv *rt1316 =
 		snd_soc_component_get_drvdata(component);
-	struct sdw_stream_data *stream =
+	struct sdw_stream_runtime *sdw_stream =
 		snd_soc_dai_get_dma_data(dai, substream);
 
 	if (!rt1316->sdw_slave)
 		return -EINVAL;
 
-	sdw_stream_remove_slave(rt1316->sdw_slave, stream->sdw_stream);
+	sdw_stream_remove_slave(rt1316->sdw_slave, sdw_stream);
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt1316-sdw.h b/sound/soc/codecs/rt1316-sdw.h
index 57dbd49993b0..e37121655bc1 100644
--- a/sound/soc/codecs/rt1316-sdw.h
+++ b/sound/soc/codecs/rt1316-sdw.h
@@ -50,8 +50,4 @@ struct rt1316_sdw_priv {
 	unsigned int bq_params_cnt;
 };
 
-struct sdw_stream_data {
-	struct sdw_stream_runtime *sdw_stream;
-};
-
 #endif /* __RT1316_SDW_H__ */
-- 
2.25.1

