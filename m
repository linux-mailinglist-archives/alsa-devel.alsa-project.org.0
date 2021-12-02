Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 173A746683A
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 17:28:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93AC928BA;
	Thu,  2 Dec 2021 17:27:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93AC928BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638462489;
	bh=+yFzHirHX3Xclw/SmIm5qWAgpVbPdV5afTLP2mMhsRk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YC2u+Lu8NcXETCU+viME4LB87wRqA+PQNAMPPDNIwdcRQWNVLz2Q6j+ghAQ0HIYDk
	 0TfjiVR58+h4nDFm9GFuzXjqQWBOrTtDYRy+rkrX85+ZDDI+5slEeSWvYDEbiZPk32
	 xyJL+g/3P0vVQwwq9PVQwqBKqH22stzay9bQTr9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B2B3F80511;
	Thu,  2 Dec 2021 17:25:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB91BF804FE; Thu,  2 Dec 2021 17:25:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 532EBF802E0
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 17:25:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 532EBF802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BQwLoD5G"
Received: by mail-lj1-x229.google.com with SMTP id k23so784300lje.1
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 08:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TqYniy4pFRsXD92ySrc+ZxB/2v4IriL3y3/YUqS2PUE=;
 b=BQwLoD5GsKuHwGcm9CCRNNoWfhuNnvmOM/2ZfVxwRSvlj+i9mrX6Mzj+ppnnqAI2rq
 E4tEwLGLm2ZnzLcmo7YCVVDjFY/vifIM4jmBBPiT9ZNPUUc6jzq+1MFNWnx+tx+iOPx1
 iCqsC/b3kAPfUNlk7ZZvnIGQb82xDqikIR2SFjicK1Bq8gRWRMpOORG1GxFsWkYuCL+4
 HshbFPgGDw1cizhpzuODlQc4P6wY2GQ3HLYY8tmbpgbAXrmgv4ynsB2RGnML4RhD0PEA
 hOOHxPmFfl9yyVqq1ELu6U0RJDWBjL6/FD8csHQz7n6CUkw0CaSpULEtIoeWnNSCiXy+
 A+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TqYniy4pFRsXD92ySrc+ZxB/2v4IriL3y3/YUqS2PUE=;
 b=5Q4DaBlI0KP3RWfrHv/VITdvRnYM/iLtdLNyFYjs1fliZJ9LgLYuCqgK/FXBYX+m1a
 hf/62N6njy02GoP1B7R418fNy6yn3jNFqnPaspiBA+4l4uob5J8shY1f8vIaVt23NciD
 xIMUlzEqZ0YwcF1K5CcBG5qHUI4sK9VawBM7Ihxpi9Z/fq3J67TR959Xfj8O6e4e7bya
 9xH/k9cBkBfulQTRnYrrap9ZUS6Dtt8+sdKwxYJguXLKehRh+FMJEO9GxTeWtxJnD+X+
 xkIlfrrqe/6GgLRwEzloXftnBtBTgNTvcPTRX0kynGlgrxe7jo02TDcHFWViJwmu1cHJ
 8jYQ==
X-Gm-Message-State: AOAM530J1Xx+42Jgq48ALUmxDNpsUbPLInOfzRD5XeUezhRyDfYlAPAS
 i0Z5QPbg1GXS25ijSPshOrY=
X-Google-Smtp-Source: ABdhPJySugSp1rA4YrKTD7/t4BqlpGfdBZL4TlGHm+Feas4m0Bqsz3MGvtiX9EqaRmuZilIyrhztTA==
X-Received: by 2002:a2e:948:: with SMTP id 69mr12422486ljj.82.1638462318795;
 Thu, 02 Dec 2021 08:25:18 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:18 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 03/20] ASoC: dt-bindings: tegra20-i2s: Document new nvidia,
 fixed-parent-rate property
Date: Thu,  2 Dec 2021 19:23:24 +0300
Message-Id: <20211202162341.1791-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211202162341.1791-1-digetx@gmail.com>
References: <20211202162341.1791-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
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

Document new nvidia,fixed-parent-rate property which instructs that this
board wants parent clock to stay at a fixed rate. It allows to prevent
conflicts between audio components that share same parent PLL. For
instance, this property allows to have HDMI audio, speaker and headphones
in the system playing audio simultaneously, which is a common pattern for
consumer devices.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/sound/nvidia,tegra20-i2s.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
index ad43b237d9af..68ae124eaf80 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
@@ -42,6 +42,13 @@ properties:
       - const: rx
       - const: tx
 
+  nvidia,fixed-parent-rate:
+    description: |
+      Specifies whether board prefers parent clock to stay at a fixed rate.
+      This allows multiple Tegra20 audio components work simultaneously by
+      limiting number of supportable audio rates.
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.33.1

