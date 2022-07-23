Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C96757EB25
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Jul 2022 03:54:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9834F18D3;
	Sat, 23 Jul 2022 03:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9834F18D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658541265;
	bh=qZGsHIGQqk1Ed1G/Ps3KoazOM1ITyhZq/g0CivDyiNU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=brvX+tHL/tZkdPfrcnUwFLj8x8EU6nfG1RnuMmOyHc6gzhI4geq2TQPapNoeQUg/J
	 0/NZ3pkaxzQr+Bj56PT5Xv3pRJlr0LaeKINyjPBXxDEeLTRRXLfFHEV06G/PPIo0o5
	 gTLuymAO5wIDXfdjXT3nMY0r7cU1CyGfEhB6P3X4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F19EAF80249;
	Sat, 23 Jul 2022 03:53:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28EECF8019B; Sat, 23 Jul 2022 03:53:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D695CF800E1
 for <alsa-devel@alsa-project.org>; Sat, 23 Jul 2022 03:53:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D695CF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="X+SR+9JQ"
Received: by mail-pj1-x1035.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so5603481pjl.0
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 18:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=zOMb5JQq7oT4D4mCscu+rB2TXNo1OHAZ5Z1k9q2pmg4=;
 b=X+SR+9JQxGmSIJAuRLWqRvFNr5sA17kNdIeoczXoQ5GthCHW9R9pFITkKnj/F4xkXM
 yefY20WDhjHl4plOW8VKsgv1v0NfBRFxfICKLMeO84AL5jLjvq5IVU78BX/yUZkdJ5MS
 s4dVKN7/InHy2mI3kkOkVecKXQfoTOUwoOwKl76TWUxCMUpvX2YeId5rfKquxPB56G1g
 iBW7fWtS5yFYWGukovhANWHm7GLm6Cn7AlvF/jLA1QWPimoiB8a+4sYKEXNGsqqtDwW4
 o61R8ABDkUl0iFzvS1lh5HlNHh6ORnmmsbWx8l8u64W1UBhPmlgtwSPbK5jW4m53bk21
 7koQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zOMb5JQq7oT4D4mCscu+rB2TXNo1OHAZ5Z1k9q2pmg4=;
 b=SALHRseAt+2fsLJm477+l1luuxvvRm9YaHMuPF7F3I2BErQ4RrG3O+VY3SwepaEuO4
 ISmmG9JnEfE79RyPbhtUe0E3uiuh8QIHWGAIqp4b55MCq6brDN8b5EaoS4DOTfK61ZiJ
 gQ7W/R8o2+JaLS7o4swkdaZsIEvoqhfc8Wy3gziKnp+RoGhdXt7sMCdYMg8Fh+Oz6Adw
 XR4/wWyKm2ekyFOOpwIZ2ihpgVruwbWq1ATia16wmyKnrV5rSoFjo5xE20ZD237l3wAN
 jZowRWYE2SexO2NhgAzIJffg7U0078kig36bmotyYVdp04YUYXWa6mR7CpmMGv01tiiw
 ASoQ==
X-Gm-Message-State: AJIora8vfSSB3HPWTlFRpKoFOZFb6zPg6axLIMuTt132/BpBFugyvmZ+
 HSobixhkak9eNwwyjko4zcA=
X-Google-Smtp-Source: AGRyM1tHEYoT3ayrsB98JEcmHXHTdU2hX7cPvrnxPbmiiFeGAt3ch8zSdaXZ50rY0p1NjwmsZKpSQg==
X-Received: by 2002:a17:902:a418:b0:16c:9ee2:8a02 with SMTP id
 p24-20020a170902a41800b0016c9ee28a02mr2249570plq.46.1658541188582; 
 Fri, 22 Jul 2022 18:53:08 -0700 (PDT)
Received: from localhost.localdomain (c-73-241-94-58.hsd1.ca.comcast.net.
 [73.241.94.58]) by smtp.gmail.com with ESMTPSA id
 f64-20020a17090a28c600b001ef7c7564fdsm6250855pjd.21.2022.07.22.18.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 18:53:08 -0700 (PDT)
From: Ryan Lee <ryan.lee.analog@gmail.com>
X-Google-Original-From: Ryan Lee <ryans.lee@analog.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 steve@sk2.org, ryans.lee@analog.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: max98373: Removing 0x203E from the volatile reg
Date: Fri, 22 Jul 2022 18:52:20 -0700
Message-Id: <20220723015220.4169-1-ryans.lee@analog.com>
X-Mailer: git-send-email 2.17.1
Cc: ryan.lee.analog@gmail.com
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

The 0x203E speaker gain register should be non-volatile.
This register value was not able to be synced because it was marked as
volatile.

Signed-off-by: Ryan Lee <ryans.lee@analog.com>
---
 sound/soc/codecs/max98373-i2c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/max98373-i2c.c b/sound/soc/codecs/max98373-i2c.c
index 4fe065ece17c..3e04c7f0cce4 100644
--- a/sound/soc/codecs/max98373-i2c.c
+++ b/sound/soc/codecs/max98373-i2c.c
@@ -442,7 +442,6 @@ static bool max98373_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case MAX98373_R2000_SW_RESET ... MAX98373_R2009_INT_FLAG3:
-	case MAX98373_R203E_AMP_PATH_GAIN:
 	case MAX98373_R2054_MEAS_ADC_PVDD_CH_READBACK:
 	case MAX98373_R2055_MEAS_ADC_THERM_CH_READBACK:
 	case MAX98373_R20B6_BDE_CUR_STATE_READBACK:
-- 
2.37.0

