Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 831C815D838
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 14:16:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C58A4E;
	Fri, 14 Feb 2020 14:16:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C58A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581686211;
	bh=Q3YY5ukxmbwLcth/tNt8nQ/0P7NXZeWQsMvp+Bm9vZ8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n8XD/HB3u3G3ybw473Fl/DtB5Bu83qRxW+wojgS4JDlSr+t/pmYKu/iqxZE0c3MIK
	 AH+u70Zr4c5tctktL9ku0/41VHEaAHKC6foqdMeuqb00DdTG3XH5PskGxTtOxb1vys
	 wVHvVy/C6KgnNPcB7y8XxlfxKe9PtLb2Ir+8s3wE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 847F3F80277;
	Fri, 14 Feb 2020 14:14:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96785F80260; Fri, 14 Feb 2020 14:14:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95D53F80086
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 14:13:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95D53F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="uw+QY/sO"
Received: by mail-wr1-x442.google.com with SMTP id t3so10856184wru.7
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 05:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LkbErKWwYUT9sSZs7koUeGzSJ1kXs9rP2h4RESbdYMw=;
 b=uw+QY/sOU9TAjN6r5atc110IldveajcARtxPgbi7LquQXROET3VNg85+5bORKKLAKu
 5iGeKS24GIg3DNW3mSBhNmFwp2lEXa3Ro1vcVCMA2PFm4rP5KA0FDVcYsvICJrqMLVuR
 qUEdziIr7zy+V0A8rG7fLISfNXSn2WN6Or3yqBG+J36Ae1TJRjvr3EKhFESoAzjPPQTF
 OOmBR5QHU+6JXuZCXY8HzwNF3ZbmckjyDtwzWJzupWcUR4B43xNf/4oLDlmVIJjtuWhf
 xU5qfmZhkdjntRW0owJNeh3EzO49LmeGKZYe26oBCgzGNL0ix1c+lQaJQXcH24lm0Gh4
 CDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LkbErKWwYUT9sSZs7koUeGzSJ1kXs9rP2h4RESbdYMw=;
 b=Ou8jGZ2TWMqt5GrHPIEoohi8hH7obHiaOGHp7p/uJq74Ol2fIPwerAqj7ER7pBTFTk
 tiqXEn/5damHLXKqOCfM87U4OSP9NT86wPlRuBOh5nhbnjQmNK+P4XGnxaV/4vNLI/ba
 UicCJypWo1bGsdSbBXmZI75kOjh4wcrR5O6ZFns08mA+TzA72i5TGYq6zCpmc/kIQu/x
 EwdS9YfkYKacCyCU4YXmd/kTzq1k2ZBODNCp0GEXYu/XH52y8P0qXwv6kreBVFABXczu
 7gdxbWZqw77CldFq3b8ClV4uCtf0qVoZ0N5YJj/62anbf4wimfPvUCrq2IpGa03qPDJZ
 LBUw==
X-Gm-Message-State: APjAAAVkwH0xG1aBEXeK2nuFSM0c1xpTdPSoMbtuHw8jGzWjNk+o4TC0
 KF5Ak0yu9nxjZSrAZRVB3oOcxw==
X-Google-Smtp-Source: APXvYqz68c0STkV8Q5Vc0fGN6lA992cZEJnJxpcnS0jlWkaeahzpyfKtfRZVr6TPtS9gcP80p4i0YQ==
X-Received: by 2002:a5d:4052:: with SMTP id w18mr4018666wrp.112.1581686036643; 
 Fri, 14 Feb 2020 05:13:56 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm6760792wmi.9.2020.02.14.05.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 05:13:56 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Fri, 14 Feb 2020 14:13:47 +0100
Message-Id: <20200214131350.337968-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200214131350.337968-1-jbrunet@baylibre.com>
References: <20200214131350.337968-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kbuild test robot <lkp@intel.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 2/5] ASoC: meson: aiu: fix clk bulk size
	allocation
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

Fix the size of allocated memory for the clock bulk data

Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/aiu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 5c4845a23a34..de678a9d5cab 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -203,7 +203,7 @@ static int aiu_clk_bulk_get(struct device *dev,
 	struct clk_bulk_data *clks;
 	int i, ret;
 
-	clks = devm_kcalloc(dev, num, sizeof(clks), GFP_KERNEL);
+	clks = devm_kcalloc(dev, num, sizeof(*clks), GFP_KERNEL);
 	if (!clks)
 		return -ENOMEM;
 
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
