Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C36A82EC74F
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 01:25:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FB9B1672;
	Thu,  7 Jan 2021 01:24:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FB9B1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609979128;
	bh=EdhgYXpU4eZOdUHLRz0uCv03p1UmKHHsTWMxFKXcn4Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YNLiQrEmyvTOunGuI4f1WHsmNOn53wOeOF0u7cSby7PQ/uExnWUAYnq+OjvSVYZ+G
	 7F+XdZ0/8BGAiXOjQfL/+8sZ1ClLWx/1IUpk51GqrxNvzbK+GpYnRMA9lY9OrH/reR
	 eGeIk2YnVnviAa4JPBgZEFutT70UguY6FwvSWhfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84E28F80167;
	Thu,  7 Jan 2021 01:23:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5343F80166; Thu,  7 Jan 2021 01:23:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFD37F800E3
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 01:23:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFD37F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="c5t/xHT6"
Received: by mail-pf1-x436.google.com with SMTP id c79so2706101pfc.2
 for <alsa-devel@alsa-project.org>; Wed, 06 Jan 2021 16:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1UcCa1dePCN3oHsSwbgSrrhWhEONfAwgOkl6CHpZUTo=;
 b=c5t/xHT6Qoz1VdK9QRGNom5i64Iy7mExYC//BHhBnrNmayxqFzytoqep2WVH5cMTiw
 ivameLS/W9UctT4xzWOf0E3UG2MX285np1lDwx0OCSn0T3bMfkmVntnW90po31qUuYd8
 OZKssuBFehd/7se3UcxSAATAck/ZnqZC3SFtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1UcCa1dePCN3oHsSwbgSrrhWhEONfAwgOkl6CHpZUTo=;
 b=iLfKiemghlZmfwr2R6NEPnCR40UC/FstkDtyuxu/KCDyFTxz6JONcxdU0PCvz17f0c
 AFWobnl6miVC5EZQTp95MLm+T5HaNikrKSPqgZ8fVT5iO/5bu934TNEpAJJEwwQH/b7F
 XxXxTIpByuI2Hvrh5riX2fPUci2rLrP8Yo34oO87LT4iHYPaWgn3fH+cA0nBU3ImeWpB
 u4C7XBWGRNi6g1+TUXBwbNo2bEpH8y0GwLYQENBaVAix4bJ+Wfwh/E/Cl/S0AQiW35Ja
 YObrZnSaAaXFYwQwWH6L56fMgWKgJfYgmBSQ0HdzdPAMXVqu7BL7afSw+g+4OUKxoMVQ
 pEpQ==
X-Gm-Message-State: AOAM531pW2aysSxzwdgB2x7kNOvZALUfwP6pWtouwRjS8s2g8TRQE/iB
 SuQfpOvo6DSsL03bwVK1lWahqV8ZiXJi
X-Google-Smtp-Source: ABdhPJwsjpc9sAKuSPKmC07M/t5e09gE+n0ao7ufEcj3qr2xnFxdDgn123yZIZe++GzMRxstQeoqzA==
X-Received: by 2002:a62:c312:0:b029:1a9:19c7:a8e with SMTP id
 v18-20020a62c3120000b02901a919c70a8emr6180598pfg.74.1609979014177; 
 Wed, 06 Jan 2021 16:23:34 -0800 (PST)
Received: from localhost ([2620:15c:202:201:7220:84ff:fe09:2f18])
 by smtp.gmail.com with ESMTPSA id s5sm3319152pju.9.2021.01.06.16.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 16:23:33 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ucm: fix typo in docs
Date: Wed,  6 Jan 2021 16:23:23 -0800
Message-Id: <20210107002323.338371-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Curtis Malainey <cujomalainey@chromium.org>
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

Do you know the tstaus of this fix?

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 alsaucm/alsaucm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/alsaucm/alsaucm.rst b/alsaucm/alsaucm.rst
index 7890ba5..3098672 100644
--- a/alsaucm/alsaucm.rst
+++ b/alsaucm/alsaucm.rst
@@ -122,7 +122,7 @@ Available commands:
     the value of the `IDENTIFIER` argument can can be:
 
     - ``_devstatus/{device}``
-    - ``_modtstaus/{device}``
+    - ``_modstatus/{device}``
 
   ``set`` `IDENTIFIER` `VALUE`
     set string value
-- 
2.29.2.729.g45daf8777d-goog

