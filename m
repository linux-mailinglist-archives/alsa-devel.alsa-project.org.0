Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7F858781
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 18:45:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DC111663;
	Thu, 27 Jun 2019 18:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DC111663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561653903;
	bh=sKQ0dOiLgCnpK+ak/lGE9bSEeyu+tytoJM2B1ZGacK8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sontefOAo+b/TsCL6C/+jSVprZN8I91NuCoxQHLA4AKhlEpxRe+G6NREVAh8+cnBq
	 Z9rEKD5l9zxROuw0ZL4ncT/VJHOMsQzoz+geGIrw0JT7OsLa1iVef/WvjBzdw5git0
	 Fmak8CJfyJsNn1IxlRDOaYrVxyIHwCOXUImV8fLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5D98F896F0;
	Thu, 27 Jun 2019 18:43:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0C69F896F6; Thu, 27 Jun 2019 18:43:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 001A5F80C0B
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 18:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 001A5F80C0B
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hgXUK-0006E9-9s; Thu, 27 Jun 2019 16:43:08 +0000
From: Colin King <colin.king@canonical.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Date: Thu, 27 Jun 2019 17:43:08 +0100
Message-Id: <20190627164308.21286-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: fix sign unintended sign
	extension on left shifts
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Colin Ian King <colin.king@canonical.com>

There are a couple of left shifts of unsigned 8 bit values that
first get promoted to signed ints and hence get sign extended
on the shift if the top bit of the 8 bit values are set. Fix
this by casting the 8 bit values to unsigned ints to stop the
unintentional sign extension.

Addresses-Coverity: ("Unintended sign extension")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/usb/mixer_quirks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 1f6011f36bb0..199fa157a411 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -741,7 +741,7 @@ static int snd_ni_control_init_val(struct usb_mixer_interface *mixer,
 		return err;
 	}
 
-	kctl->private_value |= (value << 24);
+	kctl->private_value |= ((unsigned int)value << 24);
 	return 0;
 }
 
@@ -902,7 +902,7 @@ static int snd_ftu_eff_switch_init(struct usb_mixer_interface *mixer,
 	if (err < 0)
 		return err;
 
-	kctl->private_value |= value[0] << 24;
+	kctl->private_value |= (unsigned int)value[0] << 24;
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
