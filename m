Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6887E6C5EFF
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 06:36:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2786ECC;
	Thu, 23 Mar 2023 06:35:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2786ECC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679549786;
	bh=+NUsvy+Y8PVO2h/Op18ecWWhry3F8Mgpf7FkeQTkvn0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZuPu+M1vuTGaIjpk7Rk9M+yJHHPUIxDiyJW1cgUSGgBxblwX0Fw89z1eucmCMImBg
	 W3k+yZulWNdtUuk5k2i4BVG+GvDcHVCr9tJGQTbM6uLlBH+jc6mSzFzYMtDKVlP91L
	 noq4O/ewvwRQhlm+RoGqB/Hr5HLYS+ilGs2sotGw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42C10F8057D;
	Thu, 23 Mar 2023 06:33:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCF8AF80527; Thu, 23 Mar 2023 06:31:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EAEDF80542
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 06:30:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EAEDF80542
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bqA2PEqb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549428; x=1711085428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+NUsvy+Y8PVO2h/Op18ecWWhry3F8Mgpf7FkeQTkvn0=;
  b=bqA2PEqbx1ja5Oa/OCmm8UJXeyyXyvfF7VKOhfFizqadq6Gbex99rh9Z
   HeYuA7kOh/mzBDy1QmyF2mzKmC+FlH3ad1/5uiR9mKXUdBwoxw2/+tU6L
   cI7flSbsGdh+pdoA9UNc9YzCUcAoX7ejq4FDwW29njJf0vDSSvAKK68vD
   eZ4nMpAETW7bvrvOihvQoWV7xk+Hhnt9k1gjjFcXJh5UjcSD4W2IDvtm8
   keOttnUlDZEaUxuwLCkhs5Gf6heCNsiWv1sP0q4i0J/qWwz1Dt5M38fJY
   Rz8Yw1PoPy/kCnNXrZt9u9EMuk91Y0zCcQenj4H4keQeu4K0/L1x9pH/p
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327779450"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="327779450"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675567177"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675567177"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:23 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH 14/20] soundwire: intel_ace2x: add DAI registration
Date: Thu, 23 Mar 2023 13:44:46 +0800
Message-Id: <20230323054452.1543233-15-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L5M7TX6KSUA2B72TXEBOSR2MNY43O5UB
X-Message-ID-Hash: L5M7TX6KSUA2B72TXEBOSR2MNY43O5UB
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com, tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L5M7TX6KSUA2B72TXEBOSR2MNY43O5UB/>
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

