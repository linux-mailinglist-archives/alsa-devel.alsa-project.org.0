Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8F125B5DA
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 23:29:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 349771726;
	Wed,  2 Sep 2020 23:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 349771726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599082197;
	bh=/arOLmjw8S8FKAI86vW/9nLoYu3rU6pnH3rmjI1JnJM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=peMYB1qYQvtYSbHtt6/YbGg5d7Eq5znNbwXCG3QuTC0kvhHcrA6qL7Hm5dc9g4N18
	 8dCwnjorx+55IjCjfEptrySsvqg0R0XIBEexzwV9sd7dDGXI0aTLTkreb9pwftu/Z7
	 Z2UCghFmabAOlvI1qsxIg8YHG8sm6HRnsc8xNDb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93748F80334;
	Wed,  2 Sep 2020 23:22:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9CE2F802DB; Wed,  2 Sep 2020 23:22:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9F8CF802E0
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 23:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9F8CF802E0
IronPort-SDR: SwU/UxTq6UmPc2UAYwUBrVY5qVTG6QHkD7uNjqZrUyrDT7H+pQjxJFcFRlwqom8gXGDtVuDtDz
 6kqcuyZl5VYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="157482880"
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="157482880"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:22:08 -0700
IronPort-SDR: oJ8LHOjZMmIawaws+KiOev1FNLML6RgIwQFGWGPqkMLrPiVWuqNMuwgsz1xAE0KlAr+FlumMHv
 LKMx1KMMyQpw==
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="477798290"
Received: from rnagarat-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.56.27])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:22:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/18] ALSA: usb: scarless_gen2: fix endianness issue
Date: Wed,  2 Sep 2020 16:21:27 -0500
Message-Id: <20200902212133.30964-13-pierre-louis.bossart@linux.intel.com>
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

Fix Sparse warning:

sound/usb/mixer_scarlett_gen2.c:1949:24: warning: cast to restricted
__le32

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/usb/mixer_scarlett_gen2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 0ffff7640892..d33df146d6ce 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -1946,7 +1946,7 @@ static void scarlett2_mixer_interrupt(struct urb *urb)
 		goto requeue;
 
 	if (len == 8) {
-		data = le32_to_cpu(*(u32 *)urb->transfer_buffer);
+		data = le32_to_cpu(*(__le32 *)urb->transfer_buffer);
 		if (data & SCARLETT2_USB_INTERRUPT_VOL_CHANGE)
 			scarlett2_mixer_interrupt_vol_change(mixer);
 		if (data & SCARLETT2_USB_INTERRUPT_BUTTON_CHANGE)
-- 
2.25.1

