Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 741183EC7F7
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Aug 2021 09:33:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C7F9175B;
	Sun, 15 Aug 2021 09:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C7F9175B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629012783;
	bh=JtYkOUlNY4RvSRR+0206aZpAI2AR5JFoyFxWFQsJQHc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OwIXyrZAr3IFys/eKnSBgotow8jd5y5340lM5+PnBByfv47PENw/c5xUmcewUeNI7
	 2tGzEgpYqijqJWfEoIQ/XC7CALCr3XZa2VGsc9q7oabhKA1xI44QPpfto/YAxG2UkD
	 mmcpqXui8gL2AlR9UB2aqptci4sgdhY1lROgfoaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83773F800B8;
	Sun, 15 Aug 2021 09:30:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30B98F8025D; Sat, 14 Aug 2021 22:12:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A541AF800AF
 for <alsa-devel@alsa-project.org>; Sat, 14 Aug 2021 22:12:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A541AF800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sVw7hCV8"
Received: by mail-pl1-x636.google.com with SMTP id q2so16181499plr.11
 for <alsa-devel@alsa-project.org>; Sat, 14 Aug 2021 13:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lil9AoIO0pvXft/wgCoMRBl14pUNq2Bwl4VjQXc1qVI=;
 b=sVw7hCV8yRTqkPORb847X6o48bQC2n0dn45Eh7Lyqtd7a39t/SEH/EtoSSngFP82GN
 So162zopl0Mfj7ghGwdyPWKUnows5xRA/kDf5CHjikzrj1LwvaGtaO5hgmJ8LPri+Jas
 XWqJ25D+g6NCK+fpXa2ZML8Iw2F0W8825kuwgtwXZ7ymBhsNw3C/c79RqneE/yCvp1b2
 g1EOY1X70c+kZj+albuZp7XnUi8ODg0Qhd8EB2JT0Skz3ZvqGiDYW0WOwDrs01azprdA
 0NdvaOxSuaaWQaFy79GEurrwCVQ2p/k29esGGmSFr9629L3YSMWxGXsXQClRsaUgeVOL
 QCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lil9AoIO0pvXft/wgCoMRBl14pUNq2Bwl4VjQXc1qVI=;
 b=WA6kBYHJMik1l5NQzXUEJl6uAThphSqgG0dJ/zidICwhMZn9dHEya8b4N7eSo4Fm6F
 4uV/gcOhBeN/Cew/xShpy9Z9MmCh2kdKgg1PWE/m66Kw752bWfgJ5SBXt9uucrbngxnw
 leYR7Ed8pSnrFNh2sxKaoeVVjdh28cOUwKDA/5BTGIlgiRtl0Jll19eIuJrXbhr3FHFv
 oOBKp8g/EaUaWPkMjo4bwTBJKQdsQtDTlpVd8JRmVr0dk0qGr+pvFWqTjHzI3E/Vlvmu
 CgvIIVK61GoNxp2mEmVTHQmhmXrKY9zNH6x0BhnGN1W2IsZceRY40hBq+3PybkGA9Lyw
 9Z7g==
X-Gm-Message-State: AOAM531HNQGbgLn0zuGwlGSeDiaJE/TZ3ghtDKuo7v0T2OPDj8jgv/1m
 vKA05Rv3A1TgFtHWgN2+ld0=
X-Google-Smtp-Source: ABdhPJxHkBe/kNjoFSqi6fNUoIZJHki5U4Q7eFa+ruFr7SX7NFjotH1BFbtYN4tQAkwqY/jIvhFAnQ==
X-Received: by 2002:a17:90b:395:: with SMTP id
 ga21mr8974448pjb.159.1628971956923; 
 Sat, 14 Aug 2021 13:12:36 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
 by smtp.gmail.com with ESMTPSA id u6sm7309420pgr.3.2021.08.14.13.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 13:12:36 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: tegra30: i2s: Use of_device_get_match_data
Date: Sun, 15 Aug 2021 01:42:19 +0530
Message-Id: <f4e632e0023d90c43b2b927e752585142a9d9c26.1628971397.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1628971397.git.aakashhemadri123@gmail.com>
References: <cover.1628971397.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 15 Aug 2021 09:30:27 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Helgaas <bjorn@helgaas.com>, Thierry Reding <thierry.reding@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-tegra@vger.kernel.org
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
 sound/soc/tegra/tegra30_i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 36344f0a64c1..d4c5594efaf1 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -418,7 +418,7 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 	}
 	dev_set_drvdata(&pdev->dev, i2s);
 
-	match = of_match_device(tegra30_i2s_of_match, &pdev->dev);
+	match = of_device_get_match_data(&pdev->dev);
 	if (!match) {
 		dev_err(&pdev->dev, "Error: No device match found\n");
 		ret = -ENODEV;
-- 
2.32.0

