Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83742272161
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:40:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 231C61728;
	Mon, 21 Sep 2020 12:40:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 231C61728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600684857;
	bh=AXOHei2Mu6ayb6Fmra9I8TA1n6yKChVv2ArqTdKSHL0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qYx4tkHIHOydyKyMG9b4c093QcYoS7rdoYiSuBpUeWeefWPjwRuZjdr3z4Dt1v2vi
	 oGtGiC2V75lA6ebFJela8UStHxcohd1xyCbkHuyV+9UVbHJ8Z6mVN4U8yuBqqrXFh6
	 djn8heOZx8uRINJAXSfk0popBK1sVlu0ut1xS59Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34A4DF8037F;
	Mon, 21 Sep 2020 12:28:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5AF7F802F8; Mon, 21 Sep 2020 12:28:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2925FF802FD
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:28:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2925FF802FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FMXBOj5h"
Received: by mail-wm1-x341.google.com with SMTP id z9so12040902wmk.1
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 03:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KmIaDgGE58XyP65chgC3iPI5GCq1dVupIq3PDHXzLnk=;
 b=FMXBOj5hKys6EaNWpeo+myfbNl//8YvnBN89BFoEEHUJZlceUP906hxpjtJv5e75w5
 oFW5sBEhNYpIKj8775dDM5YYj7mswOuI+WsmnkqXSRH4hjLRtmEYMujDq1Ge4jy+qz/7
 NLvqF8zfp/aFb23VqoQWG9laqbjpHqhxNQxmiFyYAHUvntfbU4VczKFBB8t55weFtR7T
 Pc2AOrKl7/B/qGR1Tnmf8elBIkynsAyjVj6iUKkXT9F7ThCel4C4qYj8OhF1oTKdjX3L
 NZXp9yA85wHNIITHL7XoTRi4ShYw3DdMZMaIU0W5v8CvrITpByv3t10VleWdDzsc24PW
 H3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KmIaDgGE58XyP65chgC3iPI5GCq1dVupIq3PDHXzLnk=;
 b=LB4Zvk/ydRVWIEddQDJvVb6fzjtRW7SQ2krlldapCB60JAVQUygps4I27H67IIdpxH
 MpDLZU+Aaq9C3AW20mFvEXKmuWd6jBKZtARYVNtsWpQRFTqyvPocdplE0GAt9nBVRIX4
 fzO+DA74m8InClBDwCVbhX3Ne0Y+b4et1j5Jqm9jjTWd98NBe73V04glLm0aeQfhgDGN
 +itVFEcjUbTXaIEY0TVePG/Wtp2D92iC32dLQNYy1XcgvQ2XWrw2lFKG/eVsm8GPD2dl
 CVvDCARMgnBCgzJ/gkBxIDsr+RzhoNLZ4AoOMvV0a3oCaoR2qXtbuwWr44tJyQjCJTS5
 m5Cg==
X-Gm-Message-State: AOAM531/IxCUOIhrmaLAXZ2UrNaZfdn8QLMMGfGyAzWdYkNiXjBto7nf
 3QkstTeWzL8f22i047eLqrQ=
X-Google-Smtp-Source: ABdhPJw1ABUKhhXdwUXKiHV3VKM/RDi97yjnt2ISW/EICG8i5o86SQj2o9UaSjhO3bGot+0lItDZAQ==
X-Received: by 2002:a7b:c1d9:: with SMTP id a25mr30621915wmj.4.1600684081195; 
 Mon, 21 Sep 2020 03:28:01 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id h2sm20713774wrp.69.2020.09.21.03.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 03:28:00 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 21/22] arm64: defconfig: Enable Allwinner i2s driver
Date: Mon, 21 Sep 2020 12:27:30 +0200
Message-Id: <20200921102731.747736-22-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921102731.747736-1-peron.clem@gmail.com>
References: <20200921102731.747736-1-peron.clem@gmail.com>
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

