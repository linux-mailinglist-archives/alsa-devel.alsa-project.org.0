Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D645C41C01
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 08:10:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24A7516FC;
	Wed, 12 Jun 2019 08:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24A7516FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560319810;
	bh=qn/AZsH/BVr/E4vsXotZUG6aCOae3RuTd44OnUyIwBg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KR9YiaA4YfWQmhKvMhcI0w6XpOJeCkW9NxFzn1xB8u+kvJvK5V9s0a+sqgJgqr/Qe
	 own8JE+WHPs1a2bsCn0Zs/Yilm5AW8cHd9vZyK8KGmWJcuZSXaorapXu3W9cY86ukj
	 lAlRAOAaohf+y7JfE00R6txU9w7724uCIhvW6bsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3595BF896FA;
	Wed, 12 Jun 2019 08:08:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41A12F89716; Wed, 12 Jun 2019 08:08:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EA7BF80791
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 08:08:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EA7BF80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mforney-org.20150623.gappssmtp.com
 header.i=@mforney-org.20150623.gappssmtp.com header.b="EGxXZbH+"
Received: by mail-pg1-x544.google.com with SMTP id f25so8308394pgv.10
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 23:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AksDGhbBPV0HQkrAxPM5AVD4JodD7wofEDqro4B1dyU=;
 b=EGxXZbH+UKx3JUrdCYC22QLXVrxUe33MRJ+UsZCFkVw+mX509XcUwxpSBz8Ywg2sKa
 6XTeKvRfCznk4B2w2Xg2nExDBC58KIBVrXtP3tyBru2CG9NYez//oIlEqwc56L6DR+GT
 g+mHOtgtaHCsEJyKfIbFON76LFWhlx3jDkJr73uoxsULq32v9e+jZtm8/pWFYH+ZiA3t
 MDtPfVJg5oVfNlUxmnJARkZTROaoJST+XR7Wg3tnOh8/N5+wbdFkrmrDHdHFJnC/MXjl
 YvU4K87jpWIC9pTcWCFrweE+BrTZLdcZLCGhqmXsjvY31lbdXkZ6W4vYxt3rZlJrv/Ey
 766A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AksDGhbBPV0HQkrAxPM5AVD4JodD7wofEDqro4B1dyU=;
 b=UC565znv+BULjmzRaAutFL1rfHdzRsWpY1+xS/dM/rn2Qe2UgFVd1VOMSZeevvUsa1
 UQwAtKXJknG7lfZY0XuEP/90QWcrPt9aEkbqa40JH/Xw2HNsJrt4YqaXKdr+E28YkhF+
 SH2Cxa1Zqpn0wuFZZzmL8ZNLaG/Xd5/ieuUDxrJgPijq3MQy3XgGOdtVMmFwvhCL9LTm
 AHH/MMNOI91o152JYkgNVyS4IRWQOgOIFGtDK+hPIx1WXboS68a5fPjEnfsmcz7WK9Dl
 /aSt/0iXth+mrv0aNkTMTqWWEjSvMMrmOFpaUKwNPdKIUm96j4L4XeaHMbFAMu6j8FPF
 ZDRw==
X-Gm-Message-State: APjAAAX9f2ldskgoHyI95VZ63wTBNijN2tZJqaNgIKO8ys7xDLtOuqZT
 nNfsZe+/Qo+SAJK+QijknV7hLQ==
X-Google-Smtp-Source: APXvYqxEMMvCZbq9Z2bXCLSJB3N6bnOg7CO0s0oEVj5vsWVywKgaV4WGUl9KqQ1SxQKmFGNm2bp1Xw==
X-Received: by 2002:a17:90a:2224:: with SMTP id
 c33mr30954263pje.22.1560319696121; 
 Tue, 11 Jun 2019 23:08:16 -0700 (PDT)
Received: from localhost ([2601:647:5180:35d7::cf52])
 by smtp.gmail.com with ESMTPSA id k8sm15571442pfi.168.2019.06.11.23.08.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 23:08:15 -0700 (PDT)
From: Michael Forney <mforney@mforney.org>
To: patch@alsa-project.org
Date: Tue, 11 Jun 2019 23:08:08 -0700
Message-Id: <20190612060814.13534-1-mforney@mforney.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/6] alsa-lib: Various portability fixes
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

Even though alsa-lib doesn't aim for ISO C conformance, hopefully these
changes are uncontroversial enough to be considered anyway.

Michael Forney (6):
  Use __func__ instead of __FUNCTION__
  List cases in range explicitly
  Don't return in a void function
  Make sure parameter qualifiers match between declaration and
    definition
  Remove unused empty struct
  Avoid pointer arithmetic on `void *`

 aserver/aserver.c    |  4 ++--
 include/error.h      |  8 ++++----
 include/local.h      |  4 ++--
 src/conf.c           | 22 ++++++++++++----------
 src/pcm/pcm.c        | 16 ++++++++--------
 src/pcm/pcm_direct.h |  2 --
 src/pcm/pcm_hw.c     |  2 +-
 src/pcm/pcm_rate.c   |  8 ++++----
 src/pcm/pcm_share.c  |  4 ++--
 9 files changed, 35 insertions(+), 35 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
