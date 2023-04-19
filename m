Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6C86E78E5
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 13:46:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DE7BEE2;
	Wed, 19 Apr 2023 13:46:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DE7BEE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681904818;
	bh=0EimNkwL3NzqPyYJdRFVT8tpM9/mvdkOg05MG6AIYZ4=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qBxaacTYdIv17BufBkfLhX66gLyqU1az3/ZAlPL0Q2/Pf6JqgFbnS6EQ45HP0bYWg
	 yXonoPOUtWpA2T/GYm/bLrP3jDSjHRkfhHfMxq3fWUr3V6mNVrw/9G+k1JieRdX5g9
	 rkylHSEtcjXc+ouClcr3Q2K0ps3+EmliJueATaY4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1B59F80149;
	Wed, 19 Apr 2023 13:46:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35574F80155; Wed, 19 Apr 2023 13:46:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D47B5F800D0
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 13:45:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D47B5F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pjoRgABh
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B036D6345A;
	Wed, 19 Apr 2023 11:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53D3C433EF;
	Wed, 19 Apr 2023 11:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681904754;
	bh=0EimNkwL3NzqPyYJdRFVT8tpM9/mvdkOg05MG6AIYZ4=;
	h=From:To:Cc:Subject:Date:From;
	b=pjoRgABhi15Q0t2nLYVz7bbdt2nxD+ZqRwMiJdIXKyGO2bRFnAHrSY25L/Eg27VA3
	 f6X3o0Wz6jRwJOQ/kmwX/BwgATGbM1qMyiZSAcnIKE5naPS/i57iL2t0DyP85zNDXw
	 liX5LuRkHVFxPSC2ySeZ/+MCRvILg4M7IhYLidYdPLuhd0ez8XJcH1wX3CL3fDyX+5
	 t6VIkE/MHK8u1id89Mw22aj2rM7sv+rDkAU9G0G2eK/I3YqVQhJXyAx3R0qn3WjdOJ
	 7jxKOY3sSvs7aNsJcXAPyvrU9idhAw5xeTOnm8WfNXe9RnhSPXXhWJu5YKAl32kNKG
	 CVpBjkrmrk88Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	David Lin <CTLIN0@nuvoton.com>
Subject: [PATCH] ASoC: nau8825: fix delay time range check
Date: Wed, 19 Apr 2023 13:45:39 +0200
Message-Id: <20230419114546.820921-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HYS7X4W4OAD53V226VBSWHJZAMVVIJP6
X-Message-ID-Hash: HYS7X4W4OAD53V226VBSWHJZAMVVIJP6
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>,
 Peter Rosin <peda@axentia.se>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HYS7X4W4OAD53V226VBSWHJZAMVVIJP6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

clang points out that the recently added range check is nonsensical:

sound/soc/codecs/nau8825.c:2826:31: error: overlapping comparisons always evaluate to false [-Werror,-Wtautological-overlap-compare]
        if (nau8825->adc_delay < 125 && nau8825->adc_delay > 500)
            ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~

The DT binding document confirms that the intention is to warn if
it's outside of the 125..500 range, so do that instead.

Fixes: fc0b096c9291 ("ASoC: nau8825: Add delay control for input path")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/nau8825.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index c4389f5fe603..f4eb999761a4 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -2823,7 +2823,7 @@ static int nau8825_read_device_properties(struct device *dev,
 	ret = device_property_read_u32(dev, "nuvoton,adc-delay-ms", &nau8825->adc_delay);
 	if (ret)
 		nau8825->adc_delay = 125;
-	if (nau8825->adc_delay < 125 && nau8825->adc_delay > 500)
+	if (nau8825->adc_delay < 125 || nau8825->adc_delay > 500)
 		dev_warn(dev, "Please set the suitable delay time!\n");
 
 	nau8825->mclk = devm_clk_get(dev, "mclk");
-- 
2.39.2

