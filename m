Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0072A294DDA
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 15:46:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2F0C1772;
	Wed, 21 Oct 2020 15:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2F0C1772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603288017;
	bh=QZ+zX+EfCnbLLfe0lKvEERnB7MS9f8BNIUZF7+C/uDI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tnf5MNG0E+/aEmqxRorOyZAK0GAAPon28sb04qSHHW1t8VgofxY5cJIKSiby9z5+m
	 6phtfFzlwcg99TUzWiPwupKrSjE8lYW5ui8feJ654GEbjIzZFHBfcn9+0QeQLzjsKs
	 d6Ckl4UkfLNzot7ALz971kXFLj7H6rRdGF8GxApQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22A11F8053B;
	Wed, 21 Oct 2020 15:37:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F3E4F80247; Mon, 19 Oct 2020 14:32:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB8AAF800AD
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 14:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB8AAF800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=126.com header.i=@126.com
 header.b="RpMfgr0m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=hLfIQIHuyLNmd+qchF
 0iMkyztO/7yUc2IbZTbVRiJyI=; b=RpMfgr0mJqGp+g+dat3z/td2OnhOXL6w2a
 plj+lFyWuj1vTLz68O5JaQ3HyvmKoVJhANV2n3uKssPo3lFlD+lwpLNedIsU/cga
 2i032g+is2b2e0XijgprS4/4Xvw1mSF8o64RMYoW1SBUespGHQvKd08m84GejoQg
 UpXTxu3Xs=
Received: from localhost.localdomain (unknown [36.112.86.14])
 by smtp1 (Coremail) with SMTP id C8mowACHgx00h41fyctCKg--.6S2;
 Mon, 19 Oct 2020 20:31:53 +0800 (CST)
From: Defang Bo <bodefang@126.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 Vishnuvardhanrao.Ravulapati@amd.com
Subject: [PATCH] ASoC: amd: move the call to devm_kzalloc below
 platform_get_resource()
Date: Mon, 19 Oct 2020 20:31:29 +0800
Message-Id: <1603110689-5015-1-git-send-email-bodefang@126.com>
X-Mailer: git-send-email 1.9.1
X-CM-TRANSID: C8mowACHgx00h41fyctCKg--.6S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrtFW7try7tr13WryxAr48tFb_yoW8JrW3p3
 93KFZxtrWrJrWUZ3y8GF48ZF1Ygry29a1UKrs8Z3y3Za45GrWkKFs7JFy0kFWSyFWvka1x
 XryDta1FvFn0qrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bFPEfUUUUU=
X-Originating-IP: [36.112.86.14]
X-CM-SenderInfo: pergvwxdqjqiyswou0bp/1tbitBDC11pEBvHlDgAAsz
X-Mailman-Approved-At: Wed, 21 Oct 2020 15:37:33 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Defang Bo <bodefang@126.com>, akshu.agrawal@amd.com
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

Just as the commit <4cb79ef9c6c4>("ASoC: amd: Fix potential NULL pointer dereference"),it makes no sense to allocate any resources if res = platform_get_resource(pdev, IORESOURCE_MEM, 0); fails,so move the call to devm_kzalloc() below the mentioned code.

Signed-off-by: Defang Bo <bodefang@126.com>
---
 sound/soc/amd/raven/acp3x-i2s.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index a532e01..c9c69eb 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -302,16 +302,14 @@ static int acp3x_dai_probe(struct platform_device *pdev)
 	struct i2s_dev_data *adata;
 	int ret;
 
-	adata = devm_kzalloc(&pdev->dev, sizeof(struct i2s_dev_data),
-			GFP_KERNEL);
-	if (!adata)
-		return -ENOMEM;
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
 		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
 		return -ENOMEM;
 	}
+	adata = devm_kzalloc(&pdev->dev, sizeof(struct i2s_dev_data), GFP_KERNEL);
+	if (!adata)
+		return -ENOMEM;
 	adata->acp3x_base = devm_ioremap(&pdev->dev, res->start,
 						resource_size(res));
 	if (!adata->acp3x_base)
-- 
1.9.1

