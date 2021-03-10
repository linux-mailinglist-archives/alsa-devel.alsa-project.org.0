Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D112E33480E
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 20:34:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CFE11708;
	Wed, 10 Mar 2021 20:33:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CFE11708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615404879;
	bh=gwXRZ5UJgu1hAM5FqZTaeDqfPX+e70coJ6SxO4EqahY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XbzjrV3fWyDFZCDMWcDCONO3d6u/mUsn64veV++IijThTi7fWJd0TJCw5zxFAaFB4
	 bvw1BAVaw0Cl8KQaP+OCOAh/cWWV+ltG1415Qz5ggHYVbUCwwUVTfp4wXKjPaG1zNG
	 yMQl4QRdcan48/aU/uoZiQ7Hqzlm66cPjbO0+IIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC399F8016C;
	Wed, 10 Mar 2021 20:33:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6571F801D8; Wed, 10 Mar 2021 20:33:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFB8BF8010D
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 20:33:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFB8BF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YOvJsN6T"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B523B64EF6;
 Wed, 10 Mar 2021 19:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615404776;
 bh=gwXRZ5UJgu1hAM5FqZTaeDqfPX+e70coJ6SxO4EqahY=;
 h=From:To:Cc:Subject:Date:From;
 b=YOvJsN6TCfMtjSBAln04iUJm6N65fMwIiUNbErAkavduoU8h6zxQMhvwS/p2hIHK9
 A3UYTsttiL86iZWxbFFbULMD63KUDegYsnQgcnFCb1l22KnLOm0o3v6TYqBEHHycBi
 GorVFe9druHSl6Qr21BA3qKnrMjVUvdqrlrKO6g+jfu8egSgd+tbAU0Ef+JOyZwjxI
 jujvGVKaVhxOYQaYIza+Y0pJAhyjaDAWgRzRgbaTehmJMyTDQ7HsfeE5bmtl1hgc1W
 eb+okHttbgJkjy0Y8ifgl+ZFgDnrvHU1OWhIe2uXS737dZ0Jik5eutW+Y+qquzTD3R
 V+9oc09fRW62Q==
From: Wolfram Sang <wsa@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: ppc: keywest: remove outdated comment
Date: Wed, 10 Mar 2021 20:32:27 +0100
Message-Id: <20210310193227.333140-1-wsa@kernel.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Wolfram Sang <wsa@kernel.org>, linuxppc-dev@lists.ozlabs.org
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

The I2C attach_adapter callback is gone. Remove this reference.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 sound/ppc/keywest.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/ppc/keywest.c b/sound/ppc/keywest.c
index a6c1905039de..a8915100d6bb 100644
--- a/sound/ppc/keywest.c
+++ b/sound/ppc/keywest.c
@@ -13,12 +13,7 @@
 #include <sound/core.h>
 #include "pmac.h"
 
-/*
- * we have to keep a static variable here since i2c attach_adapter
- * callback cannot pass a private data.
- */
 static struct pmac_keywest *keywest_ctx;
-
 static bool keywest_probed;
 
 static int keywest_probe(struct i2c_client *client,
-- 
2.30.0

