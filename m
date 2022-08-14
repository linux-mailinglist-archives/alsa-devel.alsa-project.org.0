Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF227592386
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Aug 2022 18:22:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80EE086F;
	Sun, 14 Aug 2022 18:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80EE086F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660494148;
	bh=14BEbwuS/9GtFKmOQR6ugEwfl0StUNmna3JofOg1vEc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dbwWhsZUiyQM4fSIUqH3mKA/LPRVVUnB2IufP3biu9tx1kjTY+6V8qs21fy/cOXE5
	 q2LvL9CsXWIr+1lR5Y+kctd88L3aQ/oUENGMV7JIyNX5vrBoB66CKxO/9rAYdayEgR
	 lfKfw3vaODIfsid9evo0ju4f05uwpkY8FMOZefBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04F77F8055A;
	Sun, 14 Aug 2022 18:20:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85647F80559; Sun, 14 Aug 2022 18:20:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AEFFF80508;
 Sun, 14 Aug 2022 18:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AEFFF80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="StJS565K"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E42FDB80B3C;
 Sun, 14 Aug 2022 16:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C44C433D6;
 Sun, 14 Aug 2022 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660494020;
 bh=14BEbwuS/9GtFKmOQR6ugEwfl0StUNmna3JofOg1vEc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=StJS565KV8fnAvzIX1WgzwVhUhWcpxsw4gMlON9BxlXEv5yvbjdQPdUpoBo5/8Xau
 FBsSnEtguLfsy1n25+klHsDyk3feorfOSK/xb8e3Tw/AlUlNp146wSfOfYwAV7/QNB
 9yBQsKNqZmS2/tHquZnMIkpT25utdvsR61LXIeDW5vxhwuSSBGXWp1HWjFe7ziqcU+
 Dv/KhX/ysQUnfwao48QEyDEKbKekaO/QeYrmX42fHeKU4RQnKHRXpbSVpq8XgboWtb
 5NiBIfEESpNZfFlwcMwQ8BkgVplFPgTYy3QlIsq6WDg5GIDBC8x/l2PDVGcDHudasX
 FeqheuFrxzGTw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 13/48] ASoC: SOF: Intel: hda-ipc: Do not process
 IPC reply before firmware boot
Date: Sun, 14 Aug 2022 12:19:06 -0400
Message-Id: <20220814161943.2394452-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814161943.2394452-1-sashal@kernel.org>
References: <20220814161943.2394452-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, guennadi.liakhovetski@linux.intel.com,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 lgirdwood@gmail.com, rander.wang@intel.com, yung-chuan.liao@linux.intel.com,
 tiwai@suse.com, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 daniel.baluta@nxp.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

[ Upstream commit 499cc881b09c8283ab5e75b0d6d21cb427722161 ]

It is not yet clear, but it is possible to create a firmware so broken
that it will send a reply message before a FW_READY message (it is not
yet clear if FW_READY will arrive later).
Since the reply_data is allocated only after the FW_READY message, this
will lead to a NULL pointer dereference if not filtered out.

The issue was reported with IPC4 firmware but the same condition is present
for IPC3.

Reported-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20220712122357.31282-3-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/hda-ipc.c | 39 ++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index f08011249955..65e688f749ea 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -148,17 +148,23 @@ irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context)
 
 		if (primary & SOF_IPC4_MSG_DIR_MASK) {
 			/* Reply received */
-			struct sof_ipc4_msg *data = sdev->ipc->msg.reply_data;
+			if (likely(sdev->fw_state == SOF_FW_BOOT_COMPLETE)) {
+				struct sof_ipc4_msg *data = sdev->ipc->msg.reply_data;
 
-			data->primary = primary;
-			data->extension = extension;
+				data->primary = primary;
+				data->extension = extension;
 
-			spin_lock_irq(&sdev->ipc_lock);
+				spin_lock_irq(&sdev->ipc_lock);
 
-			snd_sof_ipc_get_reply(sdev);
-			snd_sof_ipc_reply(sdev, data->primary);
+				snd_sof_ipc_get_reply(sdev);
+				snd_sof_ipc_reply(sdev, data->primary);
 
-			spin_unlock_irq(&sdev->ipc_lock);
+				spin_unlock_irq(&sdev->ipc_lock);
+			} else {
+				dev_dbg_ratelimited(sdev->dev,
+						    "IPC reply before FW_READY: %#x|%#x\n",
+						    primary, extension);
+			}
 		} else {
 			/* Notification received */
 
@@ -225,16 +231,21 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 		 * place, the message might not yet be marked as expecting a
 		 * reply.
 		 */
-		spin_lock_irq(&sdev->ipc_lock);
+		if (likely(sdev->fw_state == SOF_FW_BOOT_COMPLETE)) {
+			spin_lock_irq(&sdev->ipc_lock);
 
-		/* handle immediate reply from DSP core */
-		hda_dsp_ipc_get_reply(sdev);
-		snd_sof_ipc_reply(sdev, msg);
+			/* handle immediate reply from DSP core */
+			hda_dsp_ipc_get_reply(sdev);
+			snd_sof_ipc_reply(sdev, msg);
 
-		/* set the done bit */
-		hda_dsp_ipc_dsp_done(sdev);
+			/* set the done bit */
+			hda_dsp_ipc_dsp_done(sdev);
 
-		spin_unlock_irq(&sdev->ipc_lock);
+			spin_unlock_irq(&sdev->ipc_lock);
+		} else {
+			dev_dbg_ratelimited(sdev->dev, "IPC reply before FW_READY: %#x\n",
+					    msg);
+		}
 
 		ipc_irq = true;
 	}
-- 
2.35.1

