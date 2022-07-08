Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A3356C12D
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 22:07:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B39E5850;
	Fri,  8 Jul 2022 22:07:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B39E5850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657310878;
	bh=ZIMjVpQcWRLJTPHIWqT1n1zDZfPz3GxgdZWkW9wn9ao=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=unJkluhCBElGcgIN70mJU+EXs0JPCsr3mPmQ2UaE7fhna+CimZswCsC3NIkaC/6Jw
	 RIWhJ0NcwP2mZWItRthk4cdgpdA1eGifEut32X/mCLmXVWrJRdsWdXVXwqLSoJ2yub
	 IaxvMbMI1mbqBm4yg+TvADyhvnlkIP7t5EInV27M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A66DF80538;
	Fri,  8 Jul 2022 22:07:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F80FF8053D; Fri,  8 Jul 2022 22:07:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBA48F8028B
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 22:06:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBA48F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Aptai/ta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657310821; x=1688846821;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZIMjVpQcWRLJTPHIWqT1n1zDZfPz3GxgdZWkW9wn9ao=;
 b=Aptai/taytZDasSiQoSqJ/FZ19y1hUQ8zqhzELUmjPRTX+Z/0CZLo/nh
 8pH4G0dkzUYY+mTnMoeTYQTLNqzd5CLe74Kcg8W98lgNDdXMFmaSur0ZT
 cN1ow6Aqk/w+npUd/VDkNA1g6v556R3hpD95yaApAaEDWkJq5PI0fW+n2
 DbPMSvH4H5Ral/lcyZRquURqCUq1C0NXYxwotseNs4lH60w3N9z/BAigl
 OjmFUyrIhSIDDY+YpdaNB8cZMVa0iat+JL4UC+67TWQPEM0NJtC5v+G8E
 73CERspGkaLVdxi7sPG4h8zGlLoCA88z2X5NlEQ+U7lP3vmz8uTUNj6xE Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="264769268"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="264769268"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 13:06:51 -0700
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="544324599"
Received: from gcisnero-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.87.49])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 13:06:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: soc-pcm: demote warnings on non-atomic BE connection
Date: Fri,  8 Jul 2022 15:06:41 -0500
Message-Id: <20220708200641.26923-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

When an FE, typically non-atomic, is connected to an atomic BE, we
force the BE as non-atomic. There's no reason to throw a warning, this
is a perfectly fine configuration and a conversion that's required
by-design.

This removes the unconditional warnings such as

[   12.054213]  iDisp1: dpcm_be_connect: FE is nonatomic but BE is not, forcing BE as nonatomic
[   12.074693]  iDisp2: dpcm_be_connect: FE is nonatomic but BE is not, forcing BE as nonatomic
[   12.096612]  iDisp3: dpcm_be_connect: FE is nonatomic but BE is not, forcing BE as nonatomic
[   12.118637]  iDisp4: dpcm_be_connect: FE is nonatomic but BE is not, forcing BE as nonatomic
[   12.140660]  dmic01: dpcm_be_connect: FE is nonatomic but BE is not, forcing BE as nonatomic
[   12.147521]  dmic16k: dpcm_be_connect: FE is nonatomic but BE is not, forcing BE as nonatomic

and demotes them to dev_dbg(), as suggested in review comments.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/soc-pcm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index a827cc3c158a..5b99bf2dbd08 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1209,8 +1209,7 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 		return -EINVAL;
 	}
 	if (fe_substream->pcm->nonatomic && !be_substream->pcm->nonatomic) {
-		dev_warn(be->dev, "%s: FE is nonatomic but BE is not, forcing BE as nonatomic\n",
-			 __func__);
+		dev_dbg(be->dev, "FE is nonatomic but BE is not, forcing BE as nonatomic\n");
 		be_substream->pcm->nonatomic = 1;
 	}
 
-- 
2.34.1

