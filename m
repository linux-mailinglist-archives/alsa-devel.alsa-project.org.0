Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E1328AA63
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Oct 2020 22:29:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 604CB16A3;
	Sun, 11 Oct 2020 22:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 604CB16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602448192;
	bh=AXOHei2Mu6ayb6Fmra9I8TA1n6yKChVv2ArqTdKSHL0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h48lossBKPFuwbLdVCX8t/xdChq01/yXCn/tgTRycroBCRloGFXGO0HqxV6rRp6c8
	 ngbPjCq1bUYNYtD8mewPQS/TLipoDpeG51VRvs+Ljt6q8iZsMtkqv3CMJl0KLqOFsY
	 cGS8ciaGm1+PniaHX0GClqDauix+3K1WG7EHtwO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21901F80315;
	Sun, 11 Oct 2020 22:23:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C85F3F80303; Sun, 11 Oct 2020 22:23:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05FEBF802E9
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 22:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05FEBF802E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="E1MPRRzY"
Received: by mail-qt1-x843.google.com with SMTP id e6so2321377qtw.10
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 13:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KmIaDgGE58XyP65chgC3iPI5GCq1dVupIq3PDHXzLnk=;
 b=E1MPRRzYIZ0aDki51ehofhrFm0Z1ux7C0kpocp/M+H9BhF/SlNPQ+jvdyfcPL9eLVi
 5j8UE6I0kCIaDZ1ewOz7jYzt4PjZ63iIaik8J12Dsfh+sOlxx4EYCdkN82YfM5D2zy9Q
 W+xgyiYdn/D2X+EVly5WW5zrYT3RT6j5NFQgvjU7cgRcv9ym44zGZowtvgC+nIgOOeH9
 hj+7MW8N0jpHS3148x3RGsq/0/CkxoF6TuhukEXkGW1VfxFgK2BZjFXHvEmfYKSEJWH1
 Pa/KLyV1h5iUbXQT0oGVqh7RlDWoQyU034X3Vvk/QQjwQqUwIceJ3sYvkuAkebF7G5Nt
 3zRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KmIaDgGE58XyP65chgC3iPI5GCq1dVupIq3PDHXzLnk=;
 b=orWEmvT+mYwGLXEpKWWbb2jSsuzo5f4jQ73Ee7oSUakusSScTbWiUjS+yuTCv6HtNu
 KF0SVrtn8sxl9OYkQ/WmeYmCMUfuPEf/NJ7YsDfoh9ZUWxywJhxym3dP0lsm2pKciMcI
 gxNpw9oe20dWcp2CH2XTAoX/LDhcXBPx7qJiI2R+fNhsHc8dAuREhjXcpY6Hvg+M7D1K
 7/DPox6h2K+D2UeR1une76xj65djgP6fuM8WeQaAhSv2NdoOpoQm/AzdNj8hNrXdKdeB
 mL22oH89DHj8jgc5oH4h0MI5G2BA/eE+bOELutPlBj/19LGz+NRRSFCexW/yqJwen8vC
 sEVA==
X-Gm-Message-State: AOAM533td2DL+K4ZXirfLdL8cZAB8ooPDYtaDfEkEEuhBdiiky4cWmsJ
 J6GJNPWtfYVl373dId1fZ38=
X-Google-Smtp-Source: ABdhPJxhdeNH575/RufpVe+3KodyGx2Vfirr3hdmfoXYz448UP5h87uNHm7gqw2mfihQmAbA/mA59g==
X-Received: by 2002:ac8:e8c:: with SMTP id v12mr6980888qti.329.1602447786934; 
 Sun, 11 Oct 2020 13:23:06 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id c72sm2987778qkg.56.2020.10.11.13.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 13:23:06 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v7 12/14] arm64: defconfig: Enable Allwinner i2s driver
Date: Sun, 11 Oct 2020 22:22:22 +0200
Message-Id: <20201011202224.47544-13-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201011202224.47544-1-peron.clem@gmail.com>
References: <20201011202224.47544-1-peron.clem@gmail.com>
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

