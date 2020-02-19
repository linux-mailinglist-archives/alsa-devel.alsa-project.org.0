Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4BA165165
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 22:09:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BDB016CB;
	Wed, 19 Feb 2020 22:08:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BDB016CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582146581;
	bh=EZYbHQnDMEdppBm9YpYgGhJkhevTlhRwUOifdPPEyhM=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=J7p/VviFqV9+BqdEq3d20ny6Lo2CJgSMQ1FDciEBeDzTeTtuR/g9P7104sVr+kVmd
	 vRs257rTLE0ENTPKpYwoYmScCpGA4P/hX7ZwR5tM8MyzDV9gKIFkgLxTP75KT4h3r4
	 w1aEWM/+WR6ECENrlyzjIoU/4T/z3aeLp4nCldD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC06CF8034D;
	Wed, 19 Feb 2020 21:58:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1BD9F8034F; Wed, 19 Feb 2020 21:58:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B553CF8034B
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 21:58:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B553CF8034B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17CC2101E;
 Wed, 19 Feb 2020 12:58:13 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 901CD3F68F;
 Wed, 19 Feb 2020 12:58:12 -0800 (PST)
Date: Wed, 19 Feb 2020 20:58:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Applied "ASoC: intel: skl: Fix possible buffer overflow in debug
 outputs" to the asoc tree
In-Reply-To: <20200218111737.14193-3-tiwai@suse.de>
Message-Id: <applied-20200218111737.14193-3-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>
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

The patch

   ASoC: intel: skl: Fix possible buffer overflow in debug outputs

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 549cd0ba04dcfe340c349cd983bd440480fae8ee Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 18 Feb 2020 12:17:36 +0100
Subject: [PATCH] ASoC: intel: skl: Fix possible buffer overflow in debug
 outputs

The debugfs output of intel skl driver writes strings with multiple
snprintf() calls with the fixed size.  This was supposed to avoid the
buffer overflow but actually it still would, because snprintf()
returns the expected size to be output, not the actual output size.

Fix it by replacing snprintf() calls with scnprintf().

