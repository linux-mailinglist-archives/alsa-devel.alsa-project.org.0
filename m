Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6381A5E7612
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 10:45:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1368B83E;
	Fri, 23 Sep 2022 10:44:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1368B83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663922705;
	bh=YE8X/zDI7bMlTYRbd+A8gtt2Njzs4d6klYAxWewKdMA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RON1geVYgmXb+2tvj2A6Ya0PMk2xwZOIfm4JVvdTaHXzGIUHSQOkvq4wMkn9Y7kbr
	 ork8LvzlcoJtHWGlwn/hS7G8SzH5S1pozGaaQnPIL3WbNcm2g1UhYU32I87qPfwMYe
	 BDhvy0hXzz/GjLgytf9LPQsC0fzpeeuqYwOkMefU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DD60F8055B;
	Fri, 23 Sep 2022 10:42:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B49C0F8027B; Thu, 22 Sep 2022 15:45:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 921A4F80107
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 15:45:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 921A4F80107
Received: by mail-wr1-f44.google.com with SMTP id n15so8719976wrq.5
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 06:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=nVYl4VGBufZGCj8epAifvyAAADocOF/FFC9jfi/VTnQ=;
 b=PUOpH2GdfPO5Sxqb2KJi/+EDMvgtvx3xWy7RO+3UBXaNITFFJUyoUdJ4DJYXWzNuD7
 JZZvJAWBa3yVNddbqs2ZVVrP0gzifMJy56+47CwQ8DTUAO6Rouyn9g/5Z/OwMm0UX1LU
 /6IznAkILYT4CXu9RyGIBDIFGRM4kHMZoggjwwaq4PUtjwRQOH0KgdOsVkOPXEUPXWAi
 JhYnC1d24oeN1z1L86xiaFfbQT1RCZGHHgdcIRSUg2tq+ZZxtbgmD308sn7k3Hu2SUIQ
 YRQQUKLByRMlmOlLnzZCwY4a49LCkVTcqVKDVRarN4/X1HRPTlRE7HJp7vOk/sWFfB/e
 +lUA==
X-Gm-Message-State: ACrzQf29olth9AKcTd19ekR8ShWK6ULUXIHGmo0CLXiSHXn8FA02+PeZ
 oy3EDE2EkX4ow3tgCloXkRsvYcvoo3ngqw==
X-Google-Smtp-Source: AMsMyM70dXxaaiVcobZhETv8uF1X+sVra4qFxSV8nXfhygs8CmLcn36cX+qwLRtEqFYJSFv6jY3ttg==
X-Received: by 2002:a05:6000:a17:b0:22a:2da9:e233 with SMTP id
 co23-20020a0560000a1700b0022a2da9e233mr2078423wrb.248.1663854314843; 
 Thu, 22 Sep 2022 06:45:14 -0700 (PDT)
Received: from localhost.localdomain ([2a02:168:d80b:1:290f:c2e7:fcc5:19a3])
 by smtp.gmail.com with ESMTPSA id
 x8-20020adff0c8000000b00228c483128dsm5906517wro.90.2022.09.22.06.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 06:45:13 -0700 (PDT)
From: Benjamin Marty <info@benjaminmarty.ch>
To: alsa-devel@alsa-project.org, ctlin0@nuvoton.com, kchsu0@nuvoton.com,
 wtli@nuvoton.com
Subject: [PATCH] ASoC: nau8822: add spk boost and spk btl options
Date: Thu, 22 Sep 2022 15:44:58 +0200
Message-Id: <20220922134458.3421695-1-info@benjaminmarty.ch>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 23 Sep 2022 10:42:24 +0200
Cc: Benjamin Marty <info@benjaminmarty.ch>
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

These two options are required to use the Speaker output on this codec
to its full potential, when wiring up the Speaker in an BTL configuration.

The Speaker Boost flag is explained in the Datasheet on page 80.
The Speaker BTL flag is explained in the Datasheet on page 78.

Signed-off-by: Benjamin Marty <info@benjaminmarty.ch>
---
 sound/soc/codecs/nau8822.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index 1aef281a9972..812b8254f9a0 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -379,6 +379,12 @@ static const struct snd_kcontrol_new nau8822_snd_controls[] = {
 		NAU8822_REG_DAC_CONTROL, 5, 1, 0),
 	SOC_SINGLE("ADC 128x Oversampling Switch",
 		NAU8822_REG_ADC_CONTROL, 5, 1, 0),
+
+	SOC_SINGLE("Speaker Gain Boost Control",
+		NAU8822_REG_OUTPUT_CONTROL, 2, 1, 0),
+
+	SOC_SINGLE("Speaker BTL Configuration",
+		NAU8822_REG_RIGHT_SPEAKER_CONTROL, 4, 1, 0),
 };
 
 /* LMAIN and RMAIN Mixer */
-- 
2.37.3

