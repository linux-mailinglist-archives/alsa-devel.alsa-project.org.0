Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED32F702579
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:54:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13C91208;
	Mon, 15 May 2023 08:54:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13C91208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133691;
	bh=+NUsvy+Y8PVO2h/Op18ecWWhry3F8Mgpf7FkeQTkvn0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=csgzhVNh9WgaY6BnIfKlTT1CP2cGN2PUWvZiDfC3nrrpKgVrBeVVtgZ5up6V7J3F9
	 dc3M5Fy+O3eguJflsIuCx3HL+23F7Ga7kVIu6rT4x894whSqJTKSDUQbagVgriBjXW
	 aK83Cos95ub2WN4Kt+WK9Ced9RHF6zzLdoWxUBWA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58FA1F80600; Mon, 15 May 2023 08:51:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93722F805F9;
	Mon, 15 May 2023 08:51:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32228F805D6; Mon, 15 May 2023 08:51:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2EB5F805C7
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:50:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2EB5F805C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=W1iU3+e+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684133457; x=1715669457;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+NUsvy+Y8PVO2h/Op18ecWWhry3F8Mgpf7FkeQTkvn0=;
  b=W1iU3+e+SIrO2YkTh78FHgoes0b2nP6pfd+LDR9HPgLg2wFoCyZbk4s0
   iATGQz8O84/y9KszXdFnjIhUxavquqxxZOQuoC/6tMyMm3MZ5arOX3gJ9
   5aCI5RI3m6FEdKd97uw0GKkLCorsyWc/8F2DIU79fB1DRtyLXGBzP7rY6
   5wtAPDBSJimtARoRXQ/uDcTNX7knyevbtZgLQ3ZKw3+Ec0T9NC0XsKO1/
   c/r2bUMA4SLls3F9bZv4BIuStA9PbM2TVqJj97oxbUU/tnZMyPvxrXsHw
   GNMdwDsEhguTvfox3QhNoJ+k0a42QvuYo9nOVKtYOXQVb3eeHNpxr9iMa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349966433"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="349966433"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694908730"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="694908730"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:52 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	vinod.koul@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 14/26] soundwire: intel_ace2x: add DAI registration
Date: Mon, 15 May 2023 15:10:30 +0800
Message-Id: <20230515071042.2038-15-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MKYX7YKJXKE47SBM34SEVNV2FDDUBMGU
X-Message-ID-Hash: MKYX7YKJXKE47SBM34SEVNV2FDDUBMGU
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MKYX7YKJXKE47SBM34SEVNV2FDDUBMGU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The code is similar to the previous implementation, the only
difference is that the PDI descriptors are now in different areas.

Using common helpers proves tricky with multiple changed registers,
workarounds that are no longer necessary. It's simpler to duplicate
the intel_register_dai() function rather than try to add multiple
levels of abstraction and indirections.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_ace2x.c | 161 ++++++++++++++++++++++++++++++++
 1 file changed, 161 insertions(+)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 5deff32976f1..d6d5e6e070f4 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -116,10 +116,171 @@ static int intel_link_power_down(struct sdw_intel *sdw)
 	return ret;
 }
 
