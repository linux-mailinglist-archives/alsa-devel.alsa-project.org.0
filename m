Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8987335CC0B
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 18:28:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AC8D15E0;
	Mon, 12 Apr 2021 18:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AC8D15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618244883;
	bh=WIXlCnzhKxXVdFzpZ6w4P7U1gKoinHF2UJbEjqZzq58=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eh9g9m8bwKZ/CUMpEfd3syzQuHR5OPaNpx5GgaVU1c5Vp3UVpigbCGFAmMaSWn6XN
	 gS7a6VgVKGFt0yEXOvLPZoCUc+wKGAOBdbAtWeDRtZXHimX+S4QHVwnOjzurIMRJ/L
	 +ak8NVAEkomrmVQllW4nEyzggSnlVTqKoDhCBm58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 337AAF8013D;
	Mon, 12 Apr 2021 18:26:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DBD5F8032C; Mon, 12 Apr 2021 18:26:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8F1EF8025B
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 18:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8F1EF8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="If4pfQTb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5A28613AF;
 Mon, 12 Apr 2021 16:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618244767;
 bh=WIXlCnzhKxXVdFzpZ6w4P7U1gKoinHF2UJbEjqZzq58=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=If4pfQTbDvbS3MpvSH4aL0xHAM3cOW8q7V3DXKQHTQsC3aSSyaunu8Wdn/q02v2EW
 /MkpE8EdsyuT5KT2MqNeTxXj3gG0sav94AOhhDzKguIdF9OQgdUnkeWXB5VMwxwIIs
 leMTDBvtPWYV7oB58dqUn8wgL5Ic/OuNDK0+gGYXuiKGFgqfxG3s21KtiTK99otDec
 uR8Wubo+PK2wKHs7prqATVwNgKZTfqQpTq+iCm4y0+RWnvqh4JBnK3rGXsE7Ccr+HR
 jH1iOPtWid3W0fVTqIaMkJvgsijAKDgN/VD7mTuGDGwWeS+jOSXnL7vTwLBW0Vr1X2
 BSzO2zb/BBUUw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 11/28] ASoC: fsl_esai: Fix TDM slot setup for I2S
 mode
Date: Mon, 12 Apr 2021 12:25:36 -0400
Message-Id: <20210412162553.315227-11-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162553.315227-1-sashal@kernel.org>
References: <20210412162553.315227-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Alexander Shiyan <shc_work@mail.ru>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
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

From: Alexander Shiyan <shc_work@mail.ru>

[ Upstream commit e7a48c710defa0e0fef54d42b7d9e4ab596e2761 ]

When using the driver in I2S TDM mode, the fsl_esai_startup()
function rewrites the number of slots previously set by the
fsl_esai_set_dai_tdm_slot() function to 2.
To fix this, let's use the saved slot count value or, if TDM
is not used and the number of slots is not set, the driver will use
the default value (2), which is set by fsl_esai_probe().

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Link: https://lore.kernel.org/r/20210402081405.9892-1-shc_work@mail.ru
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl_esai.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index ff96db91f818..baa76337c33f 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -497,11 +497,13 @@ static int fsl_esai_startup(struct snd_pcm_substream *substream,
 				   ESAI_SAICR_SYNC, esai_priv->synchronous ?
 				   ESAI_SAICR_SYNC : 0);
 
-		/* Set a default slot number -- 2 */
+		/* Set slots count */
 		regmap_update_bits(esai_priv->regmap, REG_ESAI_TCCR,
-				   ESAI_xCCR_xDC_MASK, ESAI_xCCR_xDC(2));
+				   ESAI_xCCR_xDC_MASK,
+				   ESAI_xCCR_xDC(esai_priv->slots));
 		regmap_update_bits(esai_priv->regmap, REG_ESAI_RCCR,
-				   ESAI_xCCR_xDC_MASK, ESAI_xCCR_xDC(2));
+				   ESAI_xCCR_xDC_MASK,
+				   ESAI_xCCR_xDC(esai_priv->slots));
 	}
 
 	return 0;
-- 
2.30.2

