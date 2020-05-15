Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC911D4FF9
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 16:06:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB306845;
	Fri, 15 May 2020 16:05:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB306845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589551579;
	bh=6S/43w1l9+/+y+YvvpP2mj8a4LlskEu9z9gXvYisrfM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dNem6fx/wEytXaqW0dsjBb4yFoBINXcXifsajaZzd16pLk37cDR2zNZiidJaU58xq
	 gCgM2SaaNKKPRTDfgmK7eVAEhXm1Gnv7PL8mU2/1eFyuOxwFxPU+I5moQEgIqVGUlE
	 x4Vafrh5lFwJMXx3ZXwZW2qy8phhc22jjpNUbMiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17E0DF802E3;
	Fri, 15 May 2020 16:01:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2492AF802A1; Fri, 15 May 2020 16:00:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AC15F80254
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 16:00:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AC15F80254
IronPort-SDR: V0qp/cGFMlGjCqy/kwoZxISLvNQfst4JLcyDCkbE6Lhp/L3wwQpxJwsywAU+r3/QWLKjNT94Ss
 1rnf1p6Lt0eg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 07:00:46 -0700
IronPort-SDR: jYZhb/aDaqkDjSa7AUuHsOLIF1FZT9GTD00PmhSrOrpoxCRu1aPu2qlqb3RlIC+0kO0oxzhOQS
 iuZbqsY1RchQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; d="scan'208";a="266611164"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga006.jf.intel.com with ESMTP; 15 May 2020 07:00:45 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 7/8] ASoC: SOF: imx: make dsp_ops static
Date: Fri, 15 May 2020 16:59:57 +0300
Message-Id: <20200515135958.17511-8-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200515135958.17511-1-kai.vehmanen@linux.intel.com>
References: <20200515135958.17511-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: daniel.baluta@nxp.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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

This was in the SOF tree but lost in upstream contributions

Fixes: 202acc565a1f05 ("ASoC: SOF: imx: Add i.MX8 HW support")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 68b2edccd791..63f9c20a1bac 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -119,7 +119,7 @@ static void imx8_dsp_handle_request(struct imx_dsp_ipc *ipc)
 	snd_sof_ipc_msgs_rx(priv->sdev);
 }
 
-struct imx_dsp_ops dsp_ops = {
+static struct imx_dsp_ops dsp_ops = {
 	.handle_reply		= imx8_dsp_handle_reply,
 	.handle_request		= imx8_dsp_handle_request,
 };
-- 
2.26.0

