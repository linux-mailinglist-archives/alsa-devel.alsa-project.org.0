Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B996698620
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 21:48:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BA9CDEE;
	Wed, 15 Feb 2023 21:47:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BA9CDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676494092;
	bh=U9PmzKr2eX4knF7rwI3V5e5EUP5F/De1180ePJyKP9c=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H5Jx5TIIbGpaNCWzQEsEHVD5drtK36q8kNpGk6wRgByvVCIr4fFXuzpow1fneeLSB
	 NWMbcYQ1YYuWhHe+Sq4/nzj9DDi6AwM9uD948y+2Ic0AZHaMXTL9i5wfuFjSxz2qnp
	 FgTPR3qqT5j0q0wSBtGF0GhfchN6TkPYpqP0NIS4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80BBDF80496;
	Wed, 15 Feb 2023 21:46:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41D5CF800E4; Wed, 15 Feb 2023 21:46:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2599F800B6;
	Wed, 15 Feb 2023 21:46:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2599F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jF7V656l
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2F6B061D9B;
	Wed, 15 Feb 2023 20:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02526C4339B;
	Wed, 15 Feb 2023 20:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676493977;
	bh=U9PmzKr2eX4knF7rwI3V5e5EUP5F/De1180ePJyKP9c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jF7V656lZbwVXTsIFYFbPdilkqbipzJxVihXYWwXP4gD7TtKLv5S1TdSX8FjG28sa
	 ac47V5cyV+qfuPz+t2nKwL9/9HsVT0gSfExaYspNtEsTa2SLsVLKyFl7LANeOskl6l
	 8T+fYRvKtyJoSi3bIPt4wVAeAL8BZXdS5EfLIExdbssTaGkfMbi/LdZRLWFLQfqWEX
	 yFzem0Qf3LGJA2hFeeyXKFRIn9RQwdoD/Wu7voPwKbGpYoYoxQx1XLWXdgPLs7tcT1
	 ndxeiW65mh8qp61rO8J7A7x5v63+xouR/p5IC+BnicVUpABWz/q31Vpadq9+7glb6a
	 oKCH/pHJB0SFw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 16/24] ASoC: SOF: amd: Fix for handling spurious
 interrupts from DSP
Date: Wed, 15 Feb 2023 15:45:39 -0500
Message-Id: <20230215204547.2760761-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230215204547.2760761-1-sashal@kernel.org>
References: <20230215204547.2760761-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JOYKRITGOAB2EFS5DEWCS7W2C7XS3BRS
X-Message-ID-Hash: JOYKRITGOAB2EFS5DEWCS7W2C7XS3BRS
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com, tiwai@suse.com,
 AjitKumar.Pandey@amd.com, ajye_huang@compal.corp-partner.google.com,
 jiapeng.chong@linux.alibaba.com, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JOYKRITGOAB2EFS5DEWCS7W2C7XS3BRS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>

[ Upstream commit 2e7c6652f9b86c01cbd4e988057a746a3a461969 ]

As interrupts are Level-triggered,unless and until we deassert the register
the interrupts are generated which causes spurious interrupts unhandled.

Now we deasserted the interrupt at top half which solved the below
"nobody cared" warning.

warning reported in dmesg:
	irq 80: nobody cared (try booting with the "irqpoll" option)
	CPU: 5 PID: 2735 Comm: irq/80-AudioDSP
		Not tainted 5.15.86-15817-g4c19f3e06d49 #1 1bd3fd932cf58caacc95b0504d6ea1e3eab22289
	Hardware name: Google Skyrim/Skyrim, BIOS Google_Skyrim.15303.0.0 01/03/2023
	Call Trace:
	<IRQ>
	dump_stack_lvl+0x69/0x97
	 __report_bad_irq+0x3a/0xae
	note_interrupt+0x1a9/0x1e3
	handle_irq_event_percpu+0x4b/0x6e
	handle_irq_event+0x36/0x5b
	handle_fasteoi_irq+0xae/0x171
	 __common_interrupt+0x48/0xc4
	</IRQ>

	handlers:
	acp_irq_handler [snd_sof_amd_acp] threaded [<000000007e089f34>] acp_irq_thread [snd_sof_amd_acp]
	Disabling IRQ #80

Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
Link: https://lore.kernel.org/r/20230203123254.1898794-1-Vsujithkumar.Reddy@amd.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/amd/acp.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 36966643e36ab..8afd67ba1e5a3 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -316,7 +316,6 @@ static irqreturn_t acp_irq_thread(int irq, void *context)
 {
 	struct snd_sof_dev *sdev = context;
 	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
-	unsigned int base = desc->dsp_intr_base;
 	unsigned int val, count = ACP_HW_SEM_RETRY_COUNT;
 
 	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->ext_intr_stat);
@@ -326,28 +325,20 @@ static irqreturn_t acp_irq_thread(int irq, void *context)
 		return IRQ_HANDLED;
 	}
 
-	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET);
-	if (val & ACP_DSP_TO_HOST_IRQ) {
-		while (snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->hw_semaphore_offset)) {
-			/* Wait until acquired HW Semaphore lock or timeout */
-			count--;
-			if (!count) {
-				dev_err(sdev->dev, "%s: Failed to acquire HW lock\n", __func__);
-				return IRQ_NONE;
-			}
+	while (snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->hw_semaphore_offset)) {
+		/* Wait until acquired HW Semaphore lock or timeout */
+		count--;
+		if (!count) {
+			dev_err(sdev->dev, "%s: Failed to acquire HW lock\n", __func__);
+			return IRQ_NONE;
 		}
-
-		sof_ops(sdev)->irq_thread(irq, sdev);
-		val |= ACP_DSP_TO_HOST_IRQ;
-		snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET, val);
-
-		/* Unlock or Release HW Semaphore */
-		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->hw_semaphore_offset, 0x0);
-
-		return IRQ_HANDLED;
 	}
 
-	return IRQ_NONE;
+	sof_ops(sdev)->irq_thread(irq, sdev);
+	/* Unlock or Release HW Semaphore */
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->hw_semaphore_offset, 0x0);
+
+	return IRQ_HANDLED;
 };
 
 static irqreturn_t acp_irq_handler(int irq, void *dev_id)
@@ -358,8 +349,11 @@ static irqreturn_t acp_irq_handler(int irq, void *dev_id)
 	unsigned int val;
 
 	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET);
-	if (val)
+	if (val) {
+		val |= ACP_DSP_TO_HOST_IRQ;
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET, val);
 		return IRQ_WAKE_THREAD;
+	}
 
 	return IRQ_NONE;
 }
-- 
2.39.0

