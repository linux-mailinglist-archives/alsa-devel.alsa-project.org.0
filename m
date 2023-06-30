Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C11D745765
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 10:35:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0092A93A;
	Mon,  3 Jul 2023 10:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0092A93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688373301;
	bh=PQzafQPINWzNCKfU5qAbB7q39zv1fe5dtlRulHQmlWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PJxisnJl35CxiXAnL6STsBCDG/StrxSV+AH7cXsveRjodyODq7oEt63Jns6PHAIzO
	 dEqkiP3txeDdu2OVP6FH3CR4reJVsvMKX5ju0reIe8dhaJsuGeBXTNaZI0U8NPB2tt
	 qQ/KfpI8wNZ65fGPwkZWSssxhP6X+3J1cUVQfHeE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A004BF805B0; Mon,  3 Jul 2023 10:32:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0691DF805AE;
	Mon,  3 Jul 2023 10:32:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81B7FF80431; Fri, 30 Jun 2023 16:27:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAE56F80246
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 16:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAE56F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EEH5d8nm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 45E1961758;
	Fri, 30 Jun 2023 14:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB908C433CA;
	Fri, 30 Jun 2023 14:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688135238;
	bh=PQzafQPINWzNCKfU5qAbB7q39zv1fe5dtlRulHQmlWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EEH5d8nmZCFHaRW8Qfwvrw5eNUf+1b2fNeJWl2yEjsEaYvYJH0AzcfYcAfP2rHAe7
	 sBLFMDTvsOaXYOYCudL0iFFfRwKwwgEXgrlXqC4nG23beyJK+aJUOXQInbZy20Tle5
	 3YUWnL39h1Q68uJzcvO+S1WxjG+0y392YKXRo15u8y2hZOIFBW06lIlUlIb2LG2IQ9
	 W66LzIPVxrsK2xDEh2qvjNdaP89h+TF+u9CzC9JRo7aRyQS0XBnFMVTYed/WyuGWvY
	 z+I1c8vDDYWSksfECI0r9E/HS6Sk+9WKQ4ZbhU2M8AVAK243u3Gkw4DgxlGC3YjOaz
	 uQ4eGCn4tJXjw==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qFF5p-0001OQ-BJ; Fri, 30 Jun 2023 16:27:25 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 2/5] ASoC: codecs: wcd938x: drop inline keywords
Date: Fri, 30 Jun 2023 16:27:14 +0200
Message-Id: <20230630142717.5314-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230630142717.5314-1-johan+linaro@kernel.org>
References: <20230630142717.5314-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UZF3MPPX3GIOVAWAD4CG3F5ICPAYGK7H
X-Message-ID-Hash: UZF3MPPX3GIOVAWAD4CG3F5ICPAYGK7H
X-Mailman-Approved-At: Mon, 03 Jul 2023 08:32:29 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UZF3MPPX3GIOVAWAD4CG3F5ICPAYGK7H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The compiler is generally better at deciding what functions should be
inlined than driver authors are.

Drop the bogus inline keyword from two functions that were neither very
small or used in a single place.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/wcd938x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index b8a52a1a63d5..5ce15b622a91 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -2124,7 +2124,7 @@ static int wcd938x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *compon
 	return wcd938x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
 }
 
-static inline void wcd938x_mbhc_get_result_params(struct wcd938x_priv *wcd938x,
+static void wcd938x_mbhc_get_result_params(struct wcd938x_priv *wcd938x,
 						s16 *d1_a, u16 noff,
 						int32_t *zdet)
 {
@@ -2231,8 +2231,8 @@ static void wcd938x_mbhc_zdet_ramp(struct snd_soc_component *component,
 	*zr = zdet;
 }
 
-static inline void wcd938x_wcd_mbhc_qfuse_cal(struct snd_soc_component *component,
-					      int32_t *z_val, int flag_l_r)
+static void wcd938x_wcd_mbhc_qfuse_cal(struct snd_soc_component *component,
+					int32_t *z_val, int flag_l_r)
 {
 	s16 q1;
 	int q1_cal;
-- 
2.39.3

