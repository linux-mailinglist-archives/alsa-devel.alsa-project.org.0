Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E5C31E1A1
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Feb 2021 22:51:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B6C01660;
	Wed, 17 Feb 2021 22:50:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B6C01660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613598667;
	bh=pDndI/od1H3KQgPwpgbBTfuDYBwvVr/AtxDoRtZPhAs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I5DPMwxjIKp8iVcpDO1JH+Mx1qPFlp81dffrEvalbC6iR1DEeCvbowt/Ps9yXcaCy
	 PeDXppsvcjj5YFvq7BG0g4twcOPxTWAvmmbIZbfSTji6ksHdjfgHVDKSDLIEVPujZo
	 +yvsUaiw16IgiC06s7lwPoc8ikDpbfHww06aNb3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5897F800AE;
	Wed, 17 Feb 2021 22:49:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00CEFF80258; Wed, 17 Feb 2021 22:49:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77E90F800D0
 for <alsa-devel@alsa-project.org>; Wed, 17 Feb 2021 22:49:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77E90F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="nAFVvg8M"
Received: by mail-pj1-x1034.google.com with SMTP id l18so104639pji.3
 for <alsa-devel@alsa-project.org>; Wed, 17 Feb 2021 13:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J2IdJVh7hg1dJBeP75OoiAa+KfwLLFykVFFZkuB1avE=;
 b=nAFVvg8MIqA37aUAWaHXhyuMRFYkEtpA5HXz3eUabG+TkKHg8MDcKSNeTXykWPwrgq
 KRAznP4uu4jDof5kATJvKJPV0DoAeSwKo5JcFJKcl3O5p70a+g1y5nGMQE7UBy9xyEPh
 RC7TFwVmXTnfNjw51UKQU2mJgwzonFLA+3R4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J2IdJVh7hg1dJBeP75OoiAa+KfwLLFykVFFZkuB1avE=;
 b=AtYrcWi19AH0evllHGputSM2FGI+J943aYSwtvxW59n4obMSbeH3SiL79Hnoa5P+Kf
 ktDSoltoy/2Tc3L1wVfmXpyo9mNU/vXSW3BGn1qam8wiVGPjFdIHUmQezHfncLRb9shm
 G4Vl7TClM8XPS/5AOx3YVo/K9aCJcZE/dlUUzIAebz2u2oOQaKrmf/McDmBpVAum/mxC
 BzmcJRUnfaGRTV891emG9SFUnBee/au6LFLWm/EVMjVizx+WNk6sdtGcYNxLjFvnBsl+
 mgblPAcziHLMTC8i6PlaMeRrVoZE25kDY/QoShgIG7Iiv8l2ImEAp9JOY23BIn4EGkPn
 KCkA==
X-Gm-Message-State: AOAM5326FGQ/W6QIAsDgKu5jimHE4CGesCFvpoOSsFF2hAPZ+qFoZLZi
 rXur9wcDhMrI+5nrYOLBTvwd2dbcCD5J
X-Google-Smtp-Source: ABdhPJzKEX0WZPtDJEumY9YKDJDNgsvxC2CaiACplEJcXdKK/B4Y6WfuXBAByYE68fsZ6DC+wBOmWg==
X-Received: by 2002:a17:90b:948:: with SMTP id dw8mr809579pjb.17.1613598564606; 
 Wed, 17 Feb 2021 13:49:24 -0800 (PST)
Received: from localhost ([2620:15c:202:201:98ea:92f1:8f94:77f3])
 by smtp.gmail.com with UTF8SMTPSA id 194sm3261835pfu.165.2021.02.17.13.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 13:49:24 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: rt5682: remove jack detect delay
Date: Wed, 17 Feb 2021 13:49:14 -0800
Message-Id: <20210217214914.700751-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Shuming Fan <shumingf@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

There is a 250ms delay on the jack detect interrupt currently, this
delay is observable to users who are using inline controls. It can also
mask multiple presses which is a negative experience.

Cc: Bard liao <yung-chuan.liao@linux.intel.com>
Cc: Shuming Fan <shumingf@realtek.com>

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5682-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index 93c1603b42f1..b15c3e7d1f59 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -78,7 +78,7 @@ static irqreturn_t rt5682_irq(int irq, void *data)
 	struct rt5682_priv *rt5682 = data;
 
 	mod_delayed_work(system_power_efficient_wq,
-		&rt5682->jack_detect_work, msecs_to_jiffies(250));
+		&rt5682->jack_detect_work, 0);
 
 	return IRQ_HANDLED;
 }
-- 
2.30.0.478.g8a0d178c01-goog

