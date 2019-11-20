Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1DB10328C
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 05:32:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80FFA169A;
	Wed, 20 Nov 2019 05:31:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80FFA169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574224347;
	bh=cJTqw6aKkyDxCiM1cSIAtk+8XPBb0utW7ijNU0FEyrE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IebbNn7wvgDYmyz69Np2rXgCNkpQ+L1dm2wvpaOrOy4ikknT8RYdbDh3Jcon3/T2t
	 4vD3QjftJ/h8r++jqUreMtFEzZMtvA+BwhkMnuJPcQROq0BDLTwJKFb+5Fdt2E54b1
	 6lmnv3e/jDjzf2DoRm0QPzrrZU0KaPboD5GZfQQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0EFBF80159;
	Wed, 20 Nov 2019 05:29:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4662F800FF; Wed, 20 Nov 2019 05:29:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2525F8013E
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 05:29:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2525F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TdDqEiPh"
Received: by mail-pf1-x444.google.com with SMTP id c13so13559489pfp.5
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 20:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6pJPh01pMemYS+jhC5QWYxBUq3Dcy/FkJCK6VSKpF+Q=;
 b=TdDqEiPh3g6ibfqBMC8y5O+MFum6u/hDqENjVSuSsMxu6Ugok0rAwR8KIZWqtvOmzJ
 Dx+ukx8JnUjwpOxgjRLNvoyAcLLSZGGvAkrOk2pU75Jiw2cRj44vXkeQ3hRKbjSTcSaY
 wtQWV9oMrb71uU6mnPtWY+tRJ19P+MPubfUHtjzegLQgi0/Wywqiaw3236bHKxsbwzyj
 hcEZv5pFIKjn9vXQGT/S8qa4vb7S4asxogNW5b0+99ALOX2ad9MdxHgM2rvD3SUfl78h
 U+4JPIp2jt5LyCiXMblVYbZHvJGte5ZN868lxLSqB0If2CEhe0IOS/8TRbFlKi9UFaED
 oaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6pJPh01pMemYS+jhC5QWYxBUq3Dcy/FkJCK6VSKpF+Q=;
 b=lb8lbpN1103WTPmk3Q620D9/rs2H/veZLvuHybeQllkUcHIED8Z5FEH/AplKviVIg5
 2iITA7wyhl3JJxnSbTjR5XcWdC9CKJWFCNWHygfqwgj2l1hK7PHJBZlxpzHDPl/KJEgW
 iNggix7y74EhRn/4nh16NXjfy5HAjB6vMo3yHlsJvfs2Vq5DFHjJKwBxPEAU3Ipcx2y6
 sXkO5N1A4jYLl26mu/LTvfqhKXR0fMQrUTzHzHtmItwHlEh/m+NlkbA78hG4hnZtnwYF
 wBN63uJIWQIyh3AnAPET7r3xmjwQQXZUsRX60SOhWetuzIYljoCiEFc+SIQHu3oB9+B7
 glsQ==
X-Gm-Message-State: APjAAAVjGIR3P8aV+EzIV0TQepnqGF5zbVLibfsHzgR0PIVHOVo1Goqf
 gvLKNT+XcLBOVDvdZJ3KOFvn0oTz6PQ=
X-Google-Smtp-Source: APXvYqx4MyYmyNvGjAgOGFvbZL+H6kc32FBg65NcN+fgtYJ6nFJ429tTIUAbPbiLoYuvVJBpj7K62w==
X-Received: by 2002:a63:5551:: with SMTP id f17mr822944pgm.287.1574224140694; 
 Tue, 19 Nov 2019 20:29:00 -0800 (PST)
Received: from mangix-trapnet.lan ([69.42.0.214])
 by smtp.gmail.com with ESMTPSA id a6sm5447285pja.30.2019.11.19.20.29.00
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 20:29:00 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: alsa-devel@alsa-project.org
Date: Tue, 19 Nov 2019 20:28:56 -0800
Message-Id: <20191120042856.415854-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191120042856.415854-1-rosenp@gmail.com>
References: <20191120042856.415854-1-rosenp@gmail.com>
MIME-Version: 1.0
Subject: [alsa-devel] [PATCH 4/4] aplay: Limit VUMeter progress bar to 100
	for negative as well
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

If the progress bar somehow becomes negative, it ends up overwritting
tmp. Fixes this GCC warning:

aplay.c:1747:18: warning: '%02d' directive writing between 2 and 11 bytes
 into a region of size 4 [-Wformat-overflow=]
 1747 |    sprintf(tmp, "%02d%%", maxperc[c]);

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 aplay/aplay.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/aplay/aplay.c b/aplay/aplay.c
index 72fa567..9c5a11b 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -54,6 +54,8 @@
 #include "formats.h"
 #include "version.h"
 
+#define ABS(a)  (a) < 0 ? -(a) : (a)
+
 #ifdef SND_CHMAP_API_VERSION
 #define CONFIG_SUPPORT_CHMAP	1
 #endif
@@ -1741,7 +1743,7 @@ static void print_vu_meter_stereo(int *perc, int *maxperc)
 			line[bar_length + 6 + 1 + p] = '+';
 		else
 			line[bar_length - p - 1] = '+';
-		if (maxperc[c] > 99)
+		if (ABS(maxperc[c]) > 99)
 			sprintf(tmp, "MAX");
 		else
 			sprintf(tmp, "%02d%%", maxperc[c]);
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
