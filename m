Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE1B31F253
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 23:32:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DAC8166C;
	Thu, 18 Feb 2021 23:31:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DAC8166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613687545;
	bh=RRDAAwM6mBT3yKDWWKU0Us5/ZgYFs8FM/p73cXtkoEc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jO+tKQ6eUV6NIfFdoZYsNZY1UU3cFrZbXgaaXNk6kQ+uklCfs2b4RNF+P56ztR700
	 UJGEscs0fqp/OdU6iKDbDZ7uuOFwDksJyEzaUK4Fqd1XRUr0IZ2Ucx8YdQx/zYNR7k
	 qdJB5YzmiKDOFPgTBtSAA642iOLXT56/y+SCvxsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20064F802A9;
	Thu, 18 Feb 2021 23:30:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87991F802CA; Thu, 18 Feb 2021 23:29:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16BA2F801DB
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 23:29:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16BA2F801DB
IronPort-SDR: KR1+nXp60tv51aAPsW2k2Qyu5AxWKdRA7QtfODr2DX/mNfBCxnIRsFaPkdrtbPc63awyAUBTiJ
 gaxJ5jnI0SFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="182875620"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="182875620"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:37 -0800
IronPort-SDR: qilVjG95BwFELVbeFI1b+2Gu0zscS8E4FX48eU/3+pFwz0+yhyFIfN+ksZbSJnnpdGLW0FS/Pj
 STK95rM+PxLA==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="364990834"
Received: from tphilli1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.38])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:36 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/10] ASoC: qcom: q6dsp-dai: clarify expression
Date: Thu, 18 Feb 2021 16:29:09 -0600
Message-Id: <20210218222916.89809-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
References: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org,
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

sound/soc/qcom/qdsp6/q6afe-dai.c:264:35: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
  tdm->slot_mask = (dai->id & 0x1 ? tx_mask : rx_mask) & cap_mask;
                                  ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index 4e1f101281e7..3b52abec6a93 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -261,7 +261,7 @@ static int q6tdm_set_tdm_slot(struct snd_soc_dai *dai,
 		tdm->nslots_per_frame = slots;
 		tdm->slot_width = slot_width;
 		/* TDM RX dais ids are even and tx are odd */
-		tdm->slot_mask = (dai->id & 0x1 ? tx_mask : rx_mask) & cap_mask;
+		tdm->slot_mask = ((dai->id & 0x1) ? tx_mask : rx_mask) & cap_mask;
 		break;
 	default:
 		dev_err(dai->dev, "%s: invalid dai id 0x%x\n",
-- 
2.25.1

