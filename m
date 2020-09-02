Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5193B25B5D2
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 23:26:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC1F418A4;
	Wed,  2 Sep 2020 23:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC1F418A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599081992;
	bh=z76BYPJKraqqcichlpMUw1vzs0G32avX6kN3zkejCGE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bVHf7mlfftuU6o4jypBoDPPG+4HqXlEUCM5kc9+/8qx19BDjFRwWFuIm5ZPwC9ZMZ
	 R5EofLlWJwzD7M7qm8ZY6jRd6jlJBYPY43chJ/aE8IhvqSF1JK0dC2k2/pL3Hc4gVd
	 s6N22+eOA7v7KiHp/avjCQvA0+a5WFaJvPerp6G4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FC39F80303;
	Wed,  2 Sep 2020 23:22:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C1E0F801DA; Wed,  2 Sep 2020 23:22:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05BA8F80257
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 23:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05BA8F80257
IronPort-SDR: hV4uUBkLGwQ627paEL6mwIiWS00Z6Lxw12hVw+FTC9UaEj4xFxhCd5TJoc9uiiiqMOuiBu0hRf
 tHy0eMtEiSSg==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="157482862"
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="157482862"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:22:02 -0700
IronPort-SDR: r79LqBdP6piBHW+QSzIht8Jg1WOvv/SQuauDxwl62dFmbPVX0+2YX99QYBkau4teOkJIcrp5ic
 h0Yz2vU44IYQ==
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="477798273"
Received: from rnagarat-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.56.27])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:22:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/18] ALSA: core: timer: clarify operator precedence
Date: Wed,  2 Sep 2020 16:21:20 -0500
Message-Id: <20200902212133.30964-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200902212133.30964-1-pierre-louis.bossart@linux.intel.com>
References: <20200902212133.30964-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
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

fix cppcheck warning:

sound/core/timer.c:1286:9: style: Clarify calculation precedence for
'&' and '?'. [clarifyCalculation]
        ? "running" : "stopped");
        ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/core/timer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 73ad5ba76b27..227d8152d325 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1280,8 +1280,8 @@ static void snd_timer_proc_read(struct snd_info_entry *entry,
 		list_for_each_entry(ti, &timer->open_list_head, open_list)
 			snd_iprintf(buffer, "  Client %s : %s\n",
 				    ti->owner ? ti->owner : "unknown",
-				    ti->flags & (SNDRV_TIMER_IFLG_START |
-						 SNDRV_TIMER_IFLG_RUNNING)
+				    (ti->flags & (SNDRV_TIMER_IFLG_START |
+						  SNDRV_TIMER_IFLG_RUNNING))
 				    ? "running" : "stopped");
 	}
 	mutex_unlock(&register_mutex);
-- 
2.25.1

