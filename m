Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7962B6F38
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 20:47:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 618DD179F;
	Tue, 17 Nov 2020 20:46:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 618DD179F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605642463;
	bh=VwS8RY4fFY7MjZOxKF5eKRzzYY6QMUGbgoG+BFITGoA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AFNd08MgM5Kwuk+lh2CkqDKXz9EEESAL/Kr0i/zQE4lb5g5pGAAV88e4+4AUIY4xr
	 g9I6ATmFfH5QPHN3tmlTHN+jydV+Low2IYqlaLw9ODWldGrzIroo1ZeO5hIRbxvldq
	 AZsXQeiPBf4t7HfWEvs5EQNq311A0Mm/Sc+/EKrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E911F804CB;
	Tue, 17 Nov 2020 20:45:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF4D0F8025E; Tue, 17 Nov 2020 20:45:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9AAAF801F5
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 20:45:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9AAAF801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XQfdSGQu"
Received: by mail-ed1-x541.google.com with SMTP id q16so8556799edv.10
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 11:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iGo+ZN3tAXAxv3w8yNYuIIpSkiLbRMRp3Fk34AunwFo=;
 b=XQfdSGQug74wE57EDrUQcCwv7ZUJWtBXN01FdoRbPoHB0gW73UHsF61Bpr7LBhFNdP
 w9XxyHke8I9Xz8vs4Exv7IxndU25bpqtO7CqysEz8MDBU8QynFD6SCgWeJD/5t6VbCmv
 DJ/+01cA56p+DUwBYdBt8SIpMZcDSfOnEt1BaQCs6dCxDAwwu0CyyRTjmN89cqlzGV4W
 CdDeMzFE8TedSqG9OfayovDxEdV+SZ8ciISQFShyOeS/BagY9Vnqy8I7ekOdkAAa5gsX
 lkbymMefNwT00tGalZbO0r5vI+aIHB0A5D64fpPcJfCMwye9NawQ0nX1/oHo5VikF6kn
 ukNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iGo+ZN3tAXAxv3w8yNYuIIpSkiLbRMRp3Fk34AunwFo=;
 b=UdFteRmNzKqPN5l4GcHpOCCdt0qsgM9RJYzSM82cAR3IorPm/+6Q1VQucajVH0Wu7c
 WAVgKO9uJPoCGjfXJd8q7dl6kzr3fba3pIthJsCNA/kkRrOrnvf7LQy22VeJuW5jdZS9
 N50NQknUpwfMEWoh1lepwfBkQiC1FaZ0qg7gNwUVUIlixOWqdEuRaW+TLwmrAluDTfZC
 AAH4EkUzhA+Rd3XGC4HAqgGPlkrEuD/ApiQIBPpmp44e1nM4hCF+0i/3W6m7oA3WlXQf
 Bbhs7Izo++SxYkVpkh6LlO4J08+sH1tRG21rbLk5u05RQq3mpSA8IutFzAoZqZxxy8yq
 WlPw==
X-Gm-Message-State: AOAM533S01QShQb4bHVtEsULnSq0J0aviFrBdLxIr/8gRTaQA48lNw6T
 yS7RZcdxfuSOO/lWGj4asPo=
X-Google-Smtp-Source: ABdhPJyJxBsI7UzMAZkh+RoYMhBgZCCmMMEWzjjea4hV0eMUQ97cCmDrfRIc+G8Gjy1ktw15PxCicg==
X-Received: by 2002:aa7:c617:: with SMTP id h23mr21899993edq.154.1605642317521; 
 Tue, 17 Nov 2020 11:45:17 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id w2sm727972ejc.109.2020.11.17.11.45.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:45:16 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v4 1/7] clk: rockchip: add CLK_SET_RATE_PARENT to sclk for
 rk3066a i2s and uart clocks
Date: Tue, 17 Nov 2020 20:45:01 +0100
Message-Id: <20201117194507.14843-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201117194507.14843-1-jbx6244@gmail.com>
References: <20201117194507.14843-1-jbx6244@gmail.com>
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

