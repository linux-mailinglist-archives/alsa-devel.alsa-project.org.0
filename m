Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A682C216F45
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:49:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 526E9836;
	Tue,  7 Jul 2020 16:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 526E9836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594133369;
	bh=lfh9aVj1QHY1BY8teu2SpBfyyRekdAW4yjmlTHRQhBw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XVAKfx40pGF1qJ/hcvDn+cm9LaqwqpysVE8heHABdpaUar9MjJVAaTeBHszmmMza9
	 KpHTf/orXMIqL4jju8+zLOoSlaH+3bAL4g+PK4FUf1wU9Pmb1yw9Y2YF8Okq1Tcmk3
	 Q6eAd65D7Cl4QWJtkoPGFXwDISUOrjfDXo4X7zIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 731CEF802F9;
	Tue,  7 Jul 2020 16:38:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55652F8033F; Tue,  7 Jul 2020 16:38:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE1CEF80308
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:38:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE1CEF80308
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LkB5f2KQ"
Received: by mail-wr1-x442.google.com with SMTP id z2so23135036wrp.2
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d7oRUP6HHmbAXMILeJrpZWaXkV9JssFtTdyZGy/6dhk=;
 b=LkB5f2KQxj9RiMnUMCrnbNpyPWXlnW3De4WBuJl/2/6IHSiYFHZG9igGOCZ3Y6J6WK
 Gzbp0CjO+Hdh4zx8lZUoPUE8mjaqtR0sBqE1LDCGGIabjQW5F+fL8xcu83/lEJ5co343
 1/0T8okpQOpgFedcJf3DKAC0tvKA/FHXQuFyslmQPQhp8ilQDgShlhNi6h7Xvc3BeZFW
 FhGx4DjU3wuLtkjnmBDz31yplmbsKYm6QQ63skIPj0JOBDWZ6+2n4fkjip7zWgg0uq0V
 WTsR8iE1up41/dfHe6m3cLl5RdBzy45oImEPSvr+ABdZS47BW61TAjhXhJZjDOuR6RD/
 vyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d7oRUP6HHmbAXMILeJrpZWaXkV9JssFtTdyZGy/6dhk=;
 b=bKmVEOEv2Fl1PrZUuKHUPaTiF/68aXxm7Nu0EuqP+7BB6IBFvY9xHnxnD2udF+1x9F
 kQYXESKPd0+tx2PP5Y968BbFCZNjRfg5BZf34uCtfZan0pSxrNe9OoQbmADiqvwXfxfU
 s2qLRYcpxVnECRYrsz7wHZRShbZlJWGzA1U3GDmGZAj3lR5dISiIJrlHcPy/Tf6Lriqz
 FQQCJK7xncxzN0JEHLFQKcSZHh7PrM+TUE+OzYJMpaIl+AX/JY9xJDSiCMZjmocpfMIA
 tlyt+SoDscdyq5enH/1AI7vnoYzdpy/N/1mI33OszP5/ejKeOvzPeyCSB5MynFe36h/M
 M8oA==
X-Gm-Message-State: AOAM531eFURQxD1fPM6w8fFXdA8rK9v5yapTk2IAoFuAilNr/zwAsS9W
 KIY31iUFbN79fd4NNaGs8mHJqA==
X-Google-Smtp-Source: ABdhPJynXJwfY+EJdx1C+77hx2NiUZ2uZ+tqh66Q8vQrBf76qaoHLF9FMyXrc1gAY/AjtDJ4ELHvrA==
X-Received: by 2002:adf:c185:: with SMTP id x5mr59206892wre.403.1594132694312; 
 Tue, 07 Jul 2020 07:38:14 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:38:13 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 19/28] ASoC: ux500: ux500_msp_i2s: Remove unused variables
 'reg_val_DR' and 'reg_val_TSTDR'
Date: Tue,  7 Jul 2020 15:37:33 +0100
Message-Id: <20200707143742.2959960-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: Ola Lilja <ola.o.lilja@stericsson.com>, alsa-devel@alsa-project.org,
 Roger Nilsson <roger.xr.nilsson@stericsson.com>,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 Sandeep Kaushik <sandeep.kaushik@st.com>, zhong jiang <zhongjiang@huawei.com>,
 linux-arm-kernel@lists.infradead.org
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

Looks like these have been unchecked since the driver's inception in 2012.

Fixes the following W=1 kernel build warning(s):

 sound/soc/ux500/ux500_msp_i2s.c: In function ‘flush_fifo_rx’:
 sound/soc/ux500/ux500_msp_i2s.c:398:6: warning: variable ‘reg_val_DR’ set but not used [-Wunused-but-set-variable]
 sound/soc/ux500/ux500_msp_i2s.c: In function ‘flush_fifo_tx’:
 sound/soc/ux500/ux500_msp_i2s.c:415:6: warning: variable ‘reg_val_TSTDR’ set but not used [-Wunused-but-set-variable]

Cc: zhong jiang <zhongjiang@huawei.com>
Cc: Ola Lilja <ola.o.lilja@stericsson.com>
Cc: Roger Nilsson <roger.xr.nilsson@stericsson.com>
Cc: Sandeep Kaushik <sandeep.kaushik@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/ux500/ux500_msp_i2s.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ux500/ux500_msp_i2s.c b/sound/soc/ux500/ux500_msp_i2s.c
index 394d8b2a4a161..fd0b88bb79212 100644
--- a/sound/soc/ux500/ux500_msp_i2s.c
+++ b/sound/soc/ux500/ux500_msp_i2s.c
@@ -395,7 +395,7 @@ static int enable_msp(struct ux500_msp *msp, struct ux500_msp_config *config)
 
 static void flush_fifo_rx(struct ux500_msp *msp)
 {
-	u32 reg_val_DR, reg_val_GCR, reg_val_FLR;
+	u32 reg_val_GCR, reg_val_FLR;
 	u32 limit = 32;
 
 	reg_val_GCR = readl(msp->registers + MSP_GCR);
@@ -403,7 +403,7 @@ static void flush_fifo_rx(struct ux500_msp *msp)
 
 	reg_val_FLR = readl(msp->registers + MSP_FLR);
 	while (!(reg_val_FLR & RX_FIFO_EMPTY) && limit--) {
-		reg_val_DR = readl(msp->registers + MSP_DR);
+		readl(msp->registers + MSP_DR);
 		reg_val_FLR = readl(msp->registers + MSP_FLR);
 	}
 
@@ -412,7 +412,7 @@ static void flush_fifo_rx(struct ux500_msp *msp)
 
 static void flush_fifo_tx(struct ux500_msp *msp)
 {
-	u32 reg_val_TSTDR, reg_val_GCR, reg_val_FLR;
+	u32 reg_val_GCR, reg_val_FLR;
 	u32 limit = 32;
 
 	reg_val_GCR = readl(msp->registers + MSP_GCR);
@@ -421,7 +421,7 @@ static void flush_fifo_tx(struct ux500_msp *msp)
 
 	reg_val_FLR = readl(msp->registers + MSP_FLR);
 	while (!(reg_val_FLR & TX_FIFO_EMPTY) && limit--) {
-		reg_val_TSTDR = readl(msp->registers + MSP_TSTDR);
+		readl(msp->registers + MSP_TSTDR);
 		reg_val_FLR = readl(msp->registers + MSP_FLR);
 	}
 	writel(0x0, msp->registers + MSP_ITCR);
-- 
2.25.1

