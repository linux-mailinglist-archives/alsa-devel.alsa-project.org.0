Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D0B2D394A
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 04:39:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8217416DB;
	Wed,  9 Dec 2020 04:38:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8217416DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607485173;
	bh=M7rm1GG1qmGnueWnejvg5+zBo4NycUmd8cHxwnhsCpc=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c+MZScw5joZJVXG1QaBosyjSN+YEwiZU6JHcKjDrAGqmNvOsvi2wG2my6Ejw+DWe+
	 1EcczXBqKMYtRIybrSypSk0dCxzzCi1Z3rNRY7gcRlSLpbLLQ+HTzmHoS0lG1gS41S
	 /eoIEMUW6mixRPPvQZIITR+KKqWwHJbyA3JBHvvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B893EF800EF;
	Wed,  9 Dec 2020 04:37:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 620A7F8020D; Wed,  9 Dec 2020 04:37:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A66E1F800E1
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 04:37:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A66E1F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="gxWRx+su"
Received: by mail-pg1-x54a.google.com with SMTP id i6so241426pgg.10
 for <alsa-devel@alsa-project.org>; Tue, 08 Dec 2020 19:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=cLGtDGr4lSRc6pKMWGDpS/Lgwa6LfYYY02p1RrZ7Rzc=;
 b=gxWRx+su8POnwFn4NhmnxV1GlTT9LBkySou220/WqMcil1nBC60gVM0/ovXfVYauTE
 hv3vUHV/YiC68zreswN/MKI8Eg3CZAbtcUhYF8lLGvPCDn0RfrRqfCortP25ne7Jrf/x
 DH5TSq1/43ots3gheUTPUgynwWhC/Lkr6T/wiqAH+Iu9SjdjxXemc9Zy6fgfSrekf3KI
 1NLbi/G9UXUDvJAMtfFxIEVqiaLq/BilKa+hNKQ/nJ0SDgL9Ew2uXLYrbUeODnAWODCk
 ISgE22KQo+2Tt1mgBzrimP7xHRtJ7VH6wg5v9dkendDhyoOT7KhI5oPkxjKTbpXQ8ud/
 5zLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=cLGtDGr4lSRc6pKMWGDpS/Lgwa6LfYYY02p1RrZ7Rzc=;
 b=L9ZnylysfREXx+RnIWrWdi4QBIfmiFEs9nD1HSnFdYipBS0IKjT6IpJQ55OFfnAnOZ
 1u7h3xfDk8nqHYrYqmvSFYA37X5Q3mUy9bwcIJ2k+g0V2e7jvRMPwzNW+WfAR/Fp4ZUf
 2qV8hJma4OAjfhQbrz11qeT01PdNG3BRNm0RjTcpptmb5Gvej9ng5BTaZgSQImuWwE6N
 8/btGFq80AY/y01KPhDInGyWPctshd+uSD/LN+f7W18Mh7EgUDGY/IWvxTVkfPaFLxC7
 FbNBOMAJp5Q0rjbUgB5xJSX4zGpZGKF9UEztXmM4m9wpM1EA9TYkWfEt4UANzowtS/qX
 oEjw==
X-Gm-Message-State: AOAM530u9BrbrFYEKoomqj5jhTJC/R2jLvx0mBphg76V9pNjgXJwVGQe
 TVwgTBnR3Kvu5VWFr4wppo4leihYUdCv
X-Google-Smtp-Source: ABdhPJxPlrjdvyoTeo9tXiUPbLbCny7YzepQwxypnczxyxYzQKSKeag+0IcUTP4pfs26gtWMOaqsoKFPvRFz
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a17:90a:17a4:: with SMTP id
 q33mr66583pja.0.1607485069873; Tue, 08 Dec 2020 19:37:49 -0800 (PST)
Date: Wed,  9 Dec 2020 11:37:42 +0800
Message-Id: <20201209033742.3825973-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH] ASoC: rt1015p: delay 300ms after SDB pulling high for
 calibration
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

RT1015p needs 300ms delay after SDB pulling high for internal
calibration during the power on sequence.

Delays 300ms right before data sends out to avoid data truncated.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/rt1015p.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/rt1015p.c b/sound/soc/codecs/rt1015p.c
index 59bb60682270..515357474eba 100644
--- a/sound/soc/codecs/rt1015p.c
+++ b/sound/soc/codecs/rt1015p.c
@@ -4,6 +4,7 @@
 //
 // Copyright 2020 The Linux Foundation. All rights reserved.
 
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/gpio.h>
@@ -20,6 +21,7 @@
 struct rt1015p_priv {
 	struct gpio_desc *sdb;
 	int sdb_switch;
+	bool calib_done;
 };
 
 static int rt1015p_daiops_trigger(struct snd_pcm_substream *substream,
@@ -39,6 +41,11 @@ static int rt1015p_daiops_trigger(struct snd_pcm_substream *substream,
 		if (rt1015p->sdb_switch) {
 			gpiod_set_value(rt1015p->sdb, 1);
 			dev_dbg(component->dev, "set sdb to 1");
+
+			if (!rt1015p->calib_done) {
+				mdelay(300);
+				rt1015p->calib_done = true;
+			}
 		}
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
-- 
2.29.2.576.ga3fc446d84-goog

