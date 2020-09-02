Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D14B425B5D1
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 23:26:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72B8D189D;
	Wed,  2 Sep 2020 23:25:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72B8D189D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599081977;
	bh=Xr9UHzlM1BPboMgl9o4efZ9ZHPAf0cLOT8lPMOE58ik=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aoYmIV/QVya419nG7G3WbZ7hrGPg099MAMKzURelov/x1TYYVNMjIxz/c2rK4s595
	 HSxr7gUe9skQIlZj225e8ITiYBpyfDLJaEKfdgSchapB2R5iPCgSQcREijCrwSBpl1
	 ftT1+6jzTfqYH+YnZNX3zSu2K9RYU+88q7wwAUXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCA46F802FD;
	Wed,  2 Sep 2020 23:22:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C530F8024A; Wed,  2 Sep 2020 23:22:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2FBFF80268
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 23:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2FBFF80268
IronPort-SDR: sTaQEAWyuM4hNzTqEEY94woxdq+HDC3Fgv8yOapPqc6YTUdgKCosCRWCWZE7qnS4Fyd4RqYdLS
 Khc+gFiMKsIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="157482856"
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="157482856"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:22:01 -0700
IronPort-SDR: DiPg7Y93sLNQv063qqmTFfKD7nSKrs49MTJQvwXTpkqpIfg4PwTNSclw9XQuwTT451vMqG8JBa
 Ti/6Jw4Ec4SA==
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="477798271"
Received: from rnagarat-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.56.27])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:22:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/18] ALSA: core: timer: remove redundant assignment
Date: Wed,  2 Sep 2020 16:21:19 -0500
Message-Id: <20200902212133.30964-5-pierre-louis.bossart@linux.intel.com>
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

Cppcheck complains about a possible NULL pointer dereference but it
actually looks like the NULL assignment is not needed (same loop is
used in other parts of the file without it).

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/core/timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 6e27d87b18ed..73ad5ba76b27 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -173,7 +173,7 @@ EXPORT_SYMBOL(snd_timer_instance_free);
  */
 static struct snd_timer *snd_timer_find(struct snd_timer_id *tid)
 {
-	struct snd_timer *timer = NULL;
+	struct snd_timer *timer;
 
 	list_for_each_entry(timer, &snd_timer_list, device_list) {
 		if (timer->tmr_class != tid->dev_class)
-- 
2.25.1

