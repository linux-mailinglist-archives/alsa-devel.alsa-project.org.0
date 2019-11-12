Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F23EEF9D35
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 23:38:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 442EB1667;
	Tue, 12 Nov 2019 23:37:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 442EB1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573598316;
	bh=LaLSsrgErKeIRp7CD7U+V2YB9sMVNM/3dXRY3zpwdpI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q4v8Tzj709T1UmMGCsMvbkYnoMuHxo7nEcheLWJPP7OL1ZuG86KgQQDKPFBZ9BBC6
	 Hl+jt+gwpAz+zwoqeBBcUdAvDOT1dE41NIu9exUo+k3jD7OHiM2e2pLnUZ2LP3/bTb
	 /iFZkmWm7rKATNIzUyzAWECxvnxF17q83jGwdkjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ABF4F804CF;
	Tue, 12 Nov 2019 23:36:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94D2FF804CF; Tue, 12 Nov 2019 23:36:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DAC5F80275
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 23:36:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DAC5F80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="iTB6fj85"
Received: from apollo.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8E46223E5E;
 Tue, 12 Nov 2019 23:36:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1573598207;
 bh=ZQCAeIvVXoosI5EZ8z5kIox93/qG64eH4vjhPLAKDEU=;
 h=From:To:Cc:Subject:Date:From;
 b=iTB6fj85oF0ZhsoYtDOGYHj34i+UA5ro2SweiXUgFZck9fLcO3Pga1XqRnlRqStNB
 J4LFkgEL1XTkffZlv5EC6fHHP7Qx/uWTvbva86JOy2gJHR0WH1pi5QsgqBsiWRgtrn
 EWwoSs60a/xLq6h4p/W28ijJjslI882EOmIn/v5I=
From: Michael Walle <michael@walle.cc>
To: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Date: Tue, 12 Nov 2019 23:36:29 +0100
Message-Id: <20191112223629.21867-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.101.4 at web
X-Virus-Status: Clean
Cc: patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Michael Walle <michael@walle.cc>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH] ASoC: wm8904: fix regcache handling
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The current code assumes that the power is turned off in
SND_SOC_BIAS_OFF. If there are no actual regulator the codec isn't
turned off and the registers are not reset to their default values but
the regcache is still marked as dirty. Thus a value might not be written
to the hardware if it is set to the default value. Do a software reset
before turning off the power to make sure the registers are always reset
to their default states.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 sound/soc/codecs/wm8904.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 2a7d23a5daa8..7d7ea15d73e0 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -1933,6 +1933,7 @@ static int wm8904_set_bias_level(struct snd_soc_component *component,
 		snd_soc_component_update_bits(component, WM8904_BIAS_CONTROL_0,
 				    WM8904_BIAS_ENA, 0);
 
+		snd_soc_component_write(component, WM8904_SW_RESET_AND_ID, 0);
 		regcache_cache_only(wm8904->regmap, true);
 		regcache_mark_dirty(wm8904->regmap);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
