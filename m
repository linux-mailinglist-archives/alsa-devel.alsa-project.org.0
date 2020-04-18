Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 004501AF059
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 16:51:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D4259F6;
	Sat, 18 Apr 2020 16:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D4259F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587221500;
	bh=/0/tKzES9ZCvf0Wg4Gocxj57HzdAkbrdH3u/I+MnG38=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=flYPGmlSblMbQ96o5VLrUc3nRnd+wVYDTsXzNZB7DMOALh8jwwaa6KtTRb3Um+t6w
	 p4TY7AoK0ZcY3CKCyLK5IZ0g6oYe8e27Wom47keP1SYwrYAcxAUXKQPlBYNYlDtSyH
	 lLE/QHzmnEOx0tby3mwHCZT25UTm+/P0Awwx9CMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57CA6F80338;
	Sat, 18 Apr 2020 16:42:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3141CF80337; Sat, 18 Apr 2020 16:42:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50AF4F8016F
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 16:42:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50AF4F8016F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uhoIauFe"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 14E2C22202;
 Sat, 18 Apr 2020 14:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587220959;
 bh=/0/tKzES9ZCvf0Wg4Gocxj57HzdAkbrdH3u/I+MnG38=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uhoIauFem9g/EqqRDTpMBeYL1FEEKdyNqA0dv4O5myaBoXv8sV2y1Z3p0sPoNbvdS
 KebkVBKc657uruoQhEj3xmIJdWcSwKg85s8FVp7qFwjeF0qgvib8MxhA4rOb5wkv8Y
 rz/ExioMhb1yLBkXC5zvHMHyqpDeizbpRnb8qko0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 10/47] ASoC: dpcm: allow start or stop during
 pause for backend
Date: Sat, 18 Apr 2020 10:41:50 -0400
Message-Id: <20200418144227.9802-10-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418144227.9802-1-sashal@kernel.org>
References: <20200418144227.9802-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 =?UTF-8?q?=EC=9D=B4=EA=B2=BD=ED=83=9D?= <gt82.lee@samsung.com>,
 Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 alsa-devel@alsa-project.org
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

From: 이경택 <gt82.lee@samsung.com>

[ Upstream commit 21fca8bdbb64df1297e8c65a746c4c9f4a689751 ]

soc_compr_trigger_fe() allows start or stop after pause_push.
In dpcm_be_dai_trigger(), however, only pause_release is allowed
command after pause_push.
So, start or stop after pause in compress offload is always
returned as error if the compress offload is used with dpcm.
To fix the problem, SND_SOC_DPCM_STATE_PAUSED should be allowed
for start or stop command.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Link: https://lore.kernel.org/r/004d01d607c1$7a3d5250$6eb7f6f0$@samsung.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-pcm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 356d4e754561b..a0d1ce0edaf9a 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2266,7 +2266,8 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 		switch (cmd) {
 		case SNDRV_PCM_TRIGGER_START:
 			if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_PREPARE) &&
-			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP))
+			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP) &&
+			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
 				continue;
 
 			ret = dpcm_do_trigger(dpcm, be_substream, cmd);
@@ -2296,7 +2297,8 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
 		case SNDRV_PCM_TRIGGER_STOP:
-			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
+			if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_START) &&
+			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
 				continue;
 
 			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
-- 
2.20.1

