Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A54A5BCE3
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2019 15:29:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5732A16B3;
	Mon,  1 Jul 2019 15:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5732A16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561987752;
	bh=TZhsR4MgkzAhuQDWAqGBAwlC+QLITxZcryD8kZJd41M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q3gW4AVyyNNMTwUEZv9qMHOqHrA9JGzvE6ZGZRElI0h5cEQFt2JUa9uSuNCGiTRZ4
	 idacIs2MOA3KYEZj4MCvvsNIn5la8TH565TO0JqbKaEJ2d/zqO2/Uvl8PyZlQCijcQ
	 ncHBgXspa1CsYvcHp26z398YCS9Mvq5IhjrbqOQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24BC8F89738;
	Mon,  1 Jul 2019 15:25:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A149CF89736; Mon,  1 Jul 2019 15:25:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 382BFF896EC;
 Mon,  1 Jul 2019 15:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 382BFF896EC
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id ED7033C001F;
 Mon,  1 Jul 2019 15:25:38 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6_XSGTNgdQlS; Mon,  1 Jul 2019 15:25:33 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 40CE13C0579;
 Mon,  1 Jul 2019 15:25:28 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Mon, 1 Jul 2019 15:25:27 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Mon, 1 Jul 2019 15:25:17 +0200
Message-ID: <1561987518-2828-3-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561987518-2828-1-git-send-email-amiartus@de.adit-jv.com>
References: <1561987518-2828-1-git-send-email-amiartus@de.adit-jv.com>
MIME-Version: 1.0
X-Originating-IP: [10.72.93.164]
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/3] pcm_file: improve error checking in
	write_wav_header function
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

previously errno would be returned even for cases where it may have
not been populated, for example one of the write functions failing,
or writing only partial buffer,

now progress through write operations separately and report errno when
appropriate

Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
Reviewed-by: Timo Wischer <twischer@de.adit-jv.com>
---
 src/pcm/pcm_file.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/src/pcm/pcm_file.c b/src/pcm/pcm_file.c
index d83f97a..f800e51 100644
--- a/src/pcm/pcm_file.c
+++ b/src/pcm/pcm_file.c
@@ -327,6 +327,8 @@ static void setup_wav_header(snd_pcm_t *pcm, struct wav_fmt *fmt)
 static int write_wav_header(snd_pcm_t *pcm)
 {
 	snd_pcm_file_t *file = pcm->private_data;
+	ssize_t res;
+
 	static const char header[] = {
 		'R', 'I', 'F', 'F',
 		0x24, 0, 0, 0,
@@ -341,15 +343,36 @@ static int write_wav_header(snd_pcm_t *pcm)
 	
 	setup_wav_header(pcm, &file->wav_header);
 
-	if (write(file->fd, header, sizeof(header)) != sizeof(header) ||
-	    write(file->fd, &file->wav_header, sizeof(file->wav_header)) !=
-	    sizeof(file->wav_header) ||
-	    write(file->fd, header2, sizeof(header2)) != sizeof(header2)) {
-		int err = errno;
-		SYSERR("%s write header failed, file data may be corrupt", file->fname);
-		return -err;
+	res = write(file->fd, header, sizeof(header));
+	if (res != sizeof(header)) {
+		goto write_error;
+	}
+
+	res = write(file->fd, &file->wav_header, sizeof(file->wav_header));
+	if (res != sizeof(file->wav_header)) {
+		goto write_error;
 	}
+
+	res = write(file->fd, header2, sizeof(header2));
+	if (res != sizeof(header2)) {
+		goto write_error;
+	}
+
 	return 0;
+
+write_error:
+	// print real errno if available and return EIO, reason for this is to block possible
+	// EPIPE in case file->fd is a pipe. EPIPE from file->fd conflicts with EPIPE from
+	// playback stream which should be used to signal XRUN on playback device
+	if (res < 0) {
+		SYSERR("%s write header failed, file data may be corrupt", file->fname);
+	} else {
+		SNDERR("%s write header incomplete, file data may be corrupt", file->fname);
+	}
+
+	memset(&file->wav_header, 0, sizeof(struct wav_fmt));
+
+	return -EIO;
 }
 
 /* fix up the length fields in WAV header */
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
