Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 510C245CFE4
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:13:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCFC21849;
	Wed, 24 Nov 2021 23:12:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCFC21849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637791992;
	bh=In3mLWtGDD+dbq28/TAIw2GWqp3plC4mvHCKuvHKlMU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BGdC8Pg6g0nmFlFJsxwcucsPTTjFkjYm11WcCQ1CPYR5R2sjNvpxrPQAVDOMpuhyh
	 V6aBTYBiV8/Cm0CryoXC2msaHWiIUypU3izMWtlt6CCDfLSPVScL4am0vd/IlPeyRY
	 lB6GOe+jopXkpyTRVMYxxb7vX5jgrr617LDcq7yo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EF87F80566;
	Wed, 24 Nov 2021 23:07:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DE39F8053D; Wed, 24 Nov 2021 23:07:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AB78F80506
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:06:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AB78F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HOHh27+H"
Received: by mail-lf1-x131.google.com with SMTP id b40so10917464lfv.10
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FxP5tB2iw5BzQOiwdyEyNre1QfPs8oOiaNDQeHGYp/A=;
 b=HOHh27+H2jtaXVi+1wHU1itSTfNFFWN+qdR8CcjckuXtJWHLt/NplZ5GAdnAH7BJId
 fI+Dwhmyo81WnvPtsdfSqGNOJOfmy8o72YdcMFkQCqSxcf7Q2aAm7QGGUwpAD9cds28x
 uv6I4YN5rtQFr/VApnqDY14AwJ408it87uIMgAAnRjX1E2NZV28I+kc7aI39PKKJQ+eh
 GdXXJ26g31PW5sOwYPAviPnJe6TLKhty6Snep3IldzHGKeUHSb3qo4OwEqnaF9HRseVP
 PtFb22WftdH13Yst/Ud3U+ojlNVvQtcHyVp4KS6jrE32NZl5AfVFUSwkIp5d0HGVbolW
 yFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FxP5tB2iw5BzQOiwdyEyNre1QfPs8oOiaNDQeHGYp/A=;
 b=OfODDaiJS2Tw9lK+1pdoAwE4Mm5u5qste6cIzhIJ2eE4fOX7zfOIRlespAZKC2SzGm
 GJiZvAj4mljYC0TTJCTEkjmvjiO3fICddJAzuRa8re1HedIZlLwUq028XvZ2PF7+LtSb
 QFfOPNxsP0BrVMuqjlWuY4dC9ZREOheU8zoYTwsQzUvqrRBJF722ITCT1vOylRydnR5a
 vr1O3n4AAYVomXYECXejUmvApX15pHgow/tmkRbD4ujVxtkEBty3014VLiL99cLcGHqa
 QA2b3xsXjYIii5Ie6KTzQCQbErB0972UD3w+PsPJVVkPj9yvp4iIADAcl2R25wFEsI9U
 z7zQ==
X-Gm-Message-State: AOAM530tqzsvwZOhutJPNrWaU6PrRxFhkhRGg8jNFouIbEnLh6ei3tTo
 Sm9ARW3e8AoxkoM4wMDr+ZM=
X-Google-Smtp-Source: ABdhPJzmz2JI+oXafYYQHLzUOXd2AKTrSiYF3p2dJHvQqPMl1kXR7yDugyNVJd0nfhS7swYv1UQ6kw==
X-Received: by 2002:a19:dc51:: with SMTP id f17mr19510257lfj.555.1637791606149; 
 Wed, 24 Nov 2021 14:06:46 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:06:45 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 19/20] ARM: tegra: acer-a500: Enable S/PDIF and HDMI audio
Date: Thu, 25 Nov 2021 01:00:56 +0300
Message-Id: <20211124220057.15763-20-digetx@gmail.com>
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

