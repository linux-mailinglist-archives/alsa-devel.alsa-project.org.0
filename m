Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FD924E55
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 13:49:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3BDF15F2;
	Tue, 21 May 2019 13:48:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3BDF15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558439379;
	bh=Q9w2o+qCouNS/g9J789xYYk+LoUhlnWaeeASp5YEooY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sN4zUWAgPM0VVx9l9wc9wSssPBqn3biapJYB7utXRnUoyxJMajq8yzYVKYEk+WNvG
	 gWYds7PI/fLZjAV9mVBlLz8+dbEQeg+DlaNb5x1fT/FDgTmi5vLtBlX+aoaZXIhhUY
	 rb89infFEqCqEfXLbm7tArO5sCbF+3+2lCoA3Z5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB60CF89674;
	Tue, 21 May 2019 13:47:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0680BF89674; Tue, 21 May 2019 13:47:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 865D2F8079B;
 Tue, 21 May 2019 13:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 865D2F8079B
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id D32693C00DD;
 Tue, 21 May 2019 13:47:34 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e7Rs18tzHYbo; Tue, 21 May 2019 13:47:28 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 085893C005E;
 Tue, 21 May 2019 13:47:28 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Tue, 21 May 2019 13:47:27 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Tue, 21 May 2019 13:47:14 +0200
Message-ID: <1558439234-29477-1-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.72.93.164]
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH - alsa-lib 1/4] pcm_file: add support for
	infile reading in non interleaved mode
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

add helper function to copy input file data to buffer mapped by areas,
in case of an error, do not fill the areas, allowing device read buffer
to be provided to api caller

previously unused rbuf variable is reused for this purpose

Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
Reviewed-by: Timo Wischer <twischer@de.adit-jv.com>

diff --git a/src/pcm/pcm_file.c b/src/pcm/pcm_file.c
index 3a19cef..3c68265 100644
--- a/src/pcm/pcm_file.c
+++ b/src/pcm/pcm_file.c
@@ -77,6 +77,7 @@ typedef struct {
 	snd_pcm_uframes_t appl_ptr;
 	snd_pcm_uframes_t file_ptr_bytes;
 	snd_pcm_uframes_t wbuf_size;
+	snd_pcm_uframes_t rbuf_size;
 	size_t wbuf_size_bytes;
 	size_t wbuf_used_bytes;
 	char *wbuf;
@@ -266,6 +267,39 @@ static int snd_pcm_file_open_output_file(snd_pcm_file_t *file)
 	return 0;
 }
 
+/* fill areas with data from input file, return bytes red */
+static int snd_pcm_file_areas_read_infile(snd_pcm_t *pcm,
+					  const snd_pcm_channel_area_t *areas,
+					  snd_pcm_uframes_t offset,
+					  snd_pcm_uframes_t frames)
+{
+	snd_pcm_file_t *file = pcm->private_data;
+	snd_pcm_channel_area_t areas_if[pcm->channels];
+	ssize_t bytes;
+
+	if (file->ifd < 0)
+		return -EBADF;
+
+	if (file->rbuf == NULL)
+		return -ENOMEM;
+
+	if (file->rbuf_size < frames) {
+		SYSERR("requested more frames than pcm buffer");
+		return -ENOMEM;
+	}
+
+	bytes = read(file->ifd, file->rbuf, snd_pcm_frames_to_bytes(pcm, frames));
+	if (bytes < 0) {
+		SYSERR("read from file failed, error: %d", bytes);
+		return bytes;
+	}
+
+	snd_pcm_areas_from_buf(pcm, areas_if, file->rbuf);
+	snd_pcm_areas_copy(areas, offset, areas_if, 0, pcm->channels, snd_pcm_bytes_to_frames(pcm, bytes), pcm->format);
+
+	return bytes;
+}
+
 static void setup_wav_header(snd_pcm_t *pcm, struct wav_fmt *fmt)
 {
 	fmt->fmt = TO_LE16(0x01);
@@ -568,19 +602,19 @@ static snd_pcm_sframes_t snd_pcm_file_readn(snd_pcm_t *pcm, void **bufs, snd_pcm
 {
 	snd_pcm_file_t *file = pcm->private_data;
 	snd_pcm_channel_area_t areas[pcm->channels];
-	snd_pcm_sframes_t n;
+	snd_pcm_sframes_t frames;
 
-	if (file->ifd >= 0) {
-		SNDERR("DEBUG: Noninterleaved read not yet implemented.\n");
-		return 0;	/* TODO: Noninterleaved read */
-	}
+	__snd_pcm_lock(pcm);
+	frames = _snd_pcm_readn(file->gen.slave, bufs, size);
+	if (frames <= 0)
+		return frames;
 
-	n = _snd_pcm_readn(file->gen.slave, bufs, size);
-	if (n > 0) {
-		snd_pcm_areas_from_bufs(pcm, areas, bufs);
-		snd_pcm_file_add_frames(pcm, areas, 0, n);
-	}
-	return n;
+	snd_pcm_areas_from_bufs(pcm, areas, bufs);
+	snd_pcm_file_areas_read_infile(pcm, areas, 0, frames);
+	snd_pcm_file_add_frames(pcm, areas, 0, frames);
+
+	__snd_pcm_unlock(pcm);
+	return frames;
 }
 
 static snd_pcm_sframes_t snd_pcm_file_mmap_commit(snd_pcm_t *pcm,
@@ -609,9 +643,11 @@ static int snd_pcm_file_hw_free(snd_pcm_t *pcm)
 	free(file->wbuf);
 	free(file->wbuf_areas);
 	free(file->final_fname);
+	free(file->rbuf);
 	file->wbuf = NULL;
 	file->wbuf_areas = NULL;
 	file->final_fname = NULL;
+	file->rbuf = NULL;
 	return snd_pcm_hw_free(file->gen.slave);
 }
 
@@ -638,6 +674,15 @@ static int snd_pcm_file_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params)
 		snd_pcm_file_hw_free(pcm);
 		return -ENOMEM;
 	}
+	assert(!file->rbuf);
+	file->rbuf_size = slave->buffer_size;
+	file->rbuf_size_bytes = snd_pcm_frames_to_bytes(slave, file->rbuf_size);
+	file->rbuf_used_bytes = 0;
+	file->rbuf = malloc(file->rbuf_size_bytes);
+	if (file->rbuf == NULL) {
+		snd_pcm_file_hw_free(pcm);
+		return -ENOMEM;
+	}
 	file->appl_ptr = file->file_ptr_bytes = 0;
 	for (channel = 0; channel < slave->channels; ++channel) {
 		snd_pcm_channel_area_t *a = &file->wbuf_areas[channel];
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
