Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C20C55FEB35
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Oct 2022 10:54:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C0195B3B;
	Fri, 14 Oct 2022 10:53:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C0195B3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665737667;
	bh=xvL3qeDOzZi7PKQA/kUTuepfVCyG8HZ5lIAJ7GLorPc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S6VaefBkvzgFcoKjjGh9AKczy1la+lEbRj7/iMoU4hr/TK8pC30zX+RTtE3NVAIOV
	 5iDC1rV66cAE/FebAJn7j1PbA2vRtlqvnMykniICYQcb0lAeiyQwOVzj34Wmvu+6/g
	 b/w4GECWPqtSL/3aKBwYCHyzrwYM5s5/ndbO5hF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C535BF80115;
	Fri, 14 Oct 2022 10:53:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2873AF800F3; Fri, 14 Oct 2022 10:53:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29EC3F800F3
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 10:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29EC3F800F3
Received: by mail-wm1-f53.google.com with SMTP id iv17so2676136wmb.4
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 01:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ds/hG/yg49VAw25f90iPzhiJlGOcq4a5hH/BqNFsnoQ=;
 b=ywqrORLLchDEoqAop2p5Cj4GZMNVX+wyl/gpTr/ub/qW4zcz/Ok5CMMLlKet9N7HeN
 fuk5UEOYNWxxWIDuWDjfY4a4hyEATbUASW5mg0AwiDL2FgP/23yaTwPo1AtFudP0f57w
 EgUSVRzNM5GRiUX5/bv7KjWO3/peY/WtHbAEk7UddhZgda3EJb9cWVCZm+ppsVzTjHoJ
 lDyVDG+ctGh9/B0Y8MdzsFd240+Xrs0MiUpmMbqV9xq9OBJ+ZaZYEaJWhij3NsxUnRw5
 1DG6FzZ5mMgiTosmB+aRuHDs+ECugpOGoVPNZYkNuCpr+5tZf2rFBuMh0WalffZnFE1Y
 yT5A==
X-Gm-Message-State: ACrzQf3KfHgaZypNoyJnOTRPXZ63+Swh05N/RQZmAYOhFeFhQyU5TaWN
 591B9wVdNy/Z/mKySgID113SdKlknQSaIw==
X-Google-Smtp-Source: AMsMyM5KbhcQ4KacIroyWrdMQpT7pJEW8UxnjGqjoHs928dv6LdJIi8nZTXs7Kyg6SpQh3zmI16dhQ==
X-Received: by 2002:a7b:c4c2:0:b0:3b4:fdc4:6df9 with SMTP id
 g2-20020a7bc4c2000000b003b4fdc46df9mr2630083wmk.123.1665737603410; 
 Fri, 14 Oct 2022 01:53:23 -0700 (PDT)
Received: from localhost.localdomain (84-72-89-30.dclient.hispeed.ch.
 [84.72.89.30]) by smtp.gmail.com with ESMTPSA id
 i8-20020a05600c2d8800b003c64c186206sm1544585wmg.16.2022.10.14.01.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:53:22 -0700 (PDT)
From: Benjamin Marty <info@benjaminmarty.ch>
To: alsa-devel@alsa-project.org, kchsu0@nuvoton.com, wtli@nuvoton.com,
 broonie@kernel.org, lgirdwood@gmail.com
Subject: [PATCH v2] ASoC: nau8822: add spk boost and spk btl options
Date: Fri, 14 Oct 2022 10:52:54 +0200
Message-Id: <20221014085253.73733-1-info@benjaminmarty.ch>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
2.38.0