+/*
+ * DAI operations
+ */
+static const struct snd_soc_dai_ops intel_pcm_dai_ops = {
+};
+
+static const struct snd_soc_component_driver dai_component = {
+	.name			= "soundwire",
+};
+
+/*
+ * PDI routines
+ */
+static void intel_pdi_init(struct sdw_intel *sdw,
+			   struct sdw_cdns_stream_config *config)
+{
+	void __iomem *shim = sdw->link_res->shim;
+	int pcm_cap;
+
+	/* PCM Stream Capability */
+	pcm_cap = intel_readw(shim, SDW_SHIM2_PCMSCAP);
+
+	config->pcm_bd = FIELD_GET(SDW_SHIM2_PCMSCAP_BSS, pcm_cap);
+	config->pcm_in = FIELD_GET(SDW_SHIM2_PCMSCAP_ISS, pcm_cap);
+	config->pcm_out = FIELD_GET(SDW_SHIM2_PCMSCAP_ISS, pcm_cap);
+
+	dev_dbg(sdw->cdns.dev, "PCM cap bd:%d in:%d out:%d\n",
+		config->pcm_bd, config->pcm_in, config->pcm_out);
+}
+
+static int
+intel_pdi_get_ch_cap(struct sdw_intel *sdw, unsigned int pdi_num)
+{
+	void __iomem *shim = sdw->link_res->shim;
+
+	/* zero based values for channel count in register */
+	return intel_readw(shim, SDW_SHIM2_PCMSYCHC(pdi_num)) + 1;
+}
+
+static void intel_pdi_get_ch_update(struct sdw_intel *sdw,
+				    struct sdw_cdns_pdi *pdi,
+				    unsigned int num_pdi,
+				    unsigned int *num_ch)
+{
+	int ch_count = 0;
+	int i;
+
+	for (i = 0; i < num_pdi; i++) {
+		pdi->ch_count = intel_pdi_get_ch_cap(sdw, pdi->num);
+		ch_count += pdi->ch_count;
+		pdi++;
+	}
+
+	*num_ch = ch_count;
+}
+
+static void intel_pdi_stream_ch_update(struct sdw_intel *sdw,
+				       struct sdw_cdns_streams *stream)
+{
+	intel_pdi_get_ch_update(sdw, stream->bd, stream->num_bd,
+				&stream->num_ch_bd);
+
+	intel_pdi_get_ch_update(sdw, stream->in, stream->num_in,
+				&stream->num_ch_in);
+
+	intel_pdi_get_ch_update(sdw, stream->out, stream->num_out,
+				&stream->num_ch_out);
+}
+
+static int intel_create_dai(struct sdw_cdns *cdns,
+			    struct snd_soc_dai_driver *dais,
+			    enum intel_pdi_type type,
+			    u32 num, u32 off, u32 max_ch)
+{
+	int i;
+
+	if (!num)
+		return 0;
+
+	for (i = off; i < (off + num); i++) {
+		dais[i].name = devm_kasprintf(cdns->dev, GFP_KERNEL,
+					      "SDW%d Pin%d",
+					      cdns->instance, i);
+		if (!dais[i].name)
+			return -ENOMEM;
+
+		if (type == INTEL_PDI_BD || type == INTEL_PDI_OUT) {
+			dais[i].playback.channels_min = 1;
+			dais[i].playback.channels_max = max_ch;
+		}
+
+		if (type == INTEL_PDI_BD || type == INTEL_PDI_IN) {
+			dais[i].capture.channels_min = 1;
+			dais[i].capture.channels_max = max_ch;
+		}
+
+		dais[i].ops = &intel_pcm_dai_ops;
+	}
+
+	return 0;
+}
+
+static int intel_register_dai(struct sdw_intel *sdw)
+{
+	struct sdw_cdns_dai_runtime **dai_runtime_array;
+	struct sdw_cdns_stream_config config;
+	struct sdw_cdns *cdns = &sdw->cdns;
+	struct sdw_cdns_streams *stream;
+	struct snd_soc_dai_driver *dais;
+	int num_dai;
+	int ret;
+	int off = 0;
+
+	/* Read the PDI config and initialize cadence PDI */
+	intel_pdi_init(sdw, &config);
+	ret = sdw_cdns_pdi_init(cdns, config);
+	if (ret)
+		return ret;
+
+	intel_pdi_stream_ch_update(sdw, &sdw->cdns.pcm);
+
+	/* DAIs are created based on total number of PDIs supported */
+	num_dai = cdns->pcm.num_pdi;
+
+	dai_runtime_array = devm_kcalloc(cdns->dev, num_dai,
+					 sizeof(struct sdw_cdns_dai_runtime *),
+					 GFP_KERNEL);
+	if (!dai_runtime_array)
+		return -ENOMEM;
+	cdns->dai_runtime_array = dai_runtime_array;
+
+	dais = devm_kcalloc(cdns->dev, num_dai, sizeof(*dais), GFP_KERNEL);
+	if (!dais)
+		return -ENOMEM;
+
+	/* Create PCM DAIs */
+	stream = &cdns->pcm;
+
+	ret = intel_create_dai(cdns, dais, INTEL_PDI_IN, cdns->pcm.num_in,
+			       off, stream->num_ch_in);
+	if (ret)
+		return ret;
+
+	off += cdns->pcm.num_in;
+	ret = intel_create_dai(cdns, dais, INTEL_PDI_OUT, cdns->pcm.num_out,
+			       off, stream->num_ch_out);
+	if (ret)
+		return ret;
+
+	off += cdns->pcm.num_out;
+	ret = intel_create_dai(cdns, dais, INTEL_PDI_BD, cdns->pcm.num_bd,
+			       off, stream->num_ch_bd);
+	if (ret)
+		return ret;
+
+	return devm_snd_soc_register_component(cdns->dev, &dai_component,
+					       dais, num_dai);
+}
+
 const struct sdw_intel_hw_ops sdw_intel_lnl_hw_ops = {
 	.debugfs_init = intel_ace2x_debugfs_init,
 	.debugfs_exit = intel_ace2x_debugfs_exit,
 
+	.register_dai = intel_register_dai,
+
 	.link_power_up = intel_link_power_up,
 	.link_power_down = intel_link_power_down,
 };
-- 
2.25.1

