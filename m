Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C371D86BD1
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 22:43:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 607AD1667;
	Thu,  8 Aug 2019 22:42:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 607AD1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565297009;
	bh=2gnmscM+BMJMgAqOH0S4323YvMzXjwjA6lVsJJ8I0mY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=VltymtUlWvcDKn/qkFAUfhoYCYDae8litwI5we/MhKvI8ennRh1alLZsEhozKyhGd
	 qIbjcbNysT5fjgh9oxwAVJVq0zhlRhBe2gmOtUDGKANPTeJqhR+Xcw9gb60oiyhmc2
	 IbYQyxHqTbEygDOZMSqMbjRt2z1oVoBNOnTLUbN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D49B9F806E9;
	Thu,  8 Aug 2019 22:34:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36671F805A1; Thu,  8 Aug 2019 22:33:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 129D4F805AA
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 22:33:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 129D4F805AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Rj+E8oav"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=10rHvmEnpSBjRJ7mH7iwqqdv0OB/ZXwV8nDIH0lZE5k=; b=Rj+E8oav4SG3
 87LlAI1HS4qRJCR3jpT7czioD8HOCFE06Iw7bfd+blijyAGpAkAI9tbEsz+DYHHX34EOUIkdHoaUq
 vpNQqtfcIL4JVJ6UuM7ouZwMfuHEimz6EmZgXYWN1qq5qLP3wk5pzFV6WaJXwEhhkcUF1XdHQ8I57
 fVfko=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvp6R-000415-B2; Thu, 08 Aug 2019 20:33:39 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 8AA872742B42; Thu,  8 Aug 2019 21:33:38 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20190808181549.12521-3-cezary.rojewski@intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190808203338.8AA872742B42@ypsilon.sirena.org.uk>
Date: Thu,  8 Aug 2019 21:33:38 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] Applied "ASoC: Intel: Skylake: large_config_get
	overhaul" to the asoc tree
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

   ASoC: Intel: Skylake: large_config_get overhaul

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

From 36004c42c761a6d95b867a4fbb9a955034e53351 Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Thu, 8 Aug 2019 20:15:49 +0200
Subject: [PATCH] ASoC: Intel: Skylake: large_config_get overhaul

LARGE_CONFIG_GET is mainly used to retrieve requested module parameters
but it may also carry TX payload with them. Update its implementation to
account for both TX and RX data.
First reply.header carries total payload size within data_off_sizefield.
Make use of reply.header to realloc returned buffer with correct size.

Failure of IPC request is permissive - error-payload may be returned, an
informative data why GET for given param failed - and thus function
should not collapse before entire processing is finished. Caller is
responsible for checking returned payload and bytes parameters.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/20190808181549.12521-3-cezary.rojewski@intel.com
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/skylake/skl-messages.c |  3 ++-
 sound/soc/intel/skylake/skl-sst-ipc.c  | 25 ++++++++++++++++++++-----
 sound/soc/intel/skylake/skl-sst-ipc.h  |  3 ++-
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index e8cc710f092b..84f0e6f58eb5 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -1379,11 +1379,12 @@ int skl_get_module_params(struct skl_dev *skl, u32 *params, int size,
 			  u32 param_id, struct skl_module_cfg *mcfg)
 {
 	struct skl_ipc_large_config_msg msg;
+	size_t bytes = size;
 
 	msg.module_id = mcfg->id.module_id;
 	msg.instance_id = mcfg->id.pvt_id;
 	msg.param_data_size = size;
 	msg.large_param_id = param_id;
 
-	return skl_ipc_get_large_config(&skl->ipc, &msg, params);
+	return skl_ipc_get_large_config(&skl->ipc, &msg, &params, &bytes);
 }
diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skylake/skl-sst-ipc.c
index 196c80dadb1f..667cdddc289f 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.c
+++ b/sound/soc/intel/skylake/skl-sst-ipc.c
@@ -969,12 +969,18 @@ int skl_ipc_set_large_config(struct sst_generic_ipc *ipc,
 EXPORT_SYMBOL_GPL(skl_ipc_set_large_config);
 
 int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
-		struct skl_ipc_large_config_msg *msg, u32 *param)
+		struct skl_ipc_large_config_msg *msg,
+		u32 **payload, size_t *bytes)
 {
 	struct skl_ipc_header header = {0};
-	struct sst_ipc_message request = {0}, reply = {0};
+	struct sst_ipc_message request, reply = {0};
+	unsigned int *buf;
 	int ret;
 
+	reply.data = kzalloc(SKL_ADSP_W1_SZ, GFP_KERNEL);
+	if (!reply.data)
+		return -ENOMEM;
+
 	header.primary = IPC_MSG_TARGET(IPC_MOD_MSG);
 	header.primary |= IPC_MSG_DIR(IPC_MSG_REQUEST);
 	header.primary |= IPC_GLB_TYPE(IPC_MOD_LARGE_CONFIG_GET);
@@ -986,13 +992,22 @@ int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
 	header.extension |= IPC_FINAL_BLOCK(1);
 	header.extension |= IPC_INITIAL_BLOCK(1);
 
-	request.header = *(u64 *)(&header);
-	reply.data = param;
-	reply.size = msg->param_data_size;
+	request.header = *(u64 *)&header;
+	request.data = *payload;
+	request.size = *bytes;
+	reply.size = SKL_ADSP_W1_SZ;
+
 	ret = sst_ipc_tx_message_wait(ipc, request, &reply);
 	if (ret < 0)
 		dev_err(ipc->dev, "ipc: get large config fail, err: %d\n", ret);
 
+	reply.size = (reply.header >> 32) & IPC_DATA_OFFSET_SZ_MASK;
+	buf = krealloc(reply.data, reply.size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+	*payload = buf;
+	*bytes = reply.size;
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(skl_ipc_get_large_config);
diff --git a/sound/soc/intel/skylake/skl-sst-ipc.h b/sound/soc/intel/skylake/skl-sst-ipc.h
index 93af08cf41d2..08ac31778325 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.h
+++ b/sound/soc/intel/skylake/skl-sst-ipc.h
@@ -139,7 +139,8 @@ int skl_ipc_set_large_config(struct sst_generic_ipc *ipc,
 		struct skl_ipc_large_config_msg *msg, u32 *param);
 
 int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
-		struct skl_ipc_large_config_msg *msg, u32 *param);
+		struct skl_ipc_large_config_msg *msg,
+		u32 **payload, size_t *bytes);
 
 int skl_sst_ipc_load_library(struct sst_generic_ipc *ipc,
 			u8 dma_id, u8 table_id, bool wait);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
