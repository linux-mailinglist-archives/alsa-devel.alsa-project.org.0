Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 845B554A4AE
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 04:10:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 256F418A6;
	Tue, 14 Jun 2022 04:09:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 256F418A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655172601;
	bh=bk35GxZMSvgCi98hPj3XUWJh2GZvRMQ+zORPkX2Ju3s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B7FuUWmbcCLxBXofYbaxET9mYzoB78ms3ejos3NXdgRXbpEh6Fl3lFJ6RYrwjXfEL
	 LKjbi7eQDbpQR3qTJ0B7zTj8hSLtyf5ZKxMcSWwrGX05sGee1UD7uMOT/NmdHuR8zy
	 3YqO4+MaLTDu7wktbafnY41KSwC/Rs7o5HaDDtlw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41EC9F80528;
	Tue, 14 Jun 2022 04:06:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C89B1F80528; Tue, 14 Jun 2022 04:06:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B525FF8012B
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 04:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B525FF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hKbKI7i8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7B01060B65;
 Tue, 14 Jun 2022 02:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8734C341C4;
 Tue, 14 Jun 2022 02:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172366;
 bh=bk35GxZMSvgCi98hPj3XUWJh2GZvRMQ+zORPkX2Ju3s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hKbKI7i8Nva97GKq5uhJSQBAcbkCAOMfPY3KlVocDSpzZ1MkCK7D+ihANMA7mRrXJ
 h6KGAhSXVOUm/CPXvbrnpqu3XO9TsAB9jlZqB/RexOIciQPriQ2QxSuu/KrkTcAPOe
 VpmnKk/oBWIxDpWfgB3O8kemlCRdcT33fzYyUjkQEzvIPd4aUMbpVG7WuZf3tDz9IU
 DU9IlpBQHjbPr39gU5LN7Tt4oj7Sv1O5llWTfaeNjccaLp588lVmhwHvbPLxUkZCsV
 pZmdQcGli6nQq21vx913kbSuQ197WIX6lQZbxbXnaulUcGdto0i4zM/LCKQK5hEL+0
 8hhfRLIsySgqw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 02/43] ASoC: nau8822: Add operation for internal
 PLL off and on
Date: Mon, 13 Jun 2022 22:05:21 -0400
Message-Id: <20220614020602.1098943-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020602.1098943-1-sashal@kernel.org>
References: <20220614020602.1098943-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Seven Li <wtli@nuvoton.com>, tiwai@suse.com, John Hsu <kchsu0@nuvoton.com>,
 lgirdwood@gmail.com, Hui Wang <hui.wang@canonical.com>,
 Mark Brown <broonie@kernel.org>, David Lin <ctlin0@nuvoton.com>
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

From: Hui Wang <hui.wang@canonical.com>

[ Upstream commit aeca8a3295022bcec46697f16e098140423d8463 ]

We tried to enable the audio on an imx6sx EVB with the codec nau8822,
after setting the internal PLL fractional parameters, the audio still
couldn't work and the there was no sdma irq at all.

After checking with the section "8.1.1 Phase Locked Loop (PLL) Design
Example" of "NAU88C22 Datasheet Rev 0.6", we found we need to
turn off the PLL before programming fractional parameters and turn on
the PLL after programming.

After this change, the audio driver could record and play sound and
the sdma's irq is triggered when playing or recording.

Cc: David Lin <ctlin0@nuvoton.com>
Cc: John Hsu <kchsu0@nuvoton.com>
Cc: Seven Li <wtli@nuvoton.com>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
Link: https://lore.kernel.org/r/20220530040151.95221-2-hui.wang@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/nau8822.c | 4 ++++
 sound/soc/codecs/nau8822.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index 58123390c7a3..b436e532993d 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -740,6 +740,8 @@ static int nau8822_set_pll(struct snd_soc_dai *dai, int pll_id, int source,
 		pll_param->pll_int, pll_param->pll_frac,
 		pll_param->mclk_scaler, pll_param->pre_factor);
 
+	snd_soc_component_update_bits(component,
+		NAU8822_REG_POWER_MANAGEMENT_1, NAU8822_PLL_EN_MASK, NAU8822_PLL_OFF);
 	snd_soc_component_update_bits(component,
 		NAU8822_REG_PLL_N, NAU8822_PLLMCLK_DIV2 | NAU8822_PLLN_MASK,
 		(pll_param->pre_factor ? NAU8822_PLLMCLK_DIV2 : 0) |
@@ -757,6 +759,8 @@ static int nau8822_set_pll(struct snd_soc_dai *dai, int pll_id, int source,
 		pll_param->mclk_scaler << NAU8822_MCLKSEL_SFT);
 	snd_soc_component_update_bits(component,
 		NAU8822_REG_CLOCKING, NAU8822_CLKM_MASK, NAU8822_CLKM_PLL);
+	snd_soc_component_update_bits(component,
+		NAU8822_REG_POWER_MANAGEMENT_1, NAU8822_PLL_EN_MASK, NAU8822_PLL_ON);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/nau8822.h b/sound/soc/codecs/nau8822.h
index 489191ff187e..b45d42c15de6 100644
--- a/sound/soc/codecs/nau8822.h
+++ b/sound/soc/codecs/nau8822.h
@@ -90,6 +90,9 @@
 #define NAU8822_REFIMP_3K			0x3
 #define NAU8822_IOBUF_EN			(0x1 << 2)
 #define NAU8822_ABIAS_EN			(0x1 << 3)
+#define NAU8822_PLL_EN_MASK			(0x1 << 5)
+#define NAU8822_PLL_ON				(0x1 << 5)
+#define NAU8822_PLL_OFF				(0x0 << 5)
 
 /* NAU8822_REG_AUDIO_INTERFACE (0x4) */
 #define NAU8822_AIFMT_MASK			(0x3 << 3)
-- 
2.35.1

