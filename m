Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5845279A5
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 11:47:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 535161681;
	Thu, 23 May 2019 11:46:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 535161681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558604834;
	bh=ZswCPjl0DNoxmyf54hPFTkt4SjutSHr5X7jFd5gMXtI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uGrzE3yRro0Lo5O+LQ+ZFopP8Lw3jpVpP8U7C36Cm4mjBP6s0pP3ivlgSpBFj8LX0
	 R6QblFd9XOu5DUJuz2GPNyTeRFWyjvebELlKieMfvntnS3nJiPwoJYuBiq2PbdKITf
	 5A7eNNFyEGwxohipLTUc24Iv7mwtjVGaHXqXgoj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81FECF89728;
	Thu, 23 May 2019 11:44:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B673AF89674; Thu, 23 May 2019 11:44:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C97BF8079B;
 Thu, 23 May 2019 11:44:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C97BF8079B
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 0DBF53C00D1;
 Thu, 23 May 2019 11:44:46 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7HKgyxLS9gWm; Thu, 23 May 2019 11:44:39 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 371833C00DD;
 Thu, 23 May 2019 11:44:38 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Thu, 23 May 2019 11:44:37 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Thu, 23 May 2019 11:44:30 +0200
Message-ID: <1558604670-4180-2-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558604670-4180-1-git-send-email-amiartus@de.adit-jv.com>
References: <1558604670-4180-1-git-send-email-amiartus@de.adit-jv.com>
MIME-Version: 1.0
X-Originating-IP: [10.72.93.164]
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH - alsa-lib 1/1] pcm_file: add missing unlock on
	early return
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

Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>

diff --git a/src/pcm/pcm_file.c b/src/pcm/pcm_file.c
index dcaa41d..8e2c70b 100644
--- a/src/pcm/pcm_file.c
+++ b/src/pcm/pcm_file.c
@@ -584,8 +584,10 @@ static snd_pcm_sframes_t snd_pcm_file_readi(snd_pcm_t *pcm, void *buffer, snd_pc
 	__snd_pcm_lock(pcm);
 
 	frames = _snd_pcm_readi(file->gen.slave, buffer, size);
-	if (frames <= 0)
+	if (frames <= 0) {
+		__snd_pcm_unlock(pcm);
 		return frames;
+	}
 
 	snd_pcm_areas_from_buf(pcm, areas, buffer);
 	snd_pcm_file_areas_read_infile(pcm, areas, 0, frames);
@@ -605,8 +607,10 @@ static snd_pcm_sframes_t snd_pcm_file_readn(snd_pcm_t *pcm, void **bufs, snd_pcm
 
 	__snd_pcm_lock(pcm);
 	frames = _snd_pcm_readn(file->gen.slave, bufs, size);
-	if (frames <= 0)
+	if (frames <= 0) {
+		__snd_pcm_unlock(pcm);
 		return frames;
+	}
 
 	snd_pcm_areas_from_bufs(pcm, areas, bufs);
 	snd_pcm_file_areas_read_infile(pcm, areas, 0, frames);
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
