Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FDD2C6A0A
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 17:46:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C908185F;
	Fri, 27 Nov 2020 17:45:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C908185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606495586;
	bh=Gcc+h/PtJBPn1aR5hGhmV4YIr/bJPSf/B1eyl6+8eMY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uSuDFOQZC01eca8eW91MC2iP/pQz4WXeQkW9ulE5w9+EHRgthy6CsJdPLAYb0KqjN
	 gpJiyc3m603nHJft9Xbc4TV2XtQWL1+tiFDGPdVN/qIGNZIe258isDMWCE1/u24rym
	 Tm76/0iRp6Z5HNdEGxYMU00+iqRQwVC9I8ptOcLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B287F804E6;
	Fri, 27 Nov 2020 17:43:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3D29F804DF; Fri, 27 Nov 2020 17:43:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D539BF80268
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 17:43:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D539BF80268
IronPort-SDR: tLzc3SJeprF3LIh9HQqY2OqAbMVyGp75bM/xAG8Nv3h3U+8yz6MMyC4ZBVF6FBrGb6QCn4CLhN
 ci5xzjvpbF9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="234020286"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="234020286"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 08:43:01 -0800
IronPort-SDR: ylgl4DIZjdTZfX6PBqco5ZGFjcBnhxyMEeQ8/uJCjYZnSIXAW08sDxubE3Rn8BSub7de15va4v
 xJD/OkJEFfYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="403933358"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga001.jf.intel.com with ESMTP; 27 Nov 2020 08:42:59 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 4/5] ASoC: SOF: ops: modify the signature of stall op
Date: Fri, 27 Nov 2020 18:40:21 +0200
Message-Id: <20201127164022.2498406-5-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201127164022.2498406-1-kai.vehmanen@linux.intel.com>
References: <20201127164022.2498406-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, Fred Oh <fred.oh@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

From: Fred Oh <fred.oh@linux.intel.com>

Modify the signature of stall op to specify core_mask to stall cores.

Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ops.h      | 4 ++--
 sound/soc/sof/sof-priv.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 77a6ac157d37..95e748b36903 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -48,10 +48,10 @@ static inline int snd_sof_dsp_run(struct snd_sof_dev *sdev)
 	return sof_ops(sdev)->run(sdev);
 }
 
-static inline int snd_sof_dsp_stall(struct snd_sof_dev *sdev)
+static inline int snd_sof_dsp_stall(struct snd_sof_dev *sdev, unsigned int core_mask)
 {
 	if (sof_ops(sdev)->stall)
-		return sof_ops(sdev)->stall(sdev);
+		return sof_ops(sdev)->stall(sdev, core_mask);
 
 	return 0;
 }
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 32d6ceb41fdd..9ba3e3ceed01 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -101,7 +101,7 @@ struct snd_sof_dsp_ops {
 
 	/* DSP core boot / reset */
 	int (*run)(struct snd_sof_dev *sof_dev); /* mandatory */
-	int (*stall)(struct snd_sof_dev *sof_dev); /* optional */
+	int (*stall)(struct snd_sof_dev *sof_dev, unsigned int core_mask); /* optional */
 	int (*reset)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*core_power_up)(struct snd_sof_dev *sof_dev,
 			     unsigned int core_mask); /* optional */
-- 
2.28.0

