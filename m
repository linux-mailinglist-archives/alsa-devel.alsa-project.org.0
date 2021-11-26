Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A2345F1E0
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 17:28:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F7741ADA;
	Fri, 26 Nov 2021 17:27:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F7741ADA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637944092;
	bh=XuA56N4mylb5psuq/ixrXJz4DcnFsm/izIrnhfR7AeQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pAa6yIXAGDdublgkFlk2aAwpX07Vvxk3REGsx41L+kDr7i+L8bhQpKlaEUGzsDSkg
	 envqfVwiEcC/hnxR4Cze/nZnLkRZ5RjlFElsEjz6uLDI8fDvLBm8qGB2hmvvOY2HaE
	 Ef9tmb9GUgaLpkXwkdh26KX0TF7bao2m9UuPbA/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C421F805B2;
	Fri, 26 Nov 2021 17:20:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 423C9F80552; Fri, 26 Nov 2021 17:20:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF285F80508
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 17:20:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF285F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oTcerw3j"
Received: by mail-lj1-x232.google.com with SMTP id l7so19725683lja.2
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 08:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hEN8lxqzB5PkjPszcdUxNpJc6epYJF7n5YUfahDhZts=;
 b=oTcerw3jboBSgaI5lBASiQ0+yvoxajfozbWkKUsSmofKDE934IXHDdxNhB8W9inQH8
 Deth1OvQaNwgcuyT1EYOl7z37XeRTOtofk3rfAARsYrFqOpJrZaMP2yWgRj3wWz8rhOS
 c9Dce6wjkImXLFLe+QdB7nP22gzehsMpGLBEEMDo0XSy8AW6kq9BhVWDy3FC77Jlsbrv
 NXnqGvMr1srJooL0mlDZs8j2QAzGmCQDiJde7E6dgpDRF550dE9c1UQxnnqLqUJtU5t6
 jyg7JecYzESPBU3YZ5QeRjpyQX3JKtntQB7xj3ORrmWmqbKeewF4FQ6LCWyGzgfuLizK
 K0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hEN8lxqzB5PkjPszcdUxNpJc6epYJF7n5YUfahDhZts=;
 b=3ORF+zzYgEo5oMmyBRTl+Wx4cAD5pGYQZMyIUQaxiI+L8TEh4XVHIuhD+m1Wm12m5q
 pX6ogCw1WNBxMtXaiPKvmuN5q/G2Ln+CCShP1CWjRq0mYj1kC5IVAR4mbTs+zTk5FnWn
 r+WUpbiDDGNeTpaRt/pdsAi03Tmzt/+GmfacvMiGvkipb5Hi1pHeel7d2wUp9VrxMzzH
 RZefL7C5BHdhBmXp5yEFPHfjStuEdO3pWwRIo9D7wXfdgCcBX2X/q3btFW8UiatVarvj
 uHDKtWw9IRes+Pt6dtQVTbrXfc888p/w8eXNk1YPTDy1yeDAxY7f+hUquOrl8xvvyAQE
 E2jw==
X-Gm-Message-State: AOAM532WdciFaFGK836jb4aAPAoXP1Mzwfa7w66J2lLHagr9LnAjUTLs
 IYy1oqpT8/gRsryN1ioC2vOIMjcbpqY=
X-Google-Smtp-Source: ABdhPJzz5wBDSCE4Eo1QRQj2umu9yNSwj9Kxjmg73qAOgEls3WYa2Hilna7xfBmiFLf2MVj1rIyQ9w==
X-Received: by 2002:a2e:a792:: with SMTP id c18mr32236469ljf.443.1637943601285; 
 Fri, 26 Nov 2021 08:20:01 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:20:00 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 20/20] ARM: tegra: paz00: Enable S/PDIF and HDMI audio
Date: Fri, 26 Nov 2021 19:18:07 +0300
Message-Id: <20211126161807.15776-21-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
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

