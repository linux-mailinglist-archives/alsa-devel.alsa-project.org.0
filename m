Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 006459C544B
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2024 11:40:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CBEA16B7;
	Tue, 12 Nov 2024 11:39:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CBEA16B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731408008;
	bh=QhD5Wrr4zZ8WGJRryVvw7+4qMinM3ZvNb9LGCp/cyiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JSUdSsaMf57+CdByPr+Ohm/mlwjt/+VkC4tka9UngVu/sVnxYQrKJJmnuzZafrYDF
	 eap9NKyQoc6s2iKkGK+aWrlPdfR50ikjWXwd4qeO57jrMFvdB6Q9+JmVJLO9EkL+zo
	 b+WjpoRg+v1u/fEQTxB0SWFedX5yqYZIUVXcAN9I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BC2BF80638; Tue, 12 Nov 2024 11:38:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81914F806B1;
	Tue, 12 Nov 2024 11:38:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 664E3F806A7; Tue, 12 Nov 2024 11:38:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8BED3F80622
	for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2024 11:38:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BED3F80622
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UxioDTNU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 55F2CA4195F;
	Tue, 12 Nov 2024 10:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B449C4CED4;
	Tue, 12 Nov 2024 10:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407891;
	bh=QhD5Wrr4zZ8WGJRryVvw7+4qMinM3ZvNb9LGCp/cyiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UxioDTNU+dwIPLLZPVNlDm6PoZKAfUNFRfJfx3+Q1QElgmFlopY1OF7yn4/kKofk4
	 ZZ9j0n9DTlDjfVMX9oulH/a+HEf/LfJHksk/7SfpAZnRwzV8wEI2DiwKzJEdWWS/YD
	 oQq4dGsTmfgs73biHX8QqzJPIkh30FZHvqt8C1BLl4NukzAFNE43yctvf79niOeWst
	 7VwIsnW9xWjVySlGeIMwSRdSW4NWSO1bkthvkbgibov236YrlwXzTSXh9vcLmccvqA
	 tJC/PKuo+9nazM10KwJtZgAnfwjos3og2uX93XCeRN07Ds/ZSwpeA2s4i19aAWKKGV
	 dx9TdfQ6Jhk8Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Luo Yifan <luoyifan@cmss.chinamobile.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 4/6] ASoC: stm: Prevent potential division by
 zero in stm32_sai_mclk_round_rate()
Date: Tue, 12 Nov 2024 05:37:59 -0500
Message-ID: <20241112103803.1654174-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112103803.1654174-1-sashal@kernel.org>
References: <20241112103803.1654174-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.229
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ETQLD75VH7XRGPQGSC3HH2FKEWKV7ZCI
X-Message-ID-Hash: ETQLD75VH7XRGPQGSC3HH2FKEWKV7ZCI
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ETQLD75VH7XRGPQGSC3HH2FKEWKV7ZCI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Luo Yifan <luoyifan@cmss.chinamobile.com>

[ Upstream commit 63c1c87993e0e5bb11bced3d8224446a2bc62338 ]

This patch checks if div is less than or equal to zero (div <= 0). If
div is zero or negative, the function returns -EINVAL, ensuring the
division operation (*prate / div) is safe to perform.

Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
Link: https://patch.msgid.link/20241106014654.206860-1-luoyifan@cmss.chinamobile.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/stm/stm32_sai_sub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 3aa1cf2624020..3a7f0102b4c5c 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -380,8 +380,8 @@ static long stm32_sai_mclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	int div;
 
 	div = stm32_sai_get_clk_div(sai, *prate, rate);
-	if (div < 0)
-		return div;
+	if (div <= 0)
+		return -EINVAL;
 
 	mclk->freq = *prate / div;
 
-- 
2.43.0

