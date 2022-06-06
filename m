Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D63653E02A
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 05:38:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1039E16C0;
	Mon,  6 Jun 2022 05:37:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1039E16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654486699;
	bh=PbYdv2MRa7yG6EuOS10uDfEXAzmkihSEqQmVqgl0YAI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S3uwbXtYMWLN4iBvCSm0mNhhes/QOhYdFMW/Loiw32lak9raDHQjOO9r55Haszzrk
	 R2l2d9iClnS78zNqG47EbmyEE4iJPdxUzVTe3PTMdmGLiU88L5eR8bZR1HUCLhyyvs
	 SWA82LscBZGODlvnJlhRwZjITDVHqjkVO+qLLyB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85092F8012A;
	Mon,  6 Jun 2022 05:37:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8A0CF801D8; Mon,  6 Jun 2022 05:37:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84985F80089
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 05:37:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84985F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dZc4jxqz"
Received: by mail-pj1-x1029.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so13616460pjm.2
 for <alsa-devel@alsa-project.org>; Sun, 05 Jun 2022 20:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NLfIMDkhs8AhvETPVq+iAr24dyts/oFKMffXp6KK4SA=;
 b=dZc4jxqzQaYU6bNMX/oVrNpUuokhFNbSbjUF4Y4tn2uSgQi1wHF3KHqBN33PkyCgaC
 o7U9LIU2UUUYS1Pwu0A3M3cuGouUxUjzLuVyKc2wAC54r9ZJ8Qgx8S58EbPPGJTvhzj2
 nM+BTiEUYm/8FsYSHj5CvG3sdN4NGKGAJeNOc9EHx1kAgnAMadQUI/OAyMHosvsUiC4p
 kClEL8slmh2XMxZ29Y2e2BTs8KFlRoBq+prV65AP55IP0m7I35s3Bm5wtM/92RllXP24
 kp7BPPoNdsdSCvD05MwhaiAEesC289nQTsRnpEfyn7OLr+2a6MPp+7gehUyVtKnVbNn0
 mf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NLfIMDkhs8AhvETPVq+iAr24dyts/oFKMffXp6KK4SA=;
 b=75YZr9VI15uZRA54wZvaoC6igCZS3jSzgxhkmysmvFpR3KMOOxkcfRyA2nknqenFed
 JcIyHoRLGPHE0XH7/TZBnCZ+PjUFO8PJpFQaZaulsPE21mIt1XAuof+tkdfgNRwHrVwz
 WpjirLDo87q8InO5mPUHYiyYxSjAkdS+ezR+kYxlbyGYtolC7bBVjtxuZBMBy+aKo810
 GiRycc+UXa3EHx6Jc+4JN18YkeltWi7+iNtSQo4ip4nnKKMm0swX+hBVL1nvw2JyqPwf
 x3Tzy2nZpeq9j93U7oCfFaev+k0xgGmGXZFgmuv8MUbSgcXV6Encc1RujMXEwo6JilAX
 U3/w==
X-Gm-Message-State: AOAM530VKEk2BkTZxuXaXNDc5Hd/eGM78XqCa1lxolC3IQC6BhKT+F5t
 kZiqSUl05LTyXQTNcpB2p7M=
X-Google-Smtp-Source: ABdhPJzHskn/0nDuJUNh+kkv/i2TwqL9zwM4+pDSLRb9NT1RjQFYEHsVEWABjF0pgTAaI31VavBwGw==
X-Received: by 2002:a17:90b:4b4b:b0:1dc:8724:3f75 with SMTP id
 mi11-20020a17090b4b4b00b001dc87243f75mr58394066pjb.178.1654486630864; 
 Sun, 05 Jun 2022 20:37:10 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a170902db0a00b0015ee985999dsm9443596plx.97.2022.06.05.20.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 20:37:10 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: shengjiu.wang@gmail.com
Subject: [PATCH V2] ASoC: imx-audmux: remove unnecessary check of
 clk_disable_unprepare/clk_prepare_enable
Date: Mon,  6 Jun 2022 03:37:05 +0000
Message-Id: <20220606033705.291048-1-chi.minghao@zte.com.cn>
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

Because clk_disable_unprepare/clk_prepare_enable already checked NULL clock
parameter, so the additional checks are unnecessary, just remove them.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
v1->v2:
	remove the check of audmux_clk before "clk_prepare_enable"
 sound/soc/fsl/imx-audmux.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index dfa05d40b276..3ba82adace42 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -62,17 +62,14 @@ static ssize_t audmux_read_file(struct file *file, char __user *user_buf,
 	uintptr_t port = (uintptr_t)file->private_data;
 	u32 pdcr, ptcr;
 
-	if (audmux_clk) {
-		ret = clk_prepare_enable(audmux_clk);
-		if (ret)
-			return ret;
-	}
+	ret = clk_prepare_enable(audmux_clk);
+	if (ret)
+		return ret;
 
 	ptcr = readl(audmux_base + IMX_AUDMUX_V2_PTCR(port));
 	pdcr = readl(audmux_base + IMX_AUDMUX_V2_PDCR(port));
 
-	if (audmux_clk)
-		clk_disable_unprepare(audmux_clk);
+	clk_disable_unprepare(audmux_clk);
 
 	buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!buf)
@@ -209,17 +206,14 @@ int imx_audmux_v2_configure_port(unsigned int port, unsigned int ptcr,
 	if (!audmux_base)
 		return -ENOSYS;
 
-	if (audmux_clk) {
-		ret = clk_prepare_enable(audmux_clk);
-		if (ret)
-			return ret;
-	}
+	ret = clk_prepare_enable(audmux_clk);
+	if (ret)
+		return ret;
 
 	writel(ptcr, audmux_base + IMX_AUDMUX_V2_PTCR(port));
 	writel(pdcr, audmux_base + IMX_AUDMUX_V2_PDCR(port));
 
-	if (audmux_clk)
-		clk_disable_unprepare(audmux_clk);
+	clk_disable_unprepare(audmux_clk);
 
 	return 0;
 }
-- 
2.25.1


