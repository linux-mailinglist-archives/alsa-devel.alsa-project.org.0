Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ABC41C06
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 08:11:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98E571719;
	Wed, 12 Jun 2019 08:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98E571719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560319916;
	bh=8uUYpygwHOnlXqxR/tsySgeCUoU+Eo17O9F3KhXjRFE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GddYCJXifotf803Z/HkGemjgpnoT6LAlIzkQ5Cf4NsebN7Dkw3GCQwdlPr+nzrEat
	 Woj0iWR/k7CKrJEQsc7CXdMfE+mQGSwH1lKocqcxefoM/vo6O9uiRzkYNUHiAOTdJZ
	 1tq0AeqlTzd0qaamnssAKYziZ+hZw7Yq9pTkjzMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8940F89738;
	Wed, 12 Jun 2019 08:08:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF870F896E3; Wed, 12 Jun 2019 08:08:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22A57F896CE
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 08:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22A57F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mforney-org.20150623.gappssmtp.com
 header.i=@mforney-org.20150623.gappssmtp.com header.b="MwFMgY+S"
Received: by mail-pf1-x443.google.com with SMTP id j2so8977674pfe.6
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 23:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Qq1A+QctgG8NwYPP8ZTvorpgTi5+zbsJWtiK8qh1jo=;
 b=MwFMgY+S4FJvl49dAsbGn06WEcjrYQda+jvDLhL0YGYSO4Ol1Kq+6z497/9gRSnD6k
 vvAv8JdSP19C8rx69+E7LXvYtAaz6iB97HZPFHRdq6xiOWQb8eopxt11e1Qa5O9RoXbE
 nLRWR3fEuV0b9nIk+GGJ06ju3YDIe1gwCu8mGJGAH5fekSC6uxcuYa1OwOWpz4eP6MeB
 ndzWrx9gVfC4HuhRO7X5DpB78rP2Qo1aLl5F83rbZMVosJXD/hhzN8GCRnAlFM5VEKIb
 45hxJr6v5Bn4FOmzx2hUYJfYwHV5x8XlmDejZAcg5PoaYjWudhRfzUsYwoJCJ+X173MV
 YuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Qq1A+QctgG8NwYPP8ZTvorpgTi5+zbsJWtiK8qh1jo=;
 b=WC76F1s8MHlrUC+LxyCe3LlJ90Fh2F0WamzTlj6J2HYBFqqzH3LM5aUhpMhyV3al3T
 5mILiZlB8fnCwoKvftR0fGeUyk/tIn+8Vy1VsZDQanepV0otg6AsC0FnCKCwd4oZbjz6
 mlF0600KPA7Qdb8/33O6CgSlq5o5PpL9Ohvn5hHhXG4RB32crgDpFnrjyc81bgXvEVA3
 GLBQt/JsxxqC+FqZtaqNmp38fKPKKfoe2nm5FWhrDujCUiQF3ratVEvNHQUfrlRa0iAm
 IW/xnsRlURtIQ8NX6p+ORaqPDTiCEwerHB2170AlO5kRw98EhzlGMXLsv7h5DEMgIASV
 I+9w==
X-Gm-Message-State: APjAAAUuvMYZnd/yVOVseuGdQ1iY/6/CAHM459mlqc7a6qzulI9bIOSc
 PB/95LAAxipKmnltIEOx4MHOhw==
X-Google-Smtp-Source: APXvYqwl+UuJ1f+Lks7xRQ7Hq1mpAQr2No095gFIhgHRB/BW1i1bgozNpS34HnbXGeV/20qI3ZTDqw==
X-Received: by 2002:a65:6649:: with SMTP id z9mr5303608pgv.413.1560319699704; 
 Tue, 11 Jun 2019 23:08:19 -0700 (PDT)
Received: from localhost ([2601:647:5180:35d7::cf52])
 by smtp.gmail.com with ESMTPSA id t184sm1289334pgt.88.2019.06.11.23.08.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 23:08:19 -0700 (PDT)
From: Michael Forney <mforney@mforney.org>
To: patch@alsa-project.org
Date: Tue, 11 Jun 2019 23:08:11 -0700
Message-Id: <20190612060814.13534-4-mforney@mforney.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612060814.13534-1-mforney@mforney.org>
References: <20190612060814.13534-1-mforney@mforney.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 3/6] Don't return in a void function
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

A return statement with an expression in a function returning void is
a constraint violation.

Signed-off-by: Michael Forney <mforney@mforney.org>
---
 src/pcm/pcm_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/pcm/pcm_hw.c b/src/pcm/pcm_hw.c
index 77d4dae1..2028790e 100644
--- a/src/pcm/pcm_hw.c
+++ b/src/pcm/pcm_hw.c
@@ -1171,7 +1171,7 @@ static void __fill_chmap_ctl_id(snd_ctl_elem_id_t *id, int dev, int subdev,
 static void fill_chmap_ctl_id(snd_pcm_t *pcm, snd_ctl_elem_id_t *id)
 {
 	snd_pcm_hw_t *hw = pcm->private_data;
-	return __fill_chmap_ctl_id(id, hw->device, hw->subdevice, pcm->stream);
+	__fill_chmap_ctl_id(id, hw->device, hw->subdevice, pcm->stream);
 }
 
 static int is_chmap_type(int type)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
