Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2293089AF0C
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:18:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7FE2240C;
	Sun,  7 Apr 2024 09:18:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7FE2240C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474320;
	bh=xT943C5Lc6QbwMrA6Li4GMts7767Jo8Mq5mXiDRi4PQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O5q1rN+Th4FhXUnG33Pgz9x1gttQYUiITv/0Xir4SdzPo7OtSq92MQdkE/OWxJxnR
	 TkOzg2hJ5ZSnxsd+gnT/VEpIi77c74sLj5VISckdCvdqy5Ytwt8IjQlpSOPQ907Ayf
	 VprggNQEpdPS3kIdJ4NCu63FfhPlhw8JyhDLJ7gg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3842F8063B; Sun,  7 Apr 2024 09:17:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DEEDCF8062D;
	Sun,  7 Apr 2024 09:17:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7063EF8059F; Tue,  2 Apr 2024 09:12:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63C63F8057A
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 09:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63C63F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Vn749ZgT
Received: by mail.gandi.net (Postfix) with ESMTPA id C7F4AFF810;
	Tue,  2 Apr 2024 07:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712041946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qNpzql9+lH/lBhekmkx7lLo9hsDbNRyvScO8cpF1Sio=;
	b=Vn749ZgTdPjlWbJ72PnBY0ctPhrcvGn3UHn/wE+Z4138OYr6T5OKAwqCwWuEAqBE3drNZX
	0rZLPrkHcR648FVI4TS5hfDdEji/wqfXTN1c3kSTOZF7EYLBbLLblnCzHiIWP8mDKQyaON
	ABeuY8e6oH+Q8oBiEI003YTfiTPzLoF1a7oGXunJTWVFYJG99T5yxavG5x/N+R8YCHr5ZQ
	uZCfOOpxytoN+pBQ/7q55JFVoA2JMMx0aUqw6PK0GnqG1lzM6wJvHzRwvOXIcOVco8eAOD
	uVITNA1Mcp98Tsh7/X4bRuSAILMQ8hG47z7wAKWQ4sOhs2X8vJ9QMOB15rBf0w==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com,
	christophercordahi@nanometrics.ca
Subject: [PATCH v2 06/13] ASoC: ti: davinci-i2s: Delete unnecessary assignment
Date: Tue,  2 Apr 2024 09:12:06 +0200
Message-ID: <20240402071213.11671-7-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
References: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DKSFMQOV66IIONOJM6RMHQBTRTER5ZRF
X-Message-ID-Hash: DKSFMQOV66IIONOJM6RMHQBTRTER5ZRF
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:14:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DKSFMQOV66IIONOJM6RMHQBTRTER5ZRF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In davinci_i2s_hw_params(), mcbsp_word_length is set twice to
asp_word_length[fmt].

Remove second unnecessary assignment.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 sound/soc/ti/davinci-i2s.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index 578b4ae28b71..a2c7c812ea50 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -479,7 +479,6 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 			return -EINVAL;
 		}
 	}
-	mcbsp_word_length = asp_word_length[fmt];
 
 	switch (master) {
 	case SND_SOC_DAIFMT_BP_FP:
-- 
2.44.0

