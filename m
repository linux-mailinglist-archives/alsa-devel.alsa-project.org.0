Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24572C3F63
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 20:07:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8CDB168B;
	Tue,  1 Oct 2019 20:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8CDB168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569953271;
	bh=SCEVzD6mYq7NdDqlhaTWBx8KQJTEzfEEBFCOPxN0jGM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=r+cfzcpWMsSpNo9jhYu94paHE9WXJ9eQlkHrnyRzzcrAAI3oja1rBEDnnEoCR8QJi
	 V2yP4A3z05mUXRp3Y7PrPXPDgIwCO7P8ceawTbCMbpXlNyJtGq4Jvvo09ZasAdrvxt
	 I2H8XVEKZUnaDz0ySMDbwgvLB9a+vOaPrG3jV9t4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0338DF80746;
	Tue,  1 Oct 2019 19:57:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B609FF8067A; Tue,  1 Oct 2019 19:57:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8187F80635
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 19:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8187F80635
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="UIcKqSw8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=L5GbsH5Gzb7/sy59d8oCQzc2KOW4FETZgquRaXaau0M=; b=UIcKqSw8wOdw
 vRf4H5U0n7S0WiQrW4Vgk95O2n9Jkbi+WFqWzaExlFi63krzfLA3nWgYIjO4S2O7KzyVcBrCtZfYr
 SfEfk5kuiOujN4aURTks8hVBmQr8YVn5LecDE5YkygIt/K5foZRWxOUFAl7RkO6hWplv+A81srb9b
 XKu1Q=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFMOE-0005sT-Jh; Tue, 01 Oct 2019 17:56:46 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 166742742A10; Tue,  1 Oct 2019 18:56:46 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Marcin Rajwa <marcin.rajwa@linux.intel.com>
In-Reply-To: <20190927200538.660-10-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001175646.166742742A10@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 18:56:46 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: fix reset of
	host_period_bytes" to the asoc tree
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

   ASoC: SOF: Intel: hda: fix reset of host_period_bytes

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

From f567ff6c76f7e9b317248fcab7a0eb3ef432dc9e Mon Sep 17 00:00:00 2001
From: Marcin Rajwa <marcin.rajwa@linux.intel.com>
Date: Fri, 27 Sep 2019 15:05:34 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: fix reset of host_period_bytes

This patch prevents the reset of host period bytes
and uses no_stream_position to record requests
for stream position.

Signed-off-by: Marcin Rajwa <marcin.rajwa@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190927200538.660-10-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-pcm.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index 9b730f183529..575f5f5877d8 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -89,6 +89,7 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 	struct hdac_ext_stream *stream = stream_to_hdac_ext_stream(hstream);
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct snd_dma_buffer *dmab;
+	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
 	int ret;
 	u32 size, rate, bits;
 
@@ -116,9 +117,17 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 	/* disable SPIB, to enable buffer wrap for stream */
 	hda_dsp_stream_spib_config(sdev, stream, HDA_DSP_SPIB_DISABLE, 0);
 
-	/* set host_period_bytes to 0 if no IPC position */
-	if (hda && hda->no_ipc_position)
-		ipc_params->host_period_bytes = 0;
+	/* update no_stream_position flag for ipc params */
+	if (hda && hda->no_ipc_position) {
+		/* For older ABIs set host_period_bytes to zero to inform
+		 * FW we don't want position updates. Newer versions use
+		 * no_stream_position for this purpose.
+		 */
+		if (v->abi_version < SOF_ABI_VER(3, 10, 0))
+			ipc_params->host_period_bytes = 0;
+		else
+			ipc_params->no_stream_position = 1;
+	}
 
 	ipc_params->stream_tag = hstream->stream_tag;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
