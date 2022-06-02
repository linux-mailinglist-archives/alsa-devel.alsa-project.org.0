Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC5053B434
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 09:16:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AF73172F;
	Thu,  2 Jun 2022 09:15:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AF73172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654154166;
	bh=iNUOHukEyxvKur6zUyzxFqUGRKfnGRkMm0Ug5+gEvj4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fepKGze1WWCmXcLJb3G8M2jk+kjD+zr0rLoEBC/IPDpaqv+8JT8y4BX9aeuVMsEFF
	 JAxtdEQ3UAHqcWuXQqXn0OLrOzcFmOlEscgGKWYT4+5+vethrB3Uu3RtXwGdYpNWlH
	 rDy0CgHiwQXNqYF1a68DuAVQDFtfdZyi8lcMCPSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77D2DF8025E;
	Thu,  2 Jun 2022 09:15:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69AD5F80236; Thu,  2 Jun 2022 09:15:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC872F80089
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 09:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC872F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kjIm42IQ"
Received: by mail-pl1-x633.google.com with SMTP id w3so3779452plp.13
 for <alsa-devel@alsa-project.org>; Thu, 02 Jun 2022 00:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T86Xkl4zAQRDqlX+Sbg7KzV+2Znm3kmGhJEJ2gH5oPs=;
 b=kjIm42IQKm9p8crvtuLlXRMrgIPGHqf/cbX5Jp1nkyGBMxpECnqZ5tNw4G30RPSxSl
 ihT2VakbiG/ZXL6SWwJp0zuQ7kQ8ePWf8/YKs4gc0Fj5aAxPTjQzdgDFlI52vn/qTfxY
 cjAU9JiqpoH+7H2BLO9XA48OAW57jwI7UKzmewXbkmcjWWnVmYin3Mh8utHbnOGfqaBo
 cD1jkJAmTugEOEEctTHVa+GoP0iAFf3DXCI9k5QRDWt42VAAe/Gcz7HYnjFTIvdHH2NQ
 D8R/hTPIsSDjcxWOgyKWl6jTZpX27yZUh6IbNcbzODpP3uB4O/YQ/UO2LD9O63doGyfL
 vvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T86Xkl4zAQRDqlX+Sbg7KzV+2Znm3kmGhJEJ2gH5oPs=;
 b=ar6UbbsPQV0amln8EUnYKvkPwFMotBe04ep8rt2HVxens5yQlMcVPeey4+t3leNAll
 2IWKLupTQ7lqQRWle4hBkWuYvjalIlRucHAbHhK+tXnSoNu4XdXsxoQ9Xft90eVuKVVl
 eBnvWvhr6LH14J/k3VvmYqe/3d0Qs5E/2qH3joNgvKkHjUsaG9XWXgbd1QT1UzdtMlFh
 BK5OjPT2ciYB+/Y7w23cBA1XSwz8EZJindiyTlRKRGBsQHBHLaoPu6p84V4wOa/OnwDD
 7d/O9e/KHAN094T0uElYEJPTJC2Kb/+Tun+z7PxDJ5K7il8EGYbvur85b5l6uHSKsDDl
 qp5A==
X-Gm-Message-State: AOAM533hX6nuFEZv4GvxoXElIT12Gl2xxoQiu4F60Q3mEryVydvKJYYn
 8wEDjH3+a3/KLo3kvFG1ic0=
X-Google-Smtp-Source: ABdhPJwZZAKpu/HC9yA8XNgWRXb+XzH/3iyXB2zHZjMV/93ih8NOdK4sZduf3oXx1JZX6HglGbpQ6A==
X-Received: by 2002:a17:902:f60c:b0:156:82c9:e44b with SMTP id
 n12-20020a170902f60c00b0015682c9e44bmr3519920plg.106.1654154093526; 
 Thu, 02 Jun 2022 00:14:53 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a1709027ed700b00163cb0a8392sm2674737plb.168.2022.06.02.00.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 00:14:52 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: shengjiu.wang@gmail.com
Subject: [PATCH] ASoC: imx-audmux: remove unnecessary check of
 clk_disable_unprepare
Date: Thu,  2 Jun 2022 07:14:48 +0000
Message-Id: <20220602071448.277968-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org,
 Zeal Robot <zealci@zte.com.cn>, lgirdwood@gmail.com,
 Minghao Chi <chi.minghao@zte.com.cn>, nicoleotsuka@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Because clk_disable_unprepare already checked NULL clock
parameter, so the additional checks are unnecessary, just remove them.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 sound/soc/fsl/imx-audmux.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index dfa05d40b276..f434fa7decc1 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -71,8 +71,7 @@ static ssize_t audmux_read_file(struct file *file, char __user *user_buf,
 	ptcr = readl(audmux_base + IMX_AUDMUX_V2_PTCR(port));
 	pdcr = readl(audmux_base + IMX_AUDMUX_V2_PDCR(port));
 
-	if (audmux_clk)
-		clk_disable_unprepare(audmux_clk);
+	clk_disable_unprepare(audmux_clk);
 
 	buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!buf)
@@ -218,8 +217,7 @@ int imx_audmux_v2_configure_port(unsigned int port, unsigned int ptcr,
 	writel(ptcr, audmux_base + IMX_AUDMUX_V2_PTCR(port));
 	writel(pdcr, audmux_base + IMX_AUDMUX_V2_PDCR(port));
 
-	if (audmux_clk)
-		clk_disable_unprepare(audmux_clk);
+	clk_disable_unprepare(audmux_clk);
 
 	return 0;
 }
-- 
2.25.1


