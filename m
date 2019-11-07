Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8D9F24D5
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 03:02:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5C741683;
	Thu,  7 Nov 2019 03:02:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5C741683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573092175;
	bh=LSLmw2pTZLZRMCUbpTvjT+spiAQCeMKypZH6wtd0wS4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UVlaeDb3bkeh0rP+iPt1oofx8FV7AIZMA6Xqlx4s2eRD88pxGmFix2nsxKaky5zHL
	 FHAm1fFerBuAvTzodgkXtVfrTx0cTWltwBzMrw+qjQY877Gtgi9FnB1BgwEsKqhsqt
	 GFp4zJLL3EwAXg+VmoNh8TYDNK48sp+8thqZ2bx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E299F80638;
	Thu,  7 Nov 2019 02:58:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E993FF805FE; Thu,  7 Nov 2019 02:58:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A82AFF80321
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 02:58:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A82AFF80321
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="CufJuMBQ"
Received: by mail-pf1-x444.google.com with SMTP id d13so1098856pfq.2
 for <alsa-devel@alsa-project.org>; Wed, 06 Nov 2019 17:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JIjCVPMpk6TXZlrvXRZPKKPMH134eTVmZNw9qdBi9fE=;
 b=CufJuMBQzBXE7fvaW7F9ERru9Umjdet6SJMq7ziXZl45Hz1Y75RKGB0DbA/vd+PmoN
 21tuP8o1e3RThJ3JPbcLgdWLXDDUbyZvOtBjRF4E59ucdkEDqJeQ2LD3RW2GGKZDNQja
 Aje76cTe1C2ocqix3+e9IXvN+WswGns/i7Big=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JIjCVPMpk6TXZlrvXRZPKKPMH134eTVmZNw9qdBi9fE=;
 b=Bl/IBJrg9lT6dAfT08jtM/zwpwrQOtD6PbbVgfk4U/VOzXkL9DFb9rbgixH3Uw3hRn
 BM+i42V+DpjxW78gdQTQV6brV0/CSWnG/JBFkM+j5IkctlqscWjscnHOK8g83oHRIoHM
 Vm57yZy2pkPOP4h3DEpzx9MndQFdo6Cqxf8UZoW+xoHNGNsmM8UrbyDv5NLz/YMb230v
 ItUGHw2bbLznh4wQwaBwWWFzkwGy9uYmxTzsQ7UX1OG1EaY7a8XguZ36vFt7dDQMms1O
 /ivCQMcAqn2olN6l7+lflrL7HGZxNJvYBmzchmoIydM4XARnItLaehsOaT/6bkoElS1V
 oipQ==
X-Gm-Message-State: APjAAAUnKnpFNGZwC8r4NYy9JKfQ4s2YvQbhZGeKYfaMI2spuIWmE6DB
 Ni4aCkCWJedR1lNQ7CUOWKhCEz8zOd1p
X-Google-Smtp-Source: APXvYqxQH3+UEQ7VUUmnNsHehAjSJTvkQ0hPw/I2GXB6PI/KuJ9opyLFj+cAUwL9Gen2sVIPDdqKyw==
X-Received: by 2002:a17:90a:2ec3:: with SMTP id
 h3mr1447565pjs.131.1573091914624; 
 Wed, 06 Nov 2019 17:58:34 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id y24sm291465pfr.116.2019.11.06.17.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2019 17:58:34 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Wed,  6 Nov 2019 17:58:02 -0800
Message-Id: <20191107015808.26844-5-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191107015808.26844-1-cujomalainey@chromium.org>
References: <20191107015808.26844-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Curtis Malainey <cujomalainey@chromium.org>, broonie@kernel.org
Subject: [alsa-devel] [PATCH 05/11] ucm: docs: Add MinBufferLevel value
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

Allows ucm to override minimum buffer level for platforms that
incorrectly report their buffer level.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 include/use-case.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/use-case.h b/include/use-case.h
index 28e92d17..05628303 100644
--- a/include/use-case.h
+++ b/include/use-case.h
@@ -330,6 +330,10 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
  *   - JackType
  *      - Specifies whether the jack is accessed via hctl or gpio and therefore
  *        only carries the possible values of "gpio" or "hctl"
+ *   - MinBufferLevel
+ *      - This is used on platform where reported buffer level is not accurate.
+ *        E.g. "512", which holds 512 samples in device buffer. Note: this will
+ *        increase latency.
  */
 int snd_use_case_get(snd_use_case_mgr_t *uc_mgr,
                      const char *identifier,
-- 
2.24.0.432.g9d3f5f5b63-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
