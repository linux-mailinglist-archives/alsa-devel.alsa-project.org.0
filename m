Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB8A3C320C
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:54:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C1CF173F;
	Sat, 10 Jul 2021 04:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C1CF173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625885657;
	bh=0qHn9VaHBqd6Gx7tq3pjOXAu9w80RSUBs+m5shv83k4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jCivPUttK6l4zKkcLA08TN5YdxCQXFJJE8nvacWRFcwD1tHZGoOKdLTQqKanwGp0z
	 fIU2L+Eb+PPnRhqcpdhdNiARy/Ucr9FX3r63gdLgvz5f1mCFA5rfntWqOc1bVd130f
	 gytL7sGbOQRrN2+jN7QWk11p3PvrBsk5RSa4u6jM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F029F804F1;
	Sat, 10 Jul 2021 04:39:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94A23F804E5; Sat, 10 Jul 2021 04:39:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C531EF80259
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C531EF80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Jr2eEt1f"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4998F613D3;
 Sat, 10 Jul 2021 02:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625884738;
 bh=0qHn9VaHBqd6Gx7tq3pjOXAu9w80RSUBs+m5shv83k4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Jr2eEt1fauIcxzsihfBx0FSUyGKwNM9JLH39EiSbNTr/6tkYASWluQqd7sC94S3WE
 8cchwjCFVA5FqS4B40r86dwR3yMELbAULxx3eG49WWnOXrmnwHPe/Tw8Z1msz+wb2T
 gkwcGf1P/gtDRMGZlTBDPTFdRitWdfSSY4PCthjnR9X8dWvoHOaUI2MuTjD01XlU4+
 S2cI9CEUkt80XxqBM6Ed/8JrI52wTnBJDK+1gVneNgrJ6KPYF8x+ZBQjLgTOPiAh7g
 fTsfp3Wk+VHiC30jh8aD1XnKZlYttFPmyi593/hHfPRqCrkoY6r5m28NogbLGXPzvp
 XLGQHdh9ZRt+Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 17/26] ASoC: soc-core: Fix the error return code
 in snd_soc_of_parse_audio_routing()
Date: Fri,  9 Jul 2021 22:35:55 -0400
Message-Id: <20210710023604.3172486-17-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710023604.3172486-1-sashal@kernel.org>
References: <20210710023604.3172486-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>
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

From: Zhen Lei <thunder.leizhen@huawei.com>

[ Upstream commit 7d3865a10b9ff2669c531d5ddd60bf46b3d48f1e ]

When devm_kcalloc() fails, the error code -ENOMEM should be returned
instead of -EINVAL.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
Link: https://lore.kernel.org/r/20210617103729.1918-1-thunder.leizhen@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 168559b5e9f3..0344d4423167 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3644,7 +3644,7 @@ int snd_soc_of_parse_audio_routing(struct snd_soc_card *card,
 	if (!routes) {
 		dev_err(card->dev,
 			"ASoC: Could not allocate DAPM route table\n");
-		return -EINVAL;
+		return -ENOMEM;
 	}
 
 	for (i = 0; i < num_routes; i++) {
-- 
2.30.2

