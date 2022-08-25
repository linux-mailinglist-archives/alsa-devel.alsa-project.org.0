Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0005A05D2
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 03:35:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 460B13E7;
	Thu, 25 Aug 2022 03:35:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 460B13E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661391354;
	bh=GC2D4ZYN0TLBECgNcs3E4No50naTem2zZ1+F6mlc+oc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a2gEnbAsBVPJ7EFAIP4d6+gEJqf/iu/FIhva4ArdA78ZZaJRXAkWpo6KxFxgqJ5PG
	 GU7wpBGKqhon8trqiZ/rEOdFYuIc/nizTOkKzwqXDv0SVlNyz+MoBFLYe/ZFeWLtEP
	 vWJl2OqohlZk+j2ePEknruxpuQLq6SYi2aFHOYGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC6CDF80525;
	Thu, 25 Aug 2022 03:34:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F195F800BD; Thu, 25 Aug 2022 03:34:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D3BCF80245
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 03:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D3BCF80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Cqnrzwwf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EE499B826DA;
 Thu, 25 Aug 2022 01:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B2AC43470;
 Thu, 25 Aug 2022 01:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391252;
 bh=GC2D4ZYN0TLBECgNcs3E4No50naTem2zZ1+F6mlc+oc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CqnrzwwfJkSHmcnj4HxdAgrXIZ1I/Ns4lkJY3rm8X3ER4DzbOgveHR24YxeKKO9OA
 XI7/RPuk/2ARPX/1z+IzT1thb7rwzX4vH150Llkbjq/mxT6Yhzp801jOF7aJRu2bXr
 TKeK/75VZbw4hJ+s8j2dEeTln7VtbSU9PCDV8b/ACcBN11uU7LWih85hsA8lefupbF
 Ld5pqi/u06aMUz5EN1nA9bzJ4BX3lwJ9gAWgEcg8oncyaOFQVbOV9Y1m68Cd2GDtIO
 aW5nhsE3cNOeE2Q9dPBYoogDfAteFySm43p8KjyKIWj3SwCoarAULHm6PlpHSr5jeg
 VlaCLsacXYNeA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 03/38] ASoC: rt5640: Fix the JD voltage dropping
 issue
Date: Wed, 24 Aug 2022 21:33:26 -0400
Message-Id: <20220825013401.22096-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013401.22096-1-sashal@kernel.org>
References: <20220825013401.22096-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, Mohan Kumar D <mkumard@nvidia.com>
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

From: Oder Chiou <oder_chiou@realtek.com>

[ Upstream commit afb176d45870048eea540991b082208270824037 ]

The patch fixes the JD voltage dropping issue in the HDA JD using.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
Reported-by: Mohan Kumar D <mkumard@nvidia.com>
Link: https://lore.kernel.org/r/20220808052836.25791-1-oder_chiou@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt5640.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 18b3da9211e3..5ada0d318d0f 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -1986,7 +1986,7 @@ static int rt5640_set_bias_level(struct snd_soc_component *component,
 		snd_soc_component_write(component, RT5640_PWR_MIXER, 0x0000);
 		if (rt5640->jd_src == RT5640_JD_SRC_HDA_HEADER)
 			snd_soc_component_write(component, RT5640_PWR_ANLG1,
-				0x0018);
+				0x2818);
 		else
 			snd_soc_component_write(component, RT5640_PWR_ANLG1,
 				0x0000);
@@ -2592,7 +2592,8 @@ static void rt5640_enable_hda_jack_detect(
 	snd_soc_component_update_bits(component, RT5640_DUMMY1, 0x400, 0x0);
 
 	snd_soc_component_update_bits(component, RT5640_PWR_ANLG1,
-		RT5640_PWR_VREF2, RT5640_PWR_VREF2);
+		RT5640_PWR_VREF2 | RT5640_PWR_MB | RT5640_PWR_BG,
+		RT5640_PWR_VREF2 | RT5640_PWR_MB | RT5640_PWR_BG);
 	usleep_range(10000, 15000);
 	snd_soc_component_update_bits(component, RT5640_PWR_ANLG1,
 		RT5640_PWR_FV2, RT5640_PWR_FV2);
-- 
2.35.1

