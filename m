Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1063E5ACEF4
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Sep 2022 11:37:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78C7715C1;
	Mon,  5 Sep 2022 11:36:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78C7715C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662370654;
	bh=7VzYwHmlxJn778+Tn0gdpP1LQOrTbSMcaEMFGxJ6CMA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f3A9v5MqTNBKc8oVWdMx0FFcHJ2VtNMr4mMyvtfRfeklrxsbdg+hSHyJb308dVJcw
	 5tFpxlapmcCGHOGWTF6CFYnHKTq9DG0uqv6Y8SqsiVVBPkbhREK/L04ky0E1X+cNor
	 1hCTPqAyENtNeAHkkeCvnzysPzeflnMOxeiibz+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64D0CF800E8;
	Mon,  5 Sep 2022 11:36:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B777F80238; Mon,  5 Sep 2022 11:36:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3B1AF800E9
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 11:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3B1AF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MNckiRIE"
Received: by mail-ej1-x636.google.com with SMTP id lx1so15815827ejb.12
 for <alsa-devel@alsa-project.org>; Mon, 05 Sep 2022 02:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=UVzntTLQu6YKGPoOys5LB9DBMo84EPi0lKU1jOROxRI=;
 b=MNckiRIE8LkV8gv9kXwA+YdPmsVcMoxg3uHJk/dXUt8ZNStv6zhdchlSrB1QWadX6/
 PBeovOiegG0xm3eNdOGCj6OMMzkWEMe99O4QXBWSX2xZJVhpWNk0Fa3kIQdQYHiclQSS
 XKCtrOe0qRsVUlg0xF21PsS3c4sNABJSog/210NQuRbo72KK0scFha2GEsty8nsYXyh7
 kAHhxa391aREbcDMYY55aLeWdPH13BPViMemJLaPnds5bBY2DHc85OqJvs3PF1dobaK/
 XFImXigd/07wAYfSKhCEaBHDQJkmfSbP5etNqtQRl0uA107nlxW+vDfmWdkG4vjPR/25
 y9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UVzntTLQu6YKGPoOys5LB9DBMo84EPi0lKU1jOROxRI=;
 b=vWzGMG79APTm+juV18n5WEbGXRWVg9QFBCSDWZN3Ricc8KltAzrFVADya8t/FdMTll
 GHsjJRTc2adptJFMP4Dk99coLgXTf6E8u3BxmqIOrnbGJEzPKpFMSZmzCvySPVC3OBe0
 VswycYQyvXKrKgoTLyTIHgmcx/0zM/S3aGRqQCNvRVpfDAn8M8GSg838TdolTMLN441r
 q4jWpVtNwyFdbffGAW0zJ8Aazf/3Z2EFGKEOJLZl7WrYqZ8Qd1QELWM3udO38w3CspUN
 BFZd+1XWpAnB49enWKHHj8N8E29McHLm5QuDDAzKdrS3WUhEbPXr4je8L4QTgz+QxIJ8
 9xIA==
X-Gm-Message-State: ACgBeo1l3gOussb9Am4QewL7kwGaSMbXcRX/W0l9j9s3pfKIH+d9roXF
 Z6enI80q+BDaMhgOhj8ImYI=
X-Google-Smtp-Source: AA6agR6HZnPWDhPjGHZKwHYPw6FFTOmXlHR0ZtPemLi6cU5Vl4zAeyWQMj6OLv6xDEXaiPUuwT6I0w==
X-Received: by 2002:a17:907:6e89:b0:741:a19b:638a with SMTP id
 sh9-20020a1709076e8900b00741a19b638amr22390703ejc.317.1662370581473; 
 Mon, 05 Sep 2022 02:36:21 -0700 (PDT)
Received: from felia.fritz.box
 (200116b8268cc400942297814b5b37b6.dip.versatel-1u1.de.
 [2001:16b8:268c:c400:9422:9781:4b5b:37b6])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170906300900b00742a4debae1sm4720507ejz.6.2022.09.05.02.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 02:36:20 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Mark Brown <broonie@kernel.org>, asahi@lists.linux.dev,
 alsa-devel@alsa-project.org
Subject: [PATCH] MAINTAINERS: rectify entry in ARM/APPLE MACHINE SOUND DRIVERS
Date: Mon,  5 Sep 2022 11:35:46 +0200
Message-Id: <20220905093546.19735-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

Commit 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver") adds
a new sound driver at the location "sound/soc/apple/", but it adds a file
entry referring to the non-existing location "drivers/sound/apple/*".

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Repair this file reference in ARM/APPLE MACHINE SOUND DRIVERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Martin, please ack.
Mark, please pick this patch on top of the commit above.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 29443aad5031..c239d7e69158 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1904,7 +1904,7 @@ L:	asahi@lists.linux.dev
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/apple,*
-F:	drivers/sound/apple/*
+F:	sound/soc/apple/
 
 ARM/ARTPEC MACHINE SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
-- 
2.17.1

