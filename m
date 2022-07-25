Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7A85804E3
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 21:55:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5D52857;
	Mon, 25 Jul 2022 21:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5D52857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658778929;
	bh=T4dOidDCV/lIIULIxX+eGw4Js2uDDreViuZMp+lMRYw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Stekm34QiOwXYV3T8GuocAB900iXq7CPA2eab+nT0PHOQsJi510m8Ip8bZH3Xr74E
	 eCMFhSYcleS3hGVnrkHtSo6v9k/9Upc+jTZRElXAuabphZ5bk8Upy2NJOthDyAp37V
	 H9ZZfeAzuMF2s9dD/GyQqojyysXet2YoDUBefYUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD832F80539;
	Mon, 25 Jul 2022 21:54:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5722F804FD; Mon, 25 Jul 2022 21:54:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA2A0F802DF
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 21:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA2A0F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MrLS7e2/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658778839; x=1690314839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T4dOidDCV/lIIULIxX+eGw4Js2uDDreViuZMp+lMRYw=;
 b=MrLS7e2/TCpbdNqADfQQvQxdkrtxR3P52zYeEIXCcDCUuPRuu1YlfNGW
 B0cL3PaaExzClTi5Pbl6aiwaOUlXwcjU6pH4FmPSkTmdqgWeLI1vESBW/
 RPMLq3IsM0eaLfoPkWErUrkhU2rDsG2+MQxLFe20hgS9T/3xAH0AJIwuc
 65BOny+82f4FSRfTPqc/VFQ5wc0d2w8uzz/I2pVmHzgRjiCKKkZv+UM2p
 JcWC9QHp9420TQA+hC8uyNZI/cHgzeuquHuQwBh7Hj0lMlJDI0sOkSTHf
 UhiEjfv8tLkT2+agb+Bh5N0IVtFzGffhbjfck39Oh0MDF61nbxpm29q31 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="270820365"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="270820365"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:53:52 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="627593511"
Received: from mbianco-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.71.159])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:53:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: SOF: Add cont_update_posn to platform parameters
Date: Mon, 25 Jul 2022 14:53:42 -0500
Message-Id: <20220725195343.145603-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725195343.145603-1-pierre-louis.bossart@linux.intel.com>
References: <20220725195343.145603-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Daniel Baluta <daniel.baluta@nxp.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, YC Hung <yc.hung@mediatek.com>,
 Chao Song <chao.song@intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: YC Hung <yc.hung@mediatek.com>

Add cont_update_posn to platform parameters to support
continue update position for platform.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: YC Hung <yc.hung@mediatek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-pcm.c | 3 +++
 sound/soc/sof/sof-priv.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/sof/ipc3-pcm.c b/sound/soc/sof/ipc3-pcm.c
index b97e63d3724a..9c6a84bdeca7 100644
--- a/sound/soc/sof/ipc3-pcm.c
+++ b/sound/soc/sof/ipc3-pcm.c
@@ -115,6 +115,9 @@ static int sof_ipc3_pcm_hw_params(struct snd_soc_component *component,
 			pcm.params.no_stream_position = 1;
 	}
 
+	if (platform_params->cont_update_posn)
+		pcm.params.cont_update_posn = 1;
+
 	dev_dbg(component->dev, "stream_tag %d", pcm.params.stream_tag);
 
 	/* send hw_params IPC to the DSP */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 8bbc94907c62..823583086279 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -126,6 +126,7 @@ struct snd_sof_platform_stream_params {
 	bool use_phy_address;
 	u32 phy_addr;
 	bool no_ipc_position;
+	bool cont_update_posn;
 };
 
 /*
-- 
2.34.1

