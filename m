Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F31C25108
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 15:48:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE04C167E;
	Tue, 21 May 2019 15:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE04C167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558446506;
	bh=ENKUMhqWBJEN7KUMgP1Xpb9Kz5mgtZHUhsKOzlTDq8I=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bbeidaSwDKF4Aczx+ePcNTfYHxyiQXT7iGAKfY87ZJp+ZlafVjvZ6r6PyXQAufM2t
	 8v1mhp1mtAkG1zZwagufJzRrvk/2WAC/DUFrRPxsUhReyTs/usVR7c9D4+4QsQuniD
	 EZCvqI5ojvS15AYehpEbTBz7rpQcpm9E6TjQ3CtE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 097C2F8972C;
	Tue, 21 May 2019 15:47:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27F5CF89725; Tue, 21 May 2019 15:43:22 +0200 (CEST)
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40BBFF89633;
 Tue, 21 May 2019 15:33:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40BBFF89633
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 087C83C00D1;
 Tue, 21 May 2019 15:33:16 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7cm6mPv_1nqS; Tue, 21 May 2019 15:33:09 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 6F4E13C005E;
 Tue, 21 May 2019 15:33:09 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Tue, 21 May 2019 15:33:09 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Tue, 21 May 2019 15:33:08 +0200
Message-ID: <1558445588-11524-1-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.72.93.164]
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH - alsa-lib 2/4] pcm_file: use
	snd_pcm_file_areas_read_infile for readi
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

use previously introduced helper function, this commit unifies behavior
of readi and readn

corner case behavior of readi is changed by this commit, previously,
in case 0 bytes were red from file (EOF), frames = 0 was returned,
signaling api user as if no data was red from slave, after the patch,
amount of frames red from slave with data red from slave stored in buffer
is returned when EOF is reached

Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
Reviewed-by: Timo Wischer <twischer@de.adit-jv.com>

diff --git a/src/pcm/pcm_file.c b/src/pcm/pcm_file.c
index 3c68265..dcaa41d 100644
--- a/src/pcm/pcm_file.c
+++ b/src/pcm/pcm_file.c
@@ -579,22 +579,21 @@ static snd_pcm_sframes_t snd_pcm_file_readi(snd_pcm_t *pcm, void *buffer, snd_pc
 {
 	snd_pcm_file_t *file = pcm->private_data;
 	snd_pcm_channel_area_t areas[pcm->channels];
-	snd_pcm_sframes_t n;
+	snd_pcm_sframes_t frames;
+
+	__snd_pcm_lock(pcm);
+
+	frames = _snd_pcm_readi(file->gen.slave, buffer, size);
+	if (frames <= 0)
+		return frames;
 
-	n = _snd_pcm_readi(file->gen.slave, buffer, size);
-	if (n <= 0)
-		return n;
-	if (file->ifd >= 0) {
-		__snd_pcm_lock(pcm);
-		n = read(file->ifd, buffer, n * pcm->frame_bits / 8);
-		__snd_pcm_unlock(pcm);
-		if (n < 0)
-			return n;
-		n = n * 8 / pcm->frame_bits;
-	}
 	snd_pcm_areas_from_buf(pcm, areas, buffer);
-	snd_pcm_file_add_frames(pcm, areas, 0, n);
-	return n;
+	snd_pcm_file_areas_read_infile(pcm, areas, 0, frames);
+	snd_pcm_file_add_frames(pcm, areas, 0, frames);
+
+	__snd_pcm_unlock(pcm);
+
+	return frames;
 }
 
 /* locking */
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
