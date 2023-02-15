Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A70A2698638
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 21:48:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28D50E0F;
	Wed, 15 Feb 2023 21:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28D50E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676494115;
	bh=TcEvZYHrQCR/hfcOxedM7Vg4Fnq1Z6Qy069MGALnJCo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jstrFIUnCND1b+gMaLUPTY+bsrS60SgpxDD/c2ZJidqvlcj1Nm7wUoSBfFZj0jpFF
	 /e+YlSqxfehte8YQqsHQYffmJAWfCpAg8zoXLhwymzTxfTiQ3geMtwd3C7pUOFEjnD
	 AjhScO7uPmZ7ziysCFrWsOdVj+l03Dpd40WXcieE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0454CF80548;
	Wed, 15 Feb 2023 21:46:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 997B4F80549; Wed, 15 Feb 2023 21:46:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEC84F8053D
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 21:46:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEC84F8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pJvKQIOn
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0D174B823B9;
	Wed, 15 Feb 2023 20:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62271C433A1;
	Wed, 15 Feb 2023 20:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676494004;
	bh=TcEvZYHrQCR/hfcOxedM7Vg4Fnq1Z6Qy069MGALnJCo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pJvKQIOnsGfbIceRELHCD0TX0F8ClHISTXoTh/5wobSZDL24N0pctzLamBJ8fPSL6
	 RGSWMW18uXOY4mFRyDl6wL00LkJdVdEs9k2uhqv7QP/lWRDS8Ej1vZTt8IoX1qKj4N
	 BihCMu+mJ9t9mp/K74zoJAD3L92XLom8RRYuNnfvts7d4AelKs0HXkIKcJpuLV9128
	 Yeifo2F2OD7Z5sQZyYAV+AwyQ0MQKLTJXglcS5pS+S6IjXupqWjkmzdUp2KQpK/NCs
	 vE1bnaBgG8bO8WQM17LkqOnAZb4rpsQHVkwd7eDGuj6DhRLuCKHBcaR8LZHOGEWBDt
	 PyR6YvajoKmLA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 08/12] ASoC: rt715-sdca: fix clock stop prepare
 timeout issue
Date: Wed, 15 Feb 2023 15:46:30 -0500
Message-Id: <20230215204637.2761073-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230215204637.2761073-1-sashal@kernel.org>
References: <20230215204637.2761073-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6CXB5RFH7BBLSH3J3X35IYXY6H6J3K47
X-Message-ID-Hash: 6CXB5RFH7BBLSH3J3X35IYXY6H6J3K47
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6CXB5RFH7BBLSH3J3X35IYXY6H6J3K47/>
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
index 0f4354eafef25..85abf8073c278 100644
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

