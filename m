Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A12B852201B
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 17:51:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 458531A45;
	Tue, 10 May 2022 17:50:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 458531A45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652197861;
	bh=RwMynqfZ8kOC3Wy8PKgPjxFl1WOjYkcreb4psjsrtlE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AJTQpozvv3SeoPPBLQ4SduzeiQxDFBfXDr+InzQ35IRimRhWTpoTFVMXiKwo7JXLj
	 NDgOuSQRqFL+9XB5P2U9mr/e3lCnxDLnnusFDU74BJ5ENtlowl6xf9y4hXwLooff5d
	 oDOUKTV5zDq8f/hX14ZmZbArHjFEIWwZmbrpOnOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07891F8055B;
	Tue, 10 May 2022 17:47:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C3C4F804BD; Tue, 10 May 2022 17:47:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F196F804BD
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 17:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F196F804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NRzCoM40"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C97126138B;
 Tue, 10 May 2022 15:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCE2C385C2;
 Tue, 10 May 2022 15:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652197642;
 bh=RwMynqfZ8kOC3Wy8PKgPjxFl1WOjYkcreb4psjsrtlE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NRzCoM401gjiJ/+g6wY0vGkWGeGxv2rYg12Mtysb1GwetXNhXWIklA74y3Lq6PWHK
 9sK2ByeWMafNOgO5hDFraGqltzkaeu/LRK/Dp6k11aoE8IUmlyuPmNDYRw8X0oPsSw
 D3VHgCSvu2iHAom/r3Rmx9fuNrobNsSR1r0MqFbktom/PyHR3GhbxctMz6BZH9Qw1Q
 1kQ1aZz7eOyRKiIzgad+2BJVOg8yY/Cr0c7F7O0LWuSDMxVj+XJ5q020gwUYzm5D2v
 cveGWfVorvyisXLepEVM8eSSOie51wqxV2a2WaDHAzwEYquVr1qn6+nNlakVVYuE5L
 UYjZaJvBw3MVw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 3/4] ASoC: max98090: Generate notifications on
 changes for custom control
Date: Tue, 10 May 2022 11:47:02 -0400
Message-Id: <20220510154704.154362-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510154704.154362-1-sashal@kernel.org>
References: <20220510154704.154362-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 Mark Brown <broonie@kernel.org>
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

[ Upstream commit 13fcf676d9e102594effc686d98521ff5c90b925 ]

The max98090 driver has some custom controls which share a put() function
which returns 0 unconditionally, meaning that events are not generated
when the value changes. Fix that.

Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20220420193454.2647908-2-broonie@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/max98090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 4aefb13900c2..1a55f6aecdfe 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -436,7 +436,7 @@ static int max98090_put_enab_tlv(struct snd_kcontrol *kcontrol,
 		mask << mc->shift,
 		sel << mc->shift);
 
-	return 0;
+	return *select != val;
 }
 
 static const char *max98090_perf_pwr_text[] =
-- 
2.35.1

