Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 004B360E234
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 15:35:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9D7E3BC8;
	Wed, 26 Oct 2022 15:34:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9D7E3BC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666791318;
	bh=HlZwH+VTqSabzxMqXe77Yo1nAcjc60LNfCp7xD53Es0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=miW0YA1kn+swVfIkLAWsy3YolNsw2dXgagCSWG4q9GXDihficXItj2Y+557CgdjAy
	 QbPCUxKStHLXF7QkoGH/i/WAdnY0oqo5EQ3V+8OkSmLT9k2I5y6veXD0h0eX9ZTIKu
	 S98JiiF41cNi7wPu6Ulf6UkIzcAg7GDAhEwZcjWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A541F80557;
	Wed, 26 Oct 2022 15:33:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2158BF80508; Wed, 26 Oct 2022 15:33:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7732FF800BB
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 15:33:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7732FF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Qh4HV2O0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666791214; x=1698327214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HlZwH+VTqSabzxMqXe77Yo1nAcjc60LNfCp7xD53Es0=;
 b=Qh4HV2O0KabVPw7F7yMqYjb3+m0HcsjA4jiqCQb6deTUIOLjNrj1jiva
 WFPu7Wv8lDT/6esP79eBrc/Myv9X414YgZo/uk6dBvZqzWKYXFTo4cKZg
 tPbueC3yRQEc5bT2krI0sjP6zJ/gkl65KlAn2r3Odcsspv0AFh6aDtCyL
 WGxINY2Kgr15EVTw6YZhhK1CfaVK8D3EssUXmTDFtJAEpVMEjK/j6UIms
 XOsffmBhaSesXC22+Dr1oYGjqeUSAqHeb/KjVOJiyVn2x0mBnQrTpOLsz
 /4AGzJ+UQULOvBLPR0FYJVioobGkAdRwqB2GFCnAFAdrKmGGWmy8fowJi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="372155585"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="372155585"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 06:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="609952635"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="609952635"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 26 Oct 2022 06:33:26 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 1/9] ASoC: Intel: avs: Split pcm pages freeing operation
 from hw_free()
Date: Wed, 26 Oct 2022 15:50:06 +0200
Message-Id: <20221026135014.1403705-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221026135014.1403705-1-cezary.rojewski@intel.com>
References: <20221026135014.1403705-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Prepare for introduction of PCM power management support. As freeing
pages during the suspend operation is not desired, separate
snd_pcm_lib_free_pages() from existing avs_dai_fe_hw_free() so that
majority of the code found within it can be reused for standard and PM
flows both.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 293336c2fc63..fea801243d37 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -499,7 +499,7 @@ static int avs_dai_fe_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static int avs_dai_fe_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+static int __avs_dai_fe_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct avs_dma_data *data;
 	struct hdac_ext_stream *host_stream;
@@ -523,9 +523,15 @@ static int avs_dai_fe_hw_free(struct snd_pcm_substream *substream, struct snd_so
 	snd_hdac_stream_cleanup(hdac_stream(host_stream));
 	hdac_stream(host_stream)->prepared = false;
 
-	ret = snd_pcm_lib_free_pages(substream);
-	if (ret < 0)
-		dev_dbg(dai->dev, "Failed to free pages!\n");
+	return ret;
+}
+
+static int avs_dai_fe_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	int ret;
+
+	ret = __avs_dai_fe_hw_free(substream, dai);
+	snd_pcm_lib_free_pages(substream);
 
 	return ret;
 }
-- 
2.25.1

