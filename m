Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA38F38A32
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 14:26:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65E601662;
	Fri,  7 Jun 2019 14:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65E601662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559910368;
	bh=R4Jwa+8cT9m+Idc9Gb4Wuje0m0a+PAKrrBcDJVx+4/Q=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ue0nAnyrmBdiwhc+tMFQztysxGBfqAQTA1wp7g3YMN22P8z8yI6KZjEirN3KBWGa+
	 LrycfFPIzmytDc37iw/hGY///0DlQsFKkqNx5Fnki4+qQRLN6sMqaNpIsZn9UZnAsl
	 lPznrwB79SSBJTejQ+QegzQrWNFwtzwLcubUQT14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7772DF896CE;
	Fri,  7 Jun 2019 14:23:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9F49F896DE; Fri,  7 Jun 2019 14:23:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6723CF896DD;
 Fri,  7 Jun 2019 14:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6723CF896DD
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 036393C00D1;
 Fri,  7 Jun 2019 14:23:35 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zfUOeZylaVCO; Fri,  7 Jun 2019 14:23:29 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 881453C013A;
 Fri,  7 Jun 2019 14:23:28 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Fri, 7 Jun 2019 14:23:28 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Fri, 7 Jun 2019 14:23:22 +0200
Message-ID: <1559910203-29795-2-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559910203-29795-1-git-send-email-amiartus@de.adit-jv.com>
References: <1559910203-29795-1-git-send-email-amiartus@de.adit-jv.com>
MIME-Version: 1.0
X-Originating-IP: [10.72.93.164]
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/2] pcm_file: do not disrupt playback on
	output file write fail
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

previously playback could be interrupted by snd_pcm_file_add_frames:
    assert(file->wbuf_used_bytes < file->wbuf_size_bytes)

in case snd_pcm_file_write_bytes fails to write full amount of bytes
to file, variable wbuf_used_bytes would not be fully decremented by
requested amount of bytes function was called with

for the assert to trigger, multiple write fails need to happen, so
that wbuf_used_bytes overflows wbuf_size_bytes,

this patch will allow application to report error code to api user
who might have an idea how to recover, before assert is triggered,
also reporting error along with the print out message might give user
a better idea of what is going on, where previously reason for
mentioned assert was not immediately clear

Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
---
 src/pcm/pcm_file.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/src/pcm/pcm_file.c b/src/pcm/pcm_file.c
index 1ef80b5..a1d15d6 100644
--- a/src/pcm/pcm_file.c
+++ b/src/pcm/pcm_file.c
@@ -381,27 +381,31 @@ static void fixup_wav_header(snd_pcm_t *pcm)
 
 
 
-static void snd_pcm_file_write_bytes(snd_pcm_t *pcm, size_t bytes)
+/* return error code in case write failed */
+static int snd_pcm_file_write_bytes(snd_pcm_t *pcm, size_t bytes)
 {
 	snd_pcm_file_t *file = pcm->private_data;
+	snd_pcm_sframes_t err = 0;
 	assert(bytes <= file->wbuf_used_bytes);
 
 	if (file->format == SND_PCM_FILE_FORMAT_WAV &&
 	    !file->wav_header.fmt) {
-		if (write_wav_header(pcm) < 0)
-			return;
+		err = write_wav_header(pcm);
+		if (err < 0) {
+			SYSERR("%s write failed, file data may be corrupt", file->fname);
+			return err;
+		}
 	}
 
 	while (bytes > 0) {
-		snd_pcm_sframes_t err;
 		size_t n = bytes;
 		size_t cont = file->wbuf_size_bytes - file->file_ptr_bytes;
 		if (n > cont)
 			n = cont;
 		err = write(file->fd, file->wbuf + file->file_ptr_bytes, n);
 		if (err < 0) {
-			SYSERR("write failed");
-			break;
+			SYSERR("%s write failed, file data may be corrupt", file->fname);
+			return err;
 		}
 		bytes -= err;
 		file->wbuf_used_bytes -= err;
@@ -412,15 +416,18 @@ static void snd_pcm_file_write_bytes(snd_pcm_t *pcm, size_t bytes)
 		if ((snd_pcm_uframes_t)err != n)
 			break;
 	}
+
+	return 0;
 }
 
-static void snd_pcm_file_add_frames(snd_pcm_t *pcm, 
-				    const snd_pcm_channel_area_t *areas,
-				    snd_pcm_uframes_t offset,
-				    snd_pcm_uframes_t frames)
+static int snd_pcm_file_add_frames(snd_pcm_t *pcm, 
+				   const snd_pcm_channel_area_t *areas,
+				   snd_pcm_uframes_t offset,
+				   snd_pcm_uframes_t frames)
 {
 	snd_pcm_file_t *file = pcm->private_data;
 	while (frames > 0) {
+		int err = 0;
 		snd_pcm_uframes_t n = frames;
 		snd_pcm_uframes_t cont = file->wbuf_size - file->appl_ptr;
 		snd_pcm_uframes_t avail = file->wbuf_size - snd_pcm_bytes_to_frames(pcm, file->wbuf_used_bytes);
@@ -437,10 +444,15 @@ static void snd_pcm_file_add_frames(snd_pcm_t *pcm,
 		if (file->appl_ptr == file->wbuf_size)
 			file->appl_ptr = 0;
 		file->wbuf_used_bytes += snd_pcm_frames_to_bytes(pcm, n);
-		if (file->wbuf_used_bytes > file->buffer_bytes)
-			snd_pcm_file_write_bytes(pcm, file->wbuf_used_bytes - file->buffer_bytes);
+		if (file->wbuf_used_bytes > file->buffer_bytes) {
+			err = snd_pcm_file_write_bytes(pcm, file->wbuf_used_bytes - file->buffer_bytes);
+			if (err < 0) {
+				return err;
+			}
+		}
 		assert(file->wbuf_used_bytes < file->wbuf_size_bytes);
 	}
+	return 0;
 }
 
 static int snd_pcm_file_close(snd_pcm_t *pcm)
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
