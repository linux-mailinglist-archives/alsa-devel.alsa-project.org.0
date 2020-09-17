Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FC326D9C1
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 13:01:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B36FC1690;
	Thu, 17 Sep 2020 13:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B36FC1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600340500;
	bh=f6eee3CIKhb/jNrmW3Gwnq3+wMd2imeGLZwNv257hqE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SpQXTSArBiTpeZKT7aUKtUqDxDBKwSrcRc+b11XkGOfrykRTag90aytFF8Btr4GGE
	 fc2jcZYFccyAfSp3b3ENjSHZ+WTos3rfVYlfuXnYTf1Ho5svlJnmfVkIRUTa9pl3ab
	 0jOFOVQqhgEHNYqjbBi/e6bGi8ra61TZMMzvXLWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA615F802E9;
	Thu, 17 Sep 2020 12:58:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 977BDF802DC; Thu, 17 Sep 2020 12:58:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E58FF80276
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 12:58:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E58FF80276
IronPort-SDR: ZxcFjVzV2+ujOY69YVFV2QsHdITbu2Z6cxP272Pdha591X2c24yz7HuG0e6OBoRgwd8LXsJT/W
 t3kqKo36GAYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="157075355"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="157075355"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 03:58:11 -0700
IronPort-SDR: U1MQj+dtqTsezl1tcjDHi+Ti5PyMCUhWGkOubXSsrO/1l+kYJoZGJVP0RDggBkF3QdhbhV6Lu5
 axeqUDUKF0DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="320177331"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 17 Sep 2020 03:58:09 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 4/8] ASoC: SOF: control: update test for pm_runtime_get_sync()
Date: Thu, 17 Sep 2020 13:56:29 +0300
Message-Id: <20200917105633.2579047-5-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200917105633.2579047-1-kai.vehmanen@linux.intel.com>
References: <20200917105633.2579047-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

We need to avoid reporting an error for -EACCESS when pm_runtime is
not enabled.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index d5e2966cafac..5419c93badd2 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -367,7 +367,7 @@ int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int _
 	int err;
 
 	ret = pm_runtime_get_sync(scomp->dev);
-	if (ret < 0) {
+	if (ret < 0 && ret != -EACCES) {
 		dev_err_ratelimited(scomp->dev, "error: bytes_ext get failed to resume %d\n", ret);
 		pm_runtime_put_noidle(scomp->dev);
 		return ret;
-- 
2.27.0

