Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E05E63EC7F8
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Aug 2021 09:33:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A197172D;
	Sun, 15 Aug 2021 09:32:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A197172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629012808;
	bh=ELOrCrxxSvepq20ajWz0gXhUxw6h2FtUG4s1fnJY5G4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l/dQV48ykz+VAtV+L5SFm9yG348lZRLszV4UoElbBvFXDssG7V2hhRA43caW5WVK4
	 a9lL/i4FNuE4y+a2aq8o1dRFHDf8B08OiSRgC8WmEq2fVzyTPKxp0AkJSqdmI4O6It
	 tpyGgdmp11oxWpyyEOq25EDC8mKM0koSxBrB0oDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53EC1F804ED;
	Sun, 15 Aug 2021 09:30:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB5F0F802A0; Sat, 14 Aug 2021 22:20:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 166A4F800AF
 for <alsa-devel@alsa-project.org>; Sat, 14 Aug 2021 22:19:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 166A4F800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kf1Tbb+9"
Received: by mail-pj1-x102c.google.com with SMTP id
 w13-20020a17090aea0db029017897a5f7bcso21087532pjy.5
 for <alsa-devel@alsa-project.org>; Sat, 14 Aug 2021 13:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ePTL3Kfj5FpJJV64v2XN6rOLtZyUMBX7KPr/SFojksg=;
 b=kf1Tbb+9UkthXULcv3jhomGwS7YOaN93jx1dbvVp5WKHs3Q3VKpqI4KneToozvnGbn
 xOUpiYJ2ZhfqJCf7B6/EMySTahTt7PSb3RfPqxvXdn0/PH/AQmpn6h3wZHUd1LmcRzlY
 fZ5t7t7+HeDK3ZcU5qTbB2inVDgcrgl0/HEdR0evMk04U0oWHGh6Hc6aQvYFkavzeuJM
 kGIzdqdFsx9RvpzGskzn5vGgTLHsBNQ46dn1w6SlNrxgCRRKlNwEflNAeFisqZJZTJML
 XctKMJXM2JZ/QQCwBM2zKfpAFIQeTUE0emm4JIHA31wYN4yKZKbKjiyPgoAR4UqC3jzy
 JgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ePTL3Kfj5FpJJV64v2XN6rOLtZyUMBX7KPr/SFojksg=;
 b=D7li3kcHYIk9DG6LoO+DL61EmoKb6l+YhIdC/HvQFd4z2D+S8uRYiHH6tGwL15+gjw
 3HU1UTKHNMvT1jx0DXu+y3WmQaysy90pLRjjYwMFQVSGyoOBWwLzZ4s2ZyZVjjkhiNvV
 m+jm/5N4ovs9HlzFmN8XWZSuHZLTrcO0Lf/aQK1EUuCeXoQ/PG/GObjJKqFzedc7uBiF
 UkiV23S9+Ip6jsG873O0Hp25PIRlMEWgSCCzGPdOEVpAxrxE2Y8tvpu+Fc+X5YPi/K0v
 v9kNMevvG68OqPf+HFfEm7g5v4w3TS2As1v+w4oxjBbk7MnN5lTqvTuKoqXEis4KcWjQ
 urmw==
X-Gm-Message-State: AOAM532Pmf/QOe5JqSAj6Aex1TqPltH2IBbwYNL+sGttvDNZU37rcck4
 /V1bN/3m5eNVzSUTD3iYwno=
X-Google-Smtp-Source: ABdhPJyd/i/l/TfPZNQZDIBXG+aOMRplp4tSWMwKxKVFpTQcDZmEXsyQt7VWpnVqVcUm3RyklrgM/A==
X-Received: by 2002:a63:1352:: with SMTP id 18mr8066688pgt.348.1628972396713; 
 Sat, 14 Aug 2021 13:19:56 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
 by smtp.gmail.com with ESMTPSA id u13sm6413121pfi.51.2021.08.14.13.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 13:19:56 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/3] ASoC: ti: omap-mcbsp: Use of_device_get_match_data
Date: Sun, 15 Aug 2021 01:49:40 +0530
Message-Id: <44f3b21198dd1e40e1e5e783db2b3dd76505b562.1628972198.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1628972198.git.aakashhemadri123@gmail.com>
References: <cover.1628972198.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 15 Aug 2021 09:30:27 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Bjorn Helgaas <bjorn@helgaas.com>
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

Prefer `of_device_get_match_data` over `of_match_device`

Retrieve OF match data using `of_device_get_match_data`, this is cleaner
and better expresses intent.

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 sound/soc/ti/omap-mcbsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 4479d74f0a45..fcb651487854 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -1373,7 +1373,7 @@ static int asoc_mcbsp_probe(struct platform_device *pdev)
 	const struct of_device_id *match;
 	int ret;
 
-	match = of_match_device(omap_mcbsp_of_match, &pdev->dev);
+	match = of_device_get_match_data(&pdev->dev);
 	if (match) {
 		struct device_node *node = pdev->dev.of_node;
 		struct omap_mcbsp_platform_data *pdata_quirk = pdata;
-- 
2.32.0

