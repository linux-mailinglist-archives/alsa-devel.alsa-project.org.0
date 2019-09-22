Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 357A2BA065
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Sep 2019 05:33:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF400167D;
	Sun, 22 Sep 2019 05:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF400167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569123180;
	bh=AgOp8PB3GhQN7kwG4kCpv8lgZgAiWOPtqsVswqWWXOs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pf+mgPr9TIqqWk0d1o1JPMqGVjHFyrKAqX2b+OznGiEwZUzSI0zxd6MBdOAuMUaM0
	 ltx//gdTUpLfcM0628WdsSKFSthZvHNLIRNHkP8TJRFMTlcKSAfqwS3yucuG9j5dUF
	 SZwENXn6IxlLSV+AXO6njHCVKjYimu180JU5enus=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4372F80534;
	Sun, 22 Sep 2019 05:30:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCBD8F805AF; Sun, 22 Sep 2019 05:30:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED330F8045F
 for <alsa-devel@alsa-project.org>; Sun, 22 Sep 2019 05:30:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED330F8045F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YcfQt9mY"
Received: by mail-pl1-x643.google.com with SMTP id d22so3650362pls.0
 for <alsa-devel@alsa-project.org>; Sat, 21 Sep 2019 20:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bFDDbF+0vBNAsN/PAoKiFNvh9MeZl4xEMIXmuEGtX1U=;
 b=YcfQt9mYJFivEnqLxUvANJEdacwplwUYnMBsGs8R4u675XKepAc6N3f0768Z6wRMEO
 bOHFEOkFkKQB3W1Z0Duq1v/9dHrKgGpuvErzlk42WMOXoRIOoJmNO+PcIQ32QcEGNDco
 Gjyx/+6opc1LtWAldiN7gg4lsf/E5Zq1OgySbFK7u4h4X9Jq1iSksVM2YnLJs21nc1NP
 Yen8v+1xNw+j8iNjoeCS8obiu/slAP3PRIUUNoNTAedMm6i7gl23J39diIxnz0lD4rA0
 7HsqiqYM+Rn6kZP1S2hW1OEynRpkT9L20iB6qwtIbQ2ujln5/r+hQX8ZCmjLk8xrSXud
 TuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bFDDbF+0vBNAsN/PAoKiFNvh9MeZl4xEMIXmuEGtX1U=;
 b=eP86Z8+XBqmLCJuVhsdAfxw8QgeIuYPzxtkUDrLxwthCm/bTJysN7OuxzbHAlsiJHV
 aOTTkRcqXInZ5Ggx/ajfp63YupHMokWUVwowzFAWqSO8uHwrPxNzBjbaZKM4ZAo698Os
 qP8tvnskG39YQ4QZKf+WzS5fIcP34rPWCSCDvN5+9U/dmUqNia3J5AnBk4/MPsHuzIF3
 dUGodMIyb1VMt3fvH+Wq+rRSz6vyT0a3mmIkQdXEu8GkmOjrrHKlouHBY/f+ty4RWMZ3
 MQS+khrBpiLvdoyXqTBUfJ9w/KUmzAolsMZzGmW0639XDHMPiiOd9X2n/rRJFJQa9+VJ
 IqUA==
X-Gm-Message-State: APjAAAUVmikWPaoYblfI8asgcPy84la284LNlwpWEMF0RAbUphKPTRc1
 W8lYxF2JentnssuHMhl9KNGLb7dD
X-Google-Smtp-Source: APXvYqzpkeau7iPotfCVdvR8aqHq+xYEPy/b+4k7+v000GKUzeAvNUWmrsWh2ak5RvVE9jGneISedA==
X-Received: by 2002:a17:902:a715:: with SMTP id
 w21mr24284048plq.274.1569123026278; 
 Sat, 21 Sep 2019 20:30:26 -0700 (PDT)
Received: from localhost.localdomain
 ([2407:7000:aa04:fb00:ce0f:a0bf:1ece:a196])
 by smtp.gmail.com with ESMTPSA id l12sm4559532pgs.44.2019.09.21.20.30.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 21 Sep 2019 20:30:25 -0700 (PDT)
From: Ben Russell <thematrixeatsyou@gmail.com>
To: alsa-devel@alsa-project.org
Date: Sun, 22 Sep 2019 15:28:51 +1200
Message-Id: <20190922032853.6123-2-thematrixeatsyou@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190922032853.6123-1-thematrixeatsyou@gmail.com>
References: <20190922032853.6123-1-thematrixeatsyou@gmail.com>
MIME-Version: 1.0
Cc: Ben Russell <thematrixeatsyou@gmail.com>
Subject: [alsa-devel] [PATCH 1/3] pcm_local: Add snd_pcm_is_locked
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

This is needed in preparation for a fix to be applied to
pcm_ioplug which will be in a following commit.

Signed-off-by: Ben Russell <thematrixeatsyou@gmail.com>
---
 src/pcm/pcm_local.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/src/pcm/pcm_local.h b/src/pcm/pcm_local.h
index 05ed935f..649d84f2 100644
--- a/src/pcm/pcm_local.h
+++ b/src/pcm/pcm_local.h
@@ -1171,9 +1171,41 @@ static inline void snd_pcm_unlock(snd_pcm_t *pcm)
 	if (pcm->lock_enabled && pcm->need_lock)
 		pthread_mutex_unlock(&pcm->lock);
 }
+
+/*
+ * snd_pcm_is_locked() is used to determine if the lock is currently held.
+ * It is mostly provided as a workaround for pcm_ioplug, which otherwise would
+ * for some functions assume that the plugin is locked even when it isn't.
+ *
+ * If $LIBASOUND_THREAD_SAFE=0 is set then this always returns 0 as there
+ * is no mutex in that case.
+ */
+static inline int snd_pcm_is_locked(snd_pcm_t *pcm)
+{
+	int trylock_result;
+	int unlock_result;
+
+	if (pcm->lock_enabled) {
+		trylock_result = pthread_mutex_trylock(&pcm->lock);
+		assert(trylock_result == 0 || trylock_result == EBUSY);
+		if (trylock_result == 0) {
+			/* we managed to grab the lock; therefore, it wasn't locked */
+			unlock_result = pthread_mutex_unlock(&pcm->lock);
+			assert(unlock_result == 0);
+			return 0;
+		} else {
+			/* we failed to grab the lock; therefore, it was locked */
+			return 1;
+		}
+	} else {
+		return 0;
+	}
+}
+
 #else /* THREAD_SAFE_API */
 #define __snd_pcm_lock(pcm)		do {} while (0)
 #define __snd_pcm_unlock(pcm)		do {} while (0)
 #define snd_pcm_lock(pcm)		do {} while (0)
 #define snd_pcm_unlock(pcm)		do {} while (0)
+#define snd_pcm_is_locked(pcm)		0
 #endif /* THREAD_SAFE_API */
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
