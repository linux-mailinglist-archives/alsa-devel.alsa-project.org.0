Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C37FB25115
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 15:50:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38AB2166A;
	Tue, 21 May 2019 15:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38AB2166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558446605;
	bh=g5IPFzrVrxvOYlDdh+tIxiQuce2s+Fn97wKAGxB0V7o=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OkFDNR3etqeQNC8MgNBtG1L1AhhhdX1zTOSI1a1jTUxqtUt6tCew5kl0+RatMtOn7
	 OQSnn5c3xW7TO5cKVZ4MgQGr4crG6n9qTTT6o1mTHdkQSvv20sfgkYMLORF0fKiv4f
	 YJSUtOH7aGV10mwF44a0lUe9diAx77y/7SZ+e63E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F01C5F89734;
	Tue, 21 May 2019 15:47:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BBF2F89670; Tue, 21 May 2019 15:44:04 +0200 (CEST)
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6F37F89709;
 Tue, 21 May 2019 15:33:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6F37F89709
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id B5DF23C00D1;
 Tue, 21 May 2019 15:33:57 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id igySFf_GHeXl; Tue, 21 May 2019 15:33:51 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 31F023C005E;
 Tue, 21 May 2019 15:33:51 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Tue, 21 May 2019 15:33:50 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Tue, 21 May 2019 15:33:50 +0200
Message-ID: <1558445630-11610-1-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.72.93.164]
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH - alsa-lib 4/4] pcm_file: add infile read
	support for mmap mode
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

mmap_begin callback is used to copy data from input file to mmaped
buffer

guard for corner use of api (multiple mmap_begin calls by user) is
introduced to check if next continuous buffer was already overwritten

buffer is overwritten with input file data only in case of stream capture

Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
Reviewed-by: Timo Wischer <twischer@de.adit-jv.com>

diff --git a/src/pcm/pcm_file.c b/src/pcm/pcm_file.c
index 10d227b..7d3439a 100644
--- a/src/pcm/pcm_file.c
+++ b/src/pcm/pcm_file.c
@@ -88,6 +88,7 @@ typedef struct {
 	size_t buffer_bytes;
 	struct wav_fmt wav_header;
 	size_t filelen;
+	char ifmmap_overwritten;
 } snd_pcm_file_t;
 
 #if __BYTE_ORDER == __LITTLE_ENDIAN
@@ -626,6 +627,8 @@ static snd_pcm_sframes_t snd_pcm_file_mmap_commit(snd_pcm_t *pcm,
 	const snd_pcm_channel_area_t *areas;
 	snd_pcm_sframes_t result;
 
+	file->ifmmap_overwritten = 0;
+
 	result = snd_pcm_mmap_begin(file->gen.slave, &areas, &ofs, &siz);
 	if (result >= 0) {
 		assert(ofs == offset && siz == size);
@@ -636,6 +639,32 @@ static snd_pcm_sframes_t snd_pcm_file_mmap_commit(snd_pcm_t *pcm,
 	return result;
 }
 
+static int snd_pcm_file_mmap_begin(snd_pcm_t *pcm, const snd_pcm_channel_area_t **areas,
+	snd_pcm_uframes_t *offset, snd_pcm_uframes_t *frames)
+{
+	snd_pcm_file_t *file = pcm->private_data;
+	snd_pcm_channel_area_t areas_if[pcm->channels];
+	snd_pcm_uframes_t frames_if;
+	void *buffer = NULL;
+	int result;
+
+	result = snd_pcm_mmap_begin(file->gen.slave, areas, offset, frames);
+	if (result < 0)
+		return result;
+
+	if (pcm->stream != SND_PCM_STREAM_CAPTURE)
+		return result;
+
+	/* user may run mmap_begin without mmap_commit multiple times in row */
+	if (file->ifmmap_overwritten)
+		return result;
+	file->ifmmap_overwritten = 1;
+
+	snd_pcm_file_areas_read_infile(pcm, *areas, *offset, *frames);
+
+	return result;
+}
+
 static int snd_pcm_file_hw_free(snd_pcm_t *pcm)
 {
 	snd_pcm_file_t *file = pcm->private_data;
@@ -662,6 +691,7 @@ static int snd_pcm_file_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params)
 	file->wbuf_size = slave->buffer_size * 2;
 	file->wbuf_size_bytes = snd_pcm_frames_to_bytes(slave, file->wbuf_size);
 	file->wbuf_used_bytes = 0;
+	file->ifmmap_overwritten = 0;
 	assert(!file->wbuf);
 	file->wbuf = malloc(file->wbuf_size_bytes);
 	if (file->wbuf == NULL) {
@@ -773,7 +803,7 @@ static const snd_pcm_fast_ops_t snd_pcm_file_fast_ops = {
 	.poll_descriptors = snd_pcm_generic_poll_descriptors,
 	.poll_revents = snd_pcm_generic_poll_revents,
 	.htimestamp = snd_pcm_generic_htimestamp,
-	.mmap_begin = NULL,
+	.mmap_begin = snd_pcm_file_mmap_begin,
 };
 
 /**
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
