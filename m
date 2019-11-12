Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA61F9704
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 18:23:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32E121686;
	Tue, 12 Nov 2019 18:22:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32E121686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573579397;
	bh=I4CyaskhWrRC6N1FFAkrLImRrNPHMhI1hb/0zviP9hg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rm8UgvfkJGKZiv9jx7f1u2w9uSax9GGTXZRXyqEvKf50lYV0PDe1tH+K09P71/Nvf
	 R9QcWk7kq8a5WMYwRI1wwGobhJgNOrC+qnB6j/yK1j1mmpcUG0wcbJ11DZQOgcP5Wp
	 ta6nEVraP/VGNgqe+pXIrD9I5MsKb0jUfPfCuyUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3E15F80674;
	Tue, 12 Nov 2019 18:16:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C31D6F80611; Tue, 12 Nov 2019 18:16:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96C4BF80275
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 18:16:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96C4BF80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NgjRw9WU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=mnGIcQ1bpy4pqIshgjlu7kGFcVJzJvCCItFYnWM1CDk=; b=NgjRw9WUztU5
 Vp4TrMjvcfVx36ZUc28ALl8HE3LF37U6txVLilhuljlqQA4dsV135yJINAjc7oSdpGid0IKtWAclZ
 KuHz/I22/4nW5w2ku7hkLHeJsOeiOza4XpLMty6CrEKdUZxRtlZ9Sv2dzBSIIwpRYUUZZPOW9UV+I
 hobEM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUZm9-0008JJ-OS; Tue, 12 Nov 2019 17:16:21 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2076B27429FE; Tue, 12 Nov 2019 17:16:20 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191111222901.19892-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191112171620.2076B27429FE@ypsilon.sirena.org.uk>
Date: Tue, 12 Nov 2019 17:16:20 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: use fallback for
	firmware name" to the asoc tree
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

   ASoC: SOF: Intel: hda: use fallback for firmware name

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

From 0af237d51a4e734db959a158185f79019f022f59 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 11 Nov 2019 16:29:01 -0600
Subject: [PATCH] ASoC: SOF: Intel: hda: use fallback for firmware name

We have platforms such as CFL with no known I2S codec being used, and
the ACPI tables are currently empty, so fall-back to using the
firmware filename used in nocodec mode

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191111222901.19892-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 7dc0018dc4c3..91bd88fddac7 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -415,9 +415,16 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 			pdata->tplg_filename =
 				hda_mach->sof_tplg_filename;
 
-			/* firmware: pick the first in machine list */
+			/*
+			 * firmware: pick the first in machine list,
+			 * or use nocodec firmware name if list is empty
+			 */
 			mach = pdata->desc->machines;
-			pdata->fw_filename = mach->sof_fw_filename;
+			if (mach->id[0])
+				pdata->fw_filename = mach->sof_fw_filename;
+			else
+				pdata->fw_filename =
+					pdata->desc->nocodec_fw_filename;
 
 			dev_info(bus->dev, "using HDA machine driver %s now\n",
 				 hda_mach->drv_name);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
