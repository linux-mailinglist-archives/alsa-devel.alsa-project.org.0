Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E816334832
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 20:42:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C8741708;
	Wed, 10 Mar 2021 20:41:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C8741708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615405326;
	bh=cOWXCGjDQSEsNUwUYEtkpkLFNveyr6JeymAx5PE7eqM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H+jZ5ivwbe0c19Vrae/n5NTTZCUi4Mh3iw/UykwsLeDv9q3KiO3H/ctVzsR2o1w5A
	 4jbc6DiKl6H0vTyMN4Kmgin94oe6PIWq0AiB5EMQCUoZeR+QYjqycL3x2VWZEj5IyJ
	 7ZSlJoq7pDmCfhXrAAoHEFThotsrAT+W/6bZjpI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9B0FF801ED;
	Wed, 10 Mar 2021 20:40:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91A68F801D8; Wed, 10 Mar 2021 20:40:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1410AF8010D
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 20:40:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1410AF8010D
IronPort-SDR: wb5cgyV4+Uls/fh7H7TdmDB7bfymHzLWCV35+05zbuIl52S/30RhrZXVnlKAHDbr0b/J0HaSVY
 1mnQ2P5iG1lg==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="188587646"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="188587646"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 11:40:20 -0800
IronPort-SDR: Ngnr155Z4dw1Nf9P58Szzse68G1YMbgnh5b1TDqzsJaZCphjR0QwhrjEpuDkvqMLu8lMYHwvUy
 Izo1CMmL5Xnw==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="372066191"
Received: from alsonico-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.30.88])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 11:40:19 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: soc-core: fix DMI handling
Date: Wed, 10 Mar 2021 13:39:27 -0600
Message-Id: <20210310193928.108850-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jean Delvare <jdelvare@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 tiwai@suse.de, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 Jon Hunter <jonathanh@nvidia.com>
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

When DMI information is not present, trying to assign the card long
name results in the following warning.

WARNING KERN tegra-audio-graph-card sound: ASoC: no DMI vendor name!

The initial solution suggested was to test if the card device is an
ACPI one. This causes a regression visible to userspace on all Intel
platforms, with UCM unable to load card profiles based on DMI
information: the card devices are not necessarily ACPI ones, e.g. when
the parent creates platform devices on Intel devices.

To fix this problem, this patch exports the existing dmi_available
variable and tests it in the ASoC core.

Fixes: c014170408bc ("ASoC: soc-core: Prevent warning if no DMI table is present")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/firmware/dmi_scan.c | 1 +
 sound/soc/soc-core.c        | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
index d51ca0428bb8..f191a1f901ac 100644
--- a/drivers/firmware/dmi_scan.c
+++ b/drivers/firmware/dmi_scan.c
@@ -166,6 +166,7 @@ static int __init dmi_checksum(const u8 *buf, u8 len)
 static const char *dmi_ident[DMI_STRING_MAX];
 static LIST_HEAD(dmi_devices);
 int dmi_available;
+EXPORT_SYMBOL_GPL(dmi_available);
 
 /*
  *	Save a DMI string
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 16ba54eb8164..c7e4600b2dd4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1574,7 +1574,7 @@ int snd_soc_set_dmi_name(struct snd_soc_card *card, const char *flavour)
 	if (card->long_name)
 		return 0; /* long name already set by driver or from DMI */
 
-	if (!is_acpi_device_node(card->dev->fwnode))
+	if (!dmi_available)
 		return 0;
 
 	/* make up dmi long name as: vendor-product-version-board */
-- 
2.25.1

