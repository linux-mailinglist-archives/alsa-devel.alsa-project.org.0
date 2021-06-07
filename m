Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7090C39E994
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 00:27:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED46C1685;
	Tue,  8 Jun 2021 00:26:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED46C1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623104825;
	bh=bjBarmyeG2kQJirSHoweQQRDfeIPGd6W/OH52uTuh+0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S+xU9diyw3AVfZsXAIk8bwx8Cbabl2apdPNDrdOWj30YFW2fNIZQy66N+GsU3u6gi
	 ULNaQ19ZXza8g/2pjzjpq1/MGyo1pPQ/t79ZRGzBIdvnj0c3BWR8jGvI0udeRB6f3J
	 HNCCA0OQd3R4pswIcPh2oFLGM6I6+/GaUiNDNIMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4851FF804F2;
	Tue,  8 Jun 2021 00:23:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3B55F804E5; Tue,  8 Jun 2021 00:23:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0839EF80212
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 00:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0839EF80212
IronPort-SDR: g1QaTynFeU5J6yJe/y3yUypTodEY4eKOAd7PfToOmiXrZTRwmhs6iBQGLOgZOHHTKdRNpA/PPy
 6m/Hu5YHbTyQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="202867369"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="202867369"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:07 -0700
IronPort-SDR: h4IG4qHvMVbzmn4ScWCIzdCaui+99SVtm8iVFbe8Qfxk0eQ76TnnDSX/Va6Gp7OzwTkvG6eIkd
 IOwefsR3zaEQ==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="449270980"
Received: from ticela-or-160.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.108.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/15] ASoC: rt700-sdw: use first_hw_init flag on resume
Date: Mon,  7 Jun 2021 17:22:30 -0500
Message-Id: <20210607222239.582139-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607222239.582139-1-pierre-louis.bossart@linux.intel.com>
References: <20210607222239.582139-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Ryan Lee <ryans.lee@maximintegrated.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Shuming Fan <shumingf@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>, Bard Liao <bard.liao@intel.com>
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

The intent of the status check on resume was to verify if a SoundWire
peripheral reported ATTACHED before waiting for the initialization to
complete. This is required to avoid timeouts that will happen with
'ghost' devices that are exposed in the platform firmware but are not
populated in hardware.

Unfortunately we used 'hw_init' instead of 'first_hw_init'. Due to
another error, the resume operation never timed out, but the volume
settings were not properly restored.

BugLink: https://github.com/thesofproject/linux/issues/2908
BugLink: https://github.com/thesofproject/linux/issues/2637
Fixes: 7d2a5f9ae41e3 ('ASoC: rt700: add rt700 codec driver')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
---
 sound/soc/codecs/rt700-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index ff9c081fd52a..d1d9c0f455b4 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -498,7 +498,7 @@ static int __maybe_unused rt700_dev_resume(struct device *dev)
 	struct rt700_priv *rt700 = dev_get_drvdata(dev);
 	unsigned long time;
 
-	if (!rt700->hw_init)
+	if (!rt700->first_hw_init)
 		return 0;
 
 	if (!slave->unattach_request)
-- 
2.25.1

