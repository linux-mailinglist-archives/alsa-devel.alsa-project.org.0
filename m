Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6423B4D4055
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 05:31:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E58691744;
	Thu, 10 Mar 2022 05:30:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E58691744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646886702;
	bh=HaBgjpbZfVTtTKNjir1EsTFf8XFL+KnirMv1xWARbWI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J1VTqOXAF1VavNF3Xo7Rs2DPTsUGCg8XU490phPB+cGB+JbMyPgZrVKdu089qv1b0
	 YDXRLa3COC/qxI9MCP59elcLSMfmGhJ3tCJODYUhytwSci+NCtmGXQLIbpTR/+/Mz+
	 hGIzbdw84hWh7uW/bhdn05bioDDZ9QuWLCTRhiG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3B35F80548;
	Thu, 10 Mar 2022 05:28:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB48EF8052D; Thu, 10 Mar 2022 05:28:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D83BF80519
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 05:27:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D83BF80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CgqNN2qx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646886470; x=1678422470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HaBgjpbZfVTtTKNjir1EsTFf8XFL+KnirMv1xWARbWI=;
 b=CgqNN2qxsbZ4IgKGs5IC6NrHmV3VJqolf7z1vmB5uZ6X/JPcyzmmUNmu
 5kZhLasgIWx3wRXI9NIkCReFF2+ORh9WLrmRITR6OF7w3w2fmtF3UwnXt
 OLEdlS4u0i/nN0nQcyFnkwAr+L8rbNVvsu+71hZKwevo1drz59E3x9c1N
 lPALoznziCzn8GvfPIUlURW1pUz3l4SFH7hvN4ngZpMU+lzICwT5zCXjv
 5RwDb50frFyXH+4J5LU0o1Bk+28iFMrT0A83q+wlbeKtgHbVIyk6uVG00
 /qCwae0w6sEbQJPzbGNRLkCM+AyPoqDymxXws9OePL2qZRxe+WNk+pAjB g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="318380899"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="318380899"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 20:27:32 -0800
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="547884695"
Received: from ttahmed-mobl2.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.50.225])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 20:27:32 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/10] ASoC: SOF: imx: Convert to use the generic
 set_stream_data_offset ops
Date: Wed,  9 Mar 2022 20:27:19 -0800
Message-Id: <20220310042720.976809-10-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310042720.976809-1-ranjani.sridharan@linux.intel.com>
References: <20220310042720.976809-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Switch from the IPC dependent ipc_pcm_params() ops to the IPC neutral
set_stream_data_offset().

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c  | 4 ++--
 sound/soc/sof/imx/imx8m.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index f6baecbb57fb..825bd2b9b7a1 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -509,7 +509,7 @@ static const struct snd_sof_dsp_ops sof_imx8_ops = {
 	.get_window_offset	= imx8_get_window_offset,
 
 	.ipc_msg_data	= sof_ipc_msg_data,
-	.ipc_pcm_params	= sof_ipc_pcm_params,
+	.set_stream_data_offset = sof_set_stream_data_offset,
 
 	/* module loading */
 	.load_module	= snd_sof_parse_module_memcpy,
@@ -572,7 +572,7 @@ static const struct snd_sof_dsp_ops sof_imx8x_ops = {
 	.get_window_offset	= imx8_get_window_offset,
 
 	.ipc_msg_data	= sof_ipc_msg_data,
-	.ipc_pcm_params	= sof_ipc_pcm_params,
+	.set_stream_data_offset = sof_set_stream_data_offset,
 
 	/* module loading */
 	.load_module	= snd_sof_parse_module_memcpy,
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 60251486b24b..803d6be6b4fb 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -435,7 +435,7 @@ static const struct snd_sof_dsp_ops sof_imx8m_ops = {
 	.get_window_offset	= imx8m_get_window_offset,
 
 	.ipc_msg_data	= sof_ipc_msg_data,
-	.ipc_pcm_params	= sof_ipc_pcm_params,
+	.set_stream_data_offset = sof_set_stream_data_offset,
 
 	/* module loading */
 	.load_module	= snd_sof_parse_module_memcpy,
-- 
2.25.1

