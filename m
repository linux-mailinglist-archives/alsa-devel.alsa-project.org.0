Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2F927A2E0
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Sep 2020 21:41:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E26821B09;
	Sun, 27 Sep 2020 21:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E26821B09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601235668;
	bh=AXOHei2Mu6ayb6Fmra9I8TA1n6yKChVv2ArqTdKSHL0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vgI6EPTqin6MMfeH9Fle6310VYTnHPWkH3HxaKNT1617/B/o2Pdza99ChB8VF80ga
	 1PMfAWJ47Ri3RUZfZPZdMBRZpmRCGdTIrgiiFqIwscHnJMYQ3j98eBxc6a8C/EczwM
	 NMPVIO7VwqXJr1vYrZ041FBbJGC0H3cyRgQLvP6w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 198C1F8022B;
	Sun, 27 Sep 2020 21:30:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56CC3F80306; Sun, 27 Sep 2020 21:29:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B74B5F8022D
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 21:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B74B5F8022D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="d7tabAeE"
Received: by mail-wr1-x442.google.com with SMTP id k10so6419763wru.6
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 12:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KmIaDgGE58XyP65chgC3iPI5GCq1dVupIq3PDHXzLnk=;
 b=d7tabAeEQcbWpIcf8bNpbfx+YiUYroDJG3Mpuft5m+pZXAm53fT4rIrfX5RyaH/+0U
 fES9PX0yez+Y0BwKocC8M+j0DG/b1hBw85XPyTKT0bEWevWR4ZlUYxDM2BBezH43ftds
 kKSBWrB98qLZ9gPhzqiVQNvMgzG7xh4iVLOhnEDc04VYwcaDHFbPTi/eEeiXGK/Y//qy
 VtcgkElSkGfTaUnnvkjUOffMfx3MXOkrSTLR9NYMkts5u3imN80VjOGI+1MQML867Eb7
 H7aWNftVjvgH2gYS08pOfCSswsm9PXcBk/P5cK/BS9ARUuXBvq6U3ltRDTWJQBkCHVO2
 o+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KmIaDgGE58XyP65chgC3iPI5GCq1dVupIq3PDHXzLnk=;
 b=M3M7+fdrcx9EcWv2Rf0xPCVK7OvToQi5G9UP0KIPVaTR//z7YuEkOvh+rospRQQ/h4
 Cy2Rv6neF5O9w1qh4ssehV3aza1N+rX1iWNwnHm/fkMGSEvTj9gMqQYpC6+ZWhKMWp9g
 qmve5ZVLCD8X5m4nYR+4UEs+RZqhmt1KAsmqDOQvuQHMNg0eXyD8J0qXWsfInkqZq/4f
 tbY8lPH4shUbEeSFaBjsdjLlZTDBsdbr7nZw/5C15f55vJOj0T4Fy+LkiilzCgWHOYFT
 hZJkuw0jx6w5E5rZCCBbZlMKfOUOByVCg4XQ/b9YmbJ3QhLZaUr7pplpxgZMiiutiekm
 yQ9w==
X-Gm-Message-State: AOAM532c04M28c7q4SeR2I/OkiiYmhSiYnMwz1Uhe6ytMN+t0eT/rlOk
 W/OXdDToCxvL89ww4E8O4lo=
X-Google-Smtp-Source: ABdhPJwljJVskiQ1Pj0MaM/KEgYjDiPvS3aD+BnOt1B+mZDbPaEY644Sj7saJphk6yqLypNH4WrKhQ==
X-Received: by 2002:adf:fe08:: with SMTP id n8mr14997891wrr.159.1601234979015; 
 Sun, 27 Sep 2020 12:29:39 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id n21sm6149609wmi.21.2020.09.27.12.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 12:29:38 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v5 19/20] arm64: defconfig: Enable Allwinner i2s driver
Date: Sun, 27 Sep 2020 21:29:11 +0200
Message-Id: <20200927192912.46323-20-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200927192912.46323-1-peron.clem@gmail.com>
References: <20200927192912.46323-1-peron.clem@gmail.com>
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

