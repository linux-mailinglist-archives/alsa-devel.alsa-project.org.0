Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0DA25CB52
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:40:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE8DB1728;
	Thu,  3 Sep 2020 22:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE8DB1728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599165641;
	bh=vyTcdY3VF/rxQ5ORthPlvZQrjnmGeE5460vP0xUmqj4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cFFdD5NUKU6DnVHcE52/tqWcYhY7SVTGh8DGqdwLq9WFFFTw9Q/a55Vl3kUZGlqEt
	 S8tvTSFFD/0RKMGa+uBNey39ZUNU2sUk0VZlRebf6tHvs6J63fgNjSolDo3jHVY+N9
	 EbmLknQ0YnamDAmiTI4Mwu+xhMYV/KBYqiD8W4/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB0F7F80360;
	Thu,  3 Sep 2020 22:31:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFBDAF80360; Thu,  3 Sep 2020 22:31:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB8F4F80328
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:31:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB8F4F80328
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pzyYq+Ka"
Received: by mail-wm1-x342.google.com with SMTP id q9so4120464wmj.2
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 13:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5IYak11rFzawAh9fCR1gi4F4Oa4pOW/pvtZIichIlV0=;
 b=pzyYq+KaGPIgvObH/Te0U/33+5xx6ZAbGyUsLa4mRSRnyCwSM5AgxcMgDzPU24Zx9y
 /Gw2/qKtPZ/e7vTKokOQp3ZwJktnHuv8qXYTxUiYITgYXx08sH98htb1pfcUDvpHzdE2
 /LMyPtBHF+mEvb5guDq/66ZQKnSfkDQoQmc+WBEQFUhVjqPjZVlzz+qwPwV9V/OieUeU
 p3G8wDB61e8aeG7pz796+n2EhYn129DBPnSFvFfVZZcndskHBZtq8OsJtUKAmcLQ8lW4
 uyuLG1XRVSva3V3cS/MD07LkvHwzLM93EPdK3M++fjzk53+nw3d2jZskQd36mWx1xw4w
 VQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5IYak11rFzawAh9fCR1gi4F4Oa4pOW/pvtZIichIlV0=;
 b=B/3Y7voRT0yCPTYF0Vy+oR2SZQQ/v0YZwC+nKsDeP0feCEhyEHgf9BELQcnF8yWb9A
 mnWO6qaFQcw1dHmUtJ3P7WS7Gawhl3eLM1UAQg54MWEDa9VQSglsYBw747rEZjDyzSVR
 TS1w/vNiIauhZuDrEiG3T2Dk0MWAUaydqiZY/+JuRTYhiedWtnbZWCHofdSedrmkbe/B
 r5yP5GEZ0G62Jsew4fxTQRxL4VieE5nhBJF9rNcYlt8wGSN4pXVMkr10RWxZM1BajNvp
 MKX7JKw45nqGqbn33g6W8Ztuvb0ScD7lwIoDjNZp+DUMzRTMUcu5BK0wnndVDZyh+Dai
 vacQ==
X-Gm-Message-State: AOAM533F5nyAhxmkrQxL2fPrg8Ce1JiAqs9c1wYffKi5l3siXiRAp54D
 rxhwNFmOg25CN19jT/Z2iEU=
X-Google-Smtp-Source: ABdhPJxmuEEdH4QpFHEEFgjUw40D/E8UZi7btVLBAArqpLdAt3NR8lscjeIE7Qodwx7RuSbye8eVFA==
X-Received: by 2002:a05:600c:414e:: with SMTP id
 h14mr4116090wmm.2.1599165067180; 
 Thu, 03 Sep 2020 13:31:07 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id q186sm6818274wma.45.2020.09.03.13.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 13:31:06 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 20/20] arm64: defconfig: Enable Allwinner i2s driver
Date: Thu,  3 Sep 2020 22:30:34 +0200
Message-Id: <20200903203034.1057334-21-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200903203034.1057334-1-peron.clem@gmail.com>
References: <20200903203034.1057334-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
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
index 5828b42f5243..4eaac49dccbb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -691,6 +691,7 @@ CONFIG_SND_SOC_ROCKCHIP_RT5645=m
 CONFIG_SND_SOC_RK3399_GRU_SOUND=m
 CONFIG_SND_SOC_SAMSUNG=y
 CONFIG_SND_SOC_RCAR=m
+CONFIG_SND_SUN4I_I2S=m
 CONFIG_SND_SUN4I_SPDIF=m
 CONFIG_SND_SOC_AK4613=m
 CONFIG_SND_SOC_ES7134=m
-- 
2.25.1

