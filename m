Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D53C9271705
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 20:18:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74F6F1664;
	Sun, 20 Sep 2020 20:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74F6F1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600625938;
	bh=AXOHei2Mu6ayb6Fmra9I8TA1n6yKChVv2ArqTdKSHL0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hqIfprLn/uVHREejgFm+18aCbP4mkzw2yLH0o2a/8N/vCASAz3GZl9YC7jZXTNPd0
	 OqsTGvIMd6lByPRzDu01K1Ng0I+xwSMypcjsW0gMuwYL/3cK8hWn1JJwqmxmrs4EU9
	 u2j0nnAXxQWQTyM36/vSmXVNA9ETwmv8/xkQJb4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61399F80351;
	Sun, 20 Sep 2020 20:08:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE355F80321; Sun, 20 Sep 2020 20:08:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9810DF80303
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 20:08:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9810DF80303
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Kvwn4sNJ"
Received: by mail-wm1-x342.google.com with SMTP id z9so10326763wmk.1
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 11:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KmIaDgGE58XyP65chgC3iPI5GCq1dVupIq3PDHXzLnk=;
 b=Kvwn4sNJQYuWLBfag/klu96kR4p1T1dbYI/SHohvz+RB/nWXh9sO5BS8n+cIC19Qd6
 D5aU4ByOv/tmN00RXPYe3xL5gNikDawJSQ3kTlWIoKqosNhNByOFam6pLtNNxmUM1lJP
 LEk4sQhd+EzOS6Ck8T8/TmBlMj9gRs8J69Hl2/EGOcnrkhwNhUAoH5rrOaYNUq+N+kzp
 f6/DrY56c11ylNeTRgB4gGfD4BEWjZmEK5HBt3chyxza1W1a06oxtEIAXYKsevZAdPuC
 W0aM4hkEDiRR3IxFvj40oV9aE6U2/Mri03ff4zm7ZqNjYN1WPcY8+WxZnHv5u8FnKNYq
 XlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KmIaDgGE58XyP65chgC3iPI5GCq1dVupIq3PDHXzLnk=;
 b=EaCEKBw+LQO+bZzA1KnpEW1AxjU9vg8at42o3+DtdBxGduM/pYiXIglLa0oBTONZcz
 BKdUmjbXlhipWPfdOAIni52Z1ZpBZookGmOdyG6zUMFgBYEHHUZR+Wtdb88A3yKjMbO9
 yP9DwaODfj7Ngwp/5uTg2VR9xKysPo0vFoLV2/z7oTAXYVyIEDxMcf7pn0HJrjbrPaIu
 yL9pvX57i6uPlMH8xbktv4XOdfguiQhN8t8KKRCPCNmSac6IMHuINXPDwjcUdqsLuR39
 gG9Y5NOpmKxjYkqK9gQScymFJXkHNuwkewgbjNmp224TRfywy9pUaOwz+d9305pwUtFB
 l2sg==
X-Gm-Message-State: AOAM532+4YNis3xnNCLrlYAjfEkb5Jtd1PNlQ7AdWJPLyKGcuhzT5hWf
 Yx9TRKeb8D4KWLHQUSjKMfQ=
X-Google-Smtp-Source: ABdhPJwAe2vy7tX/cnWUUnWL7dwVD8OT/VXAinHq8vTpV8XOOkgDupS5Raec4D0ogrKe86Bfena9FA==
X-Received: by 2002:a1c:740c:: with SMTP id p12mr26174993wmc.176.1600625315363; 
 Sun, 20 Sep 2020 11:08:35 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id 18sm15142782wmj.28.2020.09.20.11.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 11:08:34 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 19/19] arm64: defconfig: Enable Allwinner i2s driver
Date: Sun, 20 Sep 2020 20:07:58 +0200
Message-Id: <20200920180758.592217-20-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200920180758.592217-1-peron.clem@gmail.com>
References: <20200920180758.592217-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
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

Enable Allwinner I2S driver for arm64 defconfig.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 63003ec116ee..9a3c3bbe60e4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -696,6 +696,7 @@ CONFIG_SND_SOC_ROCKCHIP_RT5645=m
 CONFIG_SND_SOC_RK3399_GRU_SOUND=m
 CONFIG_SND_SOC_SAMSUNG=y
 CONFIG_SND_SOC_RCAR=m
+CONFIG_SND_SUN4I_I2S=m
 CONFIG_SND_SUN4I_SPDIF=m
 CONFIG_SND_SOC_TEGRA=m
 CONFIG_SND_SOC_TEGRA210_AHUB=m
-- 
2.25.1

