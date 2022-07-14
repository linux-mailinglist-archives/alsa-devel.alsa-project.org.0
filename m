Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EF4574366
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:34:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89E1518EB;
	Thu, 14 Jul 2022 06:33:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89E1518EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657773278;
	bh=j+EoYSsZES5hhB5OM6SUrJyraaqpTYQoCYq/3DBqlug=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nUm45arju6Hi023m9BL1TTFbAis3boNWnQ5t8yhs2IwSvv6jZYKJFtSObB27gI6XY
	 ITt3s0LUTUjdm4vuiG/+abXCxULAaZffu23lbPN3dBFxEFi/wit+rxYDfzi5bMfLK8
	 bfHMDcmhSpC0owLfRYw9p6uc0jUODKX01hW6W3v8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF317F80641;
	Thu, 14 Jul 2022 06:25:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7338F8063C; Thu, 14 Jul 2022 06:25:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33A85F80621
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:25:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33A85F80621
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sF0W2LAY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D092461EBD;
 Thu, 14 Jul 2022 04:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D45C36AE3;
 Thu, 14 Jul 2022 04:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772705;
 bh=j+EoYSsZES5hhB5OM6SUrJyraaqpTYQoCYq/3DBqlug=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sF0W2LAYVABs7RRbAzB15KuwSBqfNn0f5OgFzYpwAwP9pUJZRlen1dmC0Pd4hRm+P
 2tpD0SoK7Np0YG4KKWYok3pvnKP6LQ9DPUg3J/1GaYdSKq/ag9K/UsJWyLveOWqt2i
 1FY1JXJw3eDH7Ysx5lE2zIDDR1f3VssXC243NFHr//T03CWU+Pzy4+I1BBK7hBNhXu
 bNqZxIHVIJ/CWGR4FLNGs01QEOxThW3vdoAWpkTUYuZGXBzr+PXMDGk8/+20aiWCqx
 p1eF+cJlDDpds/2WtB14u06aQa29AGURqTNzXfXm+Z4BBtQVAuDEuOwPQwf83SrFp3
 3xZqlucA/Cqzg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 14/28] ASoC: rt711-sdca: fix kernel NULL pointer
 dereference when IO error
Date: Thu, 14 Jul 2022 00:24:15 -0400
Message-Id: <20220714042429.281816-14-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042429.281816-1-sashal@kernel.org>
References: <20220714042429.281816-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, oder_chiou@realtek.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, Shuming Fan <shumingf@realtek.com>
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

From: Shuming Fan <shumingf@realtek.com>

[ Upstream commit 1df793d479bef546569fc2e409ff8bb3f0fb8e99 ]

The initial settings will be written before the codec probe function.
But, the rt711->component doesn't be assigned yet.
If IO error happened during initial settings operations, it will cause the kernel panic.
This patch changed component->dev to slave->dev to fix this issue.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20220621090719.30558-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt711-sdca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 9438fd264405..e99293b8fcf5 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -34,7 +34,7 @@ static int rt711_sdca_index_write(struct rt711_sdca_priv *rt711,
 
 	ret = regmap_write(regmap, addr, value);
 	if (ret < 0)
-		dev_err(rt711->component->dev,
+		dev_err(&rt711->slave->dev,
 			"Failed to set private value: %06x <= %04x ret=%d\n",
 			addr, value, ret);
 
@@ -50,7 +50,7 @@ static int rt711_sdca_index_read(struct rt711_sdca_priv *rt711,
 
 	ret = regmap_read(regmap, addr, value);
 	if (ret < 0)
-		dev_err(rt711->component->dev,
+		dev_err(&rt711->slave->dev,
 			"Failed to get private value: %06x => %04x ret=%d\n",
 			addr, *value, ret);
 
-- 
2.35.1