Fixes: d14700a01f91 ("ASoC: Intel: Skylake: Debugfs facility to dump module config")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/20200218111737.14193-3-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/skylake/skl-debug.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-debug.c b/sound/soc/intel/skylake/skl-debug.c
index 4c1703da1a6d..a15aa2ffa681 100644
--- a/sound/soc/intel/skylake/skl-debug.c
+++ b/sound/soc/intel/skylake/skl-debug.c
@@ -35,7 +35,7 @@ static ssize_t skl_print_pins(struct skl_module_pin *m_pin, char *buf,
 	ssize_t ret = 0;
 
 	for (i = 0; i < max_pin; i++) {
-		ret += snprintf(buf + size, MOD_BUF - size,
+		ret += scnprintf(buf + size, MOD_BUF - size,
 				"%s %d\n\tModule %d\n\tInstance %d\n\t"
 				"In-used %s\n\tType %s\n"
 				"\tState %d\n\tIndex %d\n",
@@ -53,7 +53,7 @@ static ssize_t skl_print_pins(struct skl_module_pin *m_pin, char *buf,
 static ssize_t skl_print_fmt(struct skl_module_fmt *fmt, char *buf,
 					ssize_t size, bool direction)
 {
-	return snprintf(buf + size, MOD_BUF - size,
+	return scnprintf(buf + size, MOD_BUF - size,
 			"%s\n\tCh %d\n\tFreq %d\n\tBit depth %d\n\t"
 			"Valid bit depth %d\n\tCh config %#x\n\tInterleaving %d\n\t"
 			"Sample Type %d\n\tCh Map %#x\n",
@@ -77,16 +77,16 @@ static ssize_t module_read(struct file *file, char __user *user_buf,
 	if (!buf)
 		return -ENOMEM;
 
-	ret = snprintf(buf, MOD_BUF, "Module:\n\tUUID %pUL\n\tModule id %d\n"
+	ret = scnprintf(buf, MOD_BUF, "Module:\n\tUUID %pUL\n\tModule id %d\n"
 			"\tInstance id %d\n\tPvt_id %d\n", mconfig->guid,
 			mconfig->id.module_id, mconfig->id.instance_id,
 			mconfig->id.pvt_id);
 
-	ret += snprintf(buf + ret, MOD_BUF - ret,
+	ret += scnprintf(buf + ret, MOD_BUF - ret,
 			"Resources:\n\tCPC %#x\n\tIBS %#x\n\tOBS %#x\t\n",
 			res->cpc, res->ibs, res->obs);
 
-	ret += snprintf(buf + ret, MOD_BUF - ret,
+	ret += scnprintf(buf + ret, MOD_BUF - ret,
 			"Module data:\n\tCore %d\n\tIn queue %d\n\t"
 			"Out queue %d\n\tType %s\n",
 			mconfig->core_id, mconfig->max_in_queue,
@@ -96,38 +96,38 @@ static ssize_t module_read(struct file *file, char __user *user_buf,
 	ret += skl_print_fmt(mconfig->in_fmt, buf, ret, true);
 	ret += skl_print_fmt(mconfig->out_fmt, buf, ret, false);
 
-	ret += snprintf(buf + ret, MOD_BUF - ret,
+	ret += scnprintf(buf + ret, MOD_BUF - ret,
 			"Fixup:\n\tParams %#x\n\tConverter %#x\n",
 			mconfig->params_fixup, mconfig->converter);
 
-	ret += snprintf(buf + ret, MOD_BUF - ret,
+	ret += scnprintf(buf + ret, MOD_BUF - ret,
 			"Module Gateway:\n\tType %#x\n\tVbus %#x\n\tHW conn %#x\n\tSlot %#x\n",
 			mconfig->dev_type, mconfig->vbus_id,
 			mconfig->hw_conn_type, mconfig->time_slot);
 
-	ret += snprintf(buf + ret, MOD_BUF - ret,
+	ret += scnprintf(buf + ret, MOD_BUF - ret,
 			"Pipeline:\n\tID %d\n\tPriority %d\n\tConn Type %d\n\t"
 			"Pages %#x\n", mconfig->pipe->ppl_id,
 			mconfig->pipe->pipe_priority, mconfig->pipe->conn_type,
 			mconfig->pipe->memory_pages);
 
-	ret += snprintf(buf + ret, MOD_BUF - ret,
+	ret += scnprintf(buf + ret, MOD_BUF - ret,
 			"\tParams:\n\t\tHost DMA %d\n\t\tLink DMA %d\n",
 			mconfig->pipe->p_params->host_dma_id,
 			mconfig->pipe->p_params->link_dma_id);
 
-	ret += snprintf(buf + ret, MOD_BUF - ret,
+	ret += scnprintf(buf + ret, MOD_BUF - ret,
 			"\tPCM params:\n\t\tCh %d\n\t\tFreq %d\n\t\tFormat %d\n",
 			mconfig->pipe->p_params->ch,
 			mconfig->pipe->p_params->s_freq,
 			mconfig->pipe->p_params->s_fmt);
 
-	ret += snprintf(buf + ret, MOD_BUF - ret,
+	ret += scnprintf(buf + ret, MOD_BUF - ret,
 			"\tLink %#x\n\tStream %#x\n",
 			mconfig->pipe->p_params->linktype,
 			mconfig->pipe->p_params->stream);
 
-	ret += snprintf(buf + ret, MOD_BUF - ret,
+	ret += scnprintf(buf + ret, MOD_BUF - ret,
 			"\tState %d\n\tPassthru %s\n",
 			mconfig->pipe->state,
 			mconfig->pipe->passthru ? "true" : "false");
@@ -137,7 +137,7 @@ static ssize_t module_read(struct file *file, char __user *user_buf,
 	ret += skl_print_pins(mconfig->m_out_pin, buf,
 			mconfig->max_out_queue, ret, false);
 
-	ret += snprintf(buf + ret, MOD_BUF - ret,
+	ret += scnprintf(buf + ret, MOD_BUF - ret,
 			"Other:\n\tDomain %d\n\tHomogeneous Input %s\n\t"
 			"Homogeneous Output %s\n\tIn Queue Mask %d\n\t"
 			"Out Queue Mask %d\n\tDMA ID %d\n\tMem Pages %d\n\t"
@@ -193,7 +193,7 @@ static ssize_t fw_softreg_read(struct file *file, char __user *user_buf,
 		__ioread32_copy(d->fw_read_buff, fw_reg_addr, w0_stat_sz >> 2);
 
 	for (offset = 0; offset < FW_REG_SIZE; offset += 16) {
-		ret += snprintf(tmp + ret, FW_REG_BUF - ret, "%#.4x: ", offset);
+		ret += scnprintf(tmp + ret, FW_REG_BUF - ret, "%#.4x: ", offset);
 		hex_dump_to_buffer(d->fw_read_buff + offset, 16, 16, 4,
 				   tmp + ret, FW_REG_BUF - ret, 0);
 		ret += strlen(tmp + ret);
-- 
2.20.1

