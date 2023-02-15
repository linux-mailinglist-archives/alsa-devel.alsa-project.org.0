Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA992698603
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 21:47:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F562851;
	Wed, 15 Feb 2023 21:46:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F562851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676494041;
	bh=rwVZKUVchx2WH69jksjVxf2LBObQPlCbiwO0bDKflwU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UFVvvFEoCrZgAANS/sMBuDF8JpoatfamCnDp/DvmrgS+cRreo98FvA2V3Im6yozmt
	 G7Ygk0eYEUqREGU5GRph1H74WHZhHUEZcjg7P8G6DbgYoKNZRM2LFRqaagGm4jXf8a
	 pgpoObfn4rj6jYHMG6xR6+CLwY/r5p0DX+5bWMMQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1CB9F800B6;
	Wed, 15 Feb 2023 21:46:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1852F801C0; Wed, 15 Feb 2023 21:46:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC2EFF80083
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 21:46:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC2EFF80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ISNjj9ZX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8FD3261D97;
	Wed, 15 Feb 2023 20:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F01C4339C;
	Wed, 15 Feb 2023 20:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676493974;
	bh=rwVZKUVchx2WH69jksjVxf2LBObQPlCbiwO0bDKflwU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ISNjj9ZXIlxl7MTNLkVX94+vmO0hjCDQbNoqoDvwlKI2eT09Pu6ye0H6nTK/hV/Y/
	 Itut21D5bLkOEFPvwSZyq5Qg4YPgYBZah/ATIGUWgC9SI71UUTW2bOQM4NmgBwSzha
	 8yo5iEcpFSp0qbM/JwF4iGyQXMZePR998P9R3f24ZyNHOWSd0hX4IPaVy5zzCOmF5g
	 RudKk3A5eCHBCt86lH1XtPmdf4xLxT05a/Z0PiW9U3XxUfPzMhE84HfZwU92m4pe9q
	 3Mg3tpHtKQy9dwcpdkRkiurbw3+f5R2gRsfoQE3tr6LcwQ1t6xaEiazWXSvhy4f/B0
	 45KDbmCJ2KFLw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 13/24] ASoC: rt715-sdca: fix clock stop prepare
 timeout issue
Date: Wed, 15 Feb 2023 15:45:36 -0500
Message-Id: <20230215204547.2760761-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230215204547.2760761-1-sashal@kernel.org>
References: <20230215204547.2760761-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RRK2LLUAZ6OYIUIAN6DLPY2GQEGZFQVG
X-Message-ID-Hash: RRK2LLUAZ6OYIUIAN6DLPY2GQEGZFQVG
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Jack Yu <jack.yu@realtek.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, oder_chiou@realtek.com, lgirdwood@gmail.com,
 tiwai@suse.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RRK2LLUAZ6OYIUIAN6DLPY2GQEGZFQVG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jack Yu <jack.yu@realtek.com>

[ Upstream commit 2036890282d56bcbf7f915ba9e04bf77967ab231 ]

Modify clock_stop_timeout value for rt715-sdca according to
the requirement of internal clock trimming.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
Link: https://lore.kernel.org/r/574b6586267a458cac78c5ac4d5b10bd@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt715-sdca-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index 3f981a9e7fb67..c54ecf3e69879 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -167,7 +167,7 @@ static int rt715_sdca_read_prop(struct sdw_slave *slave)
 	}
 
 	/* set the timeout values */
-	prop->clk_stop_timeout = 20;
+	prop->clk_stop_timeout = 200;
 
 	return 0;
 }
-- 
2.39.0

