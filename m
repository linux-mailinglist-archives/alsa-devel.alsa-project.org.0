Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6F038C34F
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 11:37:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C942816BE;
	Fri, 21 May 2021 11:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C942816BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621589834;
	bh=MvxlhhIZifUqC5B1+4VKKJ4fDuqGkmJQ69gE77ogDJE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Slfx7hKYU9oonldtIG69O84r0ltjyQRQXv/KytXvOqF6shVE9xTi+qD6cn1CYs5GD
	 ImzoZmtSNbA+/KwXolqcyhhxNfEL55Nx3rHcl3hT/bjQYu0+8qYuXoEC0HMhfw4wo+
	 ShaOBF/NMQ6IZKeD0pVV7ZwTXpbkTNFG+IO/u1cA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7FF5F804D8;
	Fri, 21 May 2021 11:33:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01F7CF80430; Fri, 21 May 2021 11:33:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16B5AF80430
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 11:33:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16B5AF80430
IronPort-SDR: 4z6wjGiCein5cMagsc3B75OR/L9Giy/LIOFFj6M8TIbZzOnPZYdp+qe25Fk96R8Fp//QB0lGfx
 eONP8fQnsSvA==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="262664202"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="262664202"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 02:33:24 -0700
IronPort-SDR: a6sB6Zf5zAhQM1PFiXf/Zi5EVFVSj5jcrKE5F9xeW0olQ4gfpBZ67twqFSbRPHTk+jLp+32UR2
 WUuAk9bsszYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="475640896"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002.fm.intel.com with ESMTP; 21 May 2021 02:33:22 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 6/7] ASoC: SOF: ops: don't return void value
Date: Fri, 21 May 2021 12:28:03 +0300
Message-Id: <20210521092804.3721324-7-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210521092804.3721324-1-kai.vehmanen@linux.intel.com>
References: <20210521092804.3721324-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, Paul Olaru <paul.olaru@oss.nxp.com>,
 Rander Wang <rander.wang@intel.com>, daniel.baluta@nxp.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Sparse throws the following warning:

sound/soc/sof/ops.h:247:17: error: returning void-valued expression

Remove the useless returns.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ops.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 2763059c3d4b..4a5d6e497f05 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -244,13 +244,13 @@ snd_sof_dsp_set_power_state(struct snd_sof_dev *sdev,
 static inline void snd_sof_dsp_dbg_dump(struct snd_sof_dev *sdev, u32 flags)
 {
 	if (sof_ops(sdev)->dbg_dump)
-		return sof_ops(sdev)->dbg_dump(sdev, flags);
+		sof_ops(sdev)->dbg_dump(sdev, flags);
 }
 
 static inline void snd_sof_ipc_dump(struct snd_sof_dev *sdev)
 {
 	if (sof_ops(sdev)->ipc_dump)
-		return sof_ops(sdev)->ipc_dump(sdev);
+		sof_ops(sdev)->ipc_dump(sdev);
 }
 
 /* register IO */
-- 
2.31.0

