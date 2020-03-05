Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BCB17A843
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 15:55:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 635411685;
	Thu,  5 Mar 2020 15:54:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 635411685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583420128;
	bh=PTpb9o5HAmDq8LtkulMJMoZqna2S892pR9rATttn43U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UFfrfnCU0jKmMqPcsBaX381QMnU9AY0+3ZNYrS5Z0Xap3qlZaya9hf4YhANjb82eZ
	 Vnzzc2Sx98BqkHsyM863igSzWRJVvxVck1MqBm+7UiFGOOPdBwtKCtSQm5UFFV/5Mn
	 cawqHKll8NkLOkYE/GCIgdImZ9crRpUERc267s/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF345F80266;
	Thu,  5 Mar 2020 15:53:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0545F8028C; Thu,  5 Mar 2020 15:53:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2D3BF8012D
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 15:53:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2D3BF8012D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 06:53:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="352372592"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2020 06:53:39 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/7] ASoC: Intel: Skylake: Select hda configuration
 permissively
Date: Thu,  5 Mar 2020 15:53:09 +0100
Message-Id: <20200305145314.32579-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200305145314.32579-1-cezary.rojewski@intel.com>
References: <20200305145314.32579-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, vkoul@kernel.org, broonie@kernel.org
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

With _reset_link removed from the probe sequence, codec_mask at the time
skl_find_hda_machine() is invoked will always be 0, so hda machine will
never be chosen. Rather than reorganizing boot flow, be permissive about
invalid mask. codec_mask will be set to proper value during probe_work -
before skl_codec_create() ever gets called.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index d66231525356..4827fe6bc1cb 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -481,13 +481,8 @@ static struct skl_ssp_clk skl_ssp_clks[] = {
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

