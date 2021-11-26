Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A907D45F1DB
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 17:27:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E0351AB1;
	Fri, 26 Nov 2021 17:26:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E0351AB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637944050;
	bh=In3mLWtGDD+dbq28/TAIw2GWqp3plC4mvHCKuvHKlMU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZwJ0EzCXHgeKn3mNjIZ68nKI2DLS9/z7/iEwGArZgS/x3ZaFxZme1NyHsaiCPzzl9
	 XwxCn7HKiby0jqlnrrqyO8oWLJcT4KOW/jQwY2wa3YNFb3xSiz7Dg0fOAcy3bQVRIN
	 kmK6L7Qm63QauV5PE7wlDjOq0afWfWuINhWoJlnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C659F805AA;
	Fri, 26 Nov 2021 17:20:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97B70F80520; Fri, 26 Nov 2021 17:20:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B440CF80508
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 17:20:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B440CF80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kzlqHTAd"
Received: by mail-lj1-x22b.google.com with SMTP id k2so19766379lji.4
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 08:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FxP5tB2iw5BzQOiwdyEyNre1QfPs8oOiaNDQeHGYp/A=;
 b=kzlqHTAdAhqx9uMFzd+CS4o7MQx3tt2NukcjKGssEu7kZMdW6fHarWUCrdqGzEAwPl
 fpuAPJ+zod57zNo+qtkm16mdGqs0Lh7iJJmFsIz6PMJ8AdXsA79F7/qVESlXK84AuKM1
 jATo9QykkskeMCYiqB+uKO0bxgT5WZL1Ni6iXRzMNQG1pph0oy763E1aOMuKM2wmLvQ5
 8ktA43IdTnoWWp/YlUGc4H9Jx+6+if72dzmi747LiVxyMPDfwsw+Wwj37c/TWmviZiFy
 1r77P+bQkb8YTtwu0AV9LbDAZQpvvyPyHhjYNAgOY211JJBMx6WUp/3/uGtrlDrdpbf5
 8t8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FxP5tB2iw5BzQOiwdyEyNre1QfPs8oOiaNDQeHGYp/A=;
 b=Qmovi9SdOXYX/vtQGF8a9VLzjdJ3vPOqsTfsQHfz1yA9cZzgUKPc4o/HiF5ZaSumtX
 kxIZnG4+KYFI9M4yqjM+RJ10zRTH7Hd0Ofl13lhpshM4zKZzZWsaQeWY3WSuQfPM3j+z
 xvljdyuSMhdusyw2zL1x3BhrluRH5dKdmkt/ISkpBavLODQhJ+LhTW2qvE/CH5FIHdoV
 uORdMl87TxrWTNWLJb6kyXBP0tAxlWu60SlrvN3VZ4WOwdDOVgDLlkhM4ZIzmdTCg6o1
 GNaygMUzDx4aUufDV2sF6S862x9EZMAZIwMY5c3CspKnaENdH4an+5+4ZDwLl93L4Ye/
 gXsg==
X-Gm-Message-State: AOAM530Y5fanXllTbIKR1aiqxPjPHpnhfQOr3puumHOs5Yh+r/A6cDpF
 e25CGH5BlwrQJvTXMdZmuoM=
X-Google-Smtp-Source: ABdhPJzxsTtZB9drLrB4WxixNDRQ7Fx6NNECUmkUX+4V5l25QUsz4gPwn3zgWqi6R9W+ucTu1kGc3w==
X-Received: by 2002:a2e:8991:: with SMTP id c17mr30947654lji.361.1637943599494; 
 Fri, 26 Nov 2021 08:19:59 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:58 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 19/20] ARM: tegra: acer-a500: Enable S/PDIF and HDMI audio
Date: Fri, 26 Nov 2021 19:18:06 +0300
Message-Id: <20211126161807.15776-20-digetx@gmail.com>
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

Enable S/PDIF controller to enable HDMI audio support on Acer A500.
Use nvidia,fixed-parent-rate property that prevents audio rate conflict
between S/PDIF and I2S.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index db388ddd062f..f47b946627c3 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -376,8 +376,16 @@ pta {
 		};
 	};
 
+	tegra_spdif: spdif@70002400 {
+		status = "okay";
+
+		nvidia,fixed-parent-rate;
+	};
+
 	tegra_i2s1: i2s@70002800 {
 		status = "okay";
+
+		nvidia,fixed-parent-rate;
 	};
 
 	uartb: serial@70006040 {
-- 
2.33.1

