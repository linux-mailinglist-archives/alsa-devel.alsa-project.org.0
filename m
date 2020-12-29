Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FC12E6F1C
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Dec 2020 09:52:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23DCE16F6;
	Tue, 29 Dec 2020 09:52:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23DCE16F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609231970;
	bh=UoGj64UJGsZuQEw/8K/Jnu5yIyyGitFb0Nl6PnGcvVM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KFaibkhLBnsfq9tK4zgMMZ1/ibv/kYxkkv7jmCGnzEkygNM8VbLxF37fN7JsuMynA
	 FhNGPdhD9M9TMIuR/7cjKuFbLw59DZCcA+7yj/+A55uEGXNTj3+yi7FIbwyM0eyPN9
	 uPupybDauZICNJB/wizvH5P0fautXZJbIApZUDCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA43DF8020C;
	Tue, 29 Dec 2020 09:51:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 662D9F8022B; Tue, 29 Dec 2020 09:51:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp02.smtpout.orange.fr
 [80.12.242.124])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 264B1F80143
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 09:51:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 264B1F80143
Received: from localhost.localdomain ([93.22.37.45]) by mwinf5d25 with ME
 id A8r32400F0ySWMH038r4gt; Tue, 29 Dec 2020 09:51:06 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 29 Dec 2020 09:51:06 +0100
X-ME-IP: 93.22.37.45
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org, perex@perex.cz,
 tiwai@suse.com
Subject: [PATCH] ASoC: Intel: common: Fix some typos
Date: Tue, 29 Dec 2020 09:51:03 +0100
Message-Id: <20201229085103.192715-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

s/apci/acpi/

Turn an ICL into a TGL because it is likely a cut'n'paste error

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/intel/common/soc-acpi-intel-ehl-match.c | 2 +-
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ehl-match.c b/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
index badafc1d54d2..5c7a1214403d 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * soc-apci-intel-ehl-match.c - tables and support for EHL ACPI enumeration.
+ * soc-acpi-intel-ehl-match.c - tables and support for EHL ACPI enumeration.
  *
  * Copyright (c) 2019, Intel Corporation.
  *
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 98196e9fad62..4933184df5f5 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * soc-apci-intel-tgl-match.c - tables and support for ICL ACPI enumeration.
+ * soc-acpi-intel-tgl-match.c - tables and support for TGL ACPI enumeration.
  *
  * Copyright (c) 2019, Intel Corporation.
  *
-- 
2.27.0

