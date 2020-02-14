Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A02815DDAE
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 17:01:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E652165D;
	Fri, 14 Feb 2020 17:00:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E652165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581696063;
	bh=ob3dAmK4Aq86iruObOEZRnf9665yLA4IKnF1j/xUNWw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LFaKDeX8y35qbeLMphJ3TWcl95neAEF9mXifmFixHqyNUJU8Tn5MVvnF3jDEe7Pmq
	 56JFyLQWJBoQKHa9auUKYA4301QgOISI0vhS01x5G5yT7NiVXJ4f/7HWki98E7Dm9q
	 N7ty2KJIYHYeEXRtWQgEUyo2gcMl9P/YABooSjjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B51DFF8028C;
	Fri, 14 Feb 2020 16:56:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15C7AF8028C; Fri, 14 Feb 2020 16:56:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5299AF80264
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 16:56:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5299AF80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Gv9rPVjm"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F27942468A;
 Fri, 14 Feb 2020 15:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695769;
 bh=J12BU6v6skinvk/5A45oPZq3RlG0T1+MQhN1yxEUabk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gv9rPVjmDjoiKqXIE5xky5ey4+I/LevhhqDAn9AGzxXs3EaFTUMdMuEMx85R5QoJx
 6gfJXFqb13HmyZxGA7FW1GDSvEcPI8KEhw/R0KjrXb0BSi2BMO5KXWcOdq/cakBqMI
 VAS7/7k6bPOVkemFkaOnKdTBb/HJq52Ahen11kp0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 14 Feb 2020 10:45:27 -0500
Message-Id: <20200214154854.6746-335-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Paul Burton <paulburton@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH AUTOSEL 5.5 335/542] ASoC: txx9: Remove unused
	rtd variable
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Paul Burton <paulburton@kernel.org>

[ Upstream commit ec0f6a4c4a987aa20b2e77e0db2ae555276e45e6 ]

Commit a857e073ffc6 ("ASoC: txx9: txx9aclc: remove snd_pcm_ops") removed
the last use of the rtd variable but didn't remove its definition,
leading to the following warning/error for MIPS rbtx49xx_defconfig
builds:

sound/soc/txx9/txx9aclc.c: In function 'txx9aclc_pcm_hw_params':
sound/soc/txx9/txx9aclc.c:54:30: error: unused variable 'rtd'
    [-Werror=unused-variable]
  struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
                              ^~~

Resolve this by removing the unused variable.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Fixes: a857e073ffc6 ("ASoC: txx9: txx9aclc: remove snd_pcm_ops")
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Link: https://lore.kernel.org/r/20200109191422.334516-1-paulburton@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/txx9/txx9aclc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/txx9/txx9aclc.c b/sound/soc/txx9/txx9aclc.c
index 33c78d33e5a1d..9a55926ebf07b 100644
--- a/sound/soc/txx9/txx9aclc.c
+++ b/sound/soc/txx9/txx9aclc.c
@@ -51,7 +51,6 @@ static int txx9aclc_pcm_hw_params(struct snd_soc_component *component,
 				  struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct txx9aclc_dmadata *dmadata = runtime->private_data;
 	int ret;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
