Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ABC1650D9
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 22:02:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80BC916B9;
	Wed, 19 Feb 2020 22:01:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80BC916B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582146123;
	bh=2/aV9Pe7ac0PG+hqgsJZznVVmJ5IrKkJA/QXanb0Q34=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HBzCnpF0QV15B7G35OlxpNtVfOWswm7xzpsgf/i2hfuHwXf7wpemjePqw8j8AHF2L
	 yT8dg39cqNxf4TH73TolQMJvcryliCc4g/+uTUHXCgm6Yi+FYJUhTpTARVldicHHst
	 c2s5JqIXZTi52bNPILfTYvRzktM4HmDlqLKyq0GQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA926F802C3;
	Wed, 19 Feb 2020 21:57:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71846F802C2; Wed, 19 Feb 2020 21:57:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 6176EF802BC
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 21:57:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6176EF802BC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 962C81FB;
 Wed, 19 Feb 2020 12:57:14 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B0A03F68F;
 Wed, 19 Feb 2020 12:57:13 -0800 (PST)
Date: Wed, 19 Feb 2020 20:57:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Applied "ASoC: dt-bindings: Make RK3328 codec GPIO explicit" to the
 asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

The patch

   ASoC: dt-bindings: Make RK3328 codec GPIO explicit

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From e14980976534d9d94f5cddd70033707965482ede Mon Sep 17 00:00:00 2001
From: Robin Murphy <robin.murphy@arm.com>
Date: Tue, 18 Feb 2020 21:31:58 +0000
Subject: [PATCH] ASoC: dt-bindings: Make RK3328 codec GPIO explicit

Existing RK3328 codec drivers have overloaded the GRF phandle to assume
implicit control of the limited-function GPIO_MUTE pin, which is usually
used to enable an external audio line driver IC. Since this pin has a
proper binding of its own (see gpio/rockchip,rk3328-grf-gpio.txt), make
a GPIO explicit in the codec binding too. This will help avoid ambiguity
on boards that use that pin for some other purpose.

(and while touching the example, enforce the "don't include status" rule)

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Link: https://lore.kernel.org/r/5f7a399dea8a9dedef57f6f99f0f6ab1c1fdc56a.1581376744.git.robin.murphy@arm.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/sound/rockchip,rk3328-codec.txt    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt
index 2469588c7ccb..1ecd75d2032a 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt
@@ -10,6 +10,11 @@ Required properties:
 - clock-names: should be "pclk".
 - spk-depop-time-ms: speak depop time msec.
 
+Optional properties:
+
+- mute-gpios: GPIO specifier for external line driver control (typically the
+              dedicated GPIO_MUTE pin)
+
 Example for rk3328 internal codec:
 
 codec: codec@ff410000 {
@@ -18,6 +23,6 @@ codec: codec@ff410000 {
 	rockchip,grf = <&grf>;
 	clocks = <&cru PCLK_ACODEC>;
 	clock-names = "pclk";
+	mute-gpios = <&grf_gpio 0 GPIO_ACTIVE_LOW>;
 	spk-depop-time-ms = 100;
-	status = "disabled";
 };
-- 
2.20.1

