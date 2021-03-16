Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F563401BA
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 10:17:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8006D16C1;
	Thu, 18 Mar 2021 10:16:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8006D16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616059061;
	bh=2PPc8vgk/cVeFudoDuZx2oZL3/JsEgwJAnLGDw7T+xc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=guQlENqLQ1bZHWj56PJn9rXf+tjsOtBRGZFUhnUapaDfrOavVUi/h8VYiROhyCyXC
	 fBkXpU4jTBnn4d3RIO6abonmpChlaFTNkA4J+mm4wbjaZEe7BSuj5gazfdveOFfC2/
	 HkMUCNZl8MpcInf2KTDzxxQkdqJjlcCxrAvti7EQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01A4AF80165;
	Thu, 18 Mar 2021 10:16:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 502D6F80163; Tue, 16 Mar 2021 13:43:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.134])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FC6EF80137
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 13:43:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FC6EF80137
Received: from localhost (unknown [192.168.167.235])
 by lucky1.263xmail.com (Postfix) with ESMTP id 94BC2C7BA1;
 Tue, 16 Mar 2021 20:43:18 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [113.57.152.160])
 by smtp.263.net (postfix) whith ESMTP id
 P24306T139685101807360S1615898598914842_; 
 Tue, 16 Mar 2021 20:43:19 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <1c0177edf5e0adde2926b1bff475e44c>
X-RL-SENDER: huangjianghui@uniontech.com
X-SENDER: huangjianghui@uniontech.com
X-LOGIN-NAME: huangjianghui@uniontech.com
X-FST-TO: perex@perex.cz
X-SENDER-IP: 113.57.152.160
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: hjh <huangjianghui@uniontech.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: hda: Fix spelling mistakes
Date: Tue, 16 Mar 2021 20:43:17 +0800
Message-Id: <20210316124317.12990-1-huangjianghui@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 18 Mar 2021 10:16:09 +0100
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mohan Kumar <mkumard@nvidia.com>
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

Signed-off-by: hjh <huangjianghui@uniontech.com>
---
 sound/hda/hdac_stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index a6ed3dc35f7e..1eb8563db2df 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -618,7 +618,7 @@ void snd_hdac_stream_sync_trigger(struct hdac_stream *azx_dev, bool set,
 EXPORT_SYMBOL_GPL(snd_hdac_stream_sync_trigger);
 
 /**
- * snd_hdac_stream_sync - sync with start/strop trigger operation
+ * snd_hdac_stream_sync - sync with start/stop trigger operation
  * @azx_dev: HD-audio core stream (master stream)
  * @start: true = start, false = stop
  * @streams: bit flags of streams to sync
-- 
2.20.1



