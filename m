Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C1C1340C
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 21:35:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED1191825;
	Fri,  3 May 2019 21:34:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED1191825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556912119;
	bh=PE/RZ2hsqubR+JWjgiZ1ydHKGdnaMB53fPCejxGV8u8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FNOD/+2tzPyTYM/E6cuMJWqjEBvNeq9hulIrQYiANHh/jp8DNqjE8fdGkqdv9XR4J
	 GVIwJ9xUjJ8p9LOdxrbYzzL/nUxxn2NRMabkdcfJCuk5rF3oq8AChap4YWGvr7z0Ql
	 NiBWV2Xq6JpsQo76b1vaieRX9h1Z0yjUfjU2FM8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBC8CF896B6;
	Fri,  3 May 2019 21:34:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97FFDF896CB; Fri,  3 May 2019 21:34:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D941F80720
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 21:34:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D941F80720
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="QjjTc8Em"
Received: by mail-pl1-x643.google.com with SMTP id w20so3160751plq.3
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 12:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dtquEs4dI9tF9E5HTPY6qPCSApYaxMMy1ZM9TNW2ugE=;
 b=QjjTc8EmizCW5wgv6T1/ubz7FyKpdhqtBs1LXTMHDe76RoC0ZG8CG2vYrQmp4JMrbx
 Dt8Sk/ncabGqYiAp00zr1n5nOb9Whjh+ESTDH44yFhK5XSIFm4Kb6ZdnegITV9nW59l+
 kCTey717mxSdYyNQdxU0kfDv9wK1Gle2zg7IQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dtquEs4dI9tF9E5HTPY6qPCSApYaxMMy1ZM9TNW2ugE=;
 b=EuXWtDWD9HruV00qJZGoFu+ifN7gbcs/2m1kkvDCWSv7NhGuTkvuBeHMekQgufjVbb
 ESPNLRu7QAh8ekeYZ9POb0UzQaWUM7KUbWQjtLTQIFAL3QBv2lgY2iJf9IpE9/hK7qGh
 z6/QnpcnpX6dXrAVOsafMCVTSMBtd5HH+FgNglKnuoNrt9A5qtWNJ1aLFr+wMhqxLrE7
 PCofpufMaI+/BeUU8QIb/X/I3ExLytHaEbAAYZAuBzjLg6gvCXIfVuJkpSwQC52gzv4F
 U2r9rDsxS8Oqd3gT5FTsj/RQj6VpwMGdkMUc2mXLsfUxWRt9C9f7JJscI9qE8Tap4wz+
 UiTg==
X-Gm-Message-State: APjAAAURKsT2V1YxzqY6KrZra7dz8qK6i1XaO0lqAuo50ZXBWH+XDSiS
 GR7iGY0GBTh0VZp0g1uZl7uruGSVFQ==
X-Google-Smtp-Source: APXvYqxN7w8Tkg5qb3WJBpBt/XXty1dHrST/7f3rI7U9GIlBdwUltjGuFyzQbYGCap7XQzZVgvFNSA==
X-Received: by 2002:a17:902:5a81:: with SMTP id
 r1mr12566262pli.147.1556912057583; 
 Fri, 03 May 2019 12:34:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id p20sm3381349pgh.83.2019.05.03.12.34.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 12:34:17 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri,  3 May 2019 12:33:42 -0700
Message-Id: <20190503193342.241330-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH] ASoC: rt5677-spi: Rename driver to
	differentiate from main codec
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

Currently the SPI driver and the main codec share the same name. This
will become confusing when looking up components when using both
drivers.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677-spi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 84b6bd8b50e1..871ccb37318d 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -29,6 +29,8 @@
 
 #include "rt5677-spi.h"
 
+#define DRV_NAME "rt5677spi"
+
 #define RT5677_SPI_BURST_LEN	240
 #define RT5677_SPI_HEADER	5
 #define RT5677_SPI_FREQ		6000000
@@ -232,7 +234,7 @@ MODULE_DEVICE_TABLE(acpi, rt5677_spi_acpi_id);
 
 static struct spi_driver rt5677_spi_driver = {
 	.driver = {
-		.name = "rt5677",
+		.name = DRV_NAME,
 		.acpi_match_table = ACPI_PTR(rt5677_spi_acpi_id),
 	},
 	.probe = rt5677_spi_probe,
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
