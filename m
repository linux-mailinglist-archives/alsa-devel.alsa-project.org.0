Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2982C78F2
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Nov 2020 12:45:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D6341848;
	Sun, 29 Nov 2020 12:44:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D6341848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606650344;
	bh=ZB4BRsyor0Gx0aOS6JDoMV78KCQ6pvgE5s5i5dIs6Oc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ijIXKb+F6s/4A5Nul/4P4shI8K+l6/oc1AfQqThJWARTAYXtlMuK0LOJGv9LhBbZp
	 HO/7aSulItjofLRBAs/iCqz3WPmPEPbaYTR8IlLQSincRwkpxAPOEj0+BXmzvjJBKd
	 Ew/I68GtlXksIPJ7m7P2fdQXy0KlMsxDnltEvzEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6385F8016E;
	Sun, 29 Nov 2020 12:43:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04134F804BD; Sun, 29 Nov 2020 12:43:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D08FF80148
 for <alsa-devel@alsa-project.org>; Sun, 29 Nov 2020 12:43:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D08FF80148
IronPort-SDR: ZOxo3o5VluRf2WrLDbFijFvtM5YV5kI88Qadt5OcAtbs2muC+cC76Lemtz2NJRhJAwlHMHqBnf
 aOzp+yRw7quA==
X-IronPort-AV: E=McAfee;i="6000,8403,9819"; a="151779970"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; d="scan'208";a="151779970"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2020 03:43:08 -0800
IronPort-SDR: e6FxUq+c38QrQ3pfi43xX1jzZQCLzWXnXpe8OtcujVG42ueXhaG331UTnQhoTpm3RV1wmbHHHy
 WQtzmZMU3IiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; d="scan'208";a="480261614"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga004.jf.intel.com with ESMTP; 29 Nov 2020 03:43:06 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] ASoC: Intel: Skylake: Select hda configuration
 permissively
Date: Sun, 29 Nov 2020 12:41:42 +0100
Message-Id: <20201129114148.13772-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201129114148.13772-1-cezary.rojewski@intel.com>
References: <20201129114148.13772-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 tiwai@suse.com, broonie@kernel.org, mateusz.gorski@linux.intel.com
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

commit a66f88394a78fec9a05fa6e517e9603e8eca8363 upstream.

With _reset_link removed from the probe sequence, codec_mask at the time
skl_find_hda_machine() is invoked will always be 0, so hda machine will
never be chosen. Rather than reorganizing boot flow, be permissive about
invalid mask. codec_mask will be set to proper value during probe_work -
before skl_codec_create() ever gets called.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200305145314.32579-3-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: <stable@vger.kernel.org> # 5.4.x
---
 sound/soc/intel/skylake/skl.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 861c07417fed..f46b90ccb46f 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -480,13 +480,8 @@ static struct skl_ssp_clk skl_ssp_clks[] = {
 static struct snd_soc_acpi_mach *skl_find_hda_machine(struct skl_dev *skl,
 					struct snd_soc_acpi_mach *machines)
 {
-	struct hdac_bus *bus = skl_to_bus(skl);
 	struct snd_soc_acpi_mach *mach;
 
-	/* check if we have any codecs detected on bus */
-	if (bus->codec_mask == 0)
-		return NULL;
-
 	/* point to common table */
 	mach = snd_soc_acpi_intel_hda_machines;
 
-- 
2.17.1

