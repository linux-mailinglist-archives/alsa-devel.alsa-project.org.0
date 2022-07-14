Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 952C05743C9
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:40:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 385B31A94;
	Thu, 14 Jul 2022 06:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 385B31A94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657773610;
	bh=XqlTd4nTiZWMDUpAlCHbBSebnj0dDtBFRM1zS2k8yng=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K2JGma51jjdVGLL2eYuj/TQ/mEc30tjPgmRhFpj0xfi4eJmW7q/KrbJELvB3wInKJ
	 ti8t58p2Cb2R9V65TwK5bR5PkydGbEUHimTxWB6fmpaIzdsW1hNKF3V44KhSqTvE+I
	 Kmtd/gjV3MctEOy7lFjkCej0iIPdhOfs7h+2iaNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9A6FF806F7;
	Thu, 14 Jul 2022 06:26:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFA7DF805B5; Thu, 14 Jul 2022 06:26:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FAD1F805BF
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FAD1F805BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Fn3+jHct"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 64F10CE24F8;
 Thu, 14 Jul 2022 04:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCFF5C34114;
 Thu, 14 Jul 2022 04:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772799;
 bh=XqlTd4nTiZWMDUpAlCHbBSebnj0dDtBFRM1zS2k8yng=;
 h=From:To:Cc:Subject:Date:From;
 b=Fn3+jHct+LX0xrawNMPbu6bEtJTeGXtwTlumoEIBwMhBdKQa480h14LxI06QdvPKk
 SHriekNS8J4Ggy5P7IyMqwfolwwWLGTyn14fNNdiuZFK9t/pA3CwnAd9rACeyF2mYd
 9utzOEwz7l7m2gvxYGKxSCszcpaAs/+MEHWws5wMQ+wqHosl2aHH0rte9jGjBgiUBc
 IvFyd3KgbE6F6Q1mI4+JkO4L2mHdlJRhZQYIczO65kh74NqivigWRbkTVs/b32skf2
 kH/DVa1TclN9AyfWV6Qa7169ZUL7SkUBQbS1z00LQ1oyZSybGN7AvyENB9Y7uA9OZe
 n4oXnsGm6QuWQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 1/6] ASoC: ops: Fix off by one in range control
 validation
Date: Thu, 14 Jul 2022 00:26:31 -0400
Message-Id: <20220714042637.282511-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>
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

From: Mark Brown <broonie@kernel.org>

[ Upstream commit 5871321fb4558c55bf9567052b618ff0be6b975e ]

We currently report that range controls accept a range of 0..(max-min) but
accept writes in the range 0..(max-min+1). Remove that extra +1.

Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20220604105246.4055214-1-broonie@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-ops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 7a37312c8e0c..453b61b42dd9 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -530,7 +530,7 @@ int snd_soc_put_volsw_range(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	if (mc->platform_max && tmp > mc->platform_max)
 		return -EINVAL;
-	if (tmp > mc->max - mc->min + 1)
+	if (tmp > mc->max - mc->min)
 		return -EINVAL;
 
 	if (invert)
@@ -551,7 +551,7 @@ int snd_soc_put_volsw_range(struct snd_kcontrol *kcontrol,
 			return -EINVAL;
 		if (mc->platform_max && tmp > mc->platform_max)
 			return -EINVAL;
-		if (tmp > mc->max - mc->min + 1)
+		if (tmp > mc->max - mc->min)
 			return -EINVAL;
 
 		if (invert)
-- 
2.35.1

