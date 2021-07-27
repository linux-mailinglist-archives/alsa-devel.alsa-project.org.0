Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C30A3D7615
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 15:23:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C21E1F0E;
	Tue, 27 Jul 2021 15:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C21E1F0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627392210;
	bh=9Ekw3+9sj0iwmU+tEstdxAwWf8wSv4kj+Ikag/p3grk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vYzHnREPJuIJYJTmxAog/dnywcRdtA/0Y52G4kqRUstXt9vIjWxYdl9yluykHeuLy
	 lwkb72TdIGKBgaKCedfyvdFJCiVkIj7qFcha1iXQw7WmqGs9Y2DtNZpjZ2AfhRMio1
	 3i5KphtNWXJe9rWVl1WbJYF3YqBJUNwONJQOjuDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A618F804FF;
	Tue, 27 Jul 2021 15:20:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 400EDF804EC; Tue, 27 Jul 2021 15:19:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 331BAF804EC
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 15:19:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 331BAF804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vGuBR4Mp"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15F936187F;
 Tue, 27 Jul 2021 13:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627391992;
 bh=9Ekw3+9sj0iwmU+tEstdxAwWf8wSv4kj+Ikag/p3grk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vGuBR4Mp83vvlydU+Qrw+DOHy8oasX4GcGynEePpnu0D5u4m/CSSKNFZWhaPkTkkC
 hTRqXAedRW8yFKTof8+ffjVT/hp49dCE8+p5vV75eyUOFDqL4GrMYncx/HekaNkVWO
 RsK5PDa9ASBT4tLThEN88gbbWxx4oirBhw4pce/uKduODkCCJlrzFTiWdwv4RCagD/
 Npx365+6mr5g7blhXdEpXI0xbHoIAozqfcaylydhUryh6y9GCBu0NQjOOkEF2Fx7Qq
 KljxrxJypZgDbOMlN4YsWi7S3XxTI6/0mOPWvj3BUGCFw9vpmNtT/cRDe+8QL7LtA8
 HOPqshrtgH0gA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 11/17] ASoC: ti: j721e-evm: Fix unbalanced domain
 activity tracking during startup
Date: Tue, 27 Jul 2021 09:19:32 -0400
Message-Id: <20210727131938.834920-11-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727131938.834920-1-sashal@kernel.org>
References: <20210727131938.834920-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>
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

From: Peter Ujfalusi <peter.ujfalusi@gmail.com>

[ Upstream commit 78d2a05ef22e7b5863b01e073dd6a06b3979bb00 ]

In case of an error within j721e_audio_startup() the domain->active must
be decremented to avoid unbalanced counter.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Link: https://lore.kernel.org/r/20210717122820.1467-2-peter.ujfalusi@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/ti/j721e-evm.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index a7c0484d44ec..017c4ad11ca6 100644
--- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -278,23 +278,29 @@ static int j721e_audio_startup(struct snd_pcm_substream *substream)
 					  j721e_rule_rate, &priv->rate_range,
 					  SNDRV_PCM_HW_PARAM_RATE, -1);
 
-	mutex_unlock(&priv->mutex);
 
 	if (ret)
-		return ret;
+		goto out;
 
 	/* Reset TDM slots to 32 */
 	ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0x3, 0x3, 2, 32);
 	if (ret && ret != -ENOTSUPP)
-		return ret;
+		goto out;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x3, 0x3, 2, 32);
 		if (ret && ret != -ENOTSUPP)
-			return ret;
+			goto out;
 	}
 
-	return 0;
+	if (ret == -ENOTSUPP)
+		ret = 0;
+out:
+	if (ret)
+		domain->active--;
+	mutex_unlock(&priv->mutex);
+
+	return ret;
 }
 
 static int j721e_audio_hw_params(struct snd_pcm_substream *substream,
-- 
2.30.2

