Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1772A024
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 22:53:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4003F171F;
	Fri, 24 May 2019 22:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4003F171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558731204;
	bh=fbBktxRUwpwY/60Q78OSl40iiRFEfu+4Qpp2JgdFRv8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pCOHZtegDwLeQCkrqDYzfeCdE1QX+bpLxHyBVlpOJiK4/Fc2KBCcD4TneuEFI8mHL
	 TvQUoi88cWHI1lO8rxNGtEbUbbJr2QDRKbOGDrVIt7lCFJ6JT5JippRpOO+zB/qZBN
	 fCOhpnb30zB7hbZamnckJvJQ5PYftoQ8NnVSOsqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9E5AF89673;
	Fri, 24 May 2019 22:51:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03DB6F89636; Fri, 24 May 2019 22:50:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 310BBF80C0F
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 22:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 310BBF80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="JlzWU32F"; 
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="DhF739hA"
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 1EA2660D0C; Fri, 24 May 2019 20:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558730443;
 bh=1rtby5Hx7aX1Icw+wA2MpY4vbTBzn0e374yLIU7OMpg=;
 h=From:To:Cc:Subject:Date:From;
 b=JlzWU32FveCujkR/3VpoYUX9lcRi9f+6XPd1PF10BdhJzrj/PJXvvKCxJISjru/l4
 ozjDMfpcwlvRDaB6uxie3lG0ZQXlWAiPa4LPbDFzh/dCT3KHfZhdFm+tQ8Fab51+aG
 pWSyTrRtt+s5biYVn3zZlTbt9VkK3rBCiWnkzSs0=
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: bgoswami@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 479B960AA8;
 Fri, 24 May 2019 20:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558730442;
 bh=1rtby5Hx7aX1Icw+wA2MpY4vbTBzn0e374yLIU7OMpg=;
 h=From:To:Cc:Subject:Date:From;
 b=DhF739hAn6m7eSqjcXHAGXzVGIxk5XcV/1Vasucrdv0Ef+7i4r3h/hzpNThXzkkCz
 sVmaKvYktcJ+DDidWlA+Igw6VLyJfQhiN5D0Sb5INHsb+0yqW0X4tiw8ziBLcUq/v5
 yNDUl1PJ7oTfof0BNGF+xKfd+NNcjz3Frr2Yn1k0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 479B960AA8
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=bgoswami@codeaurora.org
From: bgoswami@codeaurora.org
To: dmitry.torokhov@gmail.com
Date: Fri, 24 May 2019 13:40:38 -0700
Message-Id: <1558730438-16524-1-git-send-email-bgoswami@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 plai@codeaurora.org, tiwai@suse.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, linux-input@vger.kernel.org,
 Gopikrishnaiah Anandan <agopik@codeaurora.org>
Subject: [alsa-devel] [PATCH 2/3] input: Add SW_UNSUPPORT_INSERT define
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Banajit Goswami <bgoswami@codeaurora.org>

Some devices may not support specific type of input devices. For example,
when a headset or extension cable with GND/MIC swap is plugged into a
headset jack that does not support the headset/cable, it needs to be
reported with a corresponding input event. Also, increase the max values
for INPUT_DEVICE_ID_SW_MAX and SW_MAX, to accommodate future extension of
the number of event.

Signed-off-by: Gopikrishnaiah Anandan <agopik@codeaurora.org>
Signed-off-by: Banajit Goswami <bgoswami@codeaurora.org>
---
 include/linux/mod_devicetable.h        | 2 +-
 include/uapi/linux/input-event-codes.h | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 448621c..7586099 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -299,7 +299,7 @@ struct pcmcia_device_id {
 #define INPUT_DEVICE_ID_LED_MAX		0x0f
 #define INPUT_DEVICE_ID_SND_MAX		0x07
 #define INPUT_DEVICE_ID_FF_MAX		0x7f
-#define INPUT_DEVICE_ID_SW_MAX		0x0f
+#define INPUT_DEVICE_ID_SW_MAX		0x1f
 #define INPUT_DEVICE_ID_PROP_MAX	0x1f
 
 #define INPUT_DEVICE_ID_MATCH_BUS	1
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 85387c7..960fa86 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -808,7 +808,8 @@
 #define SW_LINEIN_INSERT	0x0d  /* set = inserted */
 #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
 #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
-#define SW_MAX			0x0f
+#define SW_UNSUPPORT_INSERT	0x10  /* set = unsupported device inserted */
+#define SW_MAX			0x1f
 #define SW_CNT			(SW_MAX+1)
 
 /*
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
