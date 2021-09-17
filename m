Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB2640F46F
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 10:52:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF97E17BD;
	Fri, 17 Sep 2021 10:51:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF97E17BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631868763;
	bh=pMYNJWW/793s8pR+9ORsUAWmuedSxhz/C/mp6mAqTcg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ind6myVvjV/LT9Dqo4NQ/+yMa3IrPwXCl/bgMpxs8Y87tWeXgDKKxcVozJKXBcLgx
	 34QdmLQaRy3F8XRKK7I/HJjRpj3Rb5lSmiipvQkF5XIdEFxSm6W4LiHl4R/sbnG9mE
	 2z1XkpgxxZy0FaWVS+4RC97UzLXYnTwnmJkrX4B4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49D94F802E8;
	Fri, 17 Sep 2021 10:51:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A719F8027C; Fri, 17 Sep 2021 10:51:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A355F800E3
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 10:51:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A355F800E3
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="245147255"
X-IronPort-AV: E=Sophos;i="5.85,300,1624345200"; d="scan'208";a="245147255"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 01:51:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,300,1624345200"; d="scan'208";a="546255559"
Received: from akostadi-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.216.45])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 01:51:09 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: trace: Omit error print when waking up trace
 sleepers
Date: Fri, 17 Sep 2021 11:51:08 +0300
Message-Id: <20210917085108.25532-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

Do not print error message from snd_sof_trace_notify_for_error() when
possible sleeping trace work is woken up to flush the remaining debug
information.

This action by itself is not an error, it is just an action we take when
an error occurs to make sure that all information have been fed to the
userspace (if we have trace in use).

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/trace.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index f72a6e83e6af..58f6ca5cf491 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -530,7 +530,6 @@ void snd_sof_trace_notify_for_error(struct snd_sof_dev *sdev)
 		return;
 
 	if (sdev->dtrace_is_enabled) {
-		dev_err(sdev->dev, "error: waking up any trace sleepers\n");
 		sdev->dtrace_error = true;
 		wake_up(&sdev->trace_sleep);
 	}
-- 
2.33.0

