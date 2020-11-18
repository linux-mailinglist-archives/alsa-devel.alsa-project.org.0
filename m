Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 209C02B7EC3
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 15:02:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1605717BB;
	Wed, 18 Nov 2020 15:01:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1605717BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605708130;
	bh=VwS8RY4fFY7MjZOxKF5eKRzzYY6QMUGbgoG+BFITGoA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g65DxsxCraryrHm/VJlFWoTdQTLenfCKet3047x2gbVkpuYj4j+gQOPnc6imD2Tvx
	 CbNvQQ1L/TyQFTIDIaJ++ryKmBYiTd4HC7Hrrcg3zQKZ58tm1wiaPeybKkPZzTmiaT
	 osldUYhW0zb9USHSqKYAQ/lpmhUTcqLdba0zm6YE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C87A0F804E6;
	Wed, 18 Nov 2020 14:58:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84F6AF804E3; Wed, 18 Nov 2020 14:58:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D73F0F8016C
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 14:58:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D73F0F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BXefqVtV"
Received: by mail-ej1-x644.google.com with SMTP id s25so2879019ejy.6
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 05:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iGo+ZN3tAXAxv3w8yNYuIIpSkiLbRMRp3Fk34AunwFo=;
 b=BXefqVtVvxsq8fHp6xdGBhXTYpb54Bw6UuyKcLv8wj57fnSkeylXM6zGlGgn05j3t5
 CzwVgEfHCpv0VmHrKnsn1hQiBF3ISHAAalBE0QqtH7vp0P7xvqUHf+nilx9dgsziY0Hi
 8/JZm7HPQb8U/LgOuydzxvPSkgO3JW3ah7TGvTkZOaGIPRVwOvLZAjDdG1BXFFngc7kD
 XEicIVtBW7TGXjlGt3pukgG7sb4njjusZ3EnZ7sLuodsB5CRbtME2+V8URBuIMTGt2y7
 JuCOyFzWX+KVRiWR07bO6j9U2tp3CIK5cJ5tePaWmTr8YfjlY6fWSeLDND0Jod8i+sn6
 m8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iGo+ZN3tAXAxv3w8yNYuIIpSkiLbRMRp3Fk34AunwFo=;
 b=lmcM7fm0AL4pwZIA1kBwmn6fYhnncYCNN586uce0X2Z7bYny73NgLtH5CVqjAY/NZJ
 NM5dIXVh3ZLk0+Jax3zih1MM8vXO5+pLxmHBy6R9SHfK0sswRWvqcGylFHnh9A6Oan0J
 6prozaBoojpgWUM21zAi6EAknbs3NdrEqksEQDKZihCxmpAtHXB1xvpq8edgAqQmv59b
 klzlrIJ/SLg11e3Nzhx8Xe/TUyfbEg14p29Da3PtamHue34NTZ0SaWtQtJ+0/uC7x15Q
 /VPYm8pbJV7X60JPr/P8aafgk9o35sF0sw1DJeteXgqpAttjRLlLgCxWU6lPxgkuCqKV
 u0EQ==
X-Gm-Message-State: AOAM531McilTBqQYe61H3g6wP1xPJdxB9TS0cNFSuDKZSeE8kVLZgyWn
 s/+sNz96ZlZkk2uOUclpMwE=
X-Google-Smtp-Source: ABdhPJzGkwvMghVx+eQ7qO0wtkopELk5Lccddvd1lmFjxtvj2Q2p7qXDUdyAzDKYJ6LI0ODcRg8rZw==
X-Received: by 2002:a17:906:4145:: with SMTP id
 l5mr23250136ejk.317.1605707911662; 
 Wed, 18 Nov 2020 05:58:31 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id cx6sm13721384edb.61.2020.11.18.05.58.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 05:58:31 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v5 1/7] clk: rockchip: add CLK_SET_RATE_PARENT to sclk for
 rk3066a i2s and uart clocks
