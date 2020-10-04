Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0450A282A30
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Oct 2020 12:28:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 797E1188E;
	Sun,  4 Oct 2020 12:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 797E1188E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601807308;
	bh=CPBqrEceHKkTZnYbzs1zO5/YCc94uP6hA1si5tkJJjA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IgAGDZ0F26/YxPzK0uokdHkzlWkIGOIYtWfjUT05tt6mh4aj9rzWKASBk2bcR/ymm
	 VCfygZdglwR8CR+UVCxlVAOAS7jBzK1zSzT7AXTpHRhQ3dGO3zqONeqCX/e4AMFyy5
	 Kr+Y6wyVO9ZIexFbM02FRKYiUXqfrVSbXLKov9Cc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8CD4F80218;
	Sun,  4 Oct 2020 12:26:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEC80F80246; Sun,  4 Oct 2020 12:26:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3E7FF800C9
 for <alsa-devel@alsa-project.org>; Sun,  4 Oct 2020 12:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3E7FF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kTcbPlMH"
Received: by mail-wr1-x441.google.com with SMTP id t10so6406261wrv.1
 for <alsa-devel@alsa-project.org>; Sun, 04 Oct 2020 03:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WI5lq349UOc/rM1ogB7WEEhfDIlX4fgfdyC+wmwvVyU=;
 b=kTcbPlMH0pRvBTL+XzuLaer8gkgqwkayqk5vhELRB5AdwW0g4vMxH+Cuo4W5WOrwoe
 PdjrGPx4wLGXjAKXIKhKkOq4r3yjkdc8aI9s6k7oygCa0KIvY1IgxO55JvvOJODbmmCt
 tOtRPibgT6B3ir2nYmp3e2/x6jSv4s3htfoudL6z1A064XJV/jX1yk/7zQG36TZ7Kak0
 Jd4iX6XesfZXNZM0uF5/1tdjSElsHJ0QotxKrTVcnvFj1YO4h3W/3XQiOuy0lIqFDlGD
 LymJ56niDzwrQLWizE5LpmmORZOz6/Od065hEVCeAqClNhE7LR3pm8UKFwKLA9OS5zdu
 Qqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WI5lq349UOc/rM1ogB7WEEhfDIlX4fgfdyC+wmwvVyU=;
 b=O+tPmzptHtzWJVA7iawvoDfmOkYbwq5/unimb7L3/wrqFHxS2rcBQzE4ohDhXzfTc0
 YgV2sWAvZVFucxWHXbwLsyB6zRu6mLE9Q4iwZqs0ap1acsIBADUVHEDemdi56hXqbQqg
 fgrNGnTbY/SdC+rMUymawYrXCv4XNKOQFA+rCHaSEWLMVdld2In6KTr2ZWH8OJ/kTDYG
 DkMJtGhwSrKG8XuKD79V2bEi8WyItN9hLUiyEudpJouhMvjymYCXRrRggUyTAAeuvFYZ
 Cm5oC+FypcuOdLethtq7ilFxQLJPYNeK48vUaUfRRM2DNQVcHnCJZ4+P+GhTv13K5/GA
 AKsQ==
X-Gm-Message-State: AOAM532eocciAfV4d7cFD1ROu29dN/oAWuQ06qIuK/nLsLbdPFjkCAp6
 Ik7xdSOwnCP3K4BPnFUZcDtd6nO2QAUrmKRl
X-Google-Smtp-Source: ABdhPJx8EQUEpEizo9JeW9ReirzOlZH1RWCe4mtUqCr338S4VKiWNT2h43IxA0WS/+0H0EoqAjrvhA==
X-Received: by 2002:adf:8b43:: with SMTP id v3mr7496838wra.414.1601807197616; 
 Sun, 04 Oct 2020 03:26:37 -0700 (PDT)
Received: from localhost.localdomain
 (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
 by smtp.gmail.com with ESMTPSA id q4sm8423007wru.65.2020.10.04.03.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 03:26:37 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
To: 
Subject: [PATCH] ASoC: omap-mcbsp: Fix use of uninitialised pointer
Date: Sun,  4 Oct 2020 11:25:36 +0100
Message-Id: <20201004102535.325547-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 linux-omap@vger.kernel.org, Alex Dewar <alex.dewar90@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
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

Commit 9c34d023dc35 ("ASoC: omap-mcbsp: Re-arrange files for core McBSP
and Sidetone function split"), in rearranging various files, also replaced
calls to platform_get_resource_by_name() + devm_ioremap_resource() with a
single call to devm_platform_ioremap_resource_byname(). However, the
struct resource is needed as we access its members so at present a null
pointer is dereferenced. Fix by doing things the old way.

Addresses-Coverity-ID: 1497530 ("Memory - illegal accesses")
Fixes: 9c34d023dc35 ("ASoC: omap-mcbsp: Re-arrange files for core McBSP and Sidetone function split")
Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 sound/soc/ti/omap-mcbsp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 186cea91076f..6025b30bbe77 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -620,7 +620,11 @@ static int omap_mcbsp_init(struct platform_device *pdev)
 	spin_lock_init(&mcbsp->lock);
 	mcbsp->free = true;
 
-	mcbsp->io_base = devm_platform_ioremap_resource_byname(pdev, "mpu");
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpu");
+	if (!res)
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	mcbsp->io_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(mcbsp->io_base))
 		return PTR_ERR(mcbsp->io_base);
 
-- 
2.28.0

