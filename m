Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B513451080B
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 21:04:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A1741884;
	Tue, 26 Apr 2022 21:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A1741884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650999852;
	bh=xtg5HxQLcrFUu/kx+UNr01sQ7UEWL3iVhKIKNYCJMaE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hBjwC4tjmlntDBaUQSJTrB0lWQwXKpLuSlbKIiYyBkBvBLQFkSwDEirC9zY1D3J5Y
	 5mXrwctteYcysm3kQ0Zdnu3VnKtRoghIDibe9eoOfi75XzgqYMLj78n3a3+UBXh8cs
	 fETPgEHkCgqcW543J2SuciDUbJJY76Yz6l6AXwNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00298F80529;
	Tue, 26 Apr 2022 21:02:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88F20F80105; Tue, 26 Apr 2022 21:02:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A04E5F80507
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 21:01:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A04E5F80507
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="okf88kvo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6CFEDB81DC2;
 Tue, 26 Apr 2022 19:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D7E5C385A0;
 Tue, 26 Apr 2022 19:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650999711;
 bh=xtg5HxQLcrFUu/kx+UNr01sQ7UEWL3iVhKIKNYCJMaE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=okf88kvoF4C2XfvQIHj+QI1NXemsis2xF9bgrLhDdsj6m9PTlEIz1txs8nGmCv5Ou
 onZ0kbhhvSeNIBeyXRNEKlQ+oUWaXVpGBmhCC6iVUJeqAQDciI7a6q+IaPmuam5OxA
 ZfK5g8Cs8GdNSM2qiweBNf2I9Ab3qZ4f1zb5p9a0DMqyuXCsQklaiZ3OhySMHuVFmd
 YL5nWnARFYFqy4M7WVobpfJNoS4RQVyNTbkUmh4y3eYndd7P+7xGMY3pGLlfjon+Lw
 bqFjWqlD3YxSHyHigppqgsBE0VVNCBszN+klbUjBc3L5IbQIfAbpskxLTreCh7m4xt
 BrZFEUDI3hRGw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 04/22] ASoC: Intel: soc-acpi: correct device
 endpoints for max98373
Date: Tue, 26 Apr 2022 15:01:27 -0400
Message-Id: <20220426190145.2351135-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426190145.2351135-1-sashal@kernel.org>
References: <20220426190145.2351135-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, balamurugan.c@intel.com,
 cezary.rojewski@intel.com, alsa-devel@alsa-project.org,
 peter.ujfalusi@linux.intel.com, tiwai@suse.com, yang.jie@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 gongjun.song@intel.com, liam.r.girdwood@linux.intel.com,
 Chao Song <chao.song@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com, brent.lu@intel.com
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

From: Chao Song <chao.song@linux.intel.com>

[ Upstream commit 97326be14df7bacc6ba5c62c0556298c27ea0432 ]

The left speaker of max98373 uses spk_r_endpoint, and right
speaker uses spk_l_endpoint, this is obviously wrong.

This patch corrects the endpoints for max98373 codec.

Signed-off-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20220406192341.271465-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index e2658bca6931..3137cea78d48 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -132,13 +132,13 @@ static const struct snd_soc_acpi_adr_device mx8373_1_adr[] = {
 	{
 		.adr = 0x000123019F837300ull,
 		.num_endpoints = 1,
-		.endpoints = &spk_l_endpoint,
+		.endpoints = &spk_r_endpoint,
 		.name_prefix = "Right"
 	},
 	{
 		.adr = 0x000127019F837300ull,
 		.num_endpoints = 1,
-		.endpoints = &spk_r_endpoint,
+		.endpoints = &spk_l_endpoint,
 		.name_prefix = "Left"
 	}
 };
-- 
2.35.1

