Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F7A2E2F39
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Dec 2020 22:41:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 274971863;
	Sat, 26 Dec 2020 22:40:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 274971863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609018862;
	bh=K83E6SMZCMu5Ez9LMLKPAd1FgTOTsgnz2BgGFbvwWDk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A4zJQQxhs+glIN1JD9lxAdrgtj2CCulVMh6l/dKykN8mVEF1YElG9yyx7fTKvKx+i
	 roQtmXzh4kgms9P1ixMKTNd5Zbc0Zk9yJUZOgtuxXM7kcuITSb+NmeRWjCmRe2W51C
	 Yctf1rVdSMwtpFqphhlc6m65Sta1w/S1XIzi4ztk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E29B7F804FA;
	Sat, 26 Dec 2020 22:36:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EF84F804CA; Sat, 26 Dec 2020 22:36:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPF_HELO_NONE
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBA5EF804BD
 for <alsa-devel@alsa-project.org>; Sat, 26 Dec 2020 22:36:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBA5EF804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DUNI3Le5"
Received: by mail-pg1-x52b.google.com with SMTP id n25so5062396pgb.0
 for <alsa-devel@alsa-project.org>; Sat, 26 Dec 2020 13:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RIHpjbPUjDSdAkHAuKPQJ74BKvjMzowN3uPJ2lwLUBg=;
 b=DUNI3Le5b1e8NTl5B8IC38IGwlrhqW0Ywa+q73m0d977Ida04r8a9qBvB+LtqMAT1+
 CE0sWgC8XzLCtWt9Qjv8+nECwrstCD2dsidwNXCIKj503mVn1GyId3DVLNp58PN/Oo4+
 dMpKqK1iqBI8RoweaKxdpaFv7U3GIA7JIBh/HBHwA2cPgXMuUA/NcS7k2N/3FEfcYVPh
 sKmlEvZE7rMULLHxRcbEB9JroP18vnVbeITC97LCKFdOSHNihcNs8HqWiiIfoa+ZUqhH
 WUw1f5Pz28zD2ZMgJG8h4zJDBb6WmmPBc/00uN69Sqyem5PWKtT6itSxmQU+ydeGr8Ly
 5LTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RIHpjbPUjDSdAkHAuKPQJ74BKvjMzowN3uPJ2lwLUBg=;
 b=s6KOgnFZ4Zv8BFQA2iP7qjh39b43+L0JsaiSj5wAn9HyyMWiDD13cJlNQrWpUKiARZ
 vlTmO94s/kCxITFO4zcOvPsYEDNiofktPlrGtTQ0eFepgCI0ivBq4fd57+USCJKgkWzO
 ECAc6+l6xfVZb17r7hS0U+EjwxSeCl1v4yWtdZXgp32WjPRYyhc9tfB642IRbSTPwiSk
 bFP2wh/5woAAL+KQXrZy8UHaEXSldpzsDSQoMawhz6uC8GHnEQME4ykDJz8gtrPLXneT
 A44XjUxAig7Y+DROAWC1k3UVV6cOQ1V4C7Ayi5jmdLf8Tz8pZMyic3RO3LQPOV4BYlrD
 JEXg==
X-Gm-Message-State: AOAM533/ilssBsItY5Z2ylJL4zJ6Ak2VIBRI9xsJcWNxR8Cd9PZ4BQtC
 BK9cv2sq/AnIbNhWeqkUzTVoEeC4HuZhew==
X-Google-Smtp-Source: ABdhPJwds2uT0G1feM1HtOaO0lIe6u5KoZJpXwdyywgJEs3JPTqDQAC8AVLkpvgCBBXO1wkzqfEJYQ==
X-Received: by 2002:a65:4983:: with SMTP id r3mr38283469pgs.288.1609018596973; 
 Sat, 26 Dec 2020 13:36:36 -0800 (PST)
Received: from viper.bn-i.net ([2001:470:b:65c:b92f:8d47:b3dd:6388])
 by smtp.gmail.com with ESMTPSA id b12sm30990560pft.114.2020.12.26.13.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Dec 2020 13:36:36 -0800 (PST)
From: Alex Henrie <alexhenrie24@gmail.com>
To: alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.de
Subject: [PATCH 8/9] pcm: fix undefined bit shift in bad_pcm_state
Date: Sat, 26 Dec 2020 14:35:46 -0700
Message-Id: <20201226213547.175071-9-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.29.2.368.ge46b91665e.dirty
In-Reply-To: <20201226213547.175071-1-alexhenrie24@gmail.com>
References: <20201226213547.175071-1-alexhenrie24@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alex Henrie <alexhenrie24@gmail.com>
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

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 include/pcm.h       | 4 +++-
 src/pcm/pcm.c       | 2 ++
 src/pcm/pcm_local.h | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/pcm.h b/include/pcm.h
index e300b951..c6c5d8f8 100644
--- a/include/pcm.h
+++ b/include/pcm.h
@@ -307,7 +307,9 @@ typedef enum _snd_pcm_state {
 	SND_PCM_STATE_SUSPENDED,
 	/** Hardware is disconnected */
 	SND_PCM_STATE_DISCONNECTED,
-	SND_PCM_STATE_LAST = SND_PCM_STATE_DISCONNECTED,
+	/** State cannot be queried */
+	SND_PCM_STATE_UNKNOWN,
+	SND_PCM_STATE_LAST = SND_PCM_STATE_UNKNOWN,
 	/** Private - used internally in the library - do not use*/
 	SND_PCM_STATE_PRIVATE1 = 1024
 } snd_pcm_state_t;
diff --git a/src/pcm/pcm.c b/src/pcm/pcm.c
index 24030b31..5fafc2a0 100644
--- a/src/pcm/pcm.c
+++ b/src/pcm/pcm.c
@@ -680,6 +680,8 @@ static int pcm_state_to_error(snd_pcm_state_t state)
 		return -ESTRPIPE;
 	case SND_PCM_STATE_DISCONNECTED:
 		return -ENODEV;
+	case SND_PCM_STATE_UNKNOWN:
+		return -ENOSYS;
 	default:
 		return 0;
 	}
diff --git a/src/pcm/pcm_local.h b/src/pcm/pcm_local.h
index fe77e50d..04f89623 100644
--- a/src/pcm/pcm_local.h
+++ b/src/pcm/pcm_local.h
@@ -444,7 +444,7 @@ static inline int __snd_pcm_start(snd_pcm_t *pcm)
 static inline snd_pcm_state_t __snd_pcm_state(snd_pcm_t *pcm)
 {
 	if (!pcm->fast_ops->state)
-		return -ENOSYS;
+		return SND_PCM_STATE_UNKNOWN;
 	return pcm->fast_ops->state(pcm->fast_op_arg);
 }
 
-- 
2.29.2.368.ge46b91665e.dirty

