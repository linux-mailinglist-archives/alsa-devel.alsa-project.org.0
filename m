Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84121750A69
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 16:02:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28F171F1;
	Wed, 12 Jul 2023 16:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28F171F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689170545;
	bh=Q2wlhBChaRc3FR78KJEOUowCJmvGbUlyRVV/TV82xnU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KSAbUvUbZnT9lqm+n6QnuaY2DqnWik1/D6YxnlW+SHJqytjGO1Q8D9JtmrJE21BUH
	 msivQ7c9wx3lHDYetCnvRXwSAxbyN6ooMAPFc1JI2Qmhdkk2FPnANrLrVx6JbzwKhc
	 2/WWO/cWJivclxN2km8i/bqN2ukYTO9hApejP774=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA907F80236; Wed, 12 Jul 2023 16:01:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62AA0F80236;
	Wed, 12 Jul 2023 16:01:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D39D2F80249; Wed, 12 Jul 2023 16:01:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06F17F80153
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 16:01:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06F17F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=UiX61zfF
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fbc59de0e2so71864385e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jul 2023 07:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689170484; x=1691762484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fe/Z+3ZtV+7rEEbA5ujf7MvOol2TwmyPnYuPdYc8Nwg=;
        b=UiX61zfF22NdJKf458JphAbi6m+mWH28KarzHGFtUyEVhXabazOSNAkurpgz5quMnl
         izUUZNQJJXMbmbtgB1bl4o9YSib/GV5m5jD54AQmzsi5Xz4NAoCrHjqthsSde3sidZXT
         Bk6xEDMjY+ny22PFJzjXXmkcS02rSo8B0wnA6YRoiFdR1UXtiNOIA/kC3XBjeEzryjFx
         /bUmYpKgnQGso1HekqStoMn2S9aWHyFNPb4Q4/m8TeqdfdH7hLJKw3qLiSr4ttzspj/9
         0H+9IQgjST/1GgGohMsheteYm26A2XZaSiuSjO29zVVmE8ETfPKF9NBS+6f6ROGS59Wx
         AoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689170484; x=1691762484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fe/Z+3ZtV+7rEEbA5ujf7MvOol2TwmyPnYuPdYc8Nwg=;
        b=FOhQWFtGw490ljONaBrNiKqqoJkp3+R2zsJG2KAnLBKDkrMn34f77XJd3LcZ93g8zt
         9axgva0l66OzszNpCO+V0xL6vG5RxJIzg0JtjYEovNCJFQNlxxYUYmBVqCR8J7cOAm6X
         wQMK5ZcJrM2mwoNb0lQp/o0xfFsmMRqCqvje+HcH4BwLOdr75Vx9kyyyFOUHQFQxU99p
         QsmMdTN+35nNN9G5gDpMISrXKPFxg9J2gcnF4Xhms0n2hRBHNi/8djz/+LRspMl0CeWf
         4cBL3aj42F4rf4rGfFp6RCjjaUMkyX2md+acT93KN+HfZkb3tz3PH85ijQlvb7RHGDW9
         0ViQ==
X-Gm-Message-State: ABy/qLYKYpDEyzsVMxNHBvYI7rhfPIm1tX3qRVx9CsmA2goM+NFY/ZAM
	RUFmhMKRXil84p+ABV0ZxFY=
X-Google-Smtp-Source: 
 APBJJlEPYGZqRWNC5D4AwhzPhHaPUZb4AP4spv2VYPHTJyc6HbPStnjhWinQ0WTnopg5Pgu40RTwoQ==
X-Received: by 2002:a7b:c451:0:b0:3fb:b4fc:be62 with SMTP id
 l17-20020a7bc451000000b003fbb4fcbe62mr17218287wmi.17.1689170484340;
        Wed, 12 Jul 2023 07:01:24 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id
 h6-20020a05600c314600b003fa9a00d74csm2318867wmo.3.2023.07.12.07.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 07:01:23 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] selftests: ALSA: Fix fclose on an already fclosed file
 pointer
Date: Wed, 12 Jul 2023 15:01:22 +0100
Message-Id: <20230712140122.457206-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CTOCYWFTHW6GJTMQVMNOJNRPLCZCBLM6
X-Message-ID-Hash: CTOCYWFTHW6GJTMQVMNOJNRPLCZCBLM6
X-MailFrom: colin.i.king@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CTOCYWFTHW6GJTMQVMNOJNRPLCZCBLM6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In the case where a sysfs file cannot be opened the error return path
fcloses file pointer fpl, however, fpl has already been closed in the
previous stanza. Fix the double fclose by removing it.

Fixes: 10b98a4db11a ("selftests: ALSA: Add test for the 'pcmtest' driver")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/testing/selftests/alsa/test-pcmtest-driver.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index 71931b240a83..357adc722cba 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -47,10 +47,8 @@ static int read_patterns(void)
 
 		sprintf(pf, "/sys/kernel/debug/pcmtest/fill_pattern%d", i);
 		fp = fopen(pf, "r");
-		if (!fp) {
-			fclose(fpl);
+		if (!fp)
 			return -1;
-		}
 		fread(patterns[i].buf, 1, patterns[i].len, fp);
 		fclose(fp);
 	}
-- 
2.39.2

