Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0917827D8B
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 15:04:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 941EA1671;
	Thu, 23 May 2019 15:03:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 941EA1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558616644;
	bh=nsEP7FHZS8bI6oNA8yvRdNtW4LDepiK31KIGRSoKImc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VrJjK9JGcCEH6OtjKKT3R0yqVC14DiQ2v+n1oyDMkg/KGvgiKcRFGQ22/NEXvIpI/
	 dwnAjxfZaJXI2wnKdUA/6DRhPzBZT3aQJI+EgZ6xtDQ40lCk31oZkIr+OtJfh1yE1b
	 Rwj24Snv2TpdUlZb/tb2NkbeJQvvL64laAuBsF6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53BCFF89730;
	Thu, 23 May 2019 15:01:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 809A7F89725; Thu, 23 May 2019 15:01:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC9F0F80C0F;
 Thu, 23 May 2019 15:01:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC9F0F80C0F
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id AE8533C005E;
 Thu, 23 May 2019 15:01:01 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ZRrz5wLgsF6; Thu, 23 May 2019 15:00:55 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 489473C00DD;
 Thu, 23 May 2019 15:00:49 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Thu, 23 May 2019 15:00:48 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Thu, 23 May 2019 15:00:40 +0200
Message-ID: <1558616440-21044-3-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558616440-21044-1-git-send-email-amiartus@de.adit-jv.com>
References: <1558616440-21044-1-git-send-email-amiartus@de.adit-jv.com>
MIME-Version: 1.0
X-Originating-IP: [10.72.93.164]
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/2] pcm_file: add infile read support for mmap
	mode
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
---
 src/pcm/pcm_file.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/src/pcm/pcm_file.c b/src/pcm/pcm_file.c
index 8e2c70b..52cc10a 100644
--- a/src/pcm/pcm_file.c
+++ b/src/pcm/pcm_file.c
@@ -88,6 +88,7 @@ typedef struct {
 	size_t buffer_bytes;
 	struct wav_fmt wav_header;
 	size_t filelen;
+	char ifmmap_overwritten;
 } snd_pcm_file_t;
 
 #if __BYTE_ORDER == __LITTLE_ENDIAN
@@ -630,6 +631,8 @@ static snd_pcm_sframes_t snd_pcm_file_mmap_commit(snd_pcm_t *pcm,
 	const snd_pcm_channel_area_t *areas;
 	snd_pcm_sframes_t result;
 
+	file->ifmmap_overwritten = 0;
+
 	result = snd_pcm_mmap_begin(file->gen.slave, &areas, &ofs, &siz);
 	if (result >= 0) {
 		assert(ofs == offset && siz == size);
@@ -640,6 +643,32 @@ static snd_pcm_sframes_t snd_pcm_file_mmap_commit(snd_pcm_t *pcm,
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
@@ -666,6 +695,7 @@ static int snd_pcm_file_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params)
 	file->wbuf_size = slave->buffer_size * 2;
 	file->wbuf_size_bytes = snd_pcm_frames_to_bytes(slave, file->wbuf_size);
 	file->wbuf_used_bytes = 0;
+	file->ifmmap_overwritten = 0;
 	assert(!file->wbuf);
 	file->wbuf = malloc(file->wbuf_size_bytes);
 	if (file->wbuf == NULL) {
@@ -777,6 +807,7 @@ static const snd_pcm_fast_ops_t snd_pcm_file_fast_ops = {
 	.poll_descriptors = snd_pcm_generic_poll_descriptors,
 	.poll_revents = snd_pcm_generic_poll_revents,
 	.htimestamp = snd_pcm_generic_htimestamp,
+	.mmap_begin = snd_pcm_file_mmap_begin,
 };
 
 /**
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
