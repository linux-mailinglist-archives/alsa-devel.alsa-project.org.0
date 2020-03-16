Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B671871EE
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 19:09:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F10A18CB;
	Mon, 16 Mar 2020 19:08:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F10A18CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584382183;
	bh=y9oLjSK2TxUZWlILM/SVB5M0J/KgHI6XPxssQ9hwb/8=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CNdgrPcRasRP0bBwFOna9rrFZACJgMepIKfNZTkJ7qpvS9GNa5wiixP+64OqWe+Fc
	 o5GScxuJOYcDs9w/o785RKEL9l9SOEPxu0O0ATpfZYSW7cNj8z1aLghPrIIQ1I41zE
	 JTPnYNDnHRknRwYscLqK2THFPG4II4ttWTE1AJls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2612F80162;
	Mon, 16 Mar 2020 19:08:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33863F8015B; Mon, 16 Mar 2020 19:07:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 311E0F800D2
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 19:07:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 311E0F800D2
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E40741FB;
 Mon, 16 Mar 2020 11:07:52 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66D323F67D;
 Mon, 16 Mar 2020 11:07:52 -0700 (PDT)
Date: Mon, 16 Mar 2020 18:07:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Applied "ASoC: soc-dai: return proper error for get_sdw_stream()" to
 the asoc tree
In-Reply-To: <20200316151110.2580-1-srinivas.kandagatla@linaro.org>
Message-Id: <applied-20200316151110.2580-1-srinivas.kandagatla@linaro.org>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, vkoul@kernel.org,
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

The patch

   ASoC: soc-dai: return proper error for get_sdw_stream()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 308811a327c38364fff7752d3009160632f5dd5e Mon Sep 17 00:00:00 2001
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Mon, 16 Mar 2020 15:11:10 +0000
Subject: [PATCH] ASoC: soc-dai: return proper error for get_sdw_stream()

snd_soc_dai_get_sdw_stream() returns null if dai does not support
this callback, this is no very useful for the caller to
differentiate if this is an error or unsupported call for the dai.

return -ENOTSUPP in cases where this callback is not supported.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20200316151110.2580-1-srinivas.kandagatla@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dai.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 7f70db149b81..78bac995db15 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -433,7 +433,7 @@ static inline int snd_soc_dai_set_sdw_stream(struct snd_soc_dai *dai,
  * This routine only retrieves that was previously configured
  * with snd_soc_dai_get_sdw_stream()
  *
- * Returns pointer to stream or NULL;
+ * Returns pointer to stream or -ENOTSUPP if callback is not supported;
  */
 static inline void *snd_soc_dai_get_sdw_stream(struct snd_soc_dai *dai,
 					       int direction)
@@ -441,7 +441,7 @@ static inline void *snd_soc_dai_get_sdw_stream(struct snd_soc_dai *dai,
 	if (dai->driver->ops->get_sdw_stream)
 		return dai->driver->ops->get_sdw_stream(dai, direction);
 	else
-		return NULL;
+		return ERR_PTR(-ENOTSUPP);
 }
 
 #endif
-- 
2.20.1

