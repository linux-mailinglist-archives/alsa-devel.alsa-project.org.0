Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9942FD598
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 17:27:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C26FB17AA;
	Wed, 20 Jan 2021 17:26:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C26FB17AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611160063;
	bh=pplVtWu5CogqVByi3nEGtedDWrVmUgHEkMhQP3YWBzQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GmIzmHuZeg6wLfb9DnG9sRuTviAix9+UYY9c2BFy9NCtit3/43W1Zu+oX59Y1AgId
	 18s8DVq29k5QB+rEZuwRDGNCdN1cOWYMYum0yrGomJdw7jNgDdSJmjnKgqBd3lbLCo
	 ELMKSaSn68PVXJoIYq3pj6jcIQBjaDfkyJ5V5bTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E65BFF8019D;
	Wed, 20 Jan 2021 17:26:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 230ACF8019D; Wed, 20 Jan 2021 17:26:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8F68F80164
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 17:26:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8F68F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RkindgZz"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C023D233E2;
 Wed, 20 Jan 2021 16:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611159959;
 bh=pplVtWu5CogqVByi3nEGtedDWrVmUgHEkMhQP3YWBzQ=;
 h=From:To:Cc:Subject:Date:From;
 b=RkindgZzngabP6z81VN2gDLFWgZM55s6+VL/ePVjObzbmAiEFXPBKM/EFsTlILE9t
 9lSdqnMno10m8nqWsG+4+D38soJVeb+loHGnYo3UhmjYuKuS3+m0A5gVW0Poiz4eLk
 +uZYaoZkOIzubvy0ODXGEgSnuJU1Us+Rg15H14IvcpZxyawiWxbmDOE3+ymrWDmvnU
 Ly9I7bK8V4V2p6bScMRG05QnkP2JsCwCmZgFgoZydcfhRlgSVWjriW525F3jGoMtwS
 z/UeirHC39tREfOsq1+AmCX7FYR8uyL8zU++MRGjuoicD2DfVjgm0ELD3RZSmNujVq
 CEZKeXDBAQQGQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: remove obsolete drivers
Date: Wed, 20 Jan 2021 17:25:51 +0100
Message-Id: <20210120162553.21666-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>
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

From: Arnd Bergmann <arnd@arndb.de>

A few Arm platforms are getting removed in v5.12, this removes
the corresponding sound drivers.

Link: https://lore.kernel.org/linux-arm-kernel/20210120124812.2800027-1-arnd@kernel.org/T/

Arnd Bergmann (2):
  ASoC: remove sirf prima/atlas drivers
  ASoC: remove zte zx drivers

 .../bindings/sound/sirf-audio-codec.txt       |  17 -
 .../devicetree/bindings/sound/sirf-usp.txt    |  27 -
 .../devicetree/bindings/sound/zte,tdm.txt     |  30 -
 .../bindings/sound/zte,zx-aud96p22.txt        |  24 -
 .../devicetree/bindings/sound/zte,zx-i2s.txt  |  45 --
 .../bindings/sound/zte,zx-spdif.txt           |  27 -
 sound/soc/Kconfig                             |   2 -
 sound/soc/Makefile                            |   2 -
 sound/soc/codecs/Makefile                     |   4 -
 sound/soc/codecs/sirf-audio-codec.c           | 575 ------------------
 sound/soc/codecs/zx_aud96p22.c                | 401 ------------
 sound/soc/sirf/Kconfig                        |  21 -
 sound/soc/sirf/Makefile                       |   8 -
 sound/soc/sirf/sirf-audio-port.c              |  86 ---
 sound/soc/sirf/sirf-audio.c                   | 160 -----
 sound/soc/sirf/sirf-usp.c                     | 435 -------------
 sound/soc/sirf/sirf-usp.h                     | 292 ---------
 sound/soc/zte/Kconfig                         |  26 -
 sound/soc/zte/Makefile                        |   4 -
 sound/soc/zte/zx-i2s.c                        | 452 --------------
 sound/soc/zte/zx-spdif.c                      | 363 -----------
 sound/soc/zte/zx-tdm.c                        | 458 --------------
 22 files changed, 3459 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/sirf-audio-codec.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/sirf-usp.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/zte,tdm.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/zte,zx-aud96p22.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/zte,zx-i2s.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/zte,zx-spdif.txt
 delete mode 100644 sound/soc/codecs/sirf-audio-codec.c
 delete mode 100644 sound/soc/codecs/zx_aud96p22.c
 delete mode 100644 sound/soc/sirf/Kconfig
 delete mode 100644 sound/soc/sirf/Makefile
 delete mode 100644 sound/soc/sirf/sirf-audio-port.c
 delete mode 100644 sound/soc/sirf/sirf-audio.c
 delete mode 100644 sound/soc/sirf/sirf-usp.c
 delete mode 100644 sound/soc/sirf/sirf-usp.h
 delete mode 100644 sound/soc/zte/Kconfig
 delete mode 100644 sound/soc/zte/Makefile
 delete mode 100644 sound/soc/zte/zx-i2s.c
 delete mode 100644 sound/soc/zte/zx-spdif.c
 delete mode 100644 sound/soc/zte/zx-tdm.c

-- 
2.29.2

