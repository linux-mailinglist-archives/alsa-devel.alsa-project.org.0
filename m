Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1582242459E
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 20:05:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADD57844;
	Wed,  6 Oct 2021 20:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADD57844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633543530;
	bh=1FyjDYtY1nrzviDRJTdzIW4wlmccaijK3EkJ3j2dzGk=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G/CLkhR2tlVxml9EN9rM/xE/t38SUWAUIRjnMHXLBYC+/lVUP5LyMwdjxt0xXNJYx
	 EszZJJ+ZXfOH10X7EQKlLPKRUAyyzk7mi4Z8DIYJHDH3SBYXUfHrmvr7sRYNB0AVDc
	 c+bePqr1z39G4nkwX2sufZgzdDUwu0CEBYzeAa+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F2A1F80249;
	Wed,  6 Oct 2021 20:04:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05CAEF80240; Wed,  6 Oct 2021 20:04:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 068C6F8010B
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 20:04:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 068C6F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Es9hat8W"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 691E361027;
 Wed,  6 Oct 2021 18:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633543445;
 bh=1FyjDYtY1nrzviDRJTdzIW4wlmccaijK3EkJ3j2dzGk=;
 h=Date:From:To:Cc:Subject:From;
 b=Es9hat8WQPRbkGVuBWDHipR6d/RJPHE3loWTi00iznH96AFcjPchhKHbfRwyDDeij
 FMuTslzUG6UsKxn04+aAHddbTbpZxXGlonir4r4Q4TqznkKEGMQ1NSAJulb8Vj3E/l
 npbZM81SmMnl1RQPsLKuymsJxXrezk+euW9CmxoqT6U+GJKIZRQriWO2DbYf13DRvB
 Ir19EAuxro5489dJiOknQYr1akOiB6y1nW5T0ctKnP8OgDJEyYDHkfdfeAaqrTag00
 3bCBrB2zW15BnG9ilfWE23ezvH9SbyU4i18GqtwD3uXNd+wn1N1YalnDhOIveDh1+M
 Uhf1yruccC4gA==
Date: Wed, 6 Oct 2021 13:08:10 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH][next] ASoC: q6asm: use kcalloc() instead of kzalloc()
Message-ID: <20211006180810.GA913370@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>
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

Use 2-factor multiplication argument form kcalloc() instead
of kzalloc().

Link: https://github.com/KSPP/linux/issues/162
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 sound/soc/qcom/qdsp6/q6asm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 9251d8548965..195780f75d05 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -513,7 +513,7 @@ int q6asm_map_memory_regions(unsigned int dir, struct audio_client *ac,
 		return 0;
 	}
 
-	buf = kzalloc(((sizeof(struct audio_buffer)) * periods), GFP_ATOMIC);
+	buf = kcalloc(periods, sizeof(*buf), GFP_ATOMIC);
 	if (!buf) {
 		spin_unlock_irqrestore(&ac->lock, flags);
 		return -ENOMEM;
-- 
2.27.0

