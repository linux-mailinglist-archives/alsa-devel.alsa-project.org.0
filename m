Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C28A8F24D7
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 03:03:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 582D0168E;
	Thu,  7 Nov 2019 03:02:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 582D0168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573092226;
	bh=Uqws3t5nY+/kgWUCa8AT4CfmYjrbGI1+y7tm7YUYmdI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LrgOx8GV6f9t7tJFYhNZ/aS4jTXp8LZM/Sg6NYrva1fKD1WnZOVF5O/VmE3+8Y6Yg
	 2XFQUmiwq9IP4XIur97LY2BgBiRWXdI2svJW5nKmV51kUDhhqdvAl+LPvI6tpj6tnN
	 g4nT2utad8HThSLgXUj6/tFtQGcKojtQigsec1jA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F283F8065E;
	Thu,  7 Nov 2019 02:58:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19413F80321; Thu,  7 Nov 2019 02:58:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19B1EF8048D
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 02:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19B1EF8048D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="GT1nvnSj"
Received: by mail-pl1-x644.google.com with SMTP id e3so334068plt.7
 for <alsa-devel@alsa-project.org>; Wed, 06 Nov 2019 17:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NMWAjpmwWtLHCGG+HdeGxWJERp3gGXJOhp0sqZ3EHm4=;
 b=GT1nvnSj7hvDG6uK+NOaJEYqlw6TARN+ZMPH0bLIYayDjOSamJXuh9aiqDuIZRy8OH
 agE1ZKvDQ1rMuWlSScOsg2onMRNMx177rwiRIFjHdsEk8bXCh5yQdet8hA65MajW3IGy
 F3JqznqUUdwRjochG/w3KscGtK2hLyezt9doM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NMWAjpmwWtLHCGG+HdeGxWJERp3gGXJOhp0sqZ3EHm4=;
 b=lEc/vHZ1FAvdrb2nhllcYC2g6fAk6RCouWqzxRh+dZtwz7GtXG2W+qtbZwcARq1vix
 yqEY4lTZW0vyJerp3qAwLUXr/BxlbqjdOF+big0r/rPLKweynwg8P6z0yX1ioezXrvDr
 Z0vLNwOs246RH0xthE2cPg5tgJvmQRYtmUmwMUUHX0Ew99YzH1xfg5ZvPWrB3nHuk+hP
 6Z2V54y8SKf7YYp6AurNCbtoQlG1vQzkgyWWu320MYRf5UxmbXaril/JzgHrKCeC8p8f
 biJSIq++hqkPDOAfgBVzMXDvQWoOCIu4IdgpI0djTTMK1NJdX/tzqNE5gHfFMSxrW5Yz
 hXBw==
X-Gm-Message-State: APjAAAXytgwz+MnntTrhmf7TOWtdiv9HG86++qGe7k7iot090ReOGglp
 7xaOClPH8l8qwYbLhFhaVkA3aPKvgLnA
X-Google-Smtp-Source: APXvYqzUzF5Rkbb+nVLYFin7HZb7lgKx/7OaR7wM4k3Xq0rOP6fdb8gnDwDDE5bG+V58R/jB84hQ3g==
X-Received: by 2002:a17:902:161:: with SMTP id 88mr818651plb.253.1573091915855; 
 Wed, 06 Nov 2019 17:58:35 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id a25sm289748pff.50.2019.11.06.17.58.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2019 17:58:35 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Wed,  6 Nov 2019 17:58:03 -0800
Message-Id: <20191107015808.26844-6-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191107015808.26844-1-cujomalainey@chromium.org>
References: <20191107015808.26844-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Curtis Malainey <cujomalainey@chromium.org>, broonie@kernel.org
Subject: [alsa-devel] [PATCH 06/11] ucm: docs: Add DisableSoftwareVolume
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

Some userspace audio servers might default to software volume, this
allows the ucm to force its behaviour

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 include/use-case.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/use-case.h b/include/use-case.h
index 05628303..1aeaf9d4 100644
--- a/include/use-case.h
+++ b/include/use-case.h
@@ -334,6 +334,8 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
  *      - This is used on platform where reported buffer level is not accurate.
  *        E.g. "512", which holds 512 samples in device buffer. Note: this will
  *        increase latency.
+ *   - DisableSoftwareVolume
+ *      - Set to "1" to force userspace to use hardware volume controls
  */
 int snd_use_case_get(snd_use_case_mgr_t *uc_mgr,
                      const char *identifier,
-- 
2.24.0.432.g9d3f5f5b63-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
