Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E146C3C2FF7
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:39:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 807001709;
	Sat, 10 Jul 2021 04:38:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 807001709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625884772;
	bh=BAx2GDapydcayVPgmDKTjmO6TJRsJq0/Tnd8ZZI9me8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pWCd3cuU/AyMsBc4XUVR9kRVA/93i7kMfhMRv43mbmuktc/mcynswrN0zahIXGX99
	 iFVB/KUFxgv+qUhPKssAwlOvvcuolONeNGqI/oTd2BYEGQAhlz8OERoQPlVy6WjJKu
	 9PjdqWds4KDQWXnFDtGk+q1DJH/FgnVhPjniqc0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB8F8F804E4;
	Sat, 10 Jul 2021 04:26:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9CC1F804E1; Sat, 10 Jul 2021 04:26:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28894F8028D
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28894F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KZza1hxT"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86C57613FC;
 Sat, 10 Jul 2021 02:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625883990;
 bh=BAx2GDapydcayVPgmDKTjmO6TJRsJq0/Tnd8ZZI9me8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KZza1hxT/M2aHwibrc6VBQ0I7Ts292cms7mgQQYFYNt4I0WIv42lf7wGib8oxNGwN
 +tp+1AlYcrUt7/A1zI8UtW2zbsGiMnnd44XHe3EP6GvlWqMHhU85X5VTdJjW17gstU
 2RCZU5WvlDPXuScmfZbv3kz1A3hJkl6ZB8pntNcIZk5jOq3GTBrdMwIyvY6+6nlhMC
 E1u2WCJtR63DwzH/7O+3UH3mCtECGj8dsB1vYSU09l3O1Ph0XsTF+y8VLg36oI487B
 P/8VRMQ3EUfx0Km5ABiy5MeXYEKClvE4yOCbKvBjx4QTua0QNaJhjGsivfldTZd1jN
 WVD3xD2e4vYtw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 66/93] ASoC: soc-core: Fix the error return code
 in snd_soc_of_parse_audio_routing()
Date: Fri,  9 Jul 2021 22:24:00 -0400
Message-Id: <20210710022428.3169839-66-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022428.3169839-1-sashal@kernel.org>
References: <20210710022428.3169839-1-sashal@kernel.org>
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
index b22674e3a89c..e677422c1058 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2804,7 +2804,7 @@ int snd_soc_of_parse_audio_routing(struct snd_soc_card *card,
 	if (!routes) {
 		dev_err(card->dev,
 			"ASoC: Could not allocate DAPM route table\n");
-		return -EINVAL;
+		return -ENOMEM;
 	}
 
 	for (i = 0; i < num_routes; i++) {
-- 
2.30.2

