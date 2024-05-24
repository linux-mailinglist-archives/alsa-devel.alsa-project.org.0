Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF7190777A
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 17:50:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CF2BDF9;
	Thu, 13 Jun 2024 17:50:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CF2BDF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718293818;
	bh=Cf+G7MUSUrZ7+MSy0trSFBbvCcixdcWFggMfx4iRHeM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SeXCvNIbiDcBGTLL1rkaKj1T2D82bj3ur5qApJB0XPVZOJJ9nwbXZsSohdvr2h+XP
	 Jt0Iv/YNHKs8E43rgnNFyK0qTWnf2xpzKFFrczi4ypSDIKsM9sgsSpi9xsAAk2do8U
	 062sgJFLz9oY/j8tpP8jovZKB7pm05Z25d5YBnrw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4F14F805AF; Thu, 13 Jun 2024 17:49:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58EB9F805A1;
	Thu, 13 Jun 2024 17:49:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64466F8020D; Fri, 24 May 2024 19:01:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDCFCF8016B
	for <alsa-devel@alsa-project.org>; Fri, 24 May 2024 19:01:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDCFCF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LP4u2+Wv
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1f44b441b08so8024705ad.0
        for <alsa-devel@alsa-project.org>;
 Fri, 24 May 2024 10:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716570111; x=1717174911;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b3A5Y3TABUrw3JWh7w8rkmw88AtD1mrVDTKhYMfh+dc=;
        b=LP4u2+WvnGMhH4hVUh1E3/sItPfC8aER7hWlsAxsvfsfIqYogBe5aFyphxISgN0Ma7
         3qdyhX38FkI6vFNcSbPvjPU8u3yWqjJH+FDP2VcCcnUCyFqoJwo1SuHtUj41CIrRsdiQ
         B+1QL7qqWBMHoHC4g6SpTEwHy4DoOwzURLXIK0gjmlCb6pNHyfmrRlH9xww1i13f5I7i
         6RFblu3on/VnLP8Ea4NqhoMqD91Dm0V7Xwqt35li/YLKw3Cr2FHF06QPnOliyuykD6Wy
         lBVk5wS+wKbHrloHts7L4cMX5zVd/byneosTBUA33SMzdpbnSXeZ2KLulUQLQlDvo3H0
         QxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716570111; x=1717174911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3A5Y3TABUrw3JWh7w8rkmw88AtD1mrVDTKhYMfh+dc=;
        b=pfhilLOcGZrHTZ4jEjUDYmAfX0MI4QMtKR2p0vRnY5tqpoojE8cNT7XufC54sVrEVp
         7NHUHOAUvJYRN6hZ/nd0dc8RJBHXtzRLxkC67shFhIwmztNqDBPyyId+uAe87DGQn3MP
         zFBTXw+DrtvXG6q7FwcD4Qnz/BK6076J2LymQMDhyLFGl6ZsV9+VYsAY++6k7nfL7Viu
         5sbTjvNGN9jQ7AoTkfqBI1sZURDrt0TtN1FTmtvi2GhpoqfXiT1zUNYHiBFEdF9UIhfW
         0u0iqIQPqrE/N0fFtFE5QXkkVADoZNAipbPoQbj2873pJcQ2Xepbqb1PbH+P9IYH2u5r
         Psrg==
X-Gm-Message-State: AOJu0YwyLM+drbN1j0kt/jQHk4JR7FUsaGQeyN76JAvurzli5FSTCqVh
	LEqnm+SP3SSqIrVF+3uDAVaR1l/o13dsxvWe4eqEUssBQCdumIo3
X-Google-Smtp-Source: 
 AGHT+IHEHsT1zzNtRQiEvxL9vQVA1+GMmM1tGgu0886rvjafxm8Xlqj1jhjE4F2JrqMmJP4hZy0nbQ==
X-Received: by 2002:a17:902:e745:b0:1eb:54b7:2724 with SMTP id
 d9443c01a7336-1f44990030emr30810925ad.64.1716570110284;
        Fri, 24 May 2024 10:01:50 -0700 (PDT)
Received: from localhost.localdomain ([171.61.204.81])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c9d97ccsm15992875ad.295.2024.05.24.10.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 10:01:49 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: srinivas.kandagatla@linaro.org
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] Correct documentation for struct segdist_code
Date: Fri, 24 May 2024 22:31:42 +0530
Message-Id: <20240524170142.9633-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: abhishektamboli9@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KCJ6MPOCR5JMAAU6SZ2DJMVSAFDVIZ2D
X-Message-ID-Hash: KCJ6MPOCR5JMAAU6SZ2DJMVSAFDVIZ2D
X-Mailman-Approved-At: Thu, 13 Jun 2024 15:49:42 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KCJ6MPOCR5JMAAU6SZ2DJMVSAFDVIZ2D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Correct the documentation for struct segdist_code by
removing the incorrect reference to segdist_codes and
add a note to describe the array.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405190241.jIzZxFB5-lkp@intel.com/

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
The documentation for struct segdist_code contained an incorrect reference
to segdist_codes as a member. This patch removes that incorrect reference
and adds a note to describe the array segdist_codes[] containing all possible
Segment Distribution codes.

 drivers/slimbus/stream.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
index 1d6b38657917..d9eaa8989d2e 100644
--- a/drivers/slimbus/stream.c
+++ b/drivers/slimbus/stream.c
@@ -18,7 +18,8 @@
  *		and the first slot of the next  consecutive Segment.
  * @segdist_code: Segment Distribution Code SD[11:0]
  * @seg_offset_mask: Segment offset mask in SD[11:0]
- * @segdist_codes: List of all possible Segmet Distribution codes.
+ *
+ * Note: segdist_codes: List of all possible Segmet Distribution codes.
  */
 static const struct segdist_code {
 	int ratem;

base-commit: f3d61438b613b87afb63118bea6fb18c50ba7a6b
prerequisite-patch-id: f30868a7fdcfaceb6bab2b6f41402a9aeae858cb
-- 
2.25.1

