Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A48D238A38
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 14:26:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 325041607;
	Fri,  7 Jun 2019 14:26:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 325041607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559910414;
	bh=OGgEp7OhkTHqU0CZhMgDBRUEs/tr9VeTfg2W43tpbiw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n13qptDPsTyc06pmYAgizZRD/2hOIq0IbiRsx1kYvBd17oL7L4VAn2p4EYIWQJAo0
	 VTukqEyJzJ+p7ghkLw43R/nvXh02MLbqLB/KaVjnjL6qjhNyFTY9xd423bys8XOBlY
	 2xe/EXQYGwJ7yFB3H0B2b33NNYM3W84lrhbztIW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA1E8F89731;
	Fri,  7 Jun 2019 14:23:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE7DCF89731; Fri,  7 Jun 2019 14:23:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CCB9F896CE;
 Fri,  7 Jun 2019 14:23:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CCB9F896CE
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 513EE3C00D1;
 Fri,  7 Jun 2019 14:23:39 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x6i6vdpsC1sd; Fri,  7 Jun 2019 14:23:33 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id C1A633C0149;
 Fri,  7 Jun 2019 14:23:28 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Fri, 7 Jun 2019 14:23:28 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Fri, 7 Jun 2019 14:23:23 +0200
Message-ID: <1559910203-29795-3-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559910203-29795-1-git-send-email-amiartus@de.adit-jv.com>
References: <1559910203-29795-1-git-send-email-amiartus@de.adit-jv.com>
MIME-Version: 1.0
X-Originating-IP: [10.72.93.164]
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/2] pcm_file: report write output file error
	to api user
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

when writing to output file fails, api user is notified and can handle
recovery

Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
---
 src/pcm/pcm_file.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/src/pcm/pcm_file.c b/src/pcm/pcm_file.c
index a1d15d6..7df5e89 100644
--- a/src/pcm/pcm_file.c
+++ b/src/pcm/pcm_file.c
@@ -576,7 +576,10 @@ static snd_pcm_sframes_t snd_pcm_file_writei(snd_pcm_t *pcm, const void *buffer,
 	if (n > 0) {
 		snd_pcm_areas_from_buf(pcm, areas, (void*) buffer);
 		__snd_pcm_lock(pcm);
-		snd_pcm_file_add_frames(pcm, areas, 0, n);
+		if (snd_pcm_file_add_frames(pcm, areas, 0, n) < 0) {
+			__snd_pcm_unlock(pcm);
+			return -EPIPE;
+		}
 		__snd_pcm_unlock(pcm);
 	}
 	return n;
@@ -591,7 +594,10 @@ static snd_pcm_sframes_t snd_pcm_file_writen(snd_pcm_t *pcm, void **bufs, snd_pc
 	if (n > 0) {
 		snd_pcm_areas_from_bufs(pcm, areas, bufs);
 		__snd_pcm_lock(pcm);
-		snd_pcm_file_add_frames(pcm, areas, 0, n);
+		if (snd_pcm_file_add_frames(pcm, areas, 0, n) < 0) {
+			__snd_pcm_unlock(pcm);
+			return -EPIPE;
+		}
 		__snd_pcm_unlock(pcm);
 	}
 	return n;
@@ -612,6 +618,11 @@ static snd_pcm_sframes_t snd_pcm_file_readi(snd_pcm_t *pcm, void *buffer, snd_pc
 	snd_pcm_file_areas_read_infile(pcm, areas, 0, frames);
 	__snd_pcm_lock(pcm);
 	snd_pcm_file_add_frames(pcm, areas, 0, frames);
+	if (snd_pcm_file_add_frames(pcm, areas, 0, frames) < 0) {
+		__snd_pcm_unlock(pcm);
+		return -EPIPE;
+	}
+
 	__snd_pcm_unlock(pcm);
 
 	return frames;
@@ -631,7 +642,11 @@ static snd_pcm_sframes_t snd_pcm_file_readn(snd_pcm_t *pcm, void **bufs, snd_pcm
 	snd_pcm_areas_from_bufs(pcm, areas, bufs);
 	snd_pcm_file_areas_read_infile(pcm, areas, 0, frames);
 	__snd_pcm_lock(pcm);
-	snd_pcm_file_add_frames(pcm, areas, 0, frames);
+	if (snd_pcm_file_add_frames(pcm, areas, 0, frames) < 0) {
+		__snd_pcm_unlock(pcm);
+		return -EPIPE;
+	}
+
 	__snd_pcm_unlock(pcm);
 
 	return frames;
@@ -653,8 +668,10 @@ static snd_pcm_sframes_t snd_pcm_file_mmap_commit(snd_pcm_t *pcm,
 	if (result >= 0) {
 		assert(ofs == offset && siz == size);
 		result = snd_pcm_mmap_commit(file->gen.slave, ofs, siz);
-		if (result > 0)
-			snd_pcm_file_add_frames(pcm, areas, ofs, result);
+		if (result > 0) {
+			if (snd_pcm_file_add_frames(pcm, areas, ofs, result) < 0)
+				return -EPIPE;
+		}
 	}
 	return result;
 }
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
