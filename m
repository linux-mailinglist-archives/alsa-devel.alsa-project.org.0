Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1286E252EB3
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 14:31:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0F5B1754;
	Wed, 26 Aug 2020 14:30:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0F5B1754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598445075;
	bh=5begK13A57C1a458MwTLaxrZjgC2tYsW7SVnYewFwTA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tlWnR8mNZAG/DJu/4wXI2Y5QkTmwJpqwDch/xpJz/Pn8xbHL4bbt0DzYY3GtfvVYk
	 kn4efePzm6QwbtLNLhzgR84zyU22xlOwVU7iN0KT4dhGaOW4rU2Yfk3/l6z8nYmQ0R
	 uNlD9quf2+uJa+tPCnPKjp8P3ULrFZ1BfhEDk8eU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16441F802BC;
	Wed, 26 Aug 2020 14:28:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25D40F801D9; Wed, 26 Aug 2020 14:28:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30EBBF800EB
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 14:28:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30EBBF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NudrIMqo"
Received: from localhost.localdomain (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9BF352087D;
 Wed, 26 Aug 2020 12:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598444907;
 bh=5begK13A57C1a458MwTLaxrZjgC2tYsW7SVnYewFwTA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NudrIMqo3vdrxqfhs/hSniBGSwAbwd9EtaJ4L6ERTgdByO2mvODjB6ApnD+dNx6Jx
 pubM0T5K3dE/aRJBPRh2raKegrlD5sy+ivNzwiwBUYJPe4u3pALQ5FzB2z21/y3f4x
 lcE7TuPZs9u4Bsqw+Og5OD6cHfzpYqnqqFqNXg38=
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/4] ASoC: rt1308-sdw: Fix return check for
 devm_regmap_init_sdw()
Date: Wed, 26 Aug 2020 17:58:09 +0530
Message-Id: <20200826122811.3223663-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200826122811.3223663-1-vkoul@kernel.org>
References: <20200826122811.3223663-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Shuming Fan <shumingf@realtek.com>
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

devm_regmap_init_sdw() returns a valid pointer on success or ERR_PTR on
failure which should be checked with IS_ERR. Also use PTR_ERR for
returning error codes.

Reported-by: Takashi Iwai <tiwai@suse.de>
Fixes: a87a6653a28c ("ASoC: rt1308-sdw: add rt1308 SdW amplifier driver")
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 sound/soc/codecs/rt1308-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index b0ba0d2acbdd..56e952a904a3 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -684,8 +684,8 @@ static int rt1308_sdw_probe(struct sdw_slave *slave,
 
 	/* Regmap Initialization */
 	regmap = devm_regmap_init_sdw(slave, &rt1308_sdw_regmap);
-	if (!regmap)
-		return -EINVAL;
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
 
 	rt1308_sdw_init(&slave->dev, regmap, slave);
 
-- 
2.26.2

