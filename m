Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0067CDF8
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 22:10:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2C4B169E;
	Wed, 31 Jul 2019 22:10:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2C4B169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564603858;
	bh=l2ahTLiRy8A3ZNy+GOp/8oiLx8R+r/ky5AYsCrjY0xQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dubD9Ud1VuZlmfk0k7GfVF9ZFw4qi1ADZkoSk9+xG5Xab8rt3ccT3Z2SV77dWwAQr
	 ZRyAruxqOAw584phCyGi3qvWGkZF6Q8IaVuroQHR1TTpohSCj09XI2uHLUVVs7Meer
	 ivEFb4iOvY4u3fgpNRXXLe4DFuqF6fPGM12yE6dA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 329A4F80133;
	Wed, 31 Jul 2019 22:09:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39C55F800C0; Wed, 31 Jul 2019 22:09:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57DDCF80440
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 22:09:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57DDCF80440
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="sXCTHXEs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RGnIbstR67/d58/2VBeEsEJ/D0YYSvIZYvE9aUkOglI=; b=sXCTHXEsA7iDFFkPD1idGMZHXg
 rljnX14PeB7vCozRMFWMAx92dwvrdMapCECbrpmzysy4xykG2nB25d/IAmmNTkv2qwr1obwhmSs24
 PBT5iy7zEoisaKGVdcoUHBom22tylx57JldxYMsbU5fxVChyHfRycxRWfaK4gIyOToNX82M8QxRXU
 T80P6hzjoV+MXn/JADYfhvA3wTaUxHTT9igt/zZS2BSRqmN3DgEevpWCLfREFWsnlAiiphCpkkSkX
 G5zHBKJpgFnZvtb9sYeT9c2EN2GIv4yt6U6Hu/+0y41PGzAaGziR2djBMnRUNKVazBVAmQXraXxt9
 Dq6GqtZQ==;
Received: from [191.33.152.89] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hsuu8-0007qC-HH; Wed, 31 Jul 2019 20:08:56 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hsuu6-00079g-72; Wed, 31 Jul 2019 17:08:54 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Wed, 31 Jul 2019 17:08:48 -0300
Message-Id: <5b4fae5978d309641fa8ba233a9efe2b48201cd6.1564603513.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1564603513.git.mchehab+samsung@kernel.org>
References: <cover.1564603513.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, Dave Kleikamp <shaggy@kernel.org>,
 alsa-devel@alsa-project.org, Evgeniy Dushistov <dushistov@mail.ru>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, jfs-discussion@lists.sourceforge.net,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, devicetree@vger.kernel.org
Subject: [alsa-devel] [PATCH 1/6] docs: fix a couple of new broken references
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Those are due to recent changes. Most of the issues
can be automatically fixed with:

	$ ./scripts/documentation-file-ref-check --fix

The only exception was the sound binding with required
manual work.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt | 2 +-
 MAINTAINERS                                                 | 4 ++--
 drivers/hwtracing/coresight/Kconfig                         | 2 +-
 fs/jfs/Kconfig                                              | 2 +-
 fs/ufs/Kconfig                                              | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt b/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
index 2ca3d138528e..7ecf6bd60d27 100644
--- a/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
+++ b/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
@@ -4,7 +4,7 @@ Allwinner SUN8I audio codec
 On Sun8i-A33 SoCs, the audio is separated in different parts:
 	  - A DAI driver. It uses the "sun4i-i2s" driver which is
 	  documented here:
-	  Documentation/devicetree/bindings/sound/sun4i-i2s.txt
+	  Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
 	  - An analog part of the codec which is handled as PRCM registers.
 	  See Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt
 	  - An digital part of the codec which is documented in this current
diff --git a/MAINTAINERS b/MAINTAINERS
index 6de82f019a52..f109a8bcffda 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8659,7 +8659,7 @@ L:	jfs-discussion@lists.sourceforge.net
 W:	http://jfs.sourceforge.net/
 T:	git git://github.com/kleikamp/linux-shaggy.git
 S:	Maintained
-F:	Documentation/filesystems/jfs.txt
+F:	Documentation/admin-guide/jfs.rst
 F:	fs/jfs/
 
 JME NETWORK DRIVER
@@ -16439,7 +16439,7 @@ F:	drivers/hid/hid-udraw-ps3.c
 UFS FILESYSTEM
 M:	Evgeniy Dushistov <dushistov@mail.ru>
 S:	Maintained
-F:	Documentation/filesystems/ufs.txt
+F:	Documentation/admin-guide/ufs.rst
 F:	fs/ufs/
 
 UHID USERSPACE HID IO DRIVER:
diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 14638db4991d..7a9f5fb08330 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -106,7 +106,7 @@ config CORESIGHT_CPU_DEBUG
 	  can quickly get to know program counter (PC), secure state,
 	  exception level, etc. Before use debugging functionality, platform
 	  needs to ensure the clock domain and power domain are enabled
-	  properly, please refer Documentation/trace/coresight-cpu-debug.txt
+	  properly, please refer Documentation/trace/coresight-cpu-debug.rst
 	  for detailed description and the example for usage.
 
 endif
diff --git a/fs/jfs/Kconfig b/fs/jfs/Kconfig
index 22a273bd4648..05cb0e8e4382 100644
--- a/fs/jfs/Kconfig
+++ b/fs/jfs/Kconfig
@@ -5,7 +5,7 @@ config JFS_FS
 	select CRC32
 	help
 	  This is a port of IBM's Journaled Filesystem .  More information is
-	  available in the file <file:Documentation/filesystems/jfs.txt>.
+	  available in the file <file:Documentation/admin-guide/jfs.rst>.
 
 	  If you do not intend to use the JFS filesystem, say N.
 
diff --git a/fs/ufs/Kconfig b/fs/ufs/Kconfig
index fcb41516ea59..6d30adb6b890 100644
--- a/fs/ufs/Kconfig
+++ b/fs/ufs/Kconfig
@@ -9,7 +9,7 @@ config UFS_FS
 	  this file system as well. Saying Y here will allow you to read from
 	  these partitions; if you also want to write to them, say Y to the
 	  experimental "UFS file system write support", below. Please read the
-	  file <file:Documentation/filesystems/ufs.txt> for more information.
+	  file <file:Documentation/admin-guide/ufs.rst> for more information.
 
           The recently released UFS2 variant (used in FreeBSD 5.x) is
           READ-ONLY supported.
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
