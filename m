Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB2B490D38
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 18:01:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4738B16BF;
	Mon, 17 Jan 2022 18:01:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4738B16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642438911;
	bh=L5fMBsQ4GFTUWDax+L1PtBdZ0vB16WfrrFYjYR1GER4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lcCy7ZJInLXn4C6TeZirw9yGu1RLou+Q5IKLytpJqbAjay4LMt6FhLgpaFKkrp7R5
	 8PU2oEoRcEtC4m4XnVB6VrYiIk4hv2WC6waPfHeaL/b9DqKBDypdjLyEOp1ZMJ+IJ4
	 23427hwQb+dbiIetL/JRcGZB19U9yl+Q0xez37XQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68B21F80515;
	Mon, 17 Jan 2022 18:00:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D173AF80249; Mon, 17 Jan 2022 18:00:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CDE7F80515;
 Mon, 17 Jan 2022 18:00:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CDE7F80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c7jI1Ia6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9250C611C0;
 Mon, 17 Jan 2022 17:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6FA8C36AE7;
 Mon, 17 Jan 2022 17:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642438831;
 bh=L5fMBsQ4GFTUWDax+L1PtBdZ0vB16WfrrFYjYR1GER4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c7jI1Ia6bczbyFVopt/bG+gLCDOU+MocDsP74/x54DeZwWES3hD2XVk4Zc8wfeYUc
 sUYzq2upNamnlcSTuvba+oWp6HzEzForKtpulxYS9nernkl4200NQUbkBclnQJhY0J
 9FXhNsbURzU7rgijV6C482VpV0TWTyVUuZWGS/TzC7L0tNDtnq6ywQFoGOXbL1qCzM
 ni3nnwmkoTGSk+2hOcodcsgBDR8RWKElq6n+F36RWRqFEBCOH6inu+IrSPb7z7B2bd
 cUcjjopr+KXpvxBBz6c1GT5xQN0VKLTnuQiEyRAa3jnxiElpDC1HJCLmsYhAQe/IsO
 Q6LIAihaG/tUg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 38/52] ASoC: SOF: ipc: Add null pointer check for
 substream->runtime
Date: Mon, 17 Jan 2022 11:58:39 -0500
Message-Id: <20220117165853.1470420-38-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117165853.1470420-1-sashal@kernel.org>
References: <20220117165853.1470420-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, tiwai@suse.com,
 lgirdwood@gmail.com, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, daniel.baluta@nxp.com,
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

From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>

[ Upstream commit 182b682b9ab1348e07ea1bf9d8f2505cc67f9237 ]

When pcm stream is stopped "substream->runtime" pointer will be set
to NULL by ALSA core. In case host received an ipc msg from firmware
of type IPC_STREAM_POSITION after pcm stream is stopped, there will
be kernel NULL pointer exception in ipc_period_elapsed(). This patch
fixes it by adding NULL pointer check for "substream->runtime".

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20211216232422.345164-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/ipc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index e6c53c6c470e4..ca30c506a0fd6 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -547,7 +547,8 @@ static void ipc_period_elapsed(struct snd_sof_dev *sdev, u32 msg_id)
 
 	if (spcm->pcm.compress)
 		snd_sof_compr_fragment_elapsed(stream->cstream);
-	else if (!stream->substream->runtime->no_period_wakeup)
+	else if (stream->substream->runtime &&
+		 !stream->substream->runtime->no_period_wakeup)
 		/* only inform ALSA for period_wakeup mode */
 		snd_sof_pcm_period_elapsed(stream->substream);
 }
-- 
2.34.1

