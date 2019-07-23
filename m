Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9DC7172E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 13:35:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A00A61867;
	Tue, 23 Jul 2019 13:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A00A61867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563881714;
	bh=dy4P4Whi/rD/sIkT/f1r81R9tIT08ePhWdDsrVt1f5U=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UgChKy0AZawKQwscHp8kMTprbfgDLQdvhIMB7p1t+Hs7DrNm8ZpKHfxmTfdAOvFvs
	 tVONcu2EWygOkuw6FY+m7ORvc9TEoqZkPBlqxNZ7vQiHZbuW2kGaldBI9SA6CuRUSf
	 NgoQA6kzmN0zBEWlf1L8NOzyAwPr65bvX8vK5hp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF07CF80539;
	Tue, 23 Jul 2019 13:29:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA6C7F8049A; Tue, 23 Jul 2019 13:29:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4663BF8045D
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 13:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4663BF8045D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="cZGtJ716"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=o3dqKDx8rjaT83GYes3AM0/CwP/xxTBYZd3oG6F7W1c=; b=cZGtJ716PRBV
 Q2SUL+Y1hrs50YN4PF+OnqQdkfFkzEUm6ILsSb4hbdMMbOLrlWbQCSMGL//4xsuP5T9CCREIMRFDg
 rom0ejjyuUExDPwqD9X63pvzJEY7eZaeli2hbF6LMR9CDlKzJx98dHAM/JN3YmBjg9ts8lc0VQ7Mo
 rBwXs=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpsym-0003Ii-Ak; Tue, 23 Jul 2019 11:29:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B33922742B60; Tue, 23 Jul 2019 12:29:11 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Janusz Jankowski <janusz.jankowski@linux.intel.com>
In-Reply-To: <20190722141402.7194-22-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723112911.B33922742B60@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 12:29:11 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: ssp: BCLK delay parameter"
	to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: Intel: ssp: BCLK delay parameter

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 6298b78742be6593d372ed1b5bfa5397e1393595 Mon Sep 17 00:00:00 2001
From: Janusz Jankowski <janusz.jankowski@linux.intel.com>
Date: Mon, 22 Jul 2019 09:14:02 -0500
Subject: [PATCH] ASoC: SOF: Intel: ssp: BCLK delay parameter

Some codecs require BCLK to be on for some time, before sending
any data. SOF can enable BCLK and then wait for guaranteed time,
before starting DMA on SSP start.

Signed-off-by: Janusz Jankowski <janusz.jankowski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190722141402.7194-22-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof/dai-intel.h   | 3 +++
 include/uapi/sound/sof/abi.h    | 2 +-
 include/uapi/sound/sof/tokens.h | 1 +
 sound/soc/sof/topology.c        | 3 +++
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof/dai-intel.h b/include/sound/sof/dai-intel.h
index 4bb8ee138ba7..a81afd3fbd41 100644
--- a/include/sound/sof/dai-intel.h
+++ b/include/sound/sof/dai-intel.h
@@ -76,6 +76,9 @@ struct sof_ipc_dai_ssp_params {
 	uint16_t tdm_per_slot_padding_flag;
 	uint32_t clks_control;
 	uint32_t quirks;
+	uint32_t bclk_delay;	/* guaranteed time (ms) for which BCLK
+				 * will be driven, before sending data
+				 */
 } __packed;
 
 /* HDA Configuration Request - SOF_IPC_DAI_HDA_CONFIG */
diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index 4a9c24434f42..dff70a42445a 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -26,7 +26,7 @@
 
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
-#define SOF_ABI_MINOR 8
+#define SOF_ABI_MINOR 9
 #define SOF_ABI_PATCH 0
 
 /* SOF ABI version number. Format within 32bit word is MMmmmppp */
diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index dc1b27daaac6..6435240cef13 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -75,6 +75,7 @@
 #define SOF_TKN_INTEL_SSP_FRAME_PULSE_WIDTH	503
 #define SOF_TKN_INTEL_SSP_QUIRKS		504
 #define SOF_TKN_INTEL_SSP_TDM_PADDING_PER_SLOT	505
+#define SOF_TKN_INTEL_SSP_BCLK_DELAY		506
 
 /* DMIC */
 #define SOF_TKN_INTEL_DMIC_DRIVER_VERSION	600
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 432ae343f960..12b7d900b9c2 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -748,6 +748,9 @@ static const struct sof_topology_token ssp_tokens[] = {
 		get_token_u16,
 		offsetof(struct sof_ipc_dai_ssp_params,
 			 tdm_per_slot_padding_flag), 0},
+	{SOF_TKN_INTEL_SSP_BCLK_DELAY, SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		get_token_u32,
+		offsetof(struct sof_ipc_dai_ssp_params, bclk_delay), 0},
 
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
