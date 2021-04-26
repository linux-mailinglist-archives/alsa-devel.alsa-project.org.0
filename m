Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4DF36BB5D
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 23:50:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD9FA16FD;
	Mon, 26 Apr 2021 23:49:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD9FA16FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619473827;
	bh=SugEg0UHumQ2WhgN2v6Xigujv0lQs0ITAQ2ZwIGW61s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f4t5rdkMzrX5B/h0HyZi5xilVrLoPYOB09vxLnwb4x2sc1ky/uIxN60wj9uKGs49N
	 WNf638MKMKUMk0LbdYecya7UUtooePTYF1PfFT1OQX7UaINq8g/NPKemw2P107tMYK
	 7bhhyP2keZlftmlqomkAT/kvfUOyRHAqJhk+gA2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6E19F8049C;
	Mon, 26 Apr 2021 23:47:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ABCCF8032D; Mon, 26 Apr 2021 23:47:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7A4BF80171
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 23:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7A4BF80171
IronPort-SDR: mGBZBi+Y0IzzDEosXi+i2+E/FW4BzhDqtKrite6FFgc8gGaaQWUZ1kaFeA5qcqE8xtSfH5iOgG
 ZWJi//sjNOyg==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="260363962"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="260363962"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 14:47:21 -0700
IronPort-SDR: rC5dBULe7sBhXlgAzjzQ5nYVhVTnwvJrzm1rZBX9OmUFOlWplyM0bt3DBOcL4M9Wg4zCG8R3rx
 81rnzHPXqfsA==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="422810285"
Received: from bcochran-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.24.80])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 14:47:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: fsl: imx-pcm-rpmsg: remove useless initialization
Date: Mon, 26 Apr 2021 16:47:01 -0500
Message-Id: <20210426214701.235106-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426214701.235106-1-pierre-louis.bossart@linux.intel.com>
References: <20210426214701.235106-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

cppcheck warning:

sound/soc/fsl/imx-pcm-rpmsg.c:547:18: style: Variable 'written_num' is
assigned a value that is never used. [unreadVariable]
 int written_num = 0;
                 ^
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 875c0d6df339..6d883a10efd1 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -544,7 +544,7 @@ static int imx_rpmsg_pcm_ack(struct snd_soc_component *component,
 	struct rpmsg_msg *msg;
 	unsigned long flags;
 	int buffer_tail = 0;
-	int written_num = 0;
+	int written_num;
 
 	if (!rpmsg->force_lpa)
 		return 0;
-- 
2.25.1

