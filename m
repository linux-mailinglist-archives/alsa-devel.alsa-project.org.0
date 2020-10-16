Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D199128FE36
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 08:21:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F6EE17A5;
	Fri, 16 Oct 2020 08:20:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F6EE17A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602829262;
	bh=7yWAihDEq31D9uRmDb4hBurXlLgdH2zj5CS6qqskGps=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g5EFyQu3mGXWTcYpkWrtIa4ci6yN1+2GqPiHvW2Q+LpVrYPg3toNnSspoIBkk3jT5
	 bqeQQ+6IW7uOZfk4WvUUTZdxcvjhXCdUlaHHBXxCPBa76t3fJDiruvCaWXDQh/iOEV
	 fAoA8ZLUfwe29nY0LqC2bXSa2rPcwiazHk/v7oZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFCFFF8012A;
	Fri, 16 Oct 2020 08:19:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E32B7F80217; Fri, 16 Oct 2020 08:19:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AAE9F800B8
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 08:19:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AAE9F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="brA/DRDr"
Received: from kozik-lap.mshome.net (unknown [194.230.155.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 183CC20878;
 Fri, 16 Oct 2020 06:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602829143;
 bh=7yWAihDEq31D9uRmDb4hBurXlLgdH2zj5CS6qqskGps=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=brA/DRDrlc2wH+vEPop5WQzErjLhH2a4dDF9t9KshnFBP9vPToOg4iou26XaHz5vl
 /Jl2G/NQ33LRXoklL90mNkG1/3k4pVOY0CLdOad8yuOFA0bk/tCTevPtGiX00UxVw/
 SFUn7FwolZsWYtDlqYXS4RAZG2kv/wRWz3xDKMNE=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, arm@kernel.org,
 soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Subject: [PATCH 2/2] MAINTAINERS: Move Sangbeom Kim to credits
Date: Fri, 16 Oct 2020 08:18:48 +0200
Message-Id: <20201016061848.6258-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016061848.6258-1-krzk@kernel.org>
References: <20201016061848.6258-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
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

Sangbeom Kim upstreamed the Samsung SoC Sound and PMIC (MFD, regulator,
RTC) drivers.  However his contributions and LKML activity ends in 2014:
https://lore.kernel.org/lkml/?q=f%3A%22Sangbeom+Kim%22

Move Sangbeom Kim to the CREDITS file.  Thank you for the effort you put
in to the upstream Samsung support.

Cc: Sangbeom Kim <sbkim73@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

This patch depends on 1/2 in the CREDITS part.  I can take both via
my Samsung SoC tree.
---
 CREDITS     | 5 +++++
 MAINTAINERS | 2 --
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index 5df027e12ff7..8592e45e3932 100644
--- a/CREDITS
+++ b/CREDITS
@@ -1914,6 +1914,11 @@ N: Kukjin Kim
 E: kgene@kernel.org
 D: Samsung S3C, S5P and Exynos ARM architectures
 
+N: Sangbeom Kim
+E: sbkim73@samsung.com
+D: Samsung SoC Audio (ASoC) drivers
+D: Samsung PMIC (RTC, regulators, MFD) drivers
+
 N: Russell King
 E: rmk@arm.linux.org.uk
 D: Linux/arm integrator, maintainer & hacker
diff --git a/MAINTAINERS b/MAINTAINERS
index c3976803057c..aa46cb3ce6e6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15379,7 +15379,6 @@ F:	security/safesetid/
 
 SAMSUNG AUDIO (ASoC) DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
-M:	Sangbeom Kim <sbkim73@samsung.com>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
@@ -15414,7 +15413,6 @@ S:	Maintained
 F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
-M:	Sangbeom Kim <sbkim73@samsung.com>
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-kernel@vger.kernel.org
-- 
2.25.1

