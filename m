Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FB72B370B
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Nov 2020 18:12:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4AB21749;
	Sun, 15 Nov 2020 18:11:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4AB21749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605460364;
	bh=aEUp0B6gKWhexMWTFrPQ6syXXhv4DwFr18aY9X2Sbr4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sKOZKTbbKoajNKNkenykhIJiVPFKDS50bj6M7fkvYn+umGLEOLQXHIjVl1KwJcjS/
	 UYOsn0ntQDEoLDd1EKdRoP7snvCLPoTj8d/IhOHXl97Qt/jSjaqBSLYu2MJi52TP26
	 XXxeX5C+T5f6fWXfyi6Wpoo2112YH55xEgL9TkZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1E6BF804C3;
	Sun, 15 Nov 2020 18:10:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A80B0F801F5; Sun, 15 Nov 2020 18:10:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6066F80247
 for <alsa-devel@alsa-project.org>; Sun, 15 Nov 2020 18:10:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6066F80247
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V3qmWys4"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 002F9241A3;
 Sun, 15 Nov 2020 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605460209;
 bh=aEUp0B6gKWhexMWTFrPQ6syXXhv4DwFr18aY9X2Sbr4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V3qmWys4GJ+55sDezEl4qwyS2jtjIpQxwkjiulc5KFvkI+vJCfm4rOLTN9AT5rm0A
 JEbL/6hsbV5Rrd/6V9E5W4GCWcH05U1/mPxqBpjyu7Z4AaaGQdcFhlqtd4pdo+gZcR
 5Q7MEWczSaK2Z4Rh4Qha8JOyb67INOYvrXzJIX/U=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-media@vger.kernel.org,
 devel@driverdev.osuosl.org, alsa-devel@alsa-project.org
Subject: [RFC 3/3] media: atomisp: do not select COMMON_CLK to fix builds
Date: Sun, 15 Nov 2020 18:09:50 +0100
Message-Id: <20201115170950.304460-4-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201115170950.304460-1-krzk@kernel.org>
References: <20201115170950.304460-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzk@kernel.org>
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

COMMON_CLK is a user-selectable option with its own dependencies.  The
most important dependency is !HAVE_LEGACY_CLK.  User-selectable drivers
should not select COMMON_CLK because they will create a dependency cycle
and build failures.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/staging/media/atomisp/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
index 37577bb72998..742edb261d85 100644
--- a/drivers/staging/media/atomisp/Kconfig
+++ b/drivers/staging/media/atomisp/Kconfig
@@ -2,9 +2,9 @@
 menuconfig INTEL_ATOMISP
 	bool "Enable support to Intel Atom ISP camera drivers"
 	depends on X86 && EFI && PCI && ACPI
+	depends on COMMON_CLK
 	select IOSF_MBI
 	select MEDIA_CONTROLLER
-	select COMMON_CLK
 	help
 	  Enable support for the Intel ISP2 camera interfaces and MIPI
 	  sensor drivers.
-- 
2.25.1

