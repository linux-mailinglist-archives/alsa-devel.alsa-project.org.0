Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC565BCDA
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2019 15:27:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAE19169A;
	Mon,  1 Jul 2019 15:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAE19169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561987646;
	bh=pyLtTkj2GKoF2VU908o/IWcTep4x08Drx5E+Bfm4BgQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SuZzrM7x0ahp4tmJQnev+yuH+bbwQTSoWQEi5q2aLGQQUzwIZGH3iKb9p74DUXPyg
	 v7aRzd8s0JXM1G3trJeErrJYsIchV6a8zhJbhB6yLdyR76JfFMAnjDarOLN0xwDGeK
	 YBuaOPzNFkTkkenafZTipaMHayuP7+cghagtbxHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D2A7F8970D;
	Mon,  1 Jul 2019 15:25:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADEBCF89709; Mon,  1 Jul 2019 15:25:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 476A5F89670;
 Mon,  1 Jul 2019 15:25:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 476A5F89670
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id C1D833C001F;
 Mon,  1 Jul 2019 15:25:33 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kjk_jGpkugBI; Mon,  1 Jul 2019 15:25:27 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id C5A003C04C1;
 Mon,  1 Jul 2019 15:25:27 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Mon, 1 Jul 2019 15:25:27 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Mon, 1 Jul 2019 15:25:16 +0200
Message-ID: <1561987518-2828-2-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561987518-2828-1-git-send-email-amiartus@de.adit-jv.com>
References: <1561987518-2828-1-git-send-email-amiartus@de.adit-jv.com>
MIME-Version: 1.0
X-Originating-IP: [10.72.93.164]
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/3] pcm_file: use EIO instead of EPIPE when
	failing to write output file
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

EPIPE is defined as XRUN which is not entirely correct in this condition

failing to write to a file in pcm_file plugin can not be simply recovered
by a retry as user of the api might be led to believe when receiving EPIPE

use EIO instead to indicate a different kid of error that may not be
recoverable by retry

Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
Reviewed-by: Timo Wischer <twischer@de.adit-jv.com>
---
 src/pcm/pcm_file.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/src/pcm/pcm_file.c b/src/pcm/pcm_file.c
index ab47da8..d83f97a 100644
--- a/src/pcm/pcm_file.c
+++ b/src/pcm/pcm_file.c
@@ -575,7 +575,7 @@ static snd_pcm_sframes_t snd_pcm_file_writei(snd_pcm_t *pcm, const void *buffer,
 		__snd_pcm_lock(pcm);
 		if (snd_pcm_file_add_frames(pcm, areas, 0, n) < 0) {
 			__snd_pcm_unlock(pcm);
-			return -EPIPE;
+			return -EIO;
 		}
 		__snd_pcm_unlock(pcm);
 	}
@@ -593,7 +593,7 @@ static snd_pcm_sframes_t snd_pcm_file_writen(snd_pcm_t *pcm, void **bufs, snd_pc
 		__snd_pcm_lock(pcm);
 		if (snd_pcm_file_add_frames(pcm, areas, 0, n) < 0) {
 			__snd_pcm_unlock(pcm);
-			return -EPIPE;
+			return -EIO;
 		}
 		__snd_pcm_unlock(pcm);
 	}
@@ -616,7 +616,7 @@ static snd_pcm_sframes_t snd_pcm_file_readi(snd_pcm_t *pcm, void *buffer, snd_pc
 	__snd_pcm_lock(pcm);
 	if (snd_pcm_file_add_frames(pcm, areas, 0, frames) < 0) {
 		__snd_pcm_unlock(pcm);
-		return -EPIPE;
+		return -EIO;
 	}
 
 	__snd_pcm_unlock(pcm);
@@ -640,7 +640,7 @@ static snd_pcm_sframes_t snd_pcm_file_readn(snd_pcm_t *pcm, void **bufs, snd_pcm
 	__snd_pcm_lock(pcm);
 	if (snd_pcm_file_add_frames(pcm, areas, 0, frames) < 0) {
 		__snd_pcm_unlock(pcm);
-		return -EPIPE;
+		return -EIO;
 	}
 
 	__snd_pcm_unlock(pcm);
@@ -666,7 +666,7 @@ static snd_pcm_sframes_t snd_pcm_file_mmap_commit(snd_pcm_t *pcm,
 		result = snd_pcm_mmap_commit(file->gen.slave, ofs, siz);
 		if (result > 0) {
 			if (snd_pcm_file_add_frames(pcm, areas, ofs, result) < 0)
-				return -EPIPE;
+				return -EIO;
 		}
 	}
 	return result;
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
