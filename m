Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD764417BCB
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Sep 2021 21:26:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B89E1664;
	Fri, 24 Sep 2021 21:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B89E1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632511592;
	bh=SZf6B9aJ8cnJiE9hALnLYBJH5oGeZb8raeOLUu65k+w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QfdjqLrKaZlPdad/69tXyYK5y4CQb9rb2vVsdQxODjE4I4+ofOg4eo1GiJ+xPIxU2
	 AtImxQL+oVcqY0HR6J0rQkOLBvHRDyahJC3/basxHjVzQBbIY06mOhea028r+p6LEw
	 HM+fNj6LMsOFy4M5MOiYgSfi1pWB1nFaTf1p92Uc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A431F8013F;
	Fri, 24 Sep 2021 21:24:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BA61F804D9; Fri, 24 Sep 2021 21:24:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59B97F8025D
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 21:24:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59B97F8025D
X-IronPort-AV: E=McAfee;i="6200,9189,10117"; a="203643400"
X-IronPort-AV: E=Sophos;i="5.85,320,1624345200"; d="scan'208";a="203643400"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 12:24:37 -0700
X-IronPort-AV: E=Sophos;i="5.85,320,1624345200"; d="scan'208";a="551922489"
Received: from bordone-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.164.235])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 12:24:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 1/4] ALSA: hda: hdac_stream: fix potential locking issue
 in snd_hdac_stream_assign()
Date: Fri, 24 Sep 2021 14:24:14 -0500
Message-Id: <20210924192417.169243-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924192417.169243-1-pierre-louis.bossart@linux.intel.com>
References: <20210924192417.169243-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
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

The fields 'opened', 'running', 'assigned_key' are all protected by a
spinlock, but the spinlock is not taken when looking for a
stream. This can result in a possible race between assign() and
release().

Fix by taking the spinlock before walking through the bus stream list.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/hda/hdac_stream.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 1eb8563db2df..9867555883c3 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -296,6 +296,7 @@ struct hdac_stream *snd_hdac_stream_assign(struct hdac_bus *bus,
 	int key = (substream->pcm->device << 16) | (substream->number << 2) |
 		(substream->stream + 1);
 
+	spin_lock_irq(&bus->reg_lock);
 	list_for_each_entry(azx_dev, &bus->stream_list, list) {
 		if (azx_dev->direction != substream->stream)
 			continue;
@@ -309,13 +310,12 @@ struct hdac_stream *snd_hdac_stream_assign(struct hdac_bus *bus,
 			res = azx_dev;
 	}
 	if (res) {
-		spin_lock_irq(&bus->reg_lock);
 		res->opened = 1;
 		res->running = 0;
 		res->assigned_key = key;
 		res->substream = substream;
-		spin_unlock_irq(&bus->reg_lock);
 	}
+	spin_unlock_irq(&bus->reg_lock);
 	return res;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_stream_assign);
-- 
2.25.1

