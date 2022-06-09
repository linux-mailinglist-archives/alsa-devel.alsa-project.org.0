Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EB0544202
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:34:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE59520CD;
	Thu,  9 Jun 2022 05:33:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE59520CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745664;
	bh=/XqQzof0vygZZd4wY2/ay0oJWtHG31+FWgRoGD39ccA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VWlyqJ+eQ/CX2nUJ2iOQjSTfgeKQPGKDms1rroCtAerRTQY244cfBtOn+YEZBgl4n
	 CdoWugby0csMPbbUoZeQoTEECos4ZopbnRFgunlufNrseFrQHaqSu/EKw7d5fltsVx
	 XpPd1efmINhojfRAHVi3zmXI3lUIZ0XOYSp50st8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E37FFF805E9;
	Thu,  9 Jun 2022 05:27:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF4B8F805C0; Thu,  9 Jun 2022 05:27:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0875BF8055A
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0875BF8055A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LHX4LQvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745246; x=1686281246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/XqQzof0vygZZd4wY2/ay0oJWtHG31+FWgRoGD39ccA=;
 b=LHX4LQvQpcfVJCmRv6PE2bCjQMHQhXTtzmCSvEuGEH7yB7N3yeyybN4T
 kswcPalUw5KYZptuD5RLRfdeWpFdcayev8/ygJ/hKuRqOx7+k2aB3CXu3
 fyxBPFyG+8ZEbe34T5CLC1vmhWreYpqEwTbIzVnNrnWjVTPU/EWm5l7Fn
 TbYV7sJjD38PU2qSEPSgk9tJEW7Yri/vfmVETD0rzxjLnYyPJoi26H8Ry
 r4GRArptbu/+Hl2cbfX7X5DqddPG5gHN5jcRZZizoJX9KnjUPZiyF9Tub
 sE6aK/hHhUVLenr2Hyn69JdJoxwl3pb/GgYgZvN/UfRKymoygnWti2lsQ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219575"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219575"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260259"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:01 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 22/23] AsoC: SOF: ipc4-topology: Add dai_get_clk op
Date: Wed,  8 Jun 2022 20:26:42 -0700
Message-Id: <20220609032643.916882-23-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

Define and set the dai_get_clk_op for IPC4.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 58 +++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 9f055c187b72..d5cb08ec1af1 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1511,6 +1511,63 @@ static int sof_ipc4_parse_manifest(struct snd_soc_component *scomp, int index,
 	return 0;
 }
 
+static int sof_ipc4_dai_get_clk(struct snd_sof_dev *sdev, struct snd_sof_dai *dai, int clk_type)
+{
+	struct sof_ipc4_copier *ipc4_copier = dai->private;
+	struct snd_soc_tplg_hw_config *hw_config;
+	struct snd_sof_dai_link *slink;
+	bool dai_link_found = false;
+	bool hw_cfg_found = false;
+	int i;
+
+	if (!ipc4_copier)
+		return 0;
+
+	list_for_each_entry(slink, &sdev->dai_link_list, list) {
+		if (!strcmp(slink->link->name, dai->name)) {
+			dai_link_found = true;
+			break;
+		}
+	}
+
+	if (!dai_link_found) {
+		dev_err(sdev->dev, "no DAI link found for DAI %s\n", dai->name);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < slink->num_hw_configs; i++) {
+		hw_config = &slink->hw_configs[i];
+		if (dai->current_config == le32_to_cpu(hw_config->id)) {
+			hw_cfg_found = true;
+			break;
+		}
+	}
+
+	if (!hw_cfg_found) {
+		dev_err(sdev->dev, "no matching hw_config found for DAI %s\n", dai->name);
+		return -EINVAL;
+	}
+
+	switch (ipc4_copier->dai_type) {
+	case SOF_DAI_INTEL_SSP:
+		switch (clk_type) {
+		case SOF_DAI_CLK_INTEL_SSP_MCLK:
+			return le32_to_cpu(hw_config->mclk_rate);
+		case SOF_DAI_CLK_INTEL_SSP_BCLK:
+			return le32_to_cpu(hw_config->bclk_rate);
+		default:
+			dev_err(sdev->dev, "Invalid clk type for SSP %d\n", clk_type);
+			break;
+		}
+		break;
+	default:
+		dev_err(sdev->dev, "DAI type %d not supported yet!\n", ipc4_copier->dai_type);
+		break;
+	}
+
+	return -EINVAL;
+}
+
 static enum sof_tokens host_token_list[] = {
 	SOF_COMP_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
@@ -1597,4 +1654,5 @@ const struct sof_ipc_tplg_ops ipc4_tplg_ops = {
 	.route_free = sof_ipc4_route_free,
 	.dai_config = sof_ipc4_dai_config,
 	.parse_manifest = sof_ipc4_parse_manifest,
+	.dai_get_clk = sof_ipc4_dai_get_clk,
 };
-- 
2.25.1

