Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5582C4685B9
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 15:44:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D87332539;
	Sat,  4 Dec 2021 15:43:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D87332539
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638629041;
	bh=F/TcpBb46EwAcwdC7OJY0wG1teOmVGW+DZQ2tTRLynA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k5xZ5n9VrxgKFIpG0RaC8axlKLOeDqXpaM+HwuF3Uwqh5M+8fSdXjdqd8Da/7KRzb
	 tBSpye1EXJlRN7eu/Irc6FvkL20UR8G4y1TsAiAztrF6TwCH0vIuH2JHosI8uzAPzX
	 dJY84uf9CnUR3KAXY9HQE/k2Sl1LzHXV8AJ+Sr3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42810F80564;
	Sat,  4 Dec 2021 15:38:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C154F80529; Sat,  4 Dec 2021 15:37:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B44F1F804FB
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 15:37:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B44F1F804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="L03nVmUk"
Received: by mail-lf1-x12c.google.com with SMTP id bi37so13836646lfb.5
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 06:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EtOyhR+C1wJvZU8wiedXGMGVSqNvvqifEMJLMiQgAVc=;
 b=L03nVmUkPndyUU9tH/MALMgelYXGq/p3zt1TwG85FzYAseUNRDA3Wt++ILbpd77ILA
 4h/eaUBsM7RuKPKX9HRitoYOaG972G3Tj0QD2x5GrL29nvVfiWDYaTbtjc6wPKEBt5OZ
 bs2vBX9my84twKztxReOEw9wZGY2Q0Wdl+DEtX3IrPr0S1+OuH84nzq6RCzVPfM2s9H4
 ImfwLYJ5UgbqMWS182Xz8bbwmTpCQqfQOFgEMnMm4tgMJQixPDHPkUsOgqTgLSrsumHs
 uIF/MuN0yVQ9trti88zo6x1k+eHN3ASLkkZXAlpdAbUhKhED2EZ49hlAQTbnJmuzMB5x
 b0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EtOyhR+C1wJvZU8wiedXGMGVSqNvvqifEMJLMiQgAVc=;
 b=b5E7uDpXFP5o6W0mpCtWZJkqGukZJwn4nGCN0j6VSGwnx0utYuwetzveioab6QHlx3
 na0T7norEJdhE7Uk8WnM455NqD93KitsdwJjrAvRuDsfdmLRlCUNqcwqojdNyQb0tJOv
 Jxc+LXBsVpfDNCNQO5UlLxFdMJdLnV4168HwQcr1l7H7XIqVZRglIG/yqY4MlMjVGjXg
 WuhOW7WBQEOWjtNG80lV4U+RAR9gBQu4UCq+ObxwIcyz12ESOysC7Xmmd8kRE8PP7ICM
 iJQdgZ5CPv72swgzuNMj4HBBTLsvq/f4Wxxe96D9r3X0ohjMl+cnhXVldxg54Fw58Ygq
 UC0Q==
X-Gm-Message-State: AOAM532u8L/cqGrwIOnbRtHC6TOsPVQJrT0m/SjAz7hhOCzldbjWe292
 CweXnkfAr5VYfBdCwhSi20E=
X-Google-Smtp-Source: ABdhPJy3QZudcRw4+yAZsC2/f4x/IcXmNDw0MftkOoWSdyIFIT0Dxo2x+Q+GsNwZwzdapu8R11Xzpw==
X-Received: by 2002:a05:6512:b8e:: with SMTP id
 b14mr24281414lfv.654.1638628664460; 
 Sat, 04 Dec 2021 06:37:44 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:44 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 16/22] ARM: tegra_defconfig: Enable S/PDIF driver
Date: Sat,  4 Dec 2021 17:37:19 +0300
Message-Id: <20211204143725.31646-17-digetx@gmail.com>
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

Enable Tegra20 S/PDIF driver. It's a part of HDMI audio subsystem on
Tegra.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/tegra_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 736a0d25900b..f8b40cfdfb3e 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -239,6 +239,7 @@ CONFIG_SND_HDA_CODEC_HDMI=y
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_TEGRA=y
 CONFIG_SND_SOC_TEGRA20_I2S=y
+CONFIG_SND_SOC_TEGRA20_SPDIF=y
 CONFIG_SND_SOC_TEGRA30_I2S=y
 CONFIG_SND_SOC_TEGRA_RT5640=y
 CONFIG_SND_SOC_TEGRA_WM8753=y
-- 
2.33.1

