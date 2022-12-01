Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C6263F666
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 18:44:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C5AA1841;
	Thu,  1 Dec 2022 18:43:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C5AA1841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669916657;
	bh=D2sSBZAYc+Vg9KltmJ/1P5cigpDrjdOXDLq9JRG7bY0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j/7joD+up9ve9TMOmfHv8EIgZN+eO6OCtn92neWhSwDBppPOeYG27UWZ1IsR1K/jo
	 JovgbnPKZZ4jD/9+Xyr5oOj0zX9UUh8AY5+3KzL5JUYHOkMez1cJfsMlQwSjtW465h
	 G4i5nMC9AyhacpWGA15qDIjURDZaEC5ZMoe7OSGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2838BF805D7;
	Thu,  1 Dec 2022 18:39:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 158D4F805D7; Thu,  1 Dec 2022 18:39:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41F99F805C3
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 18:39:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41F99F805C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Tr9/kMVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669916388; x=1701452388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D2sSBZAYc+Vg9KltmJ/1P5cigpDrjdOXDLq9JRG7bY0=;
 b=Tr9/kMVGSVJqOPzh4vbr+sjy3iIxbyzN2odPthlZbropvmKXxmVO6rqk
 JFFShs2Svdzb27shIdpOZz7nIbAK9GsRwl9QW7FKQjTDJvs9XlnGnl3Ao
 2CINEf26wYa9mQFN487W4gYIM4fluf0b5x4gGxfzxXBGtWaZQpaLwsK1G
 feTdUglp3bpRlnqQ4YwIXzIJ3JisZZU7BorNdSMkhqn8mYjDZiHph0Eu2
 DmCBkLz1AaYImptqgs8hXR4qbW3L20vfVTD7cGdDQlWD/QA3C+7qCWuws
 nJGhtlEX8nIBYMdKwWOy5qYCGwtca5kHzhDAHMEH/F2etHGXoHmR++F4u g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="377908492"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="377908492"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 09:39:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="889824093"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="889824093"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2022 09:39:44 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 14/16] ASoC: Intel: avs: Gather remaining logs on
 strace_release()
Date: Thu,  1 Dec 2022 18:56:17 +0100
Message-Id: <20221201175619.504758-15-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221201175619.504758-1-cezary.rojewski@intel.com>
References: <20221201175619.504758-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

When user closes the tracer, some logs may still remain in the tail of
the buffer as firmware sends LOG_BUFFER_STATUS notification only when
certain threshold of data is reached. Add whatever is left to already
gathered logs so no information is lost.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/debugfs.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index 678572ee6b9d..e7b0b99824aa 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -201,11 +201,25 @@ static int strace_open(struct inode *inode, struct file *file)
 
 static int strace_release(struct inode *inode, struct file *file)
 {
+	union avs_notify_msg msg = AVS_NOTIFICATION(LOG_BUFFER_STATUS);
 	struct avs_dev *adev = file->private_data;
-	unsigned long flags;
+	unsigned long resource_mask;
+	unsigned long flags, i;
+	u32 num_cores;
+
+	resource_mask = adev->logged_resources;
+	num_cores = adev->hw_cfg.dsp_cores;
 
 	spin_lock_irqsave(&adev->trace_lock, flags);
+
+	/* Gather any remaining logs. */
+	for_each_set_bit(i, &resource_mask, num_cores) {
+		msg.log.core = i;
+		avs_dsp_op(adev, log_buffer_status, &msg);
+	}
+
 	kfifo_free(&adev->trace_fifo);
+
 	spin_unlock_irqrestore(&adev->trace_lock, flags);
 
 	return 0;
-- 
2.25.1

