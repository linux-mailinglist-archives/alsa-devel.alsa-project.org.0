Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4CC57ABCE
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 03:17:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3227172D;
	Wed, 20 Jul 2022 03:16:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3227172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658279855;
	bh=NV2ynk2YaJoTDPoyAUDPJqIw4qadRJfcBh0URspxv/k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UcuKNxIhFNLXFev/cSpYeGWOxouBPDkQB3Vs9Y/xtxBBpP1SqaFIAKnb5RPb4efyp
	 jG2z6EqWTtXXCNaVVG+eMz1s37Xot2pF3gcvNX7Ni4cnsmjVC7LM7EXXaVddgRwQa+
	 RkiCcivzZw8vzNGAfZkblwCQ/+qA6tqsm4NXMGR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55E81F80169;
	Wed, 20 Jul 2022 03:16:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67C96F80517; Wed, 20 Jul 2022 03:16:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9E51F80517
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 03:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9E51F80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g5p9sLX6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B27A66176A;
 Wed, 20 Jul 2022 01:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8354BC341CA;
 Wed, 20 Jul 2022 01:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658279750;
 bh=NV2ynk2YaJoTDPoyAUDPJqIw4qadRJfcBh0URspxv/k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g5p9sLX6/7bFYlFcSLKBQmv5bk9pjsotoEyfZ+Ya6q5VDF8EcQjWivRljWT/0PKHQ
 8mAAVj0y9cmUf+bLRvFN/sFWdPbNpXFOjxNA3luobPZ3nYRvgXvYMbJvG+z1RIgE3w
 K6Pzvor68lkjPODXoJ/uxL2A8KYElRZxr0bCD+1+idNx8YfmzZsCzN6lw3riBmkEqm
 dCFzpj6MVaVs9dlSc70HXku07N3O+/g9/bETjq+EjTXZvZEe478IaLiKFDGZs/TXkM
 UL/xYjZuX2JdoIG15zxoZNLgNhjL4ZjxgaZXZGZwLO08yWGHjaHJdYloMQEvMG+GpC
 b46DicRhdUKHg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 32/42] ASoC: cs47l92: Fix event generation for
 OUT1 demux
Date: Tue, 19 Jul 2022 21:13:40 -0400
Message-Id: <20220720011350.1024134-32-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720011350.1024134-1-sashal@kernel.org>
References: <20220720011350.1024134-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, tanureal@opensource.cirrus.com,
 patches@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 david.rhodes@cirrus.com, rf@opensource.cirrus.com,
 Mark Brown <broonie@kernel.org>, james.schulman@cirrus.com
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit 870d72ab9228575b2f005c9a23ea08787e0f63e6 ]

cs47l92_put_demux returns the value of snd_soc_dapm_mux_update_power,
which returns a 1 if a path was found for the kcontrol. This is
obviously different to the expected return a 1 if the control
was updated value. This results in spurious notifications to
user-space. Update the handling to only return a 1 when the value is
changed.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220628153409.3266932-3-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs47l92.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 1a0280416d92..ad6f41741372 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -119,7 +119,13 @@ static int cs47l92_put_demux(struct snd_kcontrol *kcontrol,
 end:
 	snd_soc_dapm_mutex_unlock(dapm);
 
-	return snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
+	ret = snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
+	if (ret < 0) {
+		dev_err(madera->dev, "Failed to update demux power state: %d\n", ret);
+		return ret;
+	}
+
+	return change;
 }
 
 static SOC_ENUM_SINGLE_DECL(cs47l92_outdemux_enum,
-- 
2.35.1

