Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A729995181
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 16:24:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CECAF51;
	Tue,  8 Oct 2024 16:24:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CECAF51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728397486;
	bh=FTUE6CHWE75yswv5NHdLIb/r24O+NKCudvFgq8Fh62Y=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=F6pwV1I1/my2+Mn/TAjSk9N5Rs20jKUOlYvdaNDBqCYprBpBhPvSI4L2QtEoAXRcy
	 idgOxcVcPHf9x25cCvzwtKWsxRBu7wEqWkXwNZKgPM8PaYw5tCNJ4uEHKIZXK/M+uj
	 kDkRa5nwZTAf3fbb6P5kdo0Pp8j7V4wZTFEtyUzU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EEEDF8080A; Tue,  8 Oct 2024 16:21:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DAE9CF80800;
	Tue,  8 Oct 2024 16:21:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F213DF80517; Fri,  4 Oct 2024 16:11:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26799F800C9
	for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2024 16:10:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26799F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iXUHot2p
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-20b93887decso18261045ad.3
        for <alsa-devel@alsa-project.org>;
 Fri, 04 Oct 2024 07:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728051058; x=1728655858;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G+Gl2fQgPUCtMfHbBwf8K9TjCPojUwKqtER0U4Ha0P4=;
        b=iXUHot2pHMo7b42D4r/2ehgRBFuVp1PCmyHolhNvGKqeD26B1j8KJdeb/QiXnPO6Wk
         kcP44AGHxFk1Pxkvsbry77v3XtBUrb6a2xP5PTRWBwodlgkZJVwS5Jetp/gWq//lidWr
         QV40ivT8el/Oj1HHG2sjhsiNwO2rAzarjdDgYva9tqY1XiCJqkcuzp4Xw14zu9pHIC3t
         IdjaCtUuFqT7JzkN7icyZbL1AVv3EfkhoRhrPuWC4SV+buV43zWsuPJARiqqG9tQjEhW
         vaTDKBa2vPqfvFULh5bqa9KRgq4hkYl5cvHLJarnpv9CX+bFoWr8lUcBW4TXHlPDt0U/
         7jhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728051058; x=1728655858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+Gl2fQgPUCtMfHbBwf8K9TjCPojUwKqtER0U4Ha0P4=;
        b=OF8Af21z5qvKWAMkh+p7unlhKZRUa40bWPeYkWYyWGUH3BJxStCqkuB+SeQD2z+fdF
         TzkUKPB3TS0L89QDhsuxdbia7jwyreYMzXcmMFCUGPLZL7Q4pHj+ul4FAYSYlMZh/ygy
         8VwZIpGOE0Z9CPkfmneyjqb1o6ICarEWx4N64OErDgOehmzImYbv9UyW3dCUcIm5HnbJ
         lLlQuDAuWQVf87vsjrz5CcvUeYgZD1P3KGXF6hqAxWKBA6Z/1BUybpaGBfUIMyoz/kc0
         iSRjTHwP2kpGgAGU/A5YZDlrG80JLjdyc4Qn/farsd0DLGi321G2GjXfTLD0cWe9RU6G
         uPaQ==
X-Gm-Message-State: AOJu0Yx7UjLIK6aWSuSHsPiV3k6JEietF7ajAvUYdjLmZogtaLSeYGfX
	I4VmkYezSfLTw9QZvKEq5C2zPeqF8DmhAFs7bm00y+UdrYw6NG1T
X-Google-Smtp-Source: 
 AGHT+IFMvB08uHXQ8m86efriWvwk9rMcme3rK7IGLHYovJhvIAMePJxrcbbbdajwkNzKJclz8GZ9LA==
X-Received: by 2002:a17:903:1c6:b0:20b:5ea2:e06 with SMTP id
 d9443c01a7336-20bff1f6a16mr34519425ad.56.1728051057520;
        Fri, 04 Oct 2024 07:10:57 -0700 (PDT)
Received: from advait-kdeneon.. ([2405:201:1e:f1d5:cc2a:fef9:63f0:2e09])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20bef7074ddsm24480145ad.243.2024.10.04.07.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 07:10:56 -0700 (PDT)
From: Advait Dhamorikar <advaitdhamorikar@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.orgs,
	skhan@linuxfoundation.org,
	anupnewsmail@gmail.com,
	Advait Dhamorikar <advaitdhamorikar@gmail.com>
Subject: [PATCH] Fix unsigned int compared against 0
Date: Fri,  4 Oct 2024 19:40:46 +0530
Message-Id: <20241004141046.61265-1-advaitdhamorikar@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: advaitdhamorikar@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NSAJA6QLMDXU2SS4G6C2M2UM3EOJGYCQ
X-Message-ID-Hash: NSAJA6QLMDXU2SS4G6C2M2UM3EOJGYCQ
X-Mailman-Approved-At: Tue, 08 Oct 2024 14:21:18 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NSAJA6QLMDXU2SS4G6C2M2UM3EOJGYCQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

An unsigned value held by offset can never be
negative, so this test will always evaluate
the same way and is therefore redundant.

Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
---
 sound/soc/codecs/tlv320adc3xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index 7073b9d1cda8..868e8a91e05b 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -961,7 +961,7 @@ static int adc3xxx_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	if (offset >= ADC3XXX_GPIOS_MAX)
 		return -EINVAL;
 
-	if (offset >= 0 && offset < ADC3XXX_GPIO_PINS) {
+	if (offset < ADC3XXX_GPIO_PINS) {
 		/* GPIO1 is offset 0, GPIO2 is offset 1 */
 		/* We check here that the GPIO pins are either not configured
 		 * in the DT, or that they purposely are set as outputs.
-- 
2.34.1

