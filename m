Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 068216424C7
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 09:37:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43B861741;
	Mon,  5 Dec 2022 09:37:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43B861741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670229475;
	bh=B/QzYcOylHgO5bXZk2VAURwLxYtGW6UmIy1vJ5Yjpek=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Om/Xkv5ClDAfKc0VHT1Q/WrbQjdaNE1H8q6fS/eXk04D+z0iN5Rkyd1bOns+Qxp/c
	 6eZwxkyxIZs1wg06tYzir/GKuVGpVycbW6gIRc7rR5Bo7oebo7SwsclAEGhN8orCHo
	 m/Oc+O9KcweC7Z79B/RFs3tlU7QlhoNQMU7MCJtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E296CF80533;
	Mon,  5 Dec 2022 09:36:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0ED1F80533; Mon,  5 Dec 2022 09:36:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1FE3F80155
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 09:36:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1FE3F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FX8tpVyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670229393; x=1701765393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B/QzYcOylHgO5bXZk2VAURwLxYtGW6UmIy1vJ5Yjpek=;
 b=FX8tpVyY7SXzQU6Qe9aTtgZu5Da6xk8Cmbl5iMh5Q8BM5BFItCgpPkAQ
 GtbZYjWdrrbeKbogyyurhQkNwlBA+SaUAuvzudkBMXLp/rh7AAm3iqSOA
 Mk4SAzXHXG5DR8vhAGi1ZWHHPEiU6DddkGuxTz7XL9WYwycbNhAcOzAjJ
 e7lDYMNMDS0JlCkynhOwNt6EKSWRfn4fNTMkN/brKXIxDj2dZF9lnPalE
 DXOKBhA4W9b3P68u5FKLh4gP6mDo/W+NKKhdQZc1ORRptgFqfO1fLXtpS
 uhWXkYfDnawd1/SB91ldOnIE2yC1YtCRdm+OS7ZMidM8Ynx2vL1YmMxpV A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="343288271"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; d="scan'208";a="343288271"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 00:36:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="647866116"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; d="scan'208";a="647866116"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 05 Dec 2022 00:36:25 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 1/6] ASoC: Intel: Skylake: Update pipe_config_idx before
 filling BE params
Date: Mon,  5 Dec 2022 09:53:25 +0100
Message-Id: <20221205085330.857665-2-cezary.rojewski@intel.com>
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

Without updating the index before BE copier config is filled with
hardware parameters, outdated parameters are used instead.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-topology.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index e06eac592da1..fc3d719d93e1 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -1837,16 +1837,24 @@ static int skl_tplg_be_fill_pipe_params(struct snd_soc_dai *dai,
 {
 	struct nhlt_specific_cfg *cfg;
 	struct skl_pipe *pipe = mconfig->pipe;
+	struct skl_pipe_params save = *pipe->p_params;
 	struct skl_pipe_fmt *pipe_fmt;
 	struct skl_dev *skl = get_skl_ctx(dai->dev);
 	int link_type = skl_tplg_be_link_type(mconfig->dev_type);
 	u8 dev_type = skl_tplg_be_dev_type(mconfig->dev_type);
+	int ret;
 
 	skl_tplg_fill_dma_id(mconfig, params);
 
 	if (link_type == NHLT_LINK_HDA)
 		return 0;
 
+	*pipe->p_params = *params;
+	ret = skl_tplg_get_pipe_config(skl, mconfig);
+	if (ret)
+		goto err;
+
+	dev_dbg(skl->dev, "%s using pipe config: %d\n", __func__, pipe->pipe_config_idx);
 	if (pipe->direction == SNDRV_PCM_STREAM_PLAYBACK)
 		pipe_fmt = &pipe->configs[pipe->pipe_config_idx].out_fmt;
 	else
@@ -1865,10 +1873,15 @@ static int skl_tplg_be_fill_pipe_params(struct snd_soc_dai *dai,
 		dev_err(dai->dev, "Blob NULL for id:%d type:%d dirn:%d ch:%d, freq:%d, fmt:%d\n",
 			mconfig->vbus_id, link_type, params->stream,
 			params->ch, params->s_freq, params->s_fmt);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err;
 	}
 
 	return 0;
+
+err:
+	*pipe->p_params = save;
+	return ret;
 }
 
 static int skl_tplg_be_set_src_pipe_params(struct snd_soc_dai *dai,
-- 
2.25.1

