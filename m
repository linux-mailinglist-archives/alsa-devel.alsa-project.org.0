Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA15D4685C4
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 15:46:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 754082645;
	Sat,  4 Dec 2021 15:46:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 754082645
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638629212;
	bh=XuA56N4mylb5psuq/ixrXJz4DcnFsm/izIrnhfR7AeQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IsFeylzlVtCFhGIyZDFH3kLgvssTJoDFnQwgUmkKuURKvc1z1B12ETcgS9ZlwrdFH
	 1BFeORptEcl99rck1UzhTwty/qeW7DD5606odc1mAwoRSIJn45QFsxmOq6Y0GEY/Sb
	 atXmktMdo3rgWLOA5EVcQ9M+Prxl4tXvz/6CMNlw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 750D9F805C6;
	Sat,  4 Dec 2021 15:38:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F109F805A8; Sat,  4 Dec 2021 15:38:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C1ABF80520
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 15:37:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C1ABF80520
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RzfaFRXr"
Received: by mail-lf1-x132.google.com with SMTP id u3so13844112lfl.2
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 06:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hEN8lxqzB5PkjPszcdUxNpJc6epYJF7n5YUfahDhZts=;
 b=RzfaFRXrQ7CuSKPzd5O+0D9Mbq84hRoijgOs6hXD+7GKiG52l/xbQwHLkkUHWt8wo/
 EruzOPP9GeQjoxbrO3uLPWtZkWT1O3F15sjMxxf35CdGZ0vsxrdKYrmGDRYeoaOTO2EZ
 G7HhLN+0R++d1G7lRodBHCzl9BhdQSEl0bVdOpM9tiRtt8LoSIyvlci8SBbOeKXNCGr8
 rGso9XNmd7XdPBAgwbdctGo9CKcY5gi9hMHF4PHnghRk+mNMYnFG98LIwqfg3/Nb+Quz
 ud0jPN/6fTWgNYWOumT/WxHTQ4hxmxT3s2lkhBaPMqajlFTqRbOi7H03sqNM2A+qFWq2
 4Nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hEN8lxqzB5PkjPszcdUxNpJc6epYJF7n5YUfahDhZts=;
 b=gf9SyxwTlwI13Nu6eVxCyc8OL7JY8cAXW4Gk+auC/0Zz0LRDrG/M2bb+w1tB02JL6q
 MJ0Ke3diGi4ogfQ93cHH3jqC7Jvqfx9AmD+m6Tj2cGXG6KkfeDwQvWGWiRHq9/gnURwU
 9jiczD/t22Rl66tZqHYJVaczBPitlXmt2stOJAHiYPsSR1TROzbNoWCQ8sLP30nuORp3
 Gn/jmNSKUR8BMYPlVIHh/CSpkVKKm3T+pWZGHQRiPX91ZyNQdi1yajrIac9HZ2/rTm67
 Ml9nf7HSLTAMA16iL6V9OheforAKITEa5m4hBFAHvArchq5LW2id3eeyYRBoiRaxXhYz
 M5Yg==
X-Gm-Message-State: AOAM531A98NIwKzlN4ZqgBRMkDiE0991qP8ztYrW/Ctpthx/fa+/mDc3
 P40ivyMPshTTRuE84092tSQ=
X-Google-Smtp-Source: ABdhPJwf+GX/2emTs7+L59bwUSAf7ewn6GK+Tt7M5lTMPClzxfZokayjRS6DmCd3RSP5aXksQpYJwA==
X-Received: by 2002:ac2:4c47:: with SMTP id o7mr24822014lfk.558.1638628669123; 
 Sat, 04 Dec 2021 06:37:49 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:48 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 22/22] ARM: tegra: paz00: Enable S/PDIF and HDMI audio
Date: Sat,  4 Dec 2021 17:37:25 +0300
Message-Id: <20211204143725.31646-23-digetx@gmail.com>
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

