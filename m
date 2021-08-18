Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 504283EFE5F
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 09:57:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7C941683;
	Wed, 18 Aug 2021 09:56:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7C941683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629273442;
	bh=m28kiWPYX71XwZSJJbIWDMN6sjiqOwXJW0u0OJXjsdk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m4893eGStrBE90snc0nVLLDyD1vDw7vqZQnM/6dG98hTccDtA4qUtCIyTefVB5XN3
	 VQKVj6ctGUAPlkTaI0pjNgJ3qIf2v0c+XLtpWM5JM7Jyd2giYOy1nc+5gyZGvwhBdu
	 N5FYiVYnIggWRt9yrbBOy4IVIXzN0UgioHE0YRMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AA65F804E3;
	Wed, 18 Aug 2021 09:55:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B805F804E6; Wed, 18 Aug 2021 09:55:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 033AEF802BE
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 09:55:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 033AEF802BE
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="195855498"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="195855498"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 00:55:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="676974758"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 18 Aug 2021 00:55:02 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/11] ASoC: Intel: Skylake: Select proper format for NHLT blob
Date: Wed, 18 Aug 2021 09:57:34 +0200
Message-Id: <20210818075742.1515155-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818075742.1515155-1-cezary.rojewski@intel.com>
References: <20210818075742.1515155-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, jairaj.arava@intel.com,
 upstream@semihalf.com, Lewandowski@alsa-project.org, harshapriya.n@intel.com,
 cujomalainey@google.com, tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 Gustaw <gustaw.lewandowski@linux.intel.com>, hdegoede@redhat.com,
 broonie@kernel.org, jenny.tc@intel.com,
 Piotr Maziarz <piotrx.maziarz@linux.intel.com>, lma@semihalf.com,
 vamshi.krishna.gopal@intel.com
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

From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>

Use actual pipeline format, not PCM format for blob selection. Otherwise
selected blobs are not correct in pipelines with format conversion
e.g.: SRC module.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Signed-off-by: Lewandowski, Gustaw <gustaw.lewandowski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-topology.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 45b1521e6189..054c080b7289 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -1821,7 +1821,7 @@ static u8 skl_tplg_be_link_type(int dev_type)
  * Fill the BE gateway parameters
  * The BE gateway expects a blob of parameters which are kept in the ACPI
  * NHLT blob, so query the blob for interface type (i2s/pdm) and instance.
- * The port can have multiple settings so pick based on the PCM
+ * The port can have multiple settings so pick based on the pipeline
  * parameters
  */
 static int skl_tplg_be_fill_pipe_params(struct snd_soc_dai *dai,
@@ -1829,6 +1829,8 @@ static int skl_tplg_be_fill_pipe_params(struct snd_soc_dai *dai,
 				struct skl_pipe_params *params)
 {
 	struct nhlt_specific_cfg *cfg;
+	struct skl_pipe *pipe = mconfig->pipe;
+	struct skl_pipe_fmt *pipe_fmt;
 	struct skl_dev *skl = get_skl_ctx(dai->dev);
 	int link_type = skl_tplg_be_link_type(mconfig->dev_type);
 	u8 dev_type = skl_tplg_be_dev_type(mconfig->dev_type);
@@ -1838,20 +1840,23 @@ static int skl_tplg_be_fill_pipe_params(struct snd_soc_dai *dai,
 	if (link_type == NHLT_LINK_HDA)
 		return 0;
 
+	if (pipe->direction == SNDRV_PCM_STREAM_PLAYBACK)
+		pipe_fmt = &pipe->configs[pipe->pipe_config_idx].out_fmt;
+	else
+		pipe_fmt = &pipe->configs[pipe->pipe_config_idx].in_fmt;
+
 	/* update the blob based on virtual bus_id*/
 	cfg = skl_get_ep_blob(skl, mconfig->vbus_id, link_type,
-					params->s_fmt, params->ch,
-					params->s_freq, params->stream,
+					pipe_fmt->bps, pipe_fmt->channels,
+					pipe_fmt->freq, pipe->direction,
 					dev_type);
 	if (cfg) {
 		mconfig->formats_config.caps_size = cfg->size;
 		mconfig->formats_config.caps = (u32 *) &cfg->caps;
 	} else {
-		dev_err(dai->dev, "Blob NULL for id %x type %d dirn %d\n",
-					mconfig->vbus_id, link_type,
-					params->stream);
-		dev_err(dai->dev, "PCM: ch %d, freq %d, fmt %d\n",
-				 params->ch, params->s_freq, params->s_fmt);
+		dev_err(dai->dev, "Blob NULL for id:%d type:%d dirn:%d ch:%d, freq:%d, fmt:%d\n",
+			mconfig->vbus_id, link_type, params->stream,
+			params->ch, params->s_freq, params->s_fmt);
 		return -EINVAL;
 	}
 
-- 
2.25.1

