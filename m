Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C2686BB7
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 22:40:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7AAB1671;
	Thu,  8 Aug 2019 22:39:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7AAB1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565296838;
	bh=wRMjW5rwYl6FfxwEPWZHvzPQqPzcWCmHRbzGd03xFR0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SeiBw+t2VLJOIdHyugN/4wo1b/06rC8wBBz+YFZCKS/uqLDz43xG7E2s9Q25044UP
	 mb+f9DDuwNK+9nfzQkkPvrSE51MuU3fY8bN9I5nK9DnnMp+XLBkONGM4TypqMU6KeF
	 dF+imgfJhwsmI3l9mjTnBJ2XwTyOekjJO9GBroiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07D39F8063C;
	Thu,  8 Aug 2019 22:34:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B539CF805F6; Thu,  8 Aug 2019 22:33:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F092F8059F
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 22:33:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F092F8059F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="GMASBUbK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=iHaknR0UUoqHLhcxWG5LJud5sBgdGKuiy3FB14S8Fds=; b=GMASBUbKAHHu
 KhRSXYdxSpyKM/jTNfrXm2moKcsTB7bUmHZz8ZZ3fG0Gpdd6Itu8gp6FCOOaTnuuHhOzJ8wgcm1LT
 clKI8Hjark29ABWc++EM6U7KJo5pyOlVxtMho4vkLVaUgVXDnjFhAWXhgvOD4VK4ItGZSpiM9H5H1
 Plfjc=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvp6S-000416-3T; Thu, 08 Aug 2019 20:33:40 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id C25832742BDD; Thu,  8 Aug 2019 21:33:38 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20190808181549.12521-2-cezary.rojewski@intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190808203338.C25832742BDD@ypsilon.sirena.org.uk>
Date: Thu,  8 Aug 2019 21:33:38 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] Applied "ASoC: Intel: Skylake: Limit large_config_get
	to single frame" to the asoc tree
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

   ASoC: Intel: Skylake: Limit large_config_get to single frame

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

From 63e45324c284d240562a5b435afc4b23ae7d923c Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Thu, 8 Aug 2019 20:15:48 +0200
Subject: [PATCH] ASoC: Intel: Skylake: Limit large_config_get to single frame

Reply for the very first LARGE_CONFIG_GET request contains total size of
payload to be retrieved by host.
From then on, each subsequent reply carries buffer offset instead. As
looping is not covered by any real-life example, remove it and cleanup
the function for followup overhaul.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/20190808181549.12521-2-cezary.rojewski@intel.com
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/skylake/skl-sst-ipc.c | 37 +++++----------------------
 1 file changed, 7 insertions(+), 30 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skylake/skl-sst-ipc.c
index a2b69a02aab2..196c80dadb1f 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.c
+++ b/sound/soc/intel/skylake/skl-sst-ipc.c
@@ -973,8 +973,7 @@ int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
 {
 	struct skl_ipc_header header = {0};
 	struct sst_ipc_message request = {0}, reply = {0};
-	int ret = 0;
-	size_t sz_remaining, rx_size, data_offset;
+	int ret;
 
 	header.primary = IPC_MSG_TARGET(IPC_MOD_MSG);
 	header.primary |= IPC_MSG_DIR(IPC_MSG_REQUEST);
@@ -987,34 +986,12 @@ int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
 	header.extension |= IPC_FINAL_BLOCK(1);
 	header.extension |= IPC_INITIAL_BLOCK(1);
 
-	sz_remaining = msg->param_data_size;
-	data_offset = 0;
-
-	while (sz_remaining != 0) {
-		rx_size = sz_remaining > SKL_ADSP_W1_SZ
-				? SKL_ADSP_W1_SZ : sz_remaining;
-		if (rx_size == sz_remaining)
-			header.extension |= IPC_FINAL_BLOCK(1);
-
-		request.header = *(u64 *)(&header);
-		reply.data = ((char *)param) + data_offset;
-		reply.size = msg->param_data_size;
-		ret = sst_ipc_tx_message_wait(ipc, request, &reply);
-		if (ret < 0) {
-			dev_err(ipc->dev,
-				"ipc: get large config fail, err: %d\n", ret);
-			return ret;
-		}
-		sz_remaining -= rx_size;
-		data_offset = msg->param_data_size - sz_remaining;
-
-		/* clear the fields */
-		header.extension &= IPC_INITIAL_BLOCK_CLEAR;
-		header.extension &= IPC_DATA_OFFSET_SZ_CLEAR;
-		/* fill the fields */
-		header.extension |= IPC_INITIAL_BLOCK(1);
-		header.extension |= IPC_DATA_OFFSET_SZ(data_offset);
-	}
+	request.header = *(u64 *)(&header);
+	reply.data = param;
+	reply.size = msg->param_data_size;
+	ret = sst_ipc_tx_message_wait(ipc, request, &reply);
+	if (ret < 0)
+		dev_err(ipc->dev, "ipc: get large config fail, err: %d\n", ret);
 
 	return ret;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
