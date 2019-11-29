Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F63410DA2A
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Nov 2019 20:37:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E75D3166D;
	Fri, 29 Nov 2019 20:36:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E75D3166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575056254;
	bh=qIU6q83f9pTIXpfBD07yiaC+F/+OQfXESNeNOgGCRUA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kkhJ33hQLX1hO9fPvfoICpWLfr8OKUI3bbkLCiQHImvcsZo2sqeCdaR3dtMlyqyp6
	 f023uPDqSfc7QHays+ly7kv2gtFcAO10z/20Oxfjn/X28xCIvhfI6epNiazyTIJpD7
	 bPS9f917j0MMIjrUNJ/Nnm/2wMb6irzuGY8j81zk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3176DF800C2;
	Fri, 29 Nov 2019 20:35:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40351F8016F; Fri, 29 Nov 2019 20:35:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51E2AF800C2
 for <alsa-devel@alsa-project.org>; Fri, 29 Nov 2019 20:35:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51E2AF800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="n0KUy7AV"
Received: by mail-pj1-x1044.google.com with SMTP id s8so13689105pji.2
 for <alsa-devel@alsa-project.org>; Fri, 29 Nov 2019 11:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yOClwEBxwXObBV64/qIQddKfVVCljfJuY0r1InUxjoA=;
 b=n0KUy7AV66CDrovQFh+nkzwHwslqWVsqBQAWaDQyEfJu+0avl76YQ49I+n/x4rdKTs
 fJcZiRrSB6/wyy8g780dx/BcocwGyaOXAZcaGV3H3AkAC0ia6ZZNKT6X+z9hyVeIFfq3
 Bthbt2Hc6gHJiJqWvIeFvhOb+VFD0ayXgzzGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yOClwEBxwXObBV64/qIQddKfVVCljfJuY0r1InUxjoA=;
 b=lUIh6IWNPvYWObG9v/QHY77dFXv3qVKPPaAUAUYkZB6nYCVV+2nfjOC+xdI1MTN46N
 A8Oav3Beu3S7PYm8CViE8sCv9FclEptuI5RtwhGInf79RuA7rVgNDKpcPMK4NGao/jp4
 AHzrtLImy1dLwrAAYczBMglr1VfM1rH0YD+4Cuaf6EG4fp42676NnXrzC60gUCdHssHQ
 9+qIQ2pc7VCyKgWGG1Uo6yt1kB6481UrS1nJtMfV475rh3gABKw1M65c4PZK+EsFqhum
 pFJudwIc/ij/pQmxzl68weY2HrwtD/n6io8W06SpHvZWrVNSXyGbOcwEyNOSsjLG7NGV
 puGg==
X-Gm-Message-State: APjAAAXCa1sFJrXLKqUFrR6l19TFNaHJitbrtSWlL4TPVxGHYmkPryhs
 Z63+E2X/IZnGh3WRols26pbhTCjgXQQ=
X-Google-Smtp-Source: APXvYqy5jbxqI3Yg4Ox2n+5/r1NOC5WMUrSf/SEV6mewD14rRAIg9WvK3pnZWYsXWTaJwIK/ML+lHw==
X-Received: by 2002:a17:90a:db43:: with SMTP id
 u3mr20713554pjx.56.1575056143111; 
 Fri, 29 Nov 2019 11:35:43 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:521e:3469:803b:9ad6])
 by smtp.gmail.com with ESMTPSA id o67sm24734226pga.62.2019.11.29.11.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2019 11:35:42 -0800 (PST)
From: Chih-Yang Hsia <paulhsia@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Date: Sat, 30 Nov 2019 03:35:30 +0800
Message-Id: <20191129193530.51415-1-paulhsia@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, paulhsia <paulhsia@chromium.org>
Subject: [alsa-devel] [PATCH alsa-lib] ucm: Use strncmp to avoid
	access-out-of-boundary
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

From: paulhsia <paulhsia@chromium.org>

If the length of the identifier is less than the length of the prefix,
access-out-of-boundary will occur in memcmp().

Signed-off-by: paulhsia <paulhsia@chromium.org>
---
 src/ucm/main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/src/ucm/main.c b/src/ucm/main.c
index b0b6ffb3..252e50d9 100644
--- a/src/ucm/main.c
+++ b/src/ucm/main.c
@@ -61,11 +61,13 @@ static int check_identifier(const char *identifier, const char *prefix)
 {
 	int len;
 
-	if (strcmp(identifier, prefix) == 0)
-		return 1;
 	len = strlen(prefix);
-	if (memcmp(identifier, prefix, len) == 0 && identifier[len] == '/')
+	if (strncmp(identifier, prefix, len) != 0)
+		return 0;
+
+	if (identifier[len] == 0 || identifier[len] == '/')
 		return 1;
+
 	return 0;
 }
 
-- 
2.24.0.393.g34dc348eaf-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
