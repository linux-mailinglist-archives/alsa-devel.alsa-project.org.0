Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C485F527F28
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 10:05:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C20C1697;
	Mon, 16 May 2022 10:04:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C20C1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652688326;
	bh=pN65gQJ10OF32RZKO8EWFjPhG23Ifbr/m0Il5f4ZdLI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u+C0AQ5RZ7ZBN/Uv4E3PqfzXBSB3yGjf7LZ0vaF1KmBwYvLStzv94sE0Y8fGKZeiT
	 T3HrX/kyaI45pnMsHCBtQaaFlPMQHqaVfB8hu0DLUe6WW099LiP9nhyUFKj/UBC5ln
	 hx3hwIFj7jocrRN+q5VuEENDql2ahqfj/0iHQULk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1444F801D5;
	Mon, 16 May 2022 10:03:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73A4EF80245; Thu, 12 May 2022 09:44:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6830F8011C
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 09:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6830F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.b="DiruNwr0"
Received: by mail-ed1-x533.google.com with SMTP id z19so5202353edx.9
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 00:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DrDbGhLo7XaClO51j9YJvUywtHQ0+/I5lMy5wJbGhKc=;
 b=DiruNwr0imBp+10H53dtlHhIGwryjAwAWWCxLchPrV+5Ds5esyMWKjS3HAq8f4h/7O
 VZ8MmEQaRkIYQ8sFGjoZL7WHBNcERhJ9n5ZHJMUFreePm93eQoOr4FDrKr4sWpp1fB4N
 paupObkAaW1R41KdMj35taLnJ2UhWNnuoOsss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DrDbGhLo7XaClO51j9YJvUywtHQ0+/I5lMy5wJbGhKc=;
 b=i703VjgXAQSvWZFZvMSpKuBf5Sf2CQ//vnNZ0/k3BuiVLCEzCAH4JUgk1XMSpFFS7d
 mjXXTrmu8nRZhqXVijZwWQsvZgDPY/UMBS69yloHj4lAtfZl6U+6I23QShIOg0ua4l6q
 fNHpX9/nYMJ15E3Kmrc1qyaWpFcaXm3yK3WjwOspLM1v7go4EUqzmAzW18Rj7zCdF1nZ
 E7jaP7iFb/sT+F9sKSKK2xnmWPhDJJLJ4Xpy48f07eVS/dySREMfMScZQESQT/PGhUol
 QZlzxu5syVkXAEjb7U/U861EAaxN4/Hj38qyOg7fJtwKR8lnb03evZuCcL2TadLkgalU
 HNOw==
X-Gm-Message-State: AOAM5316PoFGEXVx6SSQRwVBOeYb/ENPLviSv13/7alL9Y/na6+EYnBb
 T9dmuKa0cQ1Wimnt+SXULQCLmIYKKDQHuw==
X-Google-Smtp-Source: ABdhPJx58tfL7OheWyZCoXsZi7LTgs1k6P5QALJf6eVDOoqqZCFTxJOEZzC3/cKaG5YF/CTWwcEUwg==
X-Received: by 2002:a05:6402:4241:b0:428:177b:5fd with SMTP id
 g1-20020a056402424100b00428177b05fdmr32950480edb.193.1652341444209; 
 Thu, 12 May 2022 00:44:04 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station
 (net-188-217-59-245.cust.vodafonedsl.it. [188.217.59.245])
 by smtp.gmail.com with ESMTPSA id
 cm10-20020a0564020c8a00b0042617ba63c0sm2192721edb.74.2022.05.12.00.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 00:44:03 -0700 (PDT)
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: 
Subject: [PATCH] ASoC: max98088: add support for reg_4a_cfg_bypass reg
Date: Thu, 12 May 2022 09:43:58 +0200
Message-Id: <20220512074359.446999-1-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 May 2022 10:03:51 +0200
Cc: alsa-devel@alsa-project.org, linux-amarula@amarulasolutions.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 tommaso.merciai@amarulasolutions.com, Mark Brown <broonie@kernel.org>,
 linuxfancy@googlegroups.com, linux-kernel@vger.kernel.org
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

Add mixer controls support for M98088_REG_4A_CFG_BYPASS register

References:
 - https://datasheets.maximintegrated.com/en/ds/MAX98089.pdf p71, p113

Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
---
 sound/soc/codecs/max98088.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index 429717d4ac5a..f8ec2f164e08 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -486,6 +486,11 @@ static const struct snd_kcontrol_new max98088_snd_controls[] = {
        SOC_SINGLE("EQ1 Switch", M98088_REG_49_CFG_LEVEL, 0, 1, 0),
        SOC_SINGLE("EQ2 Switch", M98088_REG_49_CFG_LEVEL, 1, 1, 0),
 
+       SOC_SINGLE("SPK Bypass Switch", M98088_REG_4A_CFG_BYPASS, 0, 1, 0),
+       SOC_SINGLE("REC Bypass Switch", M98088_REG_4A_CFG_BYPASS, 1, 1, 0),
+       SOC_SINGLE("MIC2 Bypass Switch", M98088_REG_4A_CFG_BYPASS, 4, 1, 0),
+       SOC_SINGLE("INA Bypass Switch", M98088_REG_4A_CFG_BYPASS, 7, 1, 0),
+
        SOC_ENUM("EX Limiter Mode", max98088_exmode_enum),
        SOC_ENUM("EX Limiter Threshold", max98088_ex_thresh_enum),
 
-- 
2.25.1

