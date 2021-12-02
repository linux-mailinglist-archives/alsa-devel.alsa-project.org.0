Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD2C46686C
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 17:33:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A14629D3;
	Thu,  2 Dec 2021 17:33:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A14629D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638462834;
	bh=XuA56N4mylb5psuq/ixrXJz4DcnFsm/izIrnhfR7AeQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fVlUFJSLbZnlfp4NemTbQGQuFHnjer+4yvBx1j8Y/OH20ArkwtODD40ZNKoOxFSx4
	 Co0j52hj5/xJIFqgEo+hNIGj8I/3olw8kRy6h7iHPqCrZ61xvOELbw32KyVwaPbYls
	 n29qdMy1PPUjdTYqnVQ1J6k5wBYgk84+2pKQoTUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5A58F805C1;
	Thu,  2 Dec 2021 17:26:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 659A2F80518; Thu,  2 Dec 2021 17:25:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 029ADF804FE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 17:25:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 029ADF804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RSdFPmrU"
Received: by mail-lj1-x22c.google.com with SMTP id 13so677479ljj.11
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 08:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hEN8lxqzB5PkjPszcdUxNpJc6epYJF7n5YUfahDhZts=;
 b=RSdFPmrUI402Dc09tnZNn97E4pEduqTRau2Nw1Et+vXSTSItuWqQ1qQgo5J+1BALkT
 pXeYg8IVZsh7XiyOPcIos4OYMocNv/sdZlmzqs+1PMFo80P1PiaMBMTREakOY97rlIj+
 p3xxiIOjPJznHICXuXtAWMYjNAjHr6j6o2B4QEe22j2cFRFAexLVMLKWAkcu68zI7Q1M
 nKy8m9/kVL9Sx9kILwW7DYiglMqhLFai685lmOyY+Dr588tiOYC0mEUmIsj3T5c3yoiC
 MoulSGSizoR0jg4ycDg4rR4xfpG3PxTpZjMFUyuRkb75Y0WvHCyAW8LcTScBOdBn3AmN
 UvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hEN8lxqzB5PkjPszcdUxNpJc6epYJF7n5YUfahDhZts=;
 b=QfEXCI55kT3QiKZJhc8w8OoxYnPxXD9K1Ebxq0O7dQ93eKBPiCzAIk8qsXM6KX3Z9i
 v9QIk89QYB4w/WqySzgbpkCkqW9i9jXoYJKr1Wsi/J8eZfd795ganRl/+mKj5FnoqOSX
 jlZ8hLfdsPcZ1VlVfLdYy3+uyhYe9rA4QrcLHI2ah6bLfstQwy6msm5uBvYG2/+fM9b9
 THy5wNfru+M+fyFuskssNvG44wuWDhx3u9lZbL4LNblXv3NoCbOsaE6Sbh9lxNzJ6xVh
 tOYn6TzpXEbtGpo4h5Fq0CAIjnS0WDSx5M4liJ49ZmCqFkbizCfaLwtdHRR2eQv+Y3Up
 x9mw==
X-Gm-Message-State: AOAM533iEirzipvPmtqb3LptRmCE4xGTV47owbHzNUNbcH7kDOKK9G5m
 H85EvA8Ca86CbH7gfh1YOX0=
X-Google-Smtp-Source: ABdhPJwb+aZCkvsM06cfVFDqv3SaV4prBR7wmD5aUJuI1klW3QBgZtBrKJ0ooP/0EW5plBrMNXKWsg==
X-Received: by 2002:a2e:7c16:: with SMTP id x22mr12905096ljc.460.1638462334456; 
 Thu, 02 Dec 2021 08:25:34 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:34 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 20/20] ARM: tegra: paz00: Enable S/PDIF and HDMI audio
Date: Thu,  2 Dec 2021 19:23:41 +0300
Message-Id: <20211202162341.1791-21-digetx@gmail.com>
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

Enable S/PDIF controller to enable HDMI audio support on Toshiba AC100.
Use nvidia,fixed-parent-rate property that prevents audio rate conflict
between S/PDIF and I2S.

Tested-by: Agneli <poczt@protonmail.ch>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-paz00.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 5b2260f61f05..921a811632a1 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -264,8 +264,16 @@ conf_ld17_0 {
 		};
 	};
 
+	spdif@70002400 {
+		status = "okay";
+
+		nvidia,fixed-parent-rate;
+	};
+
 	i2s@70002800 {
 		status = "okay";
+
+		nvidia,fixed-parent-rate;
 	};
 
 	serial@70006000 {
-- 
2.33.1

