Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C07B92245CB
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 23:20:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 571EC16B8;
	Fri, 17 Jul 2020 23:20:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 571EC16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595020853;
	bh=2llkUIVI25ZJKn7qESEXwf9mvn4ArRKIVZshEC1zVDw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PuOrAMrO8cpBtBVnov5JvQyf6fZ2ZjX65KZCxjos87ENXqCWcSLNiaM/PXEgvtltq
	 VFIPhGB2j8njqAjbmCFItZTaQ4BBbyox3H5zJDdH6oTUegmQFU+CMzfIJInVbPX0Y1
	 QDGyJs7QWLtEHtscWPnfPgvoHxNKsxmY4cAy8DqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3119EF8023F;
	Fri, 17 Jul 2020 23:16:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12F30F80110; Fri, 17 Jul 2020 23:16:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F62AF8021D
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 23:14:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F62AF8021D
IronPort-SDR: a+MCLr0PxSdoI6zacCXlPAxOyot2jeQ8N73AwftfTMaYPq1MoAYBGPnnW6YvBIUtf15UaqZOOu
 zTZGDUqFNdsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9685"; a="129758213"
X-IronPort-AV: E=Sophos;i="5.75,364,1589266800"; d="scan'208";a="129758213"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2020 14:13:51 -0700
IronPort-SDR: nfyp1ZXONReet9fUIVqolOMXbA5r7dVZ9EidhLiVWb/4CkY7/ChO+nYxQcSP5tA1qAQmA/4/Dy
 68Df6XMilH7A==
X-IronPort-AV: E=Sophos;i="5.75,364,1589266800"; d="scan'208";a="282905794"
Received: from toddjdav-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.240])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2020 14:13:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/6] ASoC: Intel: sof_sdw: avoid crash if invalid DSP topology
 loaded
Date: Fri, 17 Jul 2020 16:13:35 -0500
Message-Id: <20200717211337.31956-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200717211337.31956-1-pierre-louis.bossart@linux.intel.com>
References: <20200717211337.31956-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Rander Wang <rander.wang@linux.intel.com>
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

The mc_private->hdmi_pcm_list is populated by elements loaded during
DSP topology load. Valid topologies for this machine driver will always
have PCM nodes for HDMI, but driver should fail gracefully even in the case
this is not true. Add a sanity check to sof_sdw_hdmi_card_late_probe()
for this case. Without the fix, a null pcm handle gets dereferenced.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_hdmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw_hdmi.c b/sound/soc/intel/boards/sof_sdw_hdmi.c
index 72316d34eed6..99b04bb2f3a0 100644
--- a/sound/soc/intel/boards/sof_sdw_hdmi.c
+++ b/sound/soc/intel/boards/sof_sdw_hdmi.c
@@ -55,6 +55,9 @@ int sof_sdw_hdmi_card_late_probe(struct snd_soc_card *card)
 	if (!ctx->idisp_codec)
 		return 0;
 
+	if (list_empty(&ctx->hdmi_pcm_list))
+		return -EINVAL;
+
 	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct hdmi_pcm,
 			       head);
 	component = pcm->codec_dai->component;
-- 
2.25.1

