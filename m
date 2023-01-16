Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D69AB66C12F
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 15:08:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B03156FD;
	Mon, 16 Jan 2023 15:07:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B03156FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673878109;
	bh=yc5OYjMqNcPoUPNOcHjmUyy1SW2ocbOgpitqHAhQQrc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SmdsgZK2RC3lDJdjhuBmLezx05IiBTiViBgCaS1/v1YpgbVtEF6dNNsoewN28sfOt
	 mxqnorII5+tOqCS9F50mjv+1F7yufOS80ea8JEWBf8P3QYvKUd5IhWSY4s1sNQDf5q
	 SMPSUByblx8CG0m/VgMoZEe/1pyIx+UbWWWsWOfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F27FF805AC;
	Mon, 16 Jan 2023 15:05:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76690F805A0; Mon, 16 Jan 2023 15:05:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4E61F80482
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 15:05:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4E61F80482
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aODN7lTz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9F41B60FCA;
 Mon, 16 Jan 2023 14:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED55C43392;
 Mon, 16 Jan 2023 14:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673877936;
 bh=yc5OYjMqNcPoUPNOcHjmUyy1SW2ocbOgpitqHAhQQrc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aODN7lTzhhNBPHx0mrjxEIk/YzzpP1l2FzujXpJrMVFdCxjbIDC51x7SjWizxLaKq
 5XQZs5UQF2omHaXjM+9RVB/ofxvtT6fCJK5ElipFfOBbAIRiNltLAk9lfJqf77TB9F
 dyOhchbzwJhtBZk0L0ylWGIt0clvyyOJ3w/qifCtuc0eR4rrkqvPV9Tr8ztNQW9lTS
 twRw4yxmMW47K0ygIDgfJdkCKXSzeQtJUWVI4zI8YUN5CjT6OCM4tTm+xch1ZXI18H
 BXHC928SQhQyZeoaIxPAat/f7DdWL+MvpWHTOnL6UrUzN0aiQzeYX04ZjzSZmS4J93
 LT07Gdva5qdtg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 08/16] ASoC: fsl-asoc-card: Fix naming of AC'97
 CODEC widgets
Date: Mon, 16 Jan 2023 09:05:11 -0500
Message-Id: <20230116140520.116257-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230116140520.116257-1-sashal@kernel.org>
References: <20230116140520.116257-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Mark Brown <broonie@kernel.org>

[ Upstream commit 242fc66ae6e1e2b8519daacc7590a73cd0e8a6e4 ]

The fsl-asoc-card AC'97 support currently tries to route to Playback and
Capture widgets provided by the AC'97 CODEC. This doesn't work since the
generic AC'97 driver registers with an "AC97" at the front of the stream
and hence widget names, update to reflect reality. It's not clear to me
if or how this ever worked.

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20230106-asoc-udoo-probe-v1-2-a5d7469d4f67@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl-asoc-card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index d78eb9f9d24c..db663e7d17a4 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -112,8 +112,8 @@ static const struct snd_soc_dapm_route audio_map[] = {
 
 static const struct snd_soc_dapm_route audio_map_ac97[] = {
 	/* 1st half -- Normal DAPM routes */
-	{"Playback",  NULL, "CPU AC97 Playback"},
-	{"CPU AC97 Capture",  NULL, "Capture"},
+	{"AC97 Playback",  NULL, "CPU AC97 Playback"},
+	{"CPU AC97 Capture",  NULL, "AC97 Capture"},
 	/* 2nd half -- ASRC DAPM routes */
 	{"CPU AC97 Playback",  NULL, "ASRC-Playback"},
 	{"ASRC-Capture",  NULL, "CPU AC97 Capture"},
-- 
2.35.1

