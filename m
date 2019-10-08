Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF22FCF78B
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 12:54:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55D6982B;
	Tue,  8 Oct 2019 12:53:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55D6982B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570532056;
	bh=ZCFlPpJaKizvo1FqmmaxCpB88gi8WJbxYSv9p0C29AE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=oGSz3QHN90tBIfgqMusn87+94V8/Z/eQEKMr4LbGukt6WaN0RAeiLfs8pBKr/o7Sq
	 Q4QgLM4r6cSkIrK5u6dHc0LANEzpDGRNlnEyGvfa59Nnqfo2cq7jOOcgM1Xkws4VaE
	 Qun465OdCRHESXmWBVpFTzBGcTu2YPXZgCD3oGoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92518F8038F;
	Tue,  8 Oct 2019 12:52:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89C1BF80447; Tue,  8 Oct 2019 12:52:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1650AF80322
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 12:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1650AF80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="LK5kW98p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=H7lh+AWXkJkKYtvaH82vN4KeDEGiFTNPJ+CxtZRgMF0=; b=LK5kW98pBTIc
 mCO1prLLF9UIoBr81ENVMaf6R85emPL1suoNSQsSrg5DVfmwxILI6QeWFyD3JelFJsSVy2eStKARc
 ZXVYfWnR0ps8lUDwu9LJOc9+GlKqIG7N2ddkZWkve6HFP+SZYY/YN5bMnRq9AOAML5R7s0VckOMxd
 9vtrg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHn6h-00083J-Eg; Tue, 08 Oct 2019 10:52:43 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id ED3C12742998; Tue,  8 Oct 2019 11:52:42 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190916214251.13130-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008105242.ED3C12742998@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 11:52:42 +0100 (BST)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, srinivas.kandagatla@linaro.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: support alternate list of
	machines" to the asoc tree
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

   ASoC: SOF: support alternate list of machines

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 1466327e8eb3e59ae8e65e5c728055102fe0a60e Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 16 Sep 2019 16:42:41 -0500
Subject: [PATCH] ASoC: SOF: support alternate list of machines

For cases where an interface can be pin-muxed, we need to assess at
probe time which configuration should be used. In cases such as
SoundWire, we need to maintain an alternate list of machines and walk
through them when the primary detection based on ACPI _HID fails.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190916214251.13130-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 4640566b54fe..479101736ee0 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -61,6 +61,9 @@ struct sof_dev_desc {
 	/* list of machines using this configuration */
 	struct snd_soc_acpi_mach *machines;
 
+	/* alternate list of machines using this configuration */
+	struct snd_soc_acpi_mach *alt_machines;
+
 	/* Platform resource indexes in BAR / ACPI resources. */
 	/* Must set to -1 if not used - add new items to end */
 	int resindex_lpe_base;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
