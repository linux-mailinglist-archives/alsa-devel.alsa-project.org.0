Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5DC5A95D0
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Sep 2022 13:35:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBEB71632;
	Thu,  1 Sep 2022 13:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBEB71632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662032134;
	bh=h9IV4eIYW5kh1aeXPCtiTU2SIaF+F2OU6T4VbJNn0B0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WBsVAv2SJxe0FjAJt1Ok8Bv58W2xNpZXNJNDckk3Z9OPx1IMRZk36TF9LlCTUPgcq
	 iaUrKIKZstKufXEva6NxN3ym4Ci07Vemy8tQAy7NpAXUZzaO3G3FAoU3bu07h/8VGn
	 N7ZnYci7zncTsajIk60KelSTgggmytvxleAGvO1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42314F804A9;
	Thu,  1 Sep 2022 13:34:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFE3CF8026D; Thu,  1 Sep 2022 13:34:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_78,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46977F800EB
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 13:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46977F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="LJbzIZvX"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1662032063; bh=64K6de8/WYbFY9mQuRbf7StfNJYaBkUUYkjBkby97iE=;
 h=From:To:Cc:Subject:Date;
 b=LJbzIZvXhb5XUcSgRAC6Eu5+ldNP5RqOgTHgRXWJbqEgRO08yUwNmOaJm92Y8GcnE
 X59dRQe1LOpgFJNtPQSlkSyYZbhk8PStP+BUrxFwMvgNetA6uWd53VFbZ3+XiAaQOX
 aLQ9Aomr4d0baGByf/w+uvTLODMhaU+t6whgiWYQ=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: apple: mca: Unselect COMMON_CLK in Kconfig
Date: Thu,  1 Sep 2022 13:34:14 +0200
Message-Id: <20220901113415.27449-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 kernel test robot <lkp@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
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

The MCA driver selects COMMON_CLK, which leads to misconfiguration
on platforms with HAVE_LEGACY_CLK (under compile test). Kconfig catches
the conflict with the following warning:

  WARNING: unmet direct dependencies detected for COMMON_CLK
  Depends on [n]: !HAVE_LEGACY_CLK [=y]
  Selected by [m]:
  - SND_SOC_APPLE_MCA [=m] && SOUND [=m] && !UML && SND [=m] &&
    SND_SOC [=m] && (ARCH_APPLE || COMPILE_TEST [=y])

Eventually the build fails with errors like:

>> drivers/clk/clk.c:867:6: error: redefinition of 'clk_unprepare'
     867 | void clk_unprepare(struct clk *clk)
         |      ^~~~~~~~~~~~~
   In file included from drivers/clk/clk.c:9:
   include/linux/clk.h:303:20: note: previous definition of 'clk_unprepare' with type 'void(struct clk *)'
     303 | static inline void clk_unprepare(struct clk *clk)
         |                    ^~~~~~~~~~~~~

which appears to be because COMMON_CLK is selected but HAVE_CLK_PREPARE
is not. In the end it seems we had no business selecting COMMON_CLK from
an unrelated driver like that, so remove the selection. The linux/clk.h
API is there anyway.

Fixes: 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/apple/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/apple/Kconfig b/sound/soc/apple/Kconfig
index 0ba955657e98..793f7782e0d7 100644
--- a/sound/soc/apple/Kconfig
+++ b/sound/soc/apple/Kconfig
@@ -2,7 +2,6 @@ config SND_SOC_APPLE_MCA
 	tristate "Apple Silicon MCA driver"
 	depends on ARCH_APPLE || COMPILE_TEST
 	select SND_DMAENGINE_PCM
-	select COMMON_CLK
 	default ARCH_APPLE
 	help
 	  This option enables an ASoC platform driver for MCA peripherals found
-- 
2.33.0

