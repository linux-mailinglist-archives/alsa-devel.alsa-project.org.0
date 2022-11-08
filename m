Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAAE6204A9
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 01:25:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 720FA207;
	Tue,  8 Nov 2022 01:24:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 720FA207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667867109;
	bh=NuC8kKBrfvp08/rez3oFrzAks7/tQGO1pKDAS8gvr5Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K77A9eubfE6lxX4+s9/STtDTkp5rQIziHRaSZkjoZSpcdwJ53YfE22rhL2HRWtkhP
	 PIqcxV3J4mItmR9di8DBD1nvyYxbdqe7Q6ejIY9+nC/2S4zEJI1SVePRddBTttm1CL
	 VEsW0RmUcPWC9sGklcj1w97x0L2V7uFWqawNN8Ho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 304CFF804BD;
	Tue,  8 Nov 2022 01:24:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3BEAF804D0; Tue,  8 Nov 2022 01:23:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,TVD_SPACE_RATIO,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60D75F80116
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 01:23:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60D75F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NqkpdC/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667867034; x=1699403034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NuC8kKBrfvp08/rez3oFrzAks7/tQGO1pKDAS8gvr5Q=;
 b=NqkpdC/+7HI+vM4KhqCu1/92pQtLnU+d957F8Bz29hMYbVeQkKWrm1El
 iFOLshBxPbQKpbRNWQSrU6+8sjmURAb2rT9zQLYezRGNJYTuVYCDq2tWG
 d/sFk55kB2J3baJDL45LQsKTYhRhxcceG9I3BBPTEt85uQqwIck+0uL6i
 cDeUNwPIii9nji4hNbWDcP1kv572EixIr/A7wgZbqVOr24uaInC19kiI0
 ZvjPWs1ExSVuIK6jC8xcRm3SGirqWkp+nm5n7WuG46x7Jp6a+TpxcUk4Z
 C/lZph0wycZpPYecE15RVgkLIeQiPMLRYcJtzbMkSchGy3mtUjmvkvxH+ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="293927269"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="293927269"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 16:23:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="614070231"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="614070231"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 16:23:44 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 1/3] ASoC: SOF: ipc4-topology: rename sof_ipc4_widget_free_comp
Date: Tue,  8 Nov 2022 08:29:08 +0800
Message-Id: <20221108002910.2819709-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221108002910.2819709-1-yung-chuan.liao@linux.intel.com>
References: <20221108002910.2819709-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com,
 ranjani.sridharan@linux.intel.com
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

sof_ipc4_widget_free_comp is dedicated to pipeline. Rename it
to sof_ipc4_widget_free_comp_pipeline.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index ab85dde4303b..4f056adc7181 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -280,7 +280,7 @@ static void sof_ipc4_free_audio_fmt(struct sof_ipc4_available_audio_format *avai
 	available_fmt->out_audio_fmt = NULL;
 }
 
-static void sof_ipc4_widget_free_comp(struct snd_sof_widget *swidget)
+static void sof_ipc4_widget_free_comp_pipeline(struct snd_sof_widget *swidget)
 {
 	kfree(swidget->private);
 }
@@ -1884,7 +1884,8 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TY
 				  dai_token_list, ARRAY_SIZE(dai_token_list), NULL,
 				  sof_ipc4_prepare_copier_module,
 				  sof_ipc4_unprepare_copier_module},
-	[snd_soc_dapm_scheduler] = {sof_ipc4_widget_setup_comp_pipeline, sof_ipc4_widget_free_comp,
+	[snd_soc_dapm_scheduler] = {sof_ipc4_widget_setup_comp_pipeline,
+				    sof_ipc4_widget_free_comp_pipeline,
 				    pipeline_token_list, ARRAY_SIZE(pipeline_token_list), NULL,
 				    NULL, NULL},
 	[snd_soc_dapm_pga] = {sof_ipc4_widget_setup_comp_pga, sof_ipc4_widget_free_comp_pga,
-- 
2.25.1

