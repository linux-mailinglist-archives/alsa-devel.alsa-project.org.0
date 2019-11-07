Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA295F24E7
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 03:06:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79A561692;
	Thu,  7 Nov 2019 03:05:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79A561692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573092380;
	bh=UGLPjQWXDyMeEI7XZAGUqcC2R7LN6dN2UXmF5I+2hdY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QCgdCS78YYnmXy4Dv3QjKHdfCfqQdR0k+W8e3/IplfZGPrUn0ElTaeU8ww1nUXS/8
	 ZkG5QzIHiRi4HFjyLd8JhYAFJGNmhRSe8HbiwkX3bTVUtanIKWBJQId32ptXA6t6tZ
	 Nn7/9WDea26cNe0aSNIIxhsYKJTJwGnQ8zUUlUdc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0ACCF806F5;
	Thu,  7 Nov 2019 02:58:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3651F8063C; Thu,  7 Nov 2019 02:58:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCEDDF80636
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 02:58:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCEDDF80636
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ZHi0sazA"
Received: by mail-pf1-x444.google.com with SMTP id 3so1051304pfb.10
 for <alsa-devel@alsa-project.org>; Wed, 06 Nov 2019 17:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2wXWJaSCd2JmRB8D3fuZ5gEYXpLPJzLqFKUZZRyerrI=;
 b=ZHi0sazA+WoxL8NnNi1psqkdF1RNggult7lzei8x7KVuBXA8DVPqrpaUu5jHFNJ+7w
 0CKGh+fcG2XU5IW1KvdxkDRJLlXlak1xddUyaMPwBz5kKR/ZyobVuRE/PxkN8nsmj9x1
 Czro2xpp35zGixwMbRZ3sj5wPVqEAqQQ5wMv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2wXWJaSCd2JmRB8D3fuZ5gEYXpLPJzLqFKUZZRyerrI=;
 b=FHvwR8PEnuGWXbKppumeXLfXG7qfPf+OeQ9BH8mCBn5zLRcndOoD//eP93yaBlEzVx
 3o7YL63OJvNfsc9BBshuAEsq+xdkDtYUXr28zkZZ/qz4MdPO6T3/Xfoqu3cgpRQupUVa
 vEhJfz/NC7F/2KhkjUAKWbNR2QEeMXaMq1zuduumVsclEyBVeiwwX3jkunI1pkbmShfG
 apP9ZS2xuTJNona791mM6UttY16YmaYdpmRff1xlqfGbpZvPxSfSUewR9+PSsyGLUyjW
 3ZWnEfKlkay+2tm13v4D1sUOhg2SwIjc3guLYPmY/NRJ5uos3kDNyCrWmEHTdbTfWGpr
 IAtA==
X-Gm-Message-State: APjAAAXj3wroJNSi+Hi0gxgOBUBd85Twq5QdUw2fGfg88oPMX1QcSbH8
 SVLsDzyQ5C/x8ZfAYabpL6N1mP/uxIPM
X-Google-Smtp-Source: APXvYqxGuDbiCkfdq7Tp3thFdRbbOEnazAiL8GVXfeLkNFy7YPy8UELqdRBiDLIMuUj0M33xOd/VKA==
X-Received: by 2002:a62:1d8d:: with SMTP id d135mr653053pfd.172.1573091920815; 
 Wed, 06 Nov 2019 17:58:40 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id h66sm292435pfg.23.2019.11.06.17.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2019 17:58:40 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Wed,  6 Nov 2019 17:58:07 -0800
Message-Id: <20191107015808.26844-10-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191107015808.26844-1-cujomalainey@chromium.org>
References: <20191107015808.26844-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Curtis Malainey <cujomalainey@chromium.org>, broonie@kernel.org
Subject: [alsa-devel] [PATCH 10/11] ucm: docs: Add SoftwareGain
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

Add software gain ucm definition.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 include/use-case.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/use-case.h b/include/use-case.h
index e84f3f8f..ee6ee5e0 100644
--- a/include/use-case.h
+++ b/include/use-case.h
@@ -344,6 +344,9 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
  *      - This is used on platform where reported buffer level is not accurate.
  *        E.g. "512", which holds 512 samples in device buffer. Note: this will
  *        increase latency.
+ *   - SoftwareGain
+ *      - Specify the software gain in 0.01dB. E.g. "20" means there will be
+ *        0.2 dB software gain on this node.
  *   - DisableSoftwareVolume
  *      - Set to "1" to force userspace to use hardware volume controls
  */
-- 
2.24.0.432.g9d3f5f5b63-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
