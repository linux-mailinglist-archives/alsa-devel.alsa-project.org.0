Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A47741FE170
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:55:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38FF91729;
	Thu, 18 Jun 2020 03:54:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38FF91729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592445336;
	bh=Bt6ZEXdLA0UnS2fNEifmKdZSL9+XTRkjajHnMGGenKM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vu3Cduoudq2zyK3KNCxkklbqRKHQoxv0UhRa2XlLSERJdk5+IW4mCvw3ab97qbvG4
	 weIHUHSduP8Sd+85AB9kUU3tcRZ4DzEIcpiqSy/LpwdBpa3qUPbCaoJYwqf+/+rLXt
	 DknooF53Se3CgtuQu+mZxmN3S2zBNxlBOorg6vJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CE84F80392;
	Thu, 18 Jun 2020 03:25:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 977ACF8038C; Thu, 18 Jun 2020 03:25:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40EB0F8038C
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 03:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40EB0F8038C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iTw7J4K1"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B76322088E;
 Thu, 18 Jun 2020 01:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443548;
 bh=Bt6ZEXdLA0UnS2fNEifmKdZSL9+XTRkjajHnMGGenKM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iTw7J4K1Y63ecV/Mi5hCQnKPsZpmXRGFvzO3/2vtVYHl4OvtLSCh638ZD7Oi0oXtx
 tQ50rNkbHRIx2Bv1hrpdpk5x4+wF6ijgvJXoKNTA6SS4LyLQRLN5eaKvzCrDr1iZas
 gejYXLNAEfSsE8qjlTul4WAB+TjfNc1hd486taoo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 164/172] ASoC: core: only convert non DPCM link
 to DPCM link
Date: Wed, 17 Jun 2020 21:22:10 -0400
Message-Id: <20200618012218.607130-164-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618012218.607130-1-sashal@kernel.org>
References: <20200618012218.607130-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

[ Upstream commit 607fa205a7e4dfad28b8a67ab1c985756ddbccb0 ]

Additional checks for valid DAIs expose a corner case, where existing
BE dailinks get modified, e.g. HDMI links are tagged with
dpcm_capture=1 even if the DAIs are for playback.

This patch makes those changes conditional and flags configuration
issues when a BE dailink is has no_pcm=0 but dpcm_playback or
dpcm_capture=1 (which makes no sense).

As discussed on the alsa-devel mailing list, there are redundant flags
for dpcm_playback, dpcm_capture, playback_only, capture_only. This
will have to be cleaned-up in a future update. For now only correct
and flag problematic configurations.

Fixes: 218fe9b7ec7f3 ("ASoC: soc-core: Set dpcm_playback / dpcm_capture")
Suggested-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20200608194415.4663-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-core.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e45dfcb62b6a..595fe20bbc6d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1920,9 +1920,25 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 			dai_link->platform_name = component->name;
 
 			/* convert non BE into BE */
-			dai_link->no_pcm = 1;
-			dai_link->dpcm_playback = 1;
-			dai_link->dpcm_capture = 1;
+			if (!dai_link->no_pcm) {
+				dai_link->no_pcm = 1;
+
+				if (dai_link->dpcm_playback)
+					dev_warn(card->dev,
+						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_playback=1\n",
+						 dai_link->name);
+				if (dai_link->dpcm_capture)
+					dev_warn(card->dev,
+						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_capture=1\n",
+						 dai_link->name);
+
+				/* convert normal link into DPCM one */
+				if (!(dai_link->dpcm_playback ||
+				      dai_link->dpcm_capture)) {
+					dai_link->dpcm_playback = !dai_link->capture_only;
+					dai_link->dpcm_capture = !dai_link->playback_only;
+				}
+			}
 
 			/* override any BE fixups */
 			dai_link->be_hw_params_fixup =
-- 
2.25.1

