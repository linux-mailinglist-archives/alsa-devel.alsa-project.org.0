Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF6ECC522
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 23:45:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 972CC1686;
	Fri,  4 Oct 2019 23:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 972CC1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570225530;
	bh=0l3c7R4cWo3urdxDOvpibIC9QsqEGJbUn/J4r7xOhoI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I0t5LYP5n2KBN+1EKsE/W/iDIWzvnk2ZdjIzkyJPiBihR/MJYA/uLnOKNBVIVf3ru
	 3/Y8OHN5QfS1FZ90YbqSfkIZzIMXoQ53nN+c+hviDv9fZ3+HznqQx+X7RLthA2nT/N
	 l1bAEBnS+B/ft6VNu1DAgIy6zdnqPCxrKHfe4c6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A7C1F803F3;
	Fri,  4 Oct 2019 23:43:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D0E7F803D5; Fri,  4 Oct 2019 23:43:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FC66F80137
 for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2019 23:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FC66F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="eVxW6Kgt"
Received: by mail-pg1-x543.google.com with SMTP id p30so2404620pgl.2
 for <alsa-devel@alsa-project.org>; Fri, 04 Oct 2019 14:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GlE7EV9ZCAIebEa+EIBxR8fUoerT1/7sfKy7D9MHjI4=;
 b=eVxW6KgtyZ8JQrKs0J/lCOximSvmXNsC1eBefIROkzFGAjbHwvP1CIkoAjV00sn/ZT
 c37j0oEoOCfnf42J6h13VbuR1Plru4KL2pAmil/2mEiCxIC+/eOl5vhe/yZ2QsOOQryF
 NfODdc9R4JjgUz3eIt3BqOdX3FRAu3XS9Vu2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GlE7EV9ZCAIebEa+EIBxR8fUoerT1/7sfKy7D9MHjI4=;
 b=OZq83EhoLsSJFe3P8C5wDNClhVGtHm1/lzaCSHS3Jc+a6ijLFGjhAOHF0beJtzjkVV
 ULyx0uRIHIQsToxxrKTIQCzlAofHVQm6plREzFz3MrjtdOfppyDZgZIsWiM7coYRhchA
 WqRB52WcqKNVBwjx/UudJrnlhQMyCSOlfKXb1OGw7SmL2XfCrlxRWIJTxVapoTAbzL81
 UnN1m4SUmyB2FR00aYmT9UyOFrSxwiAna0jVy+cCR/uRo9UX3lQIRVn6QXB0BTED0S+C
 ZBEjK7Tfox3RmB2sJDlVnAA6rJWcHpqfQI6Lc18YFxsBlQupEffBksTthyc0iOBSpjeA
 X+VA==
X-Gm-Message-State: APjAAAXw6iXk5ZLx0diRsiq1/mTlcA1/Uq9jFeC/iQO1U9dZdQS1+NVx
 2oet8pu4AcKym/NNBwcB0RtClA==
X-Google-Smtp-Source: APXvYqz/zeAfOFLn8InrUDsSwRMd8ffzxCvY/3n479aCfXR18qlzfF6acmga5aGS3E9hIODd6McEkw==
X-Received: by 2002:a63:df50:: with SMTP id h16mr17395692pgj.126.1570225423141; 
 Fri, 04 Oct 2019 14:43:43 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id a11sm10446799pfg.94.2019.10.04.14.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 14:43:42 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  4 Oct 2019 14:43:31 -0700
Message-Id: <20191004214334.149976-8-swboyd@chromium.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
In-Reply-To: <20191004214334.149976-1-swboyd@chromium.org>
References: <20191004214334.149976-1-swboyd@chromium.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [alsa-devel] [PATCH 07/10] ASoC: jz4740: Use
	of_device_get_match_data()
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

This probe function is only called if the device is backed by a DT node,
so switch this call to of_device_get_match_data() to reduce code size
and simplify a bit. This also avoids needing to reference a potentially
undefined variable because of_device_get_match_data() doesn't need to
know anything beyond the struct device to find the match table.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: <alsa-devel@alsa-project.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Please ack or pick for immediate merge so the last patch can be merged.

 sound/soc/jz4740/jz4740-i2s.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 13408de34055..d2dab4d24b87 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -503,9 +503,8 @@ static int jz4740_i2s_dev_probe(struct platform_device *pdev)
 	if (!i2s)
 		return -ENOMEM;
 
-	match = of_match_device(jz4740_of_matches, &pdev->dev);
-	if (match)
-		i2s->version = (enum jz47xx_i2s_version)match->data;
+	i2s->version =
+		(enum jz47xx_i2s_version)of_device_get_match_data(&pdev->dev);
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	i2s->base = devm_ioremap_resource(&pdev->dev, mem);
-- 
Sent by a computer through tubes

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
