Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E16DA35CBA2
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 18:25:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 798C7167F;
	Mon, 12 Apr 2021 18:25:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 798C7167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618244750;
	bh=LT19Tsj7rRQqwqIRqGo+4VMJMhxCyuV1B6R8L5c5T+g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NkZOnsfREEIIsLmpthXaucbibBjDdvP+L2ITf4LCal7Cm3F6L8ygs1uAC1ZUkh9g8
	 1wvgmElJtxeXOnq61JzLBVG0GhQ8RUjj3OI2osvWifeM6PKNnhpiX7Yw6Sc9euP0qb
	 AX9tS/p/O0ZHuXK2bFV2OtwylI0C9PYhCvk/chJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71CB3F80273;
	Mon, 12 Apr 2021 18:23:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8715CF8032C; Mon, 12 Apr 2021 18:23:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CC45F80273
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 18:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CC45F80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JMGY+XhI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19E3061241;
 Mon, 12 Apr 2021 16:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618244608;
 bh=LT19Tsj7rRQqwqIRqGo+4VMJMhxCyuV1B6R8L5c5T+g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JMGY+XhIM1TwNGVEVIjvRP1qc/fWrk9DB64BEy01y+IcfkUok5FsZBTnQXjrbTTf5
 FPFow012kJijFSvtv0fviyMGoLp9If/Bc0tXhIosIWOjr3KxIpyoxCPv5NH0azv2ah
 q8m64k8TxsXBJz024qjbHwxfGb7qk2QDYWGG4EDsejAFcuKonGos1Z5FL1qhvr9vIQ
 je3koTv5kO0mrEJfAFI1RUKz3qcq3YoIwts1Q+wIFNDnN/SJ0ChZXgq3zYVYBtoABS
 xnZswOT4YHVkt04abg0efSQQLZfb/SmNYY8HqohPxQ0mLRAcTcIpmG1QwMM3j1Zle3
 HEZ4PRvQockgg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 25/51] ASoC: fsl_esai: Fix TDM slot setup for I2S
 mode
Date: Mon, 12 Apr 2021 12:22:30 -0400
Message-Id: <20210412162256.313524-25-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162256.313524-1-sashal@kernel.org>
References: <20210412162256.313524-1-sashal@kernel.org>
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
index 39637ca78cdb..9f5f217a9607 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -524,11 +524,13 @@ static int fsl_esai_startup(struct snd_pcm_substream *substream,
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

