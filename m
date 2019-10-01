Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AD7C3F31
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 19:59:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79D551686;
	Tue,  1 Oct 2019 19:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79D551686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569952771;
	bh=ry5t+sl30AP48XGaxHGBTSLQzMvE1ojSaCss/vUC2eM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rGlTSt9N4Alyuh1CvqskbWbpghXVkrAhvjz/UtYlyBwVgU7jX+HyfuDyTpY0Icp6E
	 zgVHr9qRq+oC04Y8qXjZB61WygyGyc1UED7PmViWWGhw7Xx+Rt9L6BP9/5SwL69IQF
	 TzE8EO+gWgwyeX0z979WHsfmuKSM+QWY2kXGuztA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7870F8065D;
	Tue,  1 Oct 2019 19:56:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8D3FF8063B; Tue,  1 Oct 2019 19:56:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 398C7F80633
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 19:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 398C7F80633
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="xWZAMXNt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=MZFzrdDU+QC6CG3fZVqiYdlWg9uCLpejRSH+S8a6v3w=; b=xWZAMXNtbawK
 K+pd0z9Dkf8MDyftvultNupjvjOZAYwbpYuYpWkQElSUJ5umQdv+SyCa2F3/4ZvBji35wz+YWgrRd
 nIwJCzPRk6Bd4iFZZBO9cXdGqve9rfzE2Oj6+3JI4BXR1BKCddUFmBYcBdnAzn6YMKf+ZA9s1v1pk
 jxxgA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFMOE-0005sW-Py; Tue, 01 Oct 2019 17:56:46 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 4D7EA2742A30; Tue,  1 Oct 2019 18:56:46 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Marcin Rajwa <marcin.rajwa@linux.intel.com>
In-Reply-To: <20190927200538.660-9-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001175646.4D7EA2742A30@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 18:56:46 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: ipc: introduce no_stream_position
	in sof_ipc_stream_params struct" to the asoc tree
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

   ASoC: SOF: ipc: introduce no_stream_position in sof_ipc_stream_params struct

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

From e3ebfd0ab5b4880bfb6a9f32614c2e389cc3da56 Mon Sep 17 00:00:00 2001
From: Marcin Rajwa <marcin.rajwa@linux.intel.com>
Date: Fri, 27 Sep 2019 15:05:33 -0500
Subject: [PATCH] ASoC: SOF: ipc: introduce no_stream_position in
 sof_ipc_stream_params struct

The host period bytes value needs to be passed to firmware.
However current implementation uses this field for different
purpose - to indicate whether FW should send stream position
to the host. Therefore this patch introduces another field
"no_stream_position", a boolean value aimed to store information
about position tracking. This way host_period_bytes preserves its
original value.

Signed-off-by: Marcin Rajwa <marcin.rajwa@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190927200538.660-9-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof/stream.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/sof/stream.h b/include/sound/sof/stream.h
index 0b71b381b952..7facefb541b3 100644
--- a/include/sound/sof/stream.h
+++ b/include/sound/sof/stream.h
@@ -83,10 +83,10 @@ struct sof_ipc_stream_params {
 	uint16_t sample_valid_bytes;
 	uint16_t sample_container_bytes;
 
-	/* for notifying host period has completed - 0 means no period IRQ */
 	uint32_t host_period_bytes;
+	uint16_t no_stream_position; /**< 1 means don't send stream position */
 
-	uint32_t reserved[2];
+	uint16_t reserved[3];
 	uint16_t chmap[SOF_IPC_MAX_CHANNELS];	/**< channel map - SOF_CHMAP_ */
 } __packed;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
