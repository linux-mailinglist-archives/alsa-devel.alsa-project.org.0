Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C39DBA066
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Sep 2019 05:33:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E53F3168A;
	Sun, 22 Sep 2019 05:32:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E53F3168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569123192;
	bh=guCZ9jwqFBT3VNsXlIEQJD87yEUR+A7//eSZChQJpRw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dATccRQr41N8aILc6FLSLTNTs2vk6sG5UC2thLyNfdUojPvTRIotrzfJbFfZNTc53
	 Gp4rytvtx/YptROtxYN2Puot5+mGc4Ip0OyYhgd46umkdC0aKhdqu705vitv2f+tJa
	 UUSYoc6Qaci0BgdOymNwM1yl0TfYtsQrAGhbePO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31B24F805F9;
	Sun, 22 Sep 2019 05:30:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B63DF805F9; Sun, 22 Sep 2019 05:30:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07196F805F8
 for <alsa-devel@alsa-project.org>; Sun, 22 Sep 2019 05:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07196F805F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Mk76p2jA"
Received: by mail-pg1-x543.google.com with SMTP id s1so4868816pgv.8
 for <alsa-devel@alsa-project.org>; Sat, 21 Sep 2019 20:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jD3xxhG1L728SQa4pM1ums3WMPLs7qw0wrrpC+LwPYk=;
 b=Mk76p2jAX2GCB/ZH6yCv+R5lK2DENBPTTgBdKoWlxt7Z/DKlnhatq/xK2czhBWDx+Y
 yddyFd/W+aX+9a9eGIkE5nyGcZnwh3fHZ+ZRvEB2GSIkwb2C7gqqG0XHGymchgs1+yD4
 MgISbmiAWb06yunQLeJGGPDcaiUEdUuvCNPwW/Kf3fs3flrbz5UFGlxcvQdMLe/dyfHV
 hFGHutuLabbp6lZ2w1KAZF/EqdVtSSskDK8yQj/NVOA//TjOxFiqkge0Has6INRc99+5
 RXBa4aiQss15BluA34Tr0sObcHlC8lL+UgkQ09k1KKRHD0mrFiMXWGYlZXbDTn9uuQiR
 L4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jD3xxhG1L728SQa4pM1ums3WMPLs7qw0wrrpC+LwPYk=;
 b=NW2Ww2MmBZ0aopAqrRjb5+BD5XFXg+Iw6KS3EnMV/7b0Cd2cgHUyUGmafjhFTqF8za
 VrJ1jCZ4BDJLoCqFP6kEvcaAaIW6XCEpQiTh6Sm/aWVomkGfSbQn+gF2awn/dIq8EsnP
 R3AOsciN1N8mdi6ohne+L8H8p6nYK/ulAJdvXlhS/cN6HI3q6eSxgyVwGOOReg8s3eN8
 ZG+qI5PcKlIdJrAY771MWgZNvwp1LQB/KyPVdiJ5CuFJP0kCFjXwhCi9sBGOCOMLk9CY
 v5Mh3bIEqP/5Rodlo0AtO1rqPh7obk7iEAPLhZcd1DpjZX0k6dd/qnZbdoSzVA/HIH/O
 4OTA==
X-Gm-Message-State: APjAAAXxyRtIrY2V2R0c7neKhTnFTrGOsOyYY/x3DmYny0QWQ1zrRgKA
 +NswkqpJK/Qo5WXeaEP5mkJpxIAw
X-Google-Smtp-Source: APXvYqwtbfJzhN0Ot2TCvMDRPWivLZO0XE905Vu9fcnTqsIwbGYbb1uqbMT0cSBnFs784Mg40HG60g==
X-Received: by 2002:a62:1890:: with SMTP id 138mr27143868pfy.161.1569123029441; 
 Sat, 21 Sep 2019 20:30:29 -0700 (PDT)
Received: from localhost.localdomain
 ([2407:7000:aa04:fb00:ce0f:a0bf:1ece:a196])
 by smtp.gmail.com with ESMTPSA id l12sm4559532pgs.44.2019.09.21.20.30.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 21 Sep 2019 20:30:28 -0700 (PDT)
From: Ben Russell <thematrixeatsyou@gmail.com>
To: alsa-devel@alsa-project.org
Date: Sun, 22 Sep 2019 15:28:52 +1200
Message-Id: <20190922032853.6123-3-thematrixeatsyou@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190922032853.6123-1-thematrixeatsyou@gmail.com>
References: <20190922032853.6123-1-thematrixeatsyou@gmail.com>
MIME-Version: 1.0
Cc: Ben Russell <thematrixeatsyou@gmail.com>
Subject: [alsa-devel] [PATCH 2/3] pcm_ioplug: Don't unlock+lock if we're not
	locked
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

This fixes a deadlock when using the pcm_jack plugin via a plug.

