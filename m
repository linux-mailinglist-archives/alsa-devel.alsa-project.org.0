Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C02785742E8
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:28:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52F1F17F6;
	Thu, 14 Jul 2022 06:27:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52F1F17F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657772884;
	bh=21nWqJIuJuPyc3MGE2rDN2XazBAGhO1m2aDnsDAArdw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T1/Qd0vbOXvTkDrgCB4ewTL0rP2RVsusTsrH0BTYj/cDJfpO5E/4tRWsB6MKkcBZy
	 QPgbEmbur1BndooKSWX49Ht/dDY2oFkqBAzHJAYy/upUsv7moXx+6OB4BQRGM6PcqW
	 Rw+rXRyeOrmlLSujJCHQqnrZFZ4HV831iELRz4e8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89186F805E7;
	Thu, 14 Jul 2022 06:23:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6503EF805E5; Thu, 14 Jul 2022 06:23:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E428DF805C6
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:23:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E428DF805C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ki9TpvZi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 92F0E61E91;
 Thu, 14 Jul 2022 04:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0958C385A2;
 Thu, 14 Jul 2022 04:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772589;
 bh=21nWqJIuJuPyc3MGE2rDN2XazBAGhO1m2aDnsDAArdw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ki9TpvZib08382bLyRQ4jbjYhMdxJVkv9X1F0zz6EFrg6E5rvCwqDc/lbo0/QK0iQ
 ttsfH8ow5FbNkeK/p8TafxACjT7jNZACiYgxDDilH1iqAH6heK8EavVLgFqtJW4hni
 zxLxgpMTrTjKr7lauOVHj5svN73P0t3fkP+UFcXT4sb+xGY2Qjk2wwR6eAL0l8sQx0
 Ze1H4ZGa8GRcwOxDylSvyLP7yTrcn7jpwtSzfoQVnfmlF0sK+OyX+1vw5cPMVptk4Y
 rBOVPK5GE8yX7Gi/qqiiJXfosCbvGLYs74sRbfZ5fH+7sICkRFQA7d/6JvX8WSTmvi
 4VcD16t5U74/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 17/41] ASoC: wm_adsp: Fix event for preloader
Date: Thu, 14 Jul 2022 00:21:57 -0400
Message-Id: <20220714042221.281187-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042221.281187-1-sashal@kernel.org>
References: <20220714042221.281187-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 simont@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit 9896c029f0df628c6cb108253d09b1d61f1d4a88 ]

The preloader controls on ADSP should return a value of 1 if the
preloader value was changed, update to correct this.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220621102041.1713504-1-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm_adsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 9cfd4f18493f..d3ecff3bdef2 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -997,7 +997,7 @@ int wm_adsp2_preloader_put(struct snd_kcontrol *kcontrol,
 		snd_soc_dapm_sync(dapm);
 	}
 
-	return 0;
+	return 1;
 }
 EXPORT_SYMBOL_GPL(wm_adsp2_preloader_put);
 
-- 
2.35.1

