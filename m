Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB1C61E466
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Nov 2022 18:11:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25EED209;
	Sun,  6 Nov 2022 18:10:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25EED209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667754672;
	bh=/m+ws4LtJVeV9zdgtIhbPo9cdoq0Rje2NJJD+yX3fok=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oynd4vd4dgnoAlyyswEXa34YT35HvyYSI+xyx1JIFGWmvSaUqAiAYt+NX1PxcLnUu
	 0hdQExE6IC3TGHtP3K1y/N7+PAf0domciV50nHZtKDiE/3iyFnJ1kNTBbWRVzC3qH0
	 w9cOylJCUohvKiAqpbJKobqpZGgGxk2747CB1XA4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 548E2F805F2;
	Sun,  6 Nov 2022 18:05:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A13DAF805F3; Sun,  6 Nov 2022 18:05:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1677FF805E8
 for <alsa-devel@alsa-project.org>; Sun,  6 Nov 2022 18:05:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1677FF805E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o/Ayol+o"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0372F60D17;
 Sun,  6 Nov 2022 17:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6CAC43152;
 Sun,  6 Nov 2022 17:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667754331;
 bh=/m+ws4LtJVeV9zdgtIhbPo9cdoq0Rje2NJJD+yX3fok=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o/Ayol+o2gQH6/EZxEZFPUtWCN8gIa/ZGMVmFaQKaAbcd3pWbTeNHLCSQjRHy5MIu
 4D9BTvBkk4hi41gRKVOVeotWK0MzRN+psGHFdK7FWJaUvb57pp97S5g294Ir8Yfr8P
 +TByKQtgRZWlo0zSvGliGVodLBX4D3JqbGBh45emzrlNHoLrc/LjROposh4GeUdYdD
 P3ex+1WaV9RX/qvmCm8/Jtvbq/1KhZOxq5rUvnNjPg39NrfhDYLFX7PhpZ4z1T+UO3
 ao87isnTBGVbQTHoLhP70VAOEWwzOfPMcsj4DZ+K20UwNK+1PlGzZX0IAhw5WjhILn
 70n4uCQdVXrLg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 08/18] ASoC: codecs: jz4725b: add missed Line In
 power control bit
Date: Sun,  6 Nov 2022 12:04:57 -0500
Message-Id: <20221106170509.1580304-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170509.1580304-1-sashal@kernel.org>
References: <20221106170509.1580304-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, paul@crapouillou.net,
 Siarhei Volkau <lis8215@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-mips@vger.kernel.org
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

From: Siarhei Volkau <lis8215@gmail.com>

[ Upstream commit 1013999b431b4bcdc1f5ae47dd3338122751db31 ]

Line In path stayed powered off during capturing or
bypass to mixer.

Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
Link: https://lore.kernel.org/r/20221016132648.3011729-2-lis8215@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/jz4725b.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index 5201a8f6d7b6..cc7a48c96aa4 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -236,7 +236,8 @@ static const struct snd_soc_dapm_widget jz4725b_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_MIXER("DAC to Mixer", JZ4725B_CODEC_REG_CR1,
 			   REG_CR1_DACSEL_OFFSET, 0, NULL, 0),
 
-	SND_SOC_DAPM_MIXER("Line In", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("Line In", JZ4725B_CODEC_REG_PMR1,
+			   REG_PMR1_SB_LIN_OFFSET, 1, NULL, 0),
 	SND_SOC_DAPM_MIXER("HP Out", JZ4725B_CODEC_REG_CR1,
 			   REG_CR1_HP_DIS_OFFSET, 1, NULL, 0),
 
-- 
2.35.1

