Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFB144BF2
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 21:16:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3F151883;
	Thu, 13 Jun 2019 21:15:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3F151883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560453392;
	bh=FzM3tBmfSR+KlG5CI2K9saa3YVmWGLXTKxstjv5+tVY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CeILAIEapaVjQxfWXojGZOlcqTRRAqN3QVPk2caSVmxrLp8shisMPrbZzfFjZXaiM
	 oLUJVrWZWVMN1NvWUkMJBEamXBH59lvBH8HTsp23nuJT0qQgxgrX8iKIh7WwZ8TZ+5
	 zoOSdon5G0jSkhr+UqyejfANeiqFjyx1N+ucwGuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 101DAF8977E;
	Thu, 13 Jun 2019 21:06:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 068DCF89776; Thu, 13 Jun 2019 21:06:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57C8AF8975D
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 21:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57C8AF8975D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ekhIZJyf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=giHDYW2zx11R37WW3bVNPHXBkHLS75Q8GyWbBH05OBQ=; b=ekhIZJyfHhuZ
 +7bxNfANtuf7WyHZb2CSg/Dt8lMYpi4jVCz8RDyYb4OfwDfHEc9yYA1Sfc/vV08h4e2DefVa7oJNG
 +j3fJmBxZkZkWiOosI42+pAh6oj1sW7U3NLXyOC8MkbJl6NDT3H4nMdt8FAZ+1b8tvd6ps6gF/6zI
 nA4YI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbV32-0005S5-43; Thu, 13 Jun 2019 19:06:08 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id A5CF7440046; Thu, 13 Jun 2019 20:06:07 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190612165705.1858-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190613190607.A5CF7440046@finisterre.sirena.org.uk>
Date: Thu, 13 Jun 2019 20:06:07 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: uapi: align comments with firmware
	files" to the asoc tree
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

   ASoC: SOF: uapi: align comments with firmware files

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From b943f798011346589bd9ae994e5755e776756a31 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Wed, 12 Jun 2019 11:57:02 -0500
Subject: [PATCH] ASoC: SOF: uapi: align comments with firmware files

No functional change, just mirror firmware comment changes

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof/topology.h | 4 ++--
 include/sound/sof/trace.h    | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
index 4978999fd362..41dcabf89899 100644
--- a/include/sound/sof/topology.h
+++ b/include/sound/sof/topology.h
@@ -84,9 +84,9 @@ struct sof_ipc_buffer {
 struct sof_ipc_comp_config {
 	struct sof_ipc_cmd_hdr hdr;
 	uint32_t periods_sink;	/**< 0 means variable */
-	uint32_t periods_source;	/**< 0 means variable */
+	uint32_t periods_source;/**< 0 means variable */
 	uint32_t reserved1;	/**< reserved */
-	uint32_t frame_fmt;		/**< SOF_IPC_FRAME_ */
+	uint32_t frame_fmt;	/**< SOF_IPC_FRAME_ */
 	uint32_t xrun_action;
 
 	/* reserved for future use */
diff --git a/include/sound/sof/trace.h b/include/sound/sof/trace.h
index 2187ff7d07ce..9257d5473d97 100644
--- a/include/sound/sof/trace.h
+++ b/include/sound/sof/trace.h
@@ -66,7 +66,9 @@ struct sof_ipc_dma_trace_posn {
 #define SOF_IPC_PANIC_WFI			(SOF_IPC_PANIC_MAGIC | 0xa)
 #define SOF_IPC_PANIC_ASSERT			(SOF_IPC_PANIC_MAGIC | 0xb)
 
-/* panic info include filename and line number */
+/* panic info include filename and line number
+ * filename array will not include null terminator if fully filled
+ */
 struct sof_ipc_panic_info {
 	struct sof_ipc_hdr hdr;
 	uint32_t code;			/* SOF_IPC_PANIC_ */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
