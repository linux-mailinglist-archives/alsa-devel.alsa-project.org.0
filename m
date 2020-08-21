Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6538724E1C0
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 22:02:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C4561683;
	Fri, 21 Aug 2020 22:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C4561683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598040130;
	bh=+aGdn+PVwGwCOfmH/euaUVu8il++IYruNuXfqK9+uDU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l1fMp7mDpvAE1rL8u+rECpDRbmG032QUDZK5u2baxEezHU4EvvLtFeAxbKDdaDSJs
	 c3sICyMsInw32h7AFS+oxKlyA1iZ3ICfdAJ8ZinIqR6tLkY2Sc257KaEtfxq6o+bNx
	 LI/DdzzHzaoautXrevJt5ejzA1IaOsJlFH46dvQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 163FBF802FE;
	Fri, 21 Aug 2020 21:56:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB434F802EA; Fri, 21 Aug 2020 21:56:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75FEDF802C2
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 21:56:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75FEDF802C2
IronPort-SDR: KP5/S9O02Y0Eo/FOTqch6VV2HrAZ/ZHYNKrK8IRWHz56MmY7tez25jhZIb/DwgE/zReQ37NPWa
 DFlsyKi9ehRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9720"; a="217158554"
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="217158554"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:19 -0700
IronPort-SDR: mdBeYO3hqwtOnI9pO0gyIifqejAuTxoTvZ/pop8e95t+T3d/v+9D6TgUeiXDIn1L1+8Ozd6yKC
 jUIRXfHRLoMQ==
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="279002411"
Received: from pahnn-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.176.176])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/14] ASoC: codecs: max98373-sdw: add missing test on resume
Date: Fri, 21 Aug 2020 14:55:54 -0500
Message-Id: <20200821195603.215535-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
References: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vinod.koul@intel.com, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

All existing SoundWire codecs follow the same pattern on resume,
except for this codec which doesn't test if the hardware is
initialized.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/max98373-sdw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index 5fe724728e84..6469612c42cb 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -256,6 +256,9 @@ static __maybe_unused int max98373_resume(struct device *dev)
 	struct max98373_priv *max98373 = dev_get_drvdata(dev);
 	unsigned long time;
 
+	if (!max98373->hw_init)
+		return 0;
+
 	if (!slave->unattach_request)
 		goto regmap_sync;
 
-- 
2.25.1

