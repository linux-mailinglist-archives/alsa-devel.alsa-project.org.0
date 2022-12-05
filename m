Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D2B6424C9
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 09:38:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DE521767;
	Mon,  5 Dec 2022 09:37:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DE521767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670229503;
	bh=Dkk3vruKcuTKAa07QIz7BbG/O+nO0F12C0SGGoHh5f0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dsNEG9u/n9iZWFQrPa5iuDIgcTShbFOF19g79Fd5MXdX0MwR2PVr70c2F2T/Kw4A+
	 yd9Y4AbdWEuxmBd/cN+7uTH+OcGz4WHBESJV1zN5bylTOKBVkORioImViGqupmtSZY
	 6jbivN5qUZL7L5TtyV4Ha3k7rjseNBEC88GHeSZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E533CF80566;
	Mon,  5 Dec 2022 09:36:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B13EF8052E; Mon,  5 Dec 2022 09:36:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56B63F8047C
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 09:36:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56B63F8047C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CSMCbr6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670229395; x=1701765395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dkk3vruKcuTKAa07QIz7BbG/O+nO0F12C0SGGoHh5f0=;
 b=CSMCbr6lswNj3+PVU3KNyoxj62kJ2mWUOt6ZckqbROTWBblT3I3+x7+p
 KVwgHO0UllbTR30KmIvZbGfWUjCYaQ/JdF7xh+KOq3cdAEhCTtjoeCkre
 cvlgL+sAPwDaSfFWsA7ECB1XuFpf9pmweSIHTIsji6w4U9Gwvp+5IuGZI
 peOtcJmpF6DC9Qcv5oG3NCHMYIzaUjAuBtXhU4kkcgtT4Tu+zJJf8ox3P
 14KvESTpWogaAMpwqIi9CEmt5k51zzwLOeeo/LunV2dfvAf++BQ9ym8ZH
 iKFVHAy/KF2BdKMMKM7T/LfOkUyirKG+49jjM1BeAGWUvJofp/iagOezP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="343288322"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; d="scan'208";a="343288322"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 00:36:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="647866191"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; d="scan'208";a="647866191"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 05 Dec 2022 00:36:30 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 3/6] ASoC: Intel: Skylake: Drop pipe_config_idx
Date: Mon,  5 Dec 2022 09:53:27 +0100
Message-Id: <20221205085330.857665-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205085330.857665-1-cezary.rojewski@intel.com>
References: <20221205085330.857665-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Field ->pipe_config_idx duplicates the job of ->cur_config_idx so
remove it.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-topology.c | 10 +++++-----
 sound/soc/intel/skylake/skl-topology.h |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index f144acae1b44..567a3b661ce4 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -1351,9 +1351,9 @@ static int skl_tplg_multi_config_set_get(struct snd_kcontrol *kcontrol,
 		return -EIO;
 
 	if (is_set)
-		pipe->pipe_config_idx = ucontrol->value.enumerated.item[0];
+		pipe->cur_config_idx = ucontrol->value.enumerated.item[0];
 	else
-		ucontrol->value.enumerated.item[0]  =  pipe->pipe_config_idx;
+		ucontrol->value.enumerated.item[0] = pipe->cur_config_idx;
 
 	return 0;
 }
@@ -1814,11 +1814,11 @@ static int skl_tplg_be_fill_pipe_params(struct snd_soc_dai *dai,
 	if (ret)
 		goto err;
 
-	dev_dbg(skl->dev, "%s using pipe config: %d\n", __func__, pipe->pipe_config_idx);
+	dev_dbg(skl->dev, "%s using pipe config: %d\n", __func__, pipe->cur_config_idx);
 	if (pipe->direction == SNDRV_PCM_STREAM_PLAYBACK)
-		pipe_fmt = &pipe->configs[pipe->pipe_config_idx].out_fmt;
+		pipe_fmt = &pipe->configs[pipe->cur_config_idx].out_fmt;
 	else
-		pipe_fmt = &pipe->configs[pipe->pipe_config_idx].in_fmt;
+		pipe_fmt = &pipe->configs[pipe->cur_config_idx].in_fmt;
 
 	/* update the blob based on virtual bus_id*/
 	cfg = intel_nhlt_get_endpoint_blob(dai->dev, skl->nhlt,
diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
index 017ac0ef324d..6db0fd7bad49 100644
--- a/sound/soc/intel/skylake/skl-topology.h
+++ b/sound/soc/intel/skylake/skl-topology.h
@@ -324,7 +324,6 @@ struct skl_pipe {
 	struct skl_path_config configs[SKL_MAX_PATH_CONFIGS];
 	struct list_head w_list;
 	bool passthru;
-	u32 pipe_config_idx;
 };
 
 enum skl_module_state {
-- 
2.25.1