Some snd_pcm_ioplug_* functions assumed that they were being
called with the pcm mutex locked, and would perform an
unlock-act-lock sequence in order to allow the relevant function to
lock the mutex itself.

If the mutex was not locked before calling these functions, it
would silently fail on unlocking the mutex, and then erroneously
leave the mutex locked as it left the function.

This patch checks to see if the mutex is locked before attempting
the unlock-act-lock sequence. If the mutex is not locked when
entering these functions, then we act and leave the mutex unlocked.

Signed-off-by: Ben Russell <thematrixeatsyou@gmail.com>
---
 src/pcm/pcm_ioplug.c | 50 +++++++++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/src/pcm/pcm_ioplug.c b/src/pcm/pcm_ioplug.c
index a437ca32..a94ecd96 100644
--- a/src/pcm/pcm_ioplug.c
+++ b/src/pcm/pcm_ioplug.c
@@ -164,9 +164,13 @@ static int snd_pcm_ioplug_prepare(snd_pcm_t *pcm)
 
 	snd_pcm_ioplug_reset(pcm);
 	if (io->data->callback->prepare) {
-		snd_pcm_unlock(pcm); /* to avoid deadlock */
-		err = io->data->callback->prepare(io->data);
-		snd_pcm_lock(pcm);
+		if (snd_pcm_is_locked(pcm)) {
+			snd_pcm_unlock(pcm); /* to avoid deadlock */
+			err = io->data->callback->prepare(io->data);
+			snd_pcm_lock(pcm);
+		} else {
+			err = io->data->callback->prepare(io->data);
+		}
 	}
 	if (err < 0)
 		return err;
@@ -463,9 +467,13 @@ static int snd_pcm_ioplug_sw_params(snd_pcm_t *pcm, snd_pcm_sw_params_t *params)
 	if (!io->data->callback->sw_params)
 		return 0;
 
-	snd_pcm_unlock(pcm); /* to avoid deadlock */
-	err = io->data->callback->sw_params(io->data, params);
-	snd_pcm_lock(pcm);
+	if (snd_pcm_is_locked(pcm)) {
+		snd_pcm_unlock(pcm); /* to avoid deadlock */
+		err = io->data->callback->sw_params(io->data, params);
+		snd_pcm_lock(pcm);
+	} else {
+		err = io->data->callback->sw_params(io->data, params);
+	}
 
 	return err;
 }
@@ -764,9 +772,13 @@ static int snd_pcm_ioplug_poll_descriptors_count(snd_pcm_t *pcm)
 	int err = 1;
 
 	if (io->data->callback->poll_descriptors_count) {
-		snd_pcm_unlock(pcm); /* to avoid deadlock */
-		err = io->data->callback->poll_descriptors_count(io->data);
-		snd_pcm_lock(pcm);
+		if (snd_pcm_is_locked(pcm)) {
+			snd_pcm_unlock(pcm); /* to avoid deadlock */
+			err = io->data->callback->poll_descriptors_count(io->data);
+			snd_pcm_lock(pcm);
+		} else {
+			err = io->data->callback->poll_descriptors_count(io->data);
+		}
 	}
 	return err;
 }
@@ -777,9 +789,13 @@ static int snd_pcm_ioplug_poll_descriptors(snd_pcm_t *pcm, struct pollfd *pfds,
 	int err;
 
 	if (io->data->callback->poll_descriptors) {
-		snd_pcm_unlock(pcm); /* to avoid deadlock */
-		err = io->data->callback->poll_descriptors(io->data, pfds, space);
-		snd_pcm_lock(pcm);
+		if (snd_pcm_is_locked(pcm)) {
+			snd_pcm_unlock(pcm); /* to avoid deadlock */
+			err = io->data->callback->poll_descriptors(io->data, pfds, space);
+			snd_pcm_lock(pcm);
+		} else {
+			err = io->data->callback->poll_descriptors(io->data, pfds, space);
+		}
 		return err;
 	}
 	if (pcm->poll_fd < 0)
@@ -799,9 +815,13 @@ static int snd_pcm_ioplug_poll_revents(snd_pcm_t *pcm, struct pollfd *pfds, unsi
 	int err;
 
 	if (io->data->callback->poll_revents) {
-		snd_pcm_unlock(pcm); /* to avoid deadlock */
-		err = io->data->callback->poll_revents(io->data, pfds, nfds, revents);
-		snd_pcm_lock(pcm);
+		if (snd_pcm_is_locked(pcm)) {
+			snd_pcm_unlock(pcm); /* to avoid deadlock */
+			err = io->data->callback->poll_revents(io->data, pfds, nfds, revents);
+			snd_pcm_lock(pcm);
+		} else {
+			err = io->data->callback->poll_revents(io->data, pfds, nfds, revents);
+		}
 	} else {
 		*revents = pfds->revents;
 		err = 0;
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
