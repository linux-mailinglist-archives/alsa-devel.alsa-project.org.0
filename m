Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 033DF4685BF
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 15:45:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8491D25E8;
	Sat,  4 Dec 2021 15:45:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8491D25E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638629157;
	bh=In3mLWtGDD+dbq28/TAIw2GWqp3plC4mvHCKuvHKlMU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=adnd6Tn7k2N8sMo7w/gnJ0aK6M6FWonXP+RYx+BlqO6nBl3m1NQU2KStaKxFzE5my
	 Hab/rsIrgKDNw5K6ZcF3AfVKrHcalU968LMi+SUOYkfpGWXHveUsL0zIXg/2WvXsqe
	 B8aIwf14CmPGlSYiZr/cFIONQ+NbjjoHfggrQ1no=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59DFFF805AB;
	Sat,  4 Dec 2021 15:38:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDEBEF8054A; Sat,  4 Dec 2021 15:38:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0A1AF8051E
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 15:37:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0A1AF8051E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UacBb1E5"
Received: by mail-lf1-x12f.google.com with SMTP id b1so13693673lfs.13
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 06:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FxP5tB2iw5BzQOiwdyEyNre1QfPs8oOiaNDQeHGYp/A=;
 b=UacBb1E5+o5jnYkAbQY/LstAz1dq1wXZlTJ9nXprj0kabeLY0GpeOaoFNI4Ko8bUbb
 I5ijch3w9RajEmDpe38OcdNA0pc89lro9SOPsUnu6kOfQdryIogs1wXkcezKIKRv0lOZ
 n9B7Db5+P+S1m6YptZd1BtdlzEStuOg1aODg0eJRFMTD+zngUlO+EorP9Cj3ohgQUwFi
 6VynchlLIfLkAnoLp+6lh6hwIesEVooX5rBWaNF80T+ryJVaSR7nHVtrnCVcIT9FieEF
 kSmj1ghUOiST/oEcvCBL2XqCkiq89IFYWBapaXu+ZUvPdjsx3vuD/jFZv/VUaHADS77x
 JOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FxP5tB2iw5BzQOiwdyEyNre1QfPs8oOiaNDQeHGYp/A=;
 b=D5aXdSwHwxkDb9yhf1k0iOh3NQ9Ihb7Xb0NJFtl6v08XQENiu8BFQjoEBbxbHrb6YS
 qpcbUIS7ZbB02Nbx5FRDmQBX8xs0eJFlnTuN2qZhwDD4FIKpEkR6ZLb7Hc6p14lhs6l0
 +lcNIBBDieUAFK+hzkorx+2hbev/IODXqRYQy1lbgSDC2CHnmjCRd2zSk3Sbx0ijubzt
 wbkAeH92zz1gBZ11h/ea+IA8a52HT/2ysQApgdiAdy1gPb0KmnKEdPl7nEFDxpxxiG/+
 /+79TweJUy7eJqhd7f8qqRY0tNMn71wqn8qz8PjKla4UmYgMkGlD7oiSHTsCIhECtMM2
 v+4Q==
X-Gm-Message-State: AOAM533msEjM5muvRpzBPFVkpXBj7D88bfDkyIBCkidUunZFAWcq9P6T
 y2E/ZRAzlIvvKNyGvvqfpi/hJuyKbFQ=
X-Google-Smtp-Source: ABdhPJwNw7tkzPZmngP9ATpz6Aqmnw4XwSr8wqcSLqr4AoEI0Q+9EtWOQ5FopwgNaf1mdEz7Fn1MUA==
X-Received: by 2002:a05:6512:b8f:: with SMTP id
 b15mr24260516lfv.443.1638628668340; 
 Sat, 04 Dec 2021 06:37:48 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:48 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 21/22] ARM: tegra: acer-a500: Enable S/PDIF and HDMI audio
Date: Sat,  4 Dec 2021 17:37:24 +0300
Message-Id: <20211204143725.31646-22-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
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

