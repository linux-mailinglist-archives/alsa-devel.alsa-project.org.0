Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B492F63AF3B
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 18:40:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54BAB16D3;
	Mon, 28 Nov 2022 18:39:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54BAB16D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669657204;
	bh=PAxi6eeJkAJBPTiO6t6sK57HyXc9bdfpzD8eQdRXDQ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mupsOt2MSJRDIbJbRMWHoWXj+N1kxJGgq+eth/6ijQCz502K4ORqqawnpAJmgeqPe
	 iJoppy4aWsCZFEbsr8M8mjiPWribRXgq0cZ3z0nvsOJWdHl16WJq//3s0VpHCyKdee
	 Qn66L75eCiznmfJm9RPb3o4wqmOH8qiAvng0qafw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95EC0F804D8;
	Mon, 28 Nov 2022 18:38:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3C30F8028B; Mon, 28 Nov 2022 18:38:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CF96F80166
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 18:38:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CF96F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XLMjF2Uj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A6041B80EA1;
 Mon, 28 Nov 2022 17:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09140C43154;
 Mon, 28 Nov 2022 17:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669657117;
 bh=PAxi6eeJkAJBPTiO6t6sK57HyXc9bdfpzD8eQdRXDQ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XLMjF2UjaenvdhCBrYuv0ecKju5kyfRXRYzqbbxY03txyy4IsyFZrxtUWghJVRxjS
 ItDct9cBnACbB8mqXi4w/rM/WvjPAsfqMjYJUXyNLYatTu4yPa4uGoKRCe8OtE8TI/
 h91LNWV/iUyvBfViPQbI+jfBwdglxVJuQQ2ptL5DgReEv9LUDN3st77k4Ocq2FQ1eC
 xA34HYF7ESUSiMHR4oOU5GSXsp5GPCg5+vcNSyklhV5D9hKtkDWxKb+m9ozFU+IvSi
 iTc4cUg5idZ36DpF/FCeBJFHCLFlOJknjvEyyqmsEmidI4V+uD0ZeMWUzuaSYcqcYL
 YTKq97LgfNzig==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 19/39] ASoC: rt711-sdca: fix the latency time of
 clock stop prepare state machine transitions
Date: Mon, 28 Nov 2022 12:35:59 -0500
Message-Id: <20221128173642.1441232-19-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128173642.1441232-1-sashal@kernel.org>
References: <20221128173642.1441232-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, oder_chiou@realtek.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, Shuming Fan <shumingf@realtek.com>
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

From: Shuming Fan <shumingf@realtek.com>

[ Upstream commit c7d7d4e7bb1290cc473610b0bb96d9fa606d00e7 ]

Due to the hardware behavior, it takes some time for CBJ detection/impedance sensing/de-bounce.
The ClockStop_NotFinished flag will be raised until these functions are completed.
In ClockStopMode0 mode case, the SdW controller might check this flag from D3 to D0 when the
jack detection interrupt happened.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20221116090318.5017-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt711-sdca-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index a085b2f530aa..31e77d462ef3 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -230,7 +230,7 @@ static int rt711_sdca_read_prop(struct sdw_slave *slave)
 	}
 
 	/* set the timeout values */
-	prop->clk_stop_timeout = 20;
+	prop->clk_stop_timeout = 700;
 
 	/* wake-up event */
 	prop->wake_capable = 1;
-- 
2.35.1

