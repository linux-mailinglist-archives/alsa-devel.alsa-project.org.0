Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF9A42BF64
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 14:02:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF1E31612;
	Wed, 13 Oct 2021 14:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF1E31612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634126541;
	bh=x5oXQhKsB8378L/MIFea34xC73BoGRWw4oX85gnlOmE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DXvfpKxvGRDHxwU5nVZxzPOA7j/LVKHCnkIzxZWjtcBPH2FAMfUn2qS6dnFzfo+VU
	 5uoZ7XWU4ElYVCc8VEGdR6lAv6WFRK5WDg0CV/MZEbXn1JwH6FFvQfoRkl97SWrXk2
	 668g4f9eXkJUlFPMZy6x1yU6YJOvZqdwbC8BiFnI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48DAEF800C0;
	Wed, 13 Oct 2021 14:01:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67FA7F80269; Wed, 13 Oct 2021 14:01:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1325F80088
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 14:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1325F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="Vphjku6E"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="Y1XyMW1y"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 42EDDA1A3D402;
 Wed, 13 Oct 2021 14:00:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1634126455; bh=x5oXQhKsB8378L/MIFea34xC73BoGRWw4oX85gnlOmE=;
 h=From:To:Cc:Subject:Date:From;
 b=Vphjku6Em9VmdFlY1ip0NSAZjI5SBOxwFHIR0E/1FaBaH82RRD5tf9u518/i8dTSV
 PmnSv4GX/whsQdDFCtCCDnSdXpmmyax/kGLGOcRI0P+U/84MEJ11ed/IQ8TUIN8zI6
 k7QSZlLikIC7a8fhuv91xOKVR5bk0yBD07ME23To=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UE2yNIUPLZ2K; Wed, 13 Oct 2021 14:00:50 +0200 (CEST)
Received: from precision.doma (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 061C7A1A3D403;
 Wed, 13 Oct 2021 14:00:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1634126450; bh=x5oXQhKsB8378L/MIFea34xC73BoGRWw4oX85gnlOmE=;
 h=From:To:Cc:Subject:Date:From;
 b=Y1XyMW1ydYQsbE8IZplDt7g4irJaabWeJb3KF2Rs/ZrubYepHDxLRXjHKMlwUIiQU
 mZ2gJjF6mbp6t+s5V2XD4e7JXa+lE6OIYN+2YbIMFC5yXrO8M0BMbkjOm0z+BjGpBn
 B3UYSGKL8K2JiJ1D9RDvxSrLW2V3IFt/hF2tNMZA=
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] alsaloop: fixed parsing value 'auto' of option 'sync'
Date: Wed, 13 Oct 2021 14:00:49 +0200
Message-Id: <20211013120049.51047-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pavel Hofman <pavel.hofman@ivitera.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The value 'auto' was not checked which resulted in using
SYNC_TYPE_NONE instead of SYNC_TYPE_AUTO.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 alsaloop/alsaloop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/alsaloop/alsaloop.c b/alsaloop/alsaloop.c
index 4192712..f5f2e37 100644
--- a/alsaloop/alsaloop.c
+++ b/alsaloop/alsaloop.c
@@ -528,6 +528,8 @@ static int parse_config(int argc, char *argv[], snd_output_t *output,
 				arg_sync = SYNC_TYPE_PLAYRATESHIFT;
 			else if (optarg[0] == 'r')
 				arg_sync = SYNC_TYPE_SAMPLERATE;
+			else if (optarg[0] == 'a')
+				arg_sync = SYNC_TYPE_AUTO;
 			else
 				arg_sync = atoi(optarg);
 			if (arg_sync < 0 || arg_sync > SYNC_TYPE_LAST)
-- 
2.25.1

