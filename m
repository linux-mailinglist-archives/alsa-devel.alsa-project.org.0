Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 517275A0DBD
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 12:18:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60623823;
	Thu, 25 Aug 2022 12:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60623823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661422712;
	bh=12fTG4cZBvXMtI67O3L36sTdb+JYC6vInBRPzsI4gKQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dkU/T7jVTkI0L7a3V3NjNNJmQKftVLPuFKExbSptGdwExUZ/mY3/KmVG4adBYbZlH
	 gZJnbjb3SSqIPYzr/fQPtsOoGSIgl7+X/TQykjQo+jNEg/nt716cZ32IJAkJPw+eJo
	 Vl9YnwsJQN8glWbAJjkGmW06sWyeYT9UsptwgYNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE11BF80271;
	Thu, 25 Aug 2022 12:17:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88C5BF8025A; Thu, 25 Aug 2022 12:17:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 533EFF800C8
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 12:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 533EFF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.b="MkA5Ertc"
Received: by mail-ed1-x530.google.com with SMTP id b16so25479643edd.4
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 03:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=GRYnjCoOv7fVbYVCxvtIrJ8TN8JZyVqLZt43NaKxUoM=;
 b=MkA5Ertcl0rV0VTl6MFoxunlFKjgNYw4ii9oZZFjiQ9nbVkpNJ846hByN55W3qH+y2
 xmi3SY8zqPgJwRleEDWX3UqzBWw4xec0nu5OmJh18SXuDOsymlLxry5XVR19uu/5R3V5
 GZAcmhkfiszfhazV5kOLPzNPugYybWoy1zF1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=GRYnjCoOv7fVbYVCxvtIrJ8TN8JZyVqLZt43NaKxUoM=;
 b=GFQMzadYCOqrtg3qQTolT34bMg4fai1KRySq5Mb2AmlSIIA2k9XZzT7+/aQypV9h5n
 5nL9tLQ/5QQPRHqa6iiQwCK1XmVuYc0pjH9YVR9o4pA88jxfrmYFLqvWw26LPEy9yiuv
 MY0bcG8NRF/DkU5HYDzZsq1KcOCzMGLkqPCVO6flGSGS/Co7AsOGZJ3PPzfygCwQzLFB
 p7omuFWLjxJONL7ZnU/iTS6ZoZYzljJgbNhgYZGG+56kZdTjrMIBZWJ+/5Qht7c65J0m
 9p7b4fCI32rC3ePCs4J2FwQT0rtatQDvAKvmsLdf6JGomT1MQdfGe/+t4oz1y+6RBg1o
 gS7Q==
X-Gm-Message-State: ACgBeo39kInCaqpD0L3BUkykoEITxp9p45o+7jV4xZF4pZybaakf4s3R
 kxCNjbSP9qax/utt5NhqPSlTDw==
X-Google-Smtp-Source: AA6agR4VZr+45kHmpz4/CpzPzba03L/xyCKRO3rzRdai4aPfScrrrb8n6XRGo0La5yDq6ZtGPbJbyQ==
X-Received: by 2002:a05:6402:1d4d:b0:447:67b:2631 with SMTP id
 dz13-20020a0564021d4d00b00447067b2631mr2519353edb.243.1661422642447; 
 Thu, 25 Aug 2022 03:17:22 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station
 (net-188-217-57-252.cust.vodafonedsl.it. [188.217.57.252])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a170906698c00b0073c23616cb1sm2320314ejr.12.2022.08.25.03.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 03:17:22 -0700 (PDT)
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: tommaso.merciai@amarulasolutions.com
Subject: [PATCH] ASoC: max98088: add support for noise gate reg
Date: Thu, 25 Aug 2022 12:17:13 +0200
Message-Id: <20220825101714.81580-1-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 linuxfancy@googlegroups.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-amarula@amarulasolutions.com, linux-kernel@vger.kernel.org
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

Add support for Noise Gate Threshold reg (ANTH reg 0x40 bit 4 to 7)

References:
 - https://datasheets.maximintegrated.com/en/ds/MAX98089.pdf, p75

Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
---
 sound/soc/codecs/max98088.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index 5ef2e1279ee7..76ef71ab9c83 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -474,6 +474,9 @@ static const struct snd_kcontrol_new max98088_snd_controls[] = {
                        max98088_mic2pre_get, max98088_mic2pre_set,
                        max98088_micboost_tlv),
 
+        SOC_SINGLE("Noise Gate Threshold", M98088_REG_40_MICAGC_THRESH,
+               4, 15, 0),
+
        SOC_SINGLE("INA Volume", M98088_REG_37_LVL_INA, 0, 7, 1),
        SOC_SINGLE("INB Volume", M98088_REG_38_LVL_INB, 0, 7, 1),
 
-- 
2.25.1

