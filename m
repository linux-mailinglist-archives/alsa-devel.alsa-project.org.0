Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 023DD374324
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:55:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94737179E;
	Wed,  5 May 2021 18:54:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94737179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620233728;
	bh=4KpiqIkSPdogFIPBLLg6Z0qN5SzVJxhS+i54j/9U6Kc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cq5J9gqcOor2al67mQfNt02XRNeQfqE4XOq77pd8jyAgG77/6hiSlcauEfdQedb2o
	 k5ulUMrqsLvhZkMuFHvHkPiVqPUVD/DCyTwjL4PD4xqLhTX0LP03hKNhV4poDUQpb0
	 5qkqRHvC9gT435t6J4tt6MF1yhi0hCZBx4DiZ35U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7BBCF8061F;
	Wed,  5 May 2021 18:39:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E122FF80619; Wed,  5 May 2021 18:39:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3520F8028D
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3520F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NRaYmooj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8FC761481;
 Wed,  5 May 2021 16:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232744;
 bh=4KpiqIkSPdogFIPBLLg6Z0qN5SzVJxhS+i54j/9U6Kc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NRaYmoojdtQgzP/QllZyye8kV3+bEkIQYseWLIzewE3o/pyvRA+A/UVkAbabplML3
 V+HuzCy+2UNE/CEm+i5bcHyg0xIYXj/MRkIq1243Rk6JwV3ndmpiihdUogCydduj5I
 A4UPFV5WOdnEdNdwtXv7DZ/gbnRs9q7VIz36F83Ddm1D8sU9JrQyJZcl4Cxvcp+ji4
 mIo3Nn7T6J2whS49LtC3GqdkYOWEvHp0E2a6Q11bXQ7efq4RClsdLSjOxVYPNr6M6R
 EC3dKfvm8ShjJYJTFYqb6pJa/94lCQ8IhSgH5Za/98g1jhh+4PFpCHhdLIijbQOIgg
 /e3cJ8Ol048iw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 05/46] ASoC: rsnd: core: Check convert rate in
 rsnd_hw_params
Date: Wed,  5 May 2021 12:38:15 -0400
Message-Id: <20210505163856.3463279-5-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163856.3463279-1-sashal@kernel.org>
References: <20210505163856.3463279-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Mikhail Durnev <mikhail_durnev@mentor.com>
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

From: Mikhail Durnev <mikhail_durnev@mentor.com>

[ Upstream commit 19c6a63ced5e07e40f3a5255cb1f0fe0d3be7b14 ]

snd_pcm_hw_params_set_rate_near can return incorrect sample rate in
some cases, e.g. when the backend output rate is set to some value higher
than 48000 Hz and the input rate is 8000 Hz. So passing the value returned
by snd_pcm_hw_params_set_rate_near to snd_pcm_hw_params will result in
"FSO/FSI ratio error" and playing no audio at all while the userland
is not properly notified about the issue.

If SRC is unable to convert the requested sample rate to the sample rate
the backend is using, then the requested sample rate should be adjusted in
rsnd_hw_params. The userland will be notified about that change in the
returned hw_params structure.

Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
Link: https://lore.kernel.org/r/1615870055-13954-1-git-send-email-mikhail_durnev@mentor.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sh/rcar/core.c | 69 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index a6c1cf987e6e..df8d7b53b760 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1426,8 +1426,75 @@ static int rsnd_hw_params(struct snd_pcm_substream *substream,
 		}
 		if (io->converted_chan)
 			dev_dbg(dev, "convert channels = %d\n", io->converted_chan);
-		if (io->converted_rate)
+		if (io->converted_rate) {
+			/*
+			 * SRC supports convert rates from params_rate(hw_params)/k_down
+			 * to params_rate(hw_params)*k_up, where k_up is always 6, and
+			 * k_down depends on number of channels and SRC unit.
+			 * So all SRC units can upsample audio up to 6 times regardless
+			 * its number of channels. And all SRC units can downsample
+			 * 2 channel audio up to 6 times too.
+			 */
+			int k_up = 6;
+			int k_down = 6;
+			int channel;
+			struct rsnd_mod *src_mod = rsnd_io_to_mod_src(io);
+
 			dev_dbg(dev, "convert rate     = %d\n", io->converted_rate);
+
+			channel = io->converted_chan ? io->converted_chan :
+				  params_channels(hw_params);
+
+			switch (rsnd_mod_id(src_mod)) {
+			/*
+			 * SRC0 can downsample 4, 6 and 8 channel audio up to 4 times.
+			 * SRC1, SRC3 and SRC4 can downsample 4 channel audio
+			 * up to 4 times.
+			 * SRC1, SRC3 and SRC4 can downsample 6 and 8 channel audio
+			 * no more than twice.
+			 */
+			case 1:
+			case 3:
+			case 4:
+				if (channel > 4) {
+					k_down = 2;
+					break;
+				}
+				fallthrough;
+			case 0:
+				if (channel > 2)
+					k_down = 4;
+				break;
+
+			/* Other SRC units do not support more than 2 channels */
+			default:
+				if (channel > 2)
+					return -EINVAL;
+			}
+
+			if (params_rate(hw_params) > io->converted_rate * k_down) {
+				hw_param_interval(hw_params, SNDRV_PCM_HW_PARAM_RATE)->min =
+					io->converted_rate * k_down;
+				hw_param_interval(hw_params, SNDRV_PCM_HW_PARAM_RATE)->max =
+					io->converted_rate * k_down;
+				hw_params->cmask |= SNDRV_PCM_HW_PARAM_RATE;
+			} else if (params_rate(hw_params) * k_up < io->converted_rate) {
+				hw_param_interval(hw_params, SNDRV_PCM_HW_PARAM_RATE)->min =
+					(io->converted_rate + k_up - 1) / k_up;
+				hw_param_interval(hw_params, SNDRV_PCM_HW_PARAM_RATE)->max =
+					(io->converted_rate + k_up - 1) / k_up;
+				hw_params->cmask |= SNDRV_PCM_HW_PARAM_RATE;
+			}
+
+			/*
+			 * TBD: Max SRC input and output rates also depend on number
+			 * of channels and SRC unit:
+			 * SRC1, SRC3 and SRC4 do not support more than 128kHz
+			 * for 6 channel and 96kHz for 8 channel audio.
+			 * Perhaps this function should return EINVAL if the input or
+			 * the output rate exceeds the limitation.
+			 */
+		}
 	}
 
 	ret = rsnd_dai_call(hw_params, io, substream, hw_params);
-- 
2.30.2

