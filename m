Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A8152200E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 17:49:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87E5E19FF;
	Tue, 10 May 2022 17:48:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87E5E19FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652197778;
	bh=FMJRUB1SG20TwFoKGF+M7aS86FGVewsJIqlGua4wN/s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VpURHAkTyOlMbqAzMKDjjLStWQYkWE7H9ccZ3deF7WMuS4ygdt9qf7RcVo3JVeMtD
	 8SzB9F5mF8hZ5rmE2crccFYG73sO7qFDbF2NOHqRRTYx1e48GmSU9KlkzTfXAJbLTC
	 /0jhC2hbRvOINM5LhX6/YUgyGBCfoM0Yy8DBT5qw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE469F8055A;
	Tue, 10 May 2022 17:46:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6F9BF8053D; Tue, 10 May 2022 17:46:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83AAFF80116
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 17:46:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83AAFF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P03ygrp+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9E3E1B81DFA;
 Tue, 10 May 2022 15:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9AEC385C9;
 Tue, 10 May 2022 15:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652197589;
 bh=FMJRUB1SG20TwFoKGF+M7aS86FGVewsJIqlGua4wN/s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P03ygrp+7dSKJAUOpzdSf3yIzeUO8TgWjOPeVxYju3bbvyeSldCZsYhV4VXBymJVN
 H0lKLPtYx3v46VBwgmZmcGbFQVsy+nNTLmmq9Sh3fc48AVXxPcbJkmcDJjDGEyBmYy
 NxD1C1cBsomCOcFsx7LEzrEy7HQcF/Dc70lurrB7mMq5Rvy72C3CF5iYuJd80QWAZM
 TNtgd3W2C+BRD/ROh90eqnbPCUHSTL8DD8VWE/tQBGYIcQinoSON3Z+fBwZdhomRht
 pBm/JuVzbPL3yKFe+umE6bIBak4BeIkn3Bv19Q4VvFGOSRI4UEx4XsZGY5pshYeZUR
 rQ5Ox1Z/IhiPQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 4/6] ASoC: ops: Validate input values in
 snd_soc_put_volsw_range()
Date: Tue, 10 May 2022 11:46:12 -0400
Message-Id: <20220510154614.154187-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510154614.154187-1-sashal@kernel.org>
References: <20220510154614.154187-1-sashal@kernel.org>
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

[ Upstream commit aa22125c57f9e577f0a667e4fa07fc3fa8ca1e60 ]

Check that values written via snd_soc_put_volsw_range() are
within the range advertised by the control, ensuring that we
don't write out of spec values to the hardware.

Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20220423131239.3375261-1-broonie@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-ops.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index c88bc6bb41cf..7a37312c8e0c 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -523,7 +523,15 @@ int snd_soc_put_volsw_range(struct snd_kcontrol *kcontrol,
 	unsigned int mask = (1 << fls(max)) - 1;
 	unsigned int invert = mc->invert;
 	unsigned int val, val_mask;
-	int err, ret;
+	int err, ret, tmp;
+
+	tmp = ucontrol->value.integer.value[0];
+	if (tmp < 0)
+		return -EINVAL;
+	if (mc->platform_max && tmp > mc->platform_max)
+		return -EINVAL;
+	if (tmp > mc->max - mc->min + 1)
+		return -EINVAL;
 
 	if (invert)
 		val = (max - ucontrol->value.integer.value[0]) & mask;
@@ -538,6 +546,14 @@ int snd_soc_put_volsw_range(struct snd_kcontrol *kcontrol,
 	ret = err;
 
 	if (snd_soc_volsw_is_stereo(mc)) {
+		tmp = ucontrol->value.integer.value[1];
+		if (tmp < 0)
+			return -EINVAL;
+		if (mc->platform_max && tmp > mc->platform_max)
+			return -EINVAL;
+		if (tmp > mc->max - mc->min + 1)
+			return -EINVAL;
+
 		if (invert)
 			val = (max - ucontrol->value.integer.value[1]) & mask;
 		else
-- 
2.35.1

