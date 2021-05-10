Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74099377F30
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 11:15:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCD9F16BD;
	Mon, 10 May 2021 11:14:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCD9F16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620638141;
	bh=A2CW6XOdu3DKukWUp1yDkvMfFccisiBwZj/AHTy8GdE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lCbqZj+pWPs8LlUmOHayaxIWqSOxPEU40fLdN278ljeOsxFYz54E9zXw+m9FHF2RL
	 BXDuKbOiF92Hiv8Ph9nEGErRL84Hk589wnvf7RkPAek+PgJesPm8TN4JMlAoZ9UbTG
	 QifSXRF3zrgiMShN5VTQjh4jNMo4UBbHuT+ccWYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D34A4F802E7;
	Mon, 10 May 2021 11:13:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E84FF80272; Mon, 10 May 2021 11:13:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE23DF8020C
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 11:13:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE23DF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rRR6r5eD"
Received: by mail-wr1-x42a.google.com with SMTP id x5so15770110wrv.13
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 02:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2p3Sj2BkzdaMJsqcUQ08/NFSQSUt4nJXy9Ws6vh2r0s=;
 b=rRR6r5eDRXVzXoT/7EFS1eZBDj9JdoW9087XwJukMzISm9THlixZqPCE3SPNshFHaN
 zj54T2zZC2RpdSfunrq/eeHciH3S2ywXCHaNpN8zquP5iuuSpuZ3fb9Gn/glg+1Zp/z3
 rksTUZZHDaxQAZcKSQEl1WXKNLCDvS1KQ/S5R8798gLFVkv6UK4ymJuDvDZmdVJPo4rC
 zRZ6oOMhcgIT+HcKs4JosSdwweoLmu8i2tcXa8bRN6e+4iuydFQHoTvtSQ+FMXx75ceV
 vx6ryye1O1TgspURIwR/H3V8/IwYmCfMcHgTzPfTq3vv4hPY161+tL3MI/yE4VR2aoo4
 5OQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2p3Sj2BkzdaMJsqcUQ08/NFSQSUt4nJXy9Ws6vh2r0s=;
 b=kZxTiQupfyiaZiiTYtlus0jyHd3X1NcQc21tqfNk36fGAtFe5zIxF1NFrNRp6V4r87
 l0BdYQuNXQwYDl/hEea0AxEVyucGXYBtvDzUbXVvCfKRkuNVhQcwkGTBsD6ey8inC2O0
 x8VQ0PShxJJdTVnpTHKJ1wc+PRhcgSmyRawYL6abyt7NRrth8Pl3JZWbmQAUxgbVJTWB
 XOHwGkts/APuv7vUzfDgqbrTWqND6IzPb0a4RYmLU/cxav38ybFSEnWnGhC3Qx1yy+KW
 t52skde9kv7rZAnRe6WPXRfjtowW4N3ibSi+a1iHYXPsb9AwR2smfJGJkoN/d2+iuRgA
 Yvug==
X-Gm-Message-State: AOAM531tF8pefIeXx44raMYJ3dyg0Sa7TWG6/QMriJxLK19BRT2yr84X
 l4JSXcbeKlI7Lo21ewYm0tMkxg==
X-Google-Smtp-Source: ABdhPJzH2NzW12N3YI4X71yzlA6PknqwfMKM+/0EaS90DHOLFGGhWehylx6FHOVwRzknimcRhZJGUA==
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr28965063wrz.256.1620637991115; 
 Mon, 10 May 2021 02:13:11 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id s5sm19040575wmh.37.2021.05.10.02.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 02:13:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 2/2] mfd: wcd934x: add additional interrupts required for MBHC
 support
Date: Mon, 10 May 2021 10:12:39 +0100
Message-Id: <20210510091239.2442-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210510091239.2442-1-srinivas.kandagatla@linaro.org>
References: <20210510091239.2442-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

WCD934x supports Multi Button Headset control which enable headset detection
along with headset button detection.

This patch adds interrupts required for MBHC functionality.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/mfd/wcd934x.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
index 53d46fadcf5a..aa19a6a4fdbf 100644
--- a/drivers/mfd/wcd934x.c
+++ b/drivers/mfd/wcd934x.c
@@ -46,6 +46,13 @@ static const struct mfd_cell wcd934x_devices[] = {
 
 static const struct regmap_irq wcd934x_irqs[] = {
 	WCD934X_REGMAP_IRQ_REG(WCD934X_IRQ_SLIMBUS, 0, BIT(0)),
+	WCD934X_REGMAP_IRQ_REG(WCD934X_IRQ_HPH_PA_OCPL_FAULT, 0, BIT(2)),
+	WCD934X_REGMAP_IRQ_REG(WCD934X_IRQ_HPH_PA_OCPR_FAULT, 0, BIT(3)),
+	WCD934X_REGMAP_IRQ_REG(WCD934X_IRQ_MBHC_SW_DET, 1, BIT(0)),
+	WCD934X_REGMAP_IRQ_REG(WCD934X_IRQ_MBHC_ELECT_INS_REM_DET, 1, BIT(1)),
+	WCD934X_REGMAP_IRQ_REG(WCD934X_IRQ_MBHC_BUTTON_PRESS_DET, 1, BIT(2)),
+	WCD934X_REGMAP_IRQ_REG(WCD934X_IRQ_MBHC_BUTTON_RELEASE_DET, 1, BIT(3)),
+	WCD934X_REGMAP_IRQ_REG(WCD934X_IRQ_MBHC_ELECT_INS_REM_LEG_DET, 1, BIT(4)),
 	WCD934X_REGMAP_IRQ_REG(WCD934X_IRQ_SOUNDWIRE, 2, BIT(4)),
 };
 
-- 
2.21.0

