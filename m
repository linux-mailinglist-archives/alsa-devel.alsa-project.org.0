Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8359B45CFE6
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:13:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22F271848;
	Wed, 24 Nov 2021 23:13:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22F271848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637792038;
	bh=XuA56N4mylb5psuq/ixrXJz4DcnFsm/izIrnhfR7AeQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RSxP9AHZnUPAoPx90ymq5mgWxwmL2sFglqMl9UYjoVpqf+pqMw1a+3vQ6k3F8uiQZ
	 SUKTy2P1XE09Nxmi6C68MirNKi6IXAIm5DY4w9EFeIanQhISjP3BXd8DWdTXH0Y1x/
	 nobZOXAfTICCWpipEZtp+IKieey58pCT7nrOOCXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C8FAF80589;
	Wed, 24 Nov 2021 23:07:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B130F80548; Wed, 24 Nov 2021 23:07:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE98AF8050F
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:06:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE98AF8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RLjzrUjM"
Received: by mail-lf1-x12b.google.com with SMTP id b1so10874728lfs.13
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hEN8lxqzB5PkjPszcdUxNpJc6epYJF7n5YUfahDhZts=;
 b=RLjzrUjM8S5jsmnXNKx086PozjojEBgI97mJK6oNkLYNvq5zuxlJFBR2ySrncrjDNl
 4fxT/3GbaHGiMRVauMHpM4xrS7BHKf335Xrt6kY3wHT9kXIsGvQC/dRY10guNJZDSYIe
 Sx9KJEqojbSiq7Aj2iwRmWtyZV6F4eVf8Cm6grpDZxrA6qVSDkhC8sWYz9hSKYVHX+Xd
 lknPSpO3sBMUZ+hGRcHV2ACFC43qjFCQGgx5Ov68+pHr8LRe6wkpriZ8zKdZZjmOk4nh
 5Zo37iV313OGLMG6DhkuZ6Yw1YPkSKKs05Tqr2seqt6jFoPf0QXLZnfFAfuitDlvsrhE
 B9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hEN8lxqzB5PkjPszcdUxNpJc6epYJF7n5YUfahDhZts=;
 b=ObZlzjoGSzXhs6f7jJoOrEmRTVtNjlYBqChqRvIdY7ssxTlekABHZ5EEbi9jJjWNZ6
 CBZ8/VW88zMBRJVSFTi2PZLqZqKZOFhA7WaWmVpYqcBZZ5Sf29z5OiLPpnASRClIyrzD
 lFfVcD62zEntNfIJY2EvsmJAbW6ycDd3Yr9QBfXkKi86ckRXrBVWi2UvQD6toUyBc3nA
 EfuykSaHgeyAdZnXtmIqQkH6keSNfqwi+9szK7ywGEIn+5A42L7c+UGSMEboIEMX40yy
 Q2+buATmDiEU1LX1Q9HIggg92EgxC5BjyxaaVZGmKHOodbeeePMpbd8Ah4XW5C9tKWqw
 k5gw==
X-Gm-Message-State: AOAM530TnQIPmWcbTvlvMPLfFm3dsV2zrnnKOrMeeZ299RKWJa1TyUx0
 1CLWP1CBrQB5qd0YZGBvBOs=
X-Google-Smtp-Source: ABdhPJyIUhRHjHnojCL+ENORXllGnFFyQb8ITUY4N//P9DJOrpX//870vLxvAdYWiBUcVX7wb14qhQ==
X-Received: by 2002:ac2:4e89:: with SMTP id o9mr18872451lfr.384.1637791606935; 
 Wed, 24 Nov 2021 14:06:46 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:06:46 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 20/20] ARM: tegra: paz00: Enable S/PDIF and HDMI audio
Date: Thu, 25 Nov 2021 01:00:57 +0300
Message-Id: <20211124220057.15763-21-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
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