Date: Wed, 18 Nov 2020 14:58:16 +0100
Message-Id: <20201118135822.9582-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201118135822.9582-1-jbx6244@gmail.com>
References: <20201118135822.9582-1-jbx6244@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org, mturquette@baylibre.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com,
 sboyd@kernel.org, robh+dt@kernel.org, broonie@kernel.org, daniel@ffwll.ch,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Add CLK_SET_RATE_PARENT to sclk for rk3066a i2s and uart clocks,
so that the parent COMPOSITE_FRACMUX and COMPOSITE_NOMUX
also update.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/clk/rockchip/clk-rk3188.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index 730020fcc..db8c58813 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -255,19 +255,19 @@ static struct rockchip_clk_branch common_spdif_fracmux __initdata =
 			RK2928_CLKSEL_CON(5), 8, 2, MFLAGS);
 
 static struct rockchip_clk_branch common_uart0_fracmux __initdata =
-	MUX(SCLK_UART0, "sclk_uart0", mux_sclk_uart0_p, 0,
+	MUX(SCLK_UART0, "sclk_uart0", mux_sclk_uart0_p, CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(13), 8, 2, MFLAGS);
 
 static struct rockchip_clk_branch common_uart1_fracmux __initdata =
-	MUX(SCLK_UART1, "sclk_uart1", mux_sclk_uart1_p, 0,
+	MUX(SCLK_UART1, "sclk_uart1", mux_sclk_uart1_p, CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(14), 8, 2, MFLAGS);
 
 static struct rockchip_clk_branch common_uart2_fracmux __initdata =
-	MUX(SCLK_UART2, "sclk_uart2", mux_sclk_uart2_p, 0,
+	MUX(SCLK_UART2, "sclk_uart2", mux_sclk_uart2_p, CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(15), 8, 2, MFLAGS);
 
 static struct rockchip_clk_branch common_uart3_fracmux __initdata =
-	MUX(SCLK_UART3, "sclk_uart3", mux_sclk_uart3_p, 0,
+	MUX(SCLK_UART3, "sclk_uart3", mux_sclk_uart3_p, CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(16), 8, 2, MFLAGS);
 
 static struct rockchip_clk_branch common_clk_branches[] __initdata = {
@@ -408,28 +408,28 @@ static struct rockchip_clk_branch common_clk_branches[] __initdata = {
 	COMPOSITE_NOMUX(0, "uart0_pre", "uart_src", 0,
 			RK2928_CLKSEL_CON(13), 0, 7, DFLAGS,
 			RK2928_CLKGATE_CON(1), 8, GFLAGS),
-	COMPOSITE_FRACMUX(0, "uart0_frac", "uart0_pre", 0,
+	COMPOSITE_FRACMUX(0, "uart0_frac", "uart0_pre", CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(17), 0,
 			RK2928_CLKGATE_CON(1), 9, GFLAGS,
 			&common_uart0_fracmux),
 	COMPOSITE_NOMUX(0, "uart1_pre", "uart_src", 0,
 			RK2928_CLKSEL_CON(14), 0, 7, DFLAGS,
 			RK2928_CLKGATE_CON(1), 10, GFLAGS),
-	COMPOSITE_FRACMUX(0, "uart1_frac", "uart1_pre", 0,
+	COMPOSITE_FRACMUX(0, "uart1_frac", "uart1_pre", CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(18), 0,
 			RK2928_CLKGATE_CON(1), 11, GFLAGS,
 			&common_uart1_fracmux),
 	COMPOSITE_NOMUX(0, "uart2_pre", "uart_src", 0,
 			RK2928_CLKSEL_CON(15), 0, 7, DFLAGS,
 			RK2928_CLKGATE_CON(1), 12, GFLAGS),
-	COMPOSITE_FRACMUX(0, "uart2_frac", "uart2_pre", 0,
+	COMPOSITE_FRACMUX(0, "uart2_frac", "uart2_pre", CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(19), 0,
 			RK2928_CLKGATE_CON(1), 13, GFLAGS,
 			&common_uart2_fracmux),
 	COMPOSITE_NOMUX(0, "uart3_pre", "uart_src", 0,
 			RK2928_CLKSEL_CON(16), 0, 7, DFLAGS,
 			RK2928_CLKGATE_CON(1), 14, GFLAGS),
-	COMPOSITE_FRACMUX(0, "uart3_frac", "uart3_pre", 0,
+	COMPOSITE_FRACMUX(0, "uart3_frac", "uart3_pre", CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(20), 0,
 			RK2928_CLKGATE_CON(1), 15, GFLAGS,
 			&common_uart3_fracmux),
@@ -543,15 +543,15 @@ static struct clk_div_table div_aclk_cpu_t[] = {
 };
 
 static struct rockchip_clk_branch rk3066a_i2s0_fracmux __initdata =
-	MUX(SCLK_I2S0, "sclk_i2s0", mux_sclk_i2s0_p, 0,
+	MUX(SCLK_I2S0, "sclk_i2s0", mux_sclk_i2s0_p, CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(2), 8, 2, MFLAGS);
 
 static struct rockchip_clk_branch rk3066a_i2s1_fracmux __initdata =
-	MUX(SCLK_I2S1, "sclk_i2s1", mux_sclk_i2s1_p, 0,
+	MUX(SCLK_I2S1, "sclk_i2s1", mux_sclk_i2s1_p, CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(3), 8, 2, MFLAGS);
 
 static struct rockchip_clk_branch rk3066a_i2s2_fracmux __initdata =
-	MUX(SCLK_I2S2, "sclk_i2s2", mux_sclk_i2s2_p, 0,
+	MUX(SCLK_I2S2, "sclk_i2s2", mux_sclk_i2s2_p, CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(4), 8, 2, MFLAGS);
 
 static struct rockchip_clk_branch rk3066a_clk_branches[] __initdata = {
@@ -615,21 +615,21 @@ static struct rockchip_clk_branch rk3066a_clk_branches[] __initdata = {
 	COMPOSITE_NOMUX(0, "i2s0_pre", "i2s_src", 0,
 			RK2928_CLKSEL_CON(2), 0, 7, DFLAGS,
 			RK2928_CLKGATE_CON(0), 7, GFLAGS),
-	COMPOSITE_FRACMUX(0, "i2s0_frac", "i2s0_pre", 0,
+	COMPOSITE_FRACMUX(0, "i2s0_frac", "i2s0_pre", CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(6), 0,
 			RK2928_CLKGATE_CON(0), 8, GFLAGS,
 			&rk3066a_i2s0_fracmux),
 	COMPOSITE_NOMUX(0, "i2s1_pre", "i2s_src", 0,
 			RK2928_CLKSEL_CON(3), 0, 7, DFLAGS,
 			RK2928_CLKGATE_CON(0), 9, GFLAGS),
-	COMPOSITE_FRACMUX(0, "i2s1_frac", "i2s1_pre", 0,
+	COMPOSITE_FRACMUX(0, "i2s1_frac", "i2s1_pre", CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(7), 0,
 			RK2928_CLKGATE_CON(0), 10, GFLAGS,
 			&rk3066a_i2s1_fracmux),
 	COMPOSITE_NOMUX(0, "i2s2_pre", "i2s_src", 0,
 			RK2928_CLKSEL_CON(4), 0, 7, DFLAGS,
 			RK2928_CLKGATE_CON(0), 11, GFLAGS),
-	COMPOSITE_FRACMUX(0, "i2s2_frac", "i2s2_pre", 0,
+	COMPOSITE_FRACMUX(0, "i2s2_frac", "i2s2_pre", CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(8), 0,
 			RK2928_CLKGATE_CON(0), 12, GFLAGS,
 			&rk3066a_i2s2_fracmux),
-- 
2.11.0

