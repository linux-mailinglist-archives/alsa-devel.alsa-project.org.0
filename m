Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E6739E1B9
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 18:14:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B95101685;
	Mon,  7 Jun 2021 18:13:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B95101685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623082470;
	bh=5TPLlNjg+rAFTrvhsrCBzcvPB6QcO6Yb61jNIL906sA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G2EAZ4pIAf7yzsjBnNaqeSqWloUvCuhl/JbjAtOaB1js3WQmUY0SRuUJylyEXY0//
	 jqYUJF3nllVdzQ1gHWlzncv7TKqf5UFpvDmHVjemCUJC+AEYa0slz58f611T7i4fpa
	 qrJRPVGYf9gwRHwE4NE7AaWxdWmSmYMcPO30ob/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C6EFF8026C;
	Mon,  7 Jun 2021 18:13:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E1FEF80212; Mon,  7 Jun 2021 18:13:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FEAFF801EC
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 18:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FEAFF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cNz5feNV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8232C613BD;
 Mon,  7 Jun 2021 16:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623082369;
 bh=5TPLlNjg+rAFTrvhsrCBzcvPB6QcO6Yb61jNIL906sA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cNz5feNVSsSvI7PArvBiWMJwUCHJ0o5H7/cOtWshLKmzlOa12S8qSpoM3UvVasSAU
 YdBdkKyAH1bJEW/ksmomNDvNIo0ab0cowwlViqdgGeAVXlE/z/cbWJzcBvsA4au2Ra
 0Cq6ucITCRXzd1O9Y/iSrVO1OjiQ7dW0Pw4E3iCma9AE2G7evyZqGUabCbFYrBga4m
 hiq9fpRY6mDRsYwOrbq2aRhuShsQFsQ+KqWzk0NhC0Pt2kcVI47tWF2nB6O7wn6rlP
 oUNb5YbL6qMsRsige7c/XiN8N9IbdWV437iZnkiwN35bzcK3hb4NoPv2UV53e2qRlW
 o79ywJyNw87Dg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 27/49] ALSA: hda: Add AlderLake-M PCI ID
Date: Mon,  7 Jun 2021 12:11:53 -0400
Message-Id: <20210607161215.3583176-27-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607161215.3583176-1-sashal@kernel.org>
References: <20210607161215.3583176-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

[ Upstream commit 4ad7935df6a566225c3d51900bde8f2f0f8b6de3 ]

Add HD Audio PCI ID for Intel AlderLake-M. Add rules to
snd_intel_dsp_find_config() to choose SOF driver for ADL-M systems with
PCH-DMIC or Soundwire codecs, and legacy driver for the rest.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20210528185123.48332-1-kai.vehmanen@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/hda/intel-dsp-config.c | 4 ++++
 sound/pci/hda/hda_intel.c    | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index ab5ff7867eb9..d8be146793ee 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -331,6 +331,10 @@ static const struct config_entry config_table[] = {
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x51c8,
 	},
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.device = 0x51cc,
+	},
 #endif
 
 };
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 79ade335c8a0..470753b36c8a 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2485,6 +2485,9 @@ static const struct pci_device_id azx_ids[] = {
 	/* Alderlake-P */
 	{ PCI_DEVICE(0x8086, 0x51c8),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
+	/* Alderlake-M */
+	{ PCI_DEVICE(0x8086, 0x51cc),
+	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Elkhart Lake */
 	{ PCI_DEVICE(0x8086, 0x4b55),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
-- 
2.30.2

