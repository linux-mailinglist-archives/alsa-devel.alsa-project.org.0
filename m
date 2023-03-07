Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B29B66ADB18
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 10:54:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD08813F0;
	Tue,  7 Mar 2023 10:53:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD08813F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678182860;
	bh=M9FmpsOxtZZYxjio2PKomkQuihn9XyVOtjXXzZ8oSg8=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JttCJGqnv/VBFUS3B/BGpFH5AyAkCx6VHbA36P2vP4zg3XSoiIsO8Eo3efdnR6/0a
	 CrXE4UqDRn/kmdRnGquGfGRtJolevZ2i7dfm+V20NcQxvuQdHPS71pNf0dyEpPPUFJ
	 ly/H5e5VRYhoiHbt9IJHSEEwIM1Dea4iR5FLCObk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D274F8042F;
	Tue,  7 Mar 2023 10:53:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64564F80431; Tue,  7 Mar 2023 10:53:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AE27F800C9
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 10:53:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AE27F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=m5PQeArW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678182804; x=1709718804;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M9FmpsOxtZZYxjio2PKomkQuihn9XyVOtjXXzZ8oSg8=;
  b=m5PQeArWvOyQhrR1MeiUdAU8AaUDQJnOcuXqh6vqGmh8Hvz7ZHmpjddK
   C9b6srsKFlPktiT3nR8cKOAIsCPaJvnEvojvhKnp9VSL2QsMVuRG9pCg4
   jSXjIrHl+YLi0cSohlYWzmnT+05ocCV+500gBwW60bkBupcgKIWkZ4+l/
   8XwYSPh6SAykwfDnbG9WgzGK1aZ1Tih9diQtTiL0eZRWcU6DWYuYh6dEY
   fqfGWHfTv9QjNfD76w7mDTqO7hD/W7CAD0NJkESoKTSSwUJr2BsTIMS6o
   RTkFR6AqvcRIN+0RBdG28vx8esX6HIfaHSZOWevLI/ed02f9erj6vIVKb
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="334526858"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="334526858"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:53:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="819700012"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="819700012"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:53:19 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Intel: pci-tng: revert invalid bar size setting
Date: Tue,  7 Mar 2023 11:53:41 +0200
Message-Id: <20230307095341.3222-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VSJZKEA3CAOBAHZFKGG6M53RQAHGC7CE
X-Message-ID-Hash: VSJZKEA3CAOBAHZFKGG6M53RQAHGC7CE
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 fntoth@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VSJZKEA3CAOBAHZFKGG6M53RQAHGC7CE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The logic for the ioremap is to find the resource index 3 (IRAM) and
infer the BAR address by subtracting the IRAM offset. The BAR size
defined in hardware specifications is 2MB.

The commit 5947b2726beb6 ("ASoC: SOF: Intel: Check the bar size before
remapping") tried to find the BAR size by querying the resource length
instead of a pre-canned value, but by requesting the size for index 3
it only gets the size of the IRAM. That's obviously wrong and prevents
the probe from proceeding.

This commit attempted to fix an issue in a fuzzing/simulated
environment but created another on actual devices, so the best course
of action is to revert that change.

Reported-by: Ferry Toth <fntoth@gmail.com>
Tested-by: Ferry Toth <fntoth@gmail.com> (Intel Edison-Arduino)
Link: https://github.com/thesofproject/linux/issues/3901
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/pci-tng.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index 5b2b409752c5..8c22a00266c0 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -75,11 +75,7 @@ static int tangier_pci_probe(struct snd_sof_dev *sdev)
 
 	/* LPE base */
 	base = pci_resource_start(pci, desc->resindex_lpe_base) - IRAM_OFFSET;
-	size = pci_resource_len(pci, desc->resindex_lpe_base);
-	if (size < PCI_BAR_SIZE) {
-		dev_err(sdev->dev, "error: I/O region is too small.\n");
-		return -ENODEV;
-	}
+	size = PCI_BAR_SIZE;
 
 	dev_dbg(sdev->dev, "LPE PHY base at 0x%x size 0x%x", base, size);
 	sdev->bar[DSP_BAR] = devm_ioremap(sdev->dev, base, size);
-- 
2.39.2

