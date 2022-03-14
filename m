Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4F64D8DD4
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 21:07:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29EDA1709;
	Mon, 14 Mar 2022 21:06:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29EDA1709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647288444;
	bh=y0cDwe/UT/q39LP7OFzMKBHPlWyTOt7vZV5KLzdg1GY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VW+uOd/BW9LmqkkLt5PGCYLIZvIu381ef+3Q6KE8Q9kW+y0C4mxDw64cT0/V/esX5
	 qka7l2XCXocJMbc4QKWkglEufDgDl4yr7HYm6TEumVozPZwrRhVT9uYs2Wnxu8wkka
	 tyXQmZj8gvCK/GjwQz19WmvenZz8GFyks4YYfKk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BF1CF80224;
	Mon, 14 Mar 2022 21:05:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62A7EF8012C; Mon, 14 Mar 2022 21:05:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4489F8012C
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 21:05:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4489F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cBULGo+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647288341; x=1678824341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y0cDwe/UT/q39LP7OFzMKBHPlWyTOt7vZV5KLzdg1GY=;
 b=cBULGo+5RPWNdkr3y/hyiF9fpdfvIkVPC88jHxLQhbSaCA+7c0ZqHa/Y
 ZqiY3yYx864Anx3S3Bh9fe3op5sz0femw+kfULNUT95jg+9WOuXP2j5Sw
 JGOuP5F0UlsSh9jZTce/tWFaHEtR42OOAdy3PCiQbmQma/1PL7Xip4+7o
 BJMRK+JLzIStTduNW7AOz4YXtj9rUKm6+46dZnH0PGX7PlQFDE3lkByT5
 frG2uII7S928+0K0aPUqu/NIVgql6tJS8UNgoPBdAXm6u5BjBc07z1uBC
 yqfu1hIwdd4J5jF/LqSmn4EN4BE++O3jDrnBm6Nf8ArhOmQZOUtNvhBCr g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342563467"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="342563467"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="634339885"
Received: from pmishr1-mobl1.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.25.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:32 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: IPC4-tooplogy: Add ccore tokens
Date: Mon, 14 Mar 2022 13:05:03 -0700
Message-Id: <20220314200520.1233427-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220314200520.1233427-1-ranjani.sridharan@linux.intel.com>
References: <20220314200520.1233427-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: =tiwai@suse.com, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index b6abf306fe96..707c0b7e0831 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -112,6 +112,11 @@ static const struct sof_topology_token ipc4_mixer_tokens[] = {
 	{SOF_TKN_MIXER_TYPE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32, 0},
 };
 
+/* Core tokens */
+static const struct sof_topology_token ipc4_core_tokens[] = {
+	{SOF_TKN_COMP_CORE_ID, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32, 0},
+};
+
 static const struct sof_token_info ipc4_token_list[SOF_TOKEN_COUNT] = {
 	[SOF_DAI_TOKENS] = {"DAI tokens", dai_tokens, ARRAY_SIZE(dai_tokens)},
 	[SOF_PIPELINE_TOKENS] = {"Pipeline tokens", pipeline_tokens, ARRAY_SIZE(pipeline_tokens)},
@@ -137,6 +142,7 @@ static const struct sof_token_info ipc4_token_list[SOF_TOKEN_COUNT] = {
 	[SOF_GAIN_TOKENS] = {"Gain tokens", gain_tokens, ARRAY_SIZE(gain_tokens)},
 	[SOF_IPC4_MIXER_TOKENS] = {"IPC4 Mixer tokens", ipc4_mixer_tokens,
 		ARRAY_SIZE(ipc4_mixer_tokens)},
+	[SOF_CORE_TOKENS] = {"Core tokens", ipc4_core_tokens, ARRAY_SIZE(ipc4_core_tokens)},
 };
 
 void sof_ipc4_dbg_audio_format(struct device *dev, struct sof_ipc4_audio_format *format,
@@ -1540,6 +1546,7 @@ static enum sof_tokens host_token_list[] = {
 	SOF_IPC4_COPIER_GATEWAY_CFG_TOKENS,
 	SOF_IPC4_COPIER_TOKENS,
 	SOF_COMP_EXT_TOKENS,
+	SOF_CORE_TOKENS,
 };
 
 static enum sof_tokens pipeline_token_list[] = {
@@ -1557,6 +1564,7 @@ static enum sof_tokens dai_token_list[] = {
 	SOF_IPC4_COPIER_TOKENS,
 	SOF_DAI_TOKENS,
 	SOF_COMP_EXT_TOKENS,
+	SOF_CORE_TOKENS,
 };
 
 static enum sof_tokens pga_token_list[] = {
@@ -1566,6 +1574,7 @@ static enum sof_tokens pga_token_list[] = {
 	SOF_IPC4_AUDIO_FORMAT_BUFFER_SIZE_TOKENS,
 	SOF_IPC4_IN_AUDIO_FORMAT_TOKENS,
 	SOF_COMP_EXT_TOKENS,
+	SOF_CORE_TOKENS,
 };
 
 static enum sof_tokens mixer_token_list[] = {
@@ -1575,6 +1584,7 @@ static enum sof_tokens mixer_token_list[] = {
 	SOF_IPC4_IN_AUDIO_FORMAT_TOKENS,
 	SOF_IPC4_AUDIO_FORMAT_BUFFER_SIZE_TOKENS,
 	SOF_COMP_EXT_TOKENS,
+	SOF_CORE_TOKENS,
 };
 
 static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TYPE_COUNT] = {
-- 
2.25.1

