Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD48640A89
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 17:24:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5A961895;
	Fri,  2 Dec 2022 17:23:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5A961895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669998251;
	bh=B/QzYcOylHgO5bXZk2VAURwLxYtGW6UmIy1vJ5Yjpek=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OX1txSvpPPg+Qw28K1fbhMI4FFapatsMqdUs7kZesZoFD0EF4LXgEZoXNHzAa2qse
	 zmVqErXDsVzHwjaznfoXFiruQvI3Fmt2Q4/OT5inakyYrLzkDAXUX12C1gb7wev5vD
	 soK2/x35sIkFo6C45/0QlIp+x+6GSE8IO992Xblg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6C8DF80558;
	Fri,  2 Dec 2022 17:22:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23A17F804FC; Fri,  2 Dec 2022 17:22:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72F7AF80272
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 17:22:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72F7AF80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lPs7tvFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669998168; x=1701534168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B/QzYcOylHgO5bXZk2VAURwLxYtGW6UmIy1vJ5Yjpek=;
 b=lPs7tvFvJ0nsilyzk+Xr65nhmXMdrvZymorGKtjOQAPARei2qPTEz4q8
 JPAHY66Frq2+BHkz9yc361CF1afzB+W/HPYYRpPI1U7PFqvtMeeDimaSU
 socA9EjB4Q09rK13sybKJ17+DmPAH867UkjxcPejAeStAdjfwpkcfHiDi
 OpXUurZ01vQhwStscuD5a3yDXUO4KfNvN4vEI63Bn0NoP72Zv2JzrBocr
 SeFyU7gN0vwsWoPXeGCD3XV3/oAYWm+4a0Im6WIe12LfPgJvuPnwrdZX5
 WQVFrjn7XHzvFdusBtxhGsmknMV8erknZvDlmIW5Z54/NNkJnmGSdrhda A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="314689478"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="314689478"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 08:22:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="733858970"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="733858970"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Dec 2022 08:22:43 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/5] ASoC: Intel: Skylake: Update pipe_config_idx before
 filling BE params
Date: Fri,  2 Dec 2022 17:39:41 +0100
Message-Id: <20221202163945.674746-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221202163945.674746-1-cezary.rojewski@intel.com>
References: <20221202163945.674746-1-cezary.rojewski@intel.com>
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

