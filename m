Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E56F95B83D5
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 11:04:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9139E183A;
	Wed, 14 Sep 2022 11:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9139E183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663146271;
	bh=w8J7WeZoAmtAVa2bitCJ9ueRJcsRqLvy4sotjojZBno=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NCkG2x26U4ZuOpwRn/oc+GeGhWyoNU4Z2uFUMWuAG7ZUdp7+v8acBSAyLnx5erRor
	 2GJlu6n+XrEXBLDhE/NDlQ49J7Yq2C5b5O/ykOMHFOQs7QustzEjEeehGlGnj741Bu
	 82Mj7SBiFw3c07idCWugmNc6FzSFpAN8nqjnwhWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 389C5F8014E;
	Wed, 14 Sep 2022 11:03:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBA86F80535; Wed, 14 Sep 2022 11:03:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DB5CF800FE
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 11:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DB5CF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NJyojNLI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id DCD0DCE16A6;
 Wed, 14 Sep 2022 09:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD70C43470;
 Wed, 14 Sep 2022 09:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663146174;
 bh=w8J7WeZoAmtAVa2bitCJ9ueRJcsRqLvy4sotjojZBno=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NJyojNLIXrXCdLruTMLXRzmQUNW+8zTnnDFK6QV2B4AwqAab9VC9ZzMyLI/q461bv
 Bdb56xr+YmJAaKIP1wNRCyE8ySu4RpudwGEVEMMwJ86NFsiwkO5IYMQuqjL7/1W4Cp
 o1CdtBho7cH1v4Z1pVHHhGRmr9Kho1Zt+Zlqlc8+iivReS0uhWEuNa7U2KJI48fIVt
 ieog4F0Z5duiuFGcg5CleXHLN7hDwgKBZ3u4k3O08/diYynnN7Upkr/wBpeIaQwSAv
 VU53Zd//A7NRYL8I+5YZbjdW4qJSOi4DAxM6q6qL1ECvTI2zbyJNAwA0BZYNhk2rLB
 JO4ZWXIJ+8GfQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 09/16] ALSA: hda/tegra: Align BDL entry to 4KB
 boundary
Date: Wed, 14 Sep 2022 05:02:17 -0400
Message-Id: <20220914090224.470913-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220914090224.470913-1-sashal@kernel.org>
References: <20220914090224.470913-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, spujar@nvidia.com, tiwai@suse.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 jonathanh@nvidia.com, Mohan Kumar <mkumard@nvidia.com>
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

From: Mohan Kumar <mkumard@nvidia.com>

[ Upstream commit 8d44e6044a0e885acdd01813768a0b27906d64fd ]

AZA HW may send a burst read/write request crossing 4K memory boundary.
The 4KB boundary is not guaranteed by Tegra HDA HW. Make SW change to
include the flag AZX_DCAPS_4K_BDLE_BOUNDARY to align BDLE to 4K
boundary.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
Link: https://lore.kernel.org/r/20220905172420.3801-1-mkumard@nvidia.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/hda_tegra.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 773f4903550a0..f0e556f2ccf69 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -451,7 +451,8 @@ MODULE_DEVICE_TABLE(of, hda_tegra_match);
 static int hda_tegra_probe(struct platform_device *pdev)
 {
 	const unsigned int driver_flags = AZX_DCAPS_CORBRP_SELF_CLEAR |
-					  AZX_DCAPS_PM_RUNTIME;
+					  AZX_DCAPS_PM_RUNTIME |
+					  AZX_DCAPS_4K_BDLE_BOUNDARY;
 	struct snd_card *card;
 	struct azx *chip;
 	struct hda_tegra *hda;
-- 
2.35.1

