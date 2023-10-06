Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3216F7BB50F
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 12:24:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4FCE112;
	Fri,  6 Oct 2023 12:24:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4FCE112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696587898;
	bh=Qo2yW05k20HRNnztoH7yDXmDezSAd43Pfh+m0jZbgCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ol7TqhWnWiNbIpxfG9OB4SdnBfNrFkhrjFNQNLaLyaMpCvRoJ2Owxj4zlL8gtJxDF
	 4E38LVlT2joTGc37HpYtsRQWlwysUpQI5skwiRpZUS63rbM01XY7r2bf9aQWooT0ZA
	 CaUAJlk8Cni/7NWTfl3rO3RBHxrMptufyXnAKNck=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C415F80310; Fri,  6 Oct 2023 12:24:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93DB8F80310;
	Fri,  6 Oct 2023 12:24:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C471F8047D; Fri,  6 Oct 2023 12:24:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from muru.com (muru.com [72.249.23.125])
	by alsa1.perex.cz (Postfix) with ESMTP id 700E6F80130
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 12:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 700E6F80130
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 5B04680E0;
	Fri,  6 Oct 2023 10:23:49 +0000 (UTC)
Date: Fri, 6 Oct 2023 13:23:48 +0300
From: Tony Lindgren <tony@atomide.com>
To: =?utf-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, bcousson@baylibre.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, jarkko.nikula@bitmer.com,
	dmitry.torokhov@gmail.com, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/3] ASoC: ti: omap-mcbsp: Ignore errors for getting
 fck_src
Message-ID: <20231006102348.GK34982@atomide.com>
References: <20230705190324.355282-1-andreas@kemnade.info>
 <20230705190324.355282-2-andreas@kemnade.info>
 <7d58d52d-2087-45af-b29e-2515b63ead13@gmail.com>
 <20230920063353.GQ5285@atomide.com>
 <dac768d2-2c66-4d6b-b3d3-d1ef69103c76@gmail.com>
 <20230921121626.GT5285@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230921121626.GT5285@atomide.com>
Message-ID-Hash: JG5ZEYD73Y7XYCEC6RMWZYJ4BGAQ4U5S
X-Message-ID-Hash: JG5ZEYD73Y7XYCEC6RMWZYJ4BGAQ4U5S
X-MailFrom: tony@atomide.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JG5ZEYD73Y7XYCEC6RMWZYJ4BGAQ4U5S/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

* Tony Lindgren <tony@atomide.com> [230921 20:34]:
> * Péter Ujfalusi <peter.ujfalusi@gmail.com> [230920 17:40]:
> > It is not the parent's fck, it is the PRCM clock which is selected as
> > the sourcee of the clock generator (CLKS) for BCLK/FSYNC. That is the
> > functional clock as well for the McBSP instance.
> 
> Oh OK
> 
> > Out of reset it is using the PRCM source which is fine in all current users.
> > I would do this fix or workaround in a different way: instead of
> > ignoring the error, avoid it in the first place. Do nothing if the
> > already selected clock is requested.
> > That would remove the error and will fail in case the reparenting is not
> > working -> boards will know this and might be able to do something about
> > it in a reasonable way.

Here's what I think the regression fix for omap4 clocks would be, the
old main_clk is not the same as the module clock that we get by default.
If this looks OK I'll do a similar fix also for omap5.

Or is something else also needed?

Regards,

Tony

8< -----------------------------
diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
--- a/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
@@ -109,6 +109,8 @@ mcbsp1: mcbsp@0 {
 				reg = <0x0 0xff>, /* MPU private access */
 				      <0x49022000 0xff>; /* L3 Interconnect */
 				reg-names = "mpu", "dma";
+				clocks = <&abe_clkctrl OMAP4_MCBSP1_CLKCTRL 24>;
+				clock-names = "fck";
 				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "common";
 				ti,buffer-size = <128>;
@@ -142,6 +144,8 @@ mcbsp2: mcbsp@0 {
 				reg = <0x0 0xff>, /* MPU private access */
 				      <0x49024000 0xff>; /* L3 Interconnect */
 				reg-names = "mpu", "dma";
+				clocks = <&abe_clkctrl OMAP4_MCBSP2_CLKCTRL 24>;
+				clock-names = "fck";
 				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "common";
 				ti,buffer-size = <128>;
@@ -175,6 +179,8 @@ mcbsp3: mcbsp@0 {
 				reg = <0x0 0xff>, /* MPU private access */
 				      <0x49026000 0xff>; /* L3 Interconnect */
 				reg-names = "mpu", "dma";
+				clocks = <&abe_clkctrl OMAP4_MCBSP3_CLKCTRL 24>;
+				clock-names = "fck";
 				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "common";
 				ti,buffer-size = <128>;
diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
--- a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
@@ -2043,6 +2043,8 @@ mcbsp4: mcbsp@0 {
 				compatible = "ti,omap4-mcbsp";
 				reg = <0x0 0xff>; /* L4 Interconnect */
 				reg-names = "mpu";
+				clocks = <&l4_per_clkctrl OMAP4_MCBSP4_CLKCTRL 24>;
+				clock-names = "fck";
 				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "common";
 				ti,buffer-size = <128>;
diff --git a/drivers/clk/ti/clk-44xx.c b/drivers/clk/ti/clk-44xx.c
--- a/drivers/clk/ti/clk-44xx.c
+++ b/drivers/clk/ti/clk-44xx.c
@@ -749,9 +749,14 @@ static struct ti_dt_clk omap44xx_clks[] = {
 	DT_CLK(NULL, "mcbsp1_sync_mux_ck", "abe-clkctrl:0028:26"),
 	DT_CLK(NULL, "mcbsp2_sync_mux_ck", "abe-clkctrl:0030:26"),
 	DT_CLK(NULL, "mcbsp3_sync_mux_ck", "abe-clkctrl:0038:26"),
+	DT_CLK("40122000.mcbsp", "prcm_fck", "abe-clkctrl:0028:26"),
+	DT_CLK("40124000.mcbsp", "prcm_fck", "abe-clkctrl:0030:26"),
+	DT_CLK("40126000.mcbsp", "prcm_fck", "abe-clkctrl:0038:26"),
 	DT_CLK(NULL, "mcbsp4_sync_mux_ck", "l4-per-clkctrl:00c0:26"),
+	DT_CLK("48096000.mcbsp", "prcm_fck", "l4-per-clkctrl:00c0:26"),
 	DT_CLK(NULL, "ocp2scp_usb_phy_phy_48m", "l3-init-clkctrl:00c0:8"),
 	DT_CLK(NULL, "otg_60m_gfclk", "l3-init-clkctrl:0040:24"),
+	DT_CLK(NULL, "pad_fck", "pad_clks_ck"),
 	DT_CLK(NULL, "per_mcbsp4_gfclk", "l4-per-clkctrl:00c0:24"),
 	DT_CLK(NULL, "pmd_stm_clock_mux_ck", "emu-sys-clkctrl:0000:20"),
 	DT_CLK(NULL, "pmd_trace_clk_mux_ck", "emu-sys-clkctrl:0000:22"),
-- 
2.42.0
