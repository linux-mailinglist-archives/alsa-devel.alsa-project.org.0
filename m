Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9729D48040E
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Dec 2021 20:07:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 476531747;
	Mon, 27 Dec 2021 20:06:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 476531747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640632033;
	bh=zrDXBEC0TcWKOtmboRNZ02hBjuZ67/soUOSSI1zFhrk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FJr10eF8hp1NLOe63mqvpX0PxQsGVCN7WFHCzKQT3brrPCaTseK2QqQ1UpOew2KYP
	 4EBSYaRLlP2EMiPJls08GFx1WuQfFj8nE7Bzy49hCJwit7CjiUdP7Vdc8IMDjb80+j
	 1N/U2stC+IMMeoAEUEuqAGt2iaaWs2mK0l5ZDP4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67CBAF800F5;
	Mon, 27 Dec 2021 20:05:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12250F804FE; Mon, 27 Dec 2021 20:05:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE71AF80161
 for <alsa-devel@alsa-project.org>; Mon, 27 Dec 2021 20:05:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE71AF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z3r/1qTr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4916761164;
 Mon, 27 Dec 2021 19:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D75C36AEB;
 Mon, 27 Dec 2021 19:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640631920;
 bh=zrDXBEC0TcWKOtmboRNZ02hBjuZ67/soUOSSI1zFhrk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z3r/1qTrLEgJdheVWtYTeSlW822xOzVjm4nGjVm18rwJiaQChuML58M09rmr7wl4B
 N9KR9Jxo8BchtTxxDRYCbhNTQnXiYwv8N1pNhmk7Rv81z0KQzvIlb9ugERsQY2Ujsj
 lpwtqBTFBeRIlMJI7hwCyX0oBx3wnIWvEL27KfMH+yRCnGkmSPjb3nWeuihVOiITb1
 OkNrJHZudJB9OMLaeM5mDO71ExUt1jyna/egmZuILxwq3FWJggoe7RFllBo7KlFARy
 8dAjXt5v/Th0r2Szy/ujpUvqxbKWFQLvO62CLzfdsCeQ8iNa29vz5wXGP10d24K7LE
 I7YzCfg+v8moA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 06/14] ASoC: rt5682: fix the wrong jack type
 detected
Date: Mon, 27 Dec 2021 14:04:44 -0500
Message-Id: <20211227190452.1042714-6-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211227190452.1042714-1-sashal@kernel.org>
References: <20211227190452.1042714-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, oder_chiou@realtek.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, Derek Fang <derek.fang@realtek.com>
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

From: Derek Fang <derek.fang@realtek.com>

[ Upstream commit 8deb34a90f06374fd26f722c2a79e15160f66be7 ]

Some powers were changed during the jack insert detection
and clk's enable/disable in CCF.
If in parallel, the influence has a chance to detect
the wrong jack type, so add a lock.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
Link: https://lore.kernel.org/r/20211214105033.471-1-derek.fang@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt5682.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 41827cdf26a39..aaef76cc151fa 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -924,6 +924,8 @@ int rt5682_headset_detect(struct snd_soc_component *component, int jack_insert)
 	unsigned int val, count;
 
 	if (jack_insert) {
+		snd_soc_dapm_mutex_lock(dapm);
+
 		snd_soc_component_update_bits(component, RT5682_PWR_ANLG_1,
 			RT5682_PWR_VREF2 | RT5682_PWR_MB,
 			RT5682_PWR_VREF2 | RT5682_PWR_MB);
@@ -968,6 +970,8 @@ int rt5682_headset_detect(struct snd_soc_component *component, int jack_insert)
 		snd_soc_component_update_bits(component, RT5682_MICBIAS_2,
 			RT5682_PWR_CLK25M_MASK | RT5682_PWR_CLK1M_MASK,
 			RT5682_PWR_CLK25M_PU | RT5682_PWR_CLK1M_PU);
+
+		snd_soc_dapm_mutex_unlock(dapm);
 	} else {
 		rt5682_enable_push_button_irq(component, false);
 		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_1,
-- 
2.34.1

