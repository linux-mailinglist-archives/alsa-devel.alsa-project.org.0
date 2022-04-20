Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1961A509091
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 21:40:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A4961B24;
	Wed, 20 Apr 2022 21:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A4961B24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650483636;
	bh=sqNgD2MXHoQ8IBpAkTanik6at2YkEYuRV3llPRaXE2Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tOflKVKz3+Q98sQbrRVgdXtY2xd7rDEsryKVXpsg8nMpBng29/JVCs0WedQ+siNqC
	 3IUWgcB82B2V9FcW9XbWsYfQpgen30+88eCcbQ9zhAIToxMI3gbECrchBdb4zyhYkR
	 yABnfy6ss1Ha5dHH5lkSjQZRSa4jOwcSgHWdltSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1AE0F800C1;
	Wed, 20 Apr 2022 21:39:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1BC3F80217; Wed, 20 Apr 2022 21:39:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94F87F80116
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 21:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94F87F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="l9WZUnoL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C2C2B6126E;
 Wed, 20 Apr 2022 19:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54855C385A1;
 Wed, 20 Apr 2022 19:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650483570;
 bh=sqNgD2MXHoQ8IBpAkTanik6at2YkEYuRV3llPRaXE2Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l9WZUnoLha85T8hpJJCWcMbt42ELnorAvSiBHdcxqEI4SAL6byMI6Jq2zUOEtvpRP
 XYw9BLdykByjP3EFTC4bN+BSL9sMKfUybGkm/uXp1wBzfflT0PnpnXa/5hYhRYOcAh
 ujXRNAqgPoiwQNSIRNIOHZ2ZxnRq/M3Xts1A+OGPT2bbMOFJ4E+kbtWhVx7vdReZv0
 l6DvEvt1WsdbytMQIkZS82RhsY6Y12NPZZCWg6HhvBH29EkDjHB1bXDOPmNw5J7LEr
 oi8roa40I4Tlt8p/vSQPqRcr2TFjg0m/aBRVBH0sVmhBeerQ+XH4Xg1O2RBh2+eMco
 s8yB78y6sNK1g==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: max98090: Generate notifications on changes for
 custom control
Date: Wed, 20 Apr 2022 20:34:54 +0100
Message-Id: <20220420193454.2647908-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420193454.2647908-1-broonie@kernel.org>
References: <20220420193454.2647908-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=748; h=from:subject;
 bh=sqNgD2MXHoQ8IBpAkTanik6at2YkEYuRV3llPRaXE2Y=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiYGA+3fRaSeyfAF+zeMr1rkz2tnnBED9m5uZxlswJ
 Jwrg/2iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYmBgPgAKCRAk1otyXVSH0CJ0B/
 98VsCP4EEh45ozL0eI2S9BOOtSVF6R0eAnzAQn36cee+aMxXI72vowTFJMO3FFsv0PGU9GV6Qsg7zr
 uvk7Npv51beDVa2iVsUn3MfizKEBIkCpJt8OVz6sNANdWMkJ8uLtVJPKMo00wZPAlYWVjtIG5if33s
 u0oAaY4gNqBNWSieNCemjS8ipQHqYhZC83bt7cH9ESx5NVHN/SQXiRi9tMn+x4PGfF6zgtpnQ4laph
 ImFfStShavb5th6mHxftQAgOhIf2S19tOWFzAyFZbbTICqs8lCr7/wUjD0NvJRlLbLWf+lE7bTt/VZ
 HYjPtScsWpFH4ErnsLlHUWkz1VawIw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

The max98090 driver has some custom controls which share a put() function
which returns 0 unconditionally, meaning that events are not generated
when the value changes. Fix that.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 6d9261346842..62b41ca050a2 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -430,7 +430,7 @@ static int max98090_put_enab_tlv(struct snd_kcontrol *kcontrol,
 		mask << mc->shift,
 		sel << mc->shift);
 
-	return 0;
+	return *select != val;
 }
 
 static const char *max98090_perf_pwr_text[] =
-- 
2.30.2

