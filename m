Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A2428FE35
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 08:20:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 443CD1797;
	Fri, 16 Oct 2020 08:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 443CD1797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602829257;
	bh=ijnQVEEPOFYo+v9rY1geLmUj2MWK5TIUHjhSE/SGbp8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ehxVVhGr9k2APiiQC0vTi8UJnL/sbMRhNjQRTauqs9UVO1wg/FycbSmNRTc9yibAC
	 MmfRmF6W8s502O1ikRWXDxPWi/s9dO3UD5nQAcMIn6mc91nD7C82FE8p/FEvx0qIMQ
	 4cgzgSSH+A4HP79gIz36g6wl44fBrIV7nMsdMQbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B68B5F8020D;
	Fri, 16 Oct 2020 08:19:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0572F8021D; Fri, 16 Oct 2020 08:19:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6988F8012A
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 08:19:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6988F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M/Erb1lL"
Received: from kozik-lap.mshome.net (unknown [194.230.155.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 69AC02074F;
 Fri, 16 Oct 2020 06:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602829139;
 bh=ijnQVEEPOFYo+v9rY1geLmUj2MWK5TIUHjhSE/SGbp8=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=M/Erb1lLK2zwqOXOzHSjVTBQMsRfKota1xTPw/pzt0AUsbWgWni4x2+JgaBMIYfUj
 QrZ+zwOqJhyq9S+GCnx7KkkhIeYs8b2xiRTnVxwgKByIQBevDqsZdsqMU9njsPjhgJ
 1mjqnh3akV95+0ASLg/6ut/cUrDy3b93+TAMVnuo=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, arm@kernel.org,
 soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Subject: [PATCH 1/2] MAINTAINERS: Move Kukjin Kim to credits
Date: Fri, 16 Oct 2020 08:18:47 +0200
Message-Id: <20201016061848.6258-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
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

Kukjin Kim has been maintaining the Samsung ARM architectures since 2010
up to 2016.  He contributed many patches for the S3C, S5P and Exynos
support.  However since 2016 there is little activity from him on the
LKML [1] so move his name to the CREDITS.

Dear Kukjin, thank you for all the effort you put in to the upstream
Samsung support.

[1] https://lore.kernel.org/lkml/?q=f%3A%22Kukjin+Kim%22

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 CREDITS     | 4 ++++
 MAINTAINERS | 2 --
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index cb02b9923a52..5df027e12ff7 100644
--- a/CREDITS
+++ b/CREDITS
@@ -1910,6 +1910,10 @@ S: 660 Harvard Ave. #7
 S: Santa Clara, CA 95051
 S: USA
 
+N: Kukjin Kim
+E: kgene@kernel.org
+D: Samsung S3C, S5P and Exynos ARM architectures
+
 N: Russell King
 E: rmk@arm.linux.org.uk
 D: Linux/arm integrator, maintainer & hacker
diff --git a/MAINTAINERS b/MAINTAINERS
index 4538378de6f5..c3976803057c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2375,7 +2375,6 @@ F:	sound/soc/rockchip/
 N:	rockchip
 
 ARM/SAMSUNG EXYNOS ARM ARCHITECTURES
-M:	Kukjin Kim <kgene@kernel.org>
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
@@ -15497,7 +15496,6 @@ F:	include/linux/clk/samsung.h
 F:	include/linux/platform_data/clk-s3c2410.h
 
 SAMSUNG SPI DRIVERS
-M:	Kukjin Kim <kgene@kernel.org>
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Andi Shyti <andi@etezian.org>
 L:	linux-spi@vger.kernel.org
-- 
2.25.1

