Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5D75BCE2
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2019 15:28:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A10DC169A;
	Mon,  1 Jul 2019 15:28:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A10DC169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561987734;
	bh=akjr64aOywYOPpBQR5HF5r4sfAWtnKEsr7qEZTep8pM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hy//X3FarOeu2AJOAOkmUGEZ6s9kzifwOnf839GdHOv3pmL6sdsvCLr0aMCKoE6fN
	 9Gnp2Cpw6XM/3+EPsShKztRLfLHzXy2+2xuxIBJEjx4p5ijrhS+jUHBfGbCKpEoIp7
	 hAmpJADpUPPG3C1Hm+O+B4APLuLgyPbXbf2pCtXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1129DF89734;
	Mon,  1 Jul 2019 15:25:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73D65F89737; Mon,  1 Jul 2019 15:25:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5B59F8076A;
 Mon,  1 Jul 2019 15:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5B59F8076A
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 732643C04C1;
 Mon,  1 Jul 2019 15:25:39 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uUzkvFcxt_O8; Mon,  1 Jul 2019 15:25:33 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id AF1663C057C;
 Mon,  1 Jul 2019 15:25:28 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Mon, 1 Jul 2019 15:25:28 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Mon, 1 Jul 2019 15:25:18 +0200
Message-ID: <1561987518-2828-4-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561987518-2828-1-git-send-email-amiartus@de.adit-jv.com>
References: <1561987518-2828-1-git-send-email-amiartus@de.adit-jv.com>
MIME-Version: 1.0
X-Originating-IP: [10.72.93.164]
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 3/3] pcm_file: in case of failed write clear
	file buffer variables
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

previously, in case of failed write to output file, error is returned
from snd_pcm_writei/read APIs, user could run pcm_drain as fallback and
encounter an assert, since drain would try to write remaining file
buffer to a file

if failed to write to output file in first place, it makes sense to clear
current internal pmc_file file buffer variables

Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
Reviewed-by: Timo Wischer <twischer@de.adit-jv.com>
---
 src/pcm/pcm_file.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/src/pcm/pcm_file.c b/src/pcm/pcm_file.c
index f800e51..bf6e064 100644
--- a/src/pcm/pcm_file.c
+++ b/src/pcm/pcm_file.c
@@ -414,8 +414,11 @@ static int snd_pcm_file_write_bytes(snd_pcm_t *pcm, size_t bytes)
 	if (file->format == SND_PCM_FILE_FORMAT_WAV &&
 	    !file->wav_header.fmt) {
 		err = write_wav_header(pcm);
-		if (err < 0)
+		if (err < 0) {
+			file->wbuf_used_bytes = 0;
+			file->file_ptr_bytes = 0;
 			return err;
+		}
 	}
 
 	while (bytes > 0) {
@@ -426,6 +429,8 @@ static int snd_pcm_file_write_bytes(snd_pcm_t *pcm, size_t bytes)
 		err = write(file->fd, file->wbuf + file->file_ptr_bytes, n);
 		if (err < 0) {
 			err = -errno;
+			file->wbuf_used_bytes = 0;
+			file->file_ptr_bytes = 0;
 			SYSERR("%s write failed, file data may be corrupt", file->fname);
 			return err;
 		}
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
