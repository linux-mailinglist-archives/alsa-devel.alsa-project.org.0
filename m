Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B2E54A530
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 04:18:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BA6E18F1;
	Tue, 14 Jun 2022 04:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BA6E18F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655173092;
	bh=+1TLaFmHua8IBNRCN5x+vDP5VBwQ5CoiTgi7CN00kSY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=isB2vDscAAV4gI1zLaEjdhRbc5Yt4Bq4SKmfj8tPk8oxEOua/TjFUR5wvrKnWUvqi
	 jKfzGpHPuHbkDJUguRMTG2WWdFLo6A9uK1m/WU+2cyCamzfn+oI1q8l3krPQRB1aWG
	 OImM8yhdmTT/ubY96azW50LsckP/4onbiFtHrkZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAEC8F80623;
	Tue, 14 Jun 2022 04:08:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A03E9F80609; Tue, 14 Jun 2022 04:08:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF364F8060F
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 04:08:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF364F8060F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EUW1xA0p"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB36D61014;
 Tue, 14 Jun 2022 02:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF279C34114;
 Tue, 14 Jun 2022 02:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172516;
 bh=+1TLaFmHua8IBNRCN5x+vDP5VBwQ5CoiTgi7CN00kSY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EUW1xA0pGLTr/75ADSkwly1xGRiqU0J933Gk4hwecqj1mBRxG4Nsww3bLEQUbyoQh
 Oa5EyVG/vcvcAlhFAkmD/qLvHyMrus2yvfcbwfHvKFYPdR9L7dizRXm6uKd1f7I0X0
 Lpwk9jG3tAnQvKw1IbfUYQzP+7N29Akg09cIQZ6VFslDFgveKVFR6A4v5WmqFkOvf3
 otYlvHgcKBKJ+5+QXHQHcthDyGaaTf55VRMtyhUjduszq6m0s6z/be6QrtRCvXKjGa
 cZE0lMB77+VaQUK61WClr/AfK9h991aG0heFM03oAI1dfNzrgfnRTBdTXXeo0dWAc5
 BMXQn//z8G0SA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 13/29] ASoC: es8328: Fix event generation for
 deemphasis control
Date: Mon, 13 Jun 2022 22:07:59 -0400
Message-Id: <20220614020815.1099999-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020815.1099999-1-sashal@kernel.org>
References: <20220614020815.1099999-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>
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

From: Mark Brown <broonie@kernel.org>

[ Upstream commit 8259610c2ec01c5cbfb61882ae176aabacac9c19 ]

Currently the put() method for the deemphasis control returns 0 when a new
value is written to the control even if the value changed, meaning events
are not generated. Fix this, skip the work of updating the value when it is
unchanged and then return 1 after having done so.

Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20220603123937.4013603-1-broonie@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/es8328.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 7e26231a596a..081b5f189632 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -161,13 +161,16 @@ static int es8328_put_deemph(struct snd_kcontrol *kcontrol,
 	if (deemph > 1)
 		return -EINVAL;
 
+	if (es8328->deemph == deemph)
+		return 0;
+
 	ret = es8328_set_deemph(component);
 	if (ret < 0)
 		return ret;
 
 	es8328->deemph = deemph;
 
-	return 0;
+	return 1;
 }
 
 
-- 
2.35.1

