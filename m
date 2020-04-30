Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5811BFBFB
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 16:03:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFB9C16A6;
	Thu, 30 Apr 2020 16:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFB9C16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588255386;
	bh=dOA8n0tJWKHGY0ZgO52Pl8gFZpj1lU4mNQIpj3C22lk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E620ZoR4vsB7/+6Opjwa3zUxJfTpnWVHj63dciTOhIN4hwh/D7pPSQqJJJHO1gw8U
	 UHqqoPvOnHf5w2yQqt3rQRlsVT0Flw03I729bsb5Nq+WD5gXQ2oUHvzs6fqwV/rGMe
	 lmDQYCNfgE+vQ5vrCR1oaA1/nTwZoztRsVgUTlcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F288F8034A;
	Thu, 30 Apr 2020 15:51:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B745AF80348; Thu, 30 Apr 2020 15:51:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7831AF80348
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 15:51:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7831AF80348
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gmGcuZ/D"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C5BE20873;
 Thu, 30 Apr 2020 13:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588254708;
 bh=dOA8n0tJWKHGY0ZgO52Pl8gFZpj1lU4mNQIpj3C22lk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gmGcuZ/DZnf+4SY0nSggB1iB1UbMSgZ5B54Y4RedYgnsbbBrW3TKqNDgQb8oU/R1K
 eKrf5vdhz6iSSE+0oiDlaRs2WCjLEEorltQI09MEildfoLqvfKImmMgdBGLnSQ31bV
 X0rOS7uHZyflCk7BQoVh1CCcmo9v/OGwcZmhhKI8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 56/79] ASoC: wm8960: Fix wrong clock after suspend
 & resume
Date: Thu, 30 Apr 2020 09:50:20 -0400
Message-Id: <20200430135043.19851-56-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430135043.19851-1-sashal@kernel.org>
References: <20200430135043.19851-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, patches@opensource.wolfsonmicro.com,
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

From: Shengjiu Wang <shengjiu.wang@nxp.com>

[ Upstream commit 1e060a453c8604311fb45ae2f84f67ed673329b4 ]

After suspend & resume, wm8960_hw_params may be called when
bias_level is not SND_SOC_BIAS_ON, then wm8960_configure_clocking
is not called. But if sample rate is changed at that time, then
the output clock rate will be not correct.

So judgement of bias_level is SND_SOC_BIAS_ON in wm8960_hw_params
is not necessary and it causes above issue.

Fixes: 3176bf2d7ccd ("ASoC: wm8960: update pll and clock setting function")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/1587468525-27514-1-git-send-email-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm8960.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index 55112c1bba5e7..6cf0f6612bdaf 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -860,8 +860,7 @@ static int wm8960_hw_params(struct snd_pcm_substream *substream,
 
 	wm8960->is_stream_in_use[tx] = true;
 
-	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_ON &&
-	    !wm8960->is_stream_in_use[!tx])
+	if (!wm8960->is_stream_in_use[!tx])
 		return wm8960_configure_clocking(component);
 
 	return 0;
-- 
2.20.1

