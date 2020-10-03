Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5CE2824C3
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Oct 2020 16:27:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FC6D1AD0;
	Sat,  3 Oct 2020 16:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FC6D1AD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601735258;
	bh=AXOHei2Mu6ayb6Fmra9I8TA1n6yKChVv2ArqTdKSHL0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j1tgYYh00GYfmgXj3ZSt+k1saqnYjOyVGQcMeL/CqCXoPhyrPPYGL0jHwfGdf+KF9
	 QEwLsEt/W6kPVHmO8lpwzVcXAtw7JX1j3ypSpZmuvP7t+FtwSq04rEE+2AieQHf+SK
	 OzIyqivliKpMdbsMrxPxlUbOeJOaZ0UsyiEgQqUA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9F73F8033F;
	Sat,  3 Oct 2020 16:20:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0784F80336; Sat,  3 Oct 2020 16:20:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29653F80323
 for <alsa-devel@alsa-project.org>; Sat,  3 Oct 2020 16:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29653F80323
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PkPumPmC"
Received: by mail-wr1-x441.google.com with SMTP id x14so4839865wrl.12
 for <alsa-devel@alsa-project.org>; Sat, 03 Oct 2020 07:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KmIaDgGE58XyP65chgC3iPI5GCq1dVupIq3PDHXzLnk=;
 b=PkPumPmC8UXR7M6JISSOLFp6uHxCWx5Gz8lQ4wAlK8ysxW/T/ZEawbeo874FmiIEwb
 MNURiyCbKxV7avdUuy6FogJ/SULdjfkMLiQwqkGw6QN4EQMEybZzoqbwnZqJGNqKOQrc
 wZGsKrYM6hV570Lj0yaOKTzPu9GKzkrWGpbAaoO3KRpWs+SqjNHUxyw6S115pEvyEiVn
 OoQuIvzdg6O+R1h1P65uuOrUH6bQG5S+PVAC+tuXcKnVzJwhIgyKzxACwI5X9JAwIdzV
 QPJuHqzEPAPT+TXn1vjT+duRavvo6bSRiQhn266y/Hx+Umfo/U4mdkNXNgnCy9CbfNT1
 WCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KmIaDgGE58XyP65chgC3iPI5GCq1dVupIq3PDHXzLnk=;
 b=ejuMo8mgfiWfsmTELo17Ju+XEMqugNn4YYepCHRol5QlbIym/w5Nf3MqTW7hS1a9Vw
 ROrGt/dvE35R8+yJw+kRp5QoN6M4qQwl12i0vfVs5Q7lkNEk/ItZ+StjO5n6Jai2VKFf
 ori+zziiIQkOLZzKoOP44C06AYaZ9AV2VP2Y3CNN361kLE3od6bOXAEHcD4mjnIvay3j
 nB55iOG0R0BLofWvu3KbYotxmaEw5QdZJKzLwOn55L11+4wF8UJT4Ys4H4R67dwa1rVc
 JwNMsPEOVjeFdZuMO+2QyWxrw7cmSt52qjcZRYD8FVu9e2Y7KSUwh77v9ssvnq1dY2zn
 EojQ==
X-Gm-Message-State: AOAM531NE5kekRpajIsH50tMc7SzFcf7H0r1sXdMGvDP7oSfKBOJ8pEz
 gwMBtM22lVRZi9onZ3SiGg0=
X-Google-Smtp-Source: ABdhPJybDm/3+hVrfq2zldYYD/jf+UjasFjPxiRlksPrIbV02wedg3SWd4aDtT+bbjnaSEV0uoStqQ==
X-Received: by 2002:adf:c750:: with SMTP id b16mr2258135wrh.231.1601734820048; 
 Sat, 03 Oct 2020 07:20:20 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id d18sm5417473wrm.10.2020.10.03.07.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 07:20:19 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v6 12/14] arm64: defconfig: Enable Allwinner i2s driver
Date: Sat,  3 Oct 2020 16:19:48 +0200
Message-Id: <20201003141950.455829-13-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201003141950.455829-1-peron.clem@gmail.com>
References: <20201003141950.455829-1-peron.clem@gmail.com>
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

