Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E32C33089C1
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 16:11:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78C2A169B;
	Fri, 29 Jan 2021 16:11:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78C2A169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611933119;
	bh=CNqvU2Xe1/20a8Y7ktndufUC8/M/ZJRqHZ7EBCsHUf8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hEk312n7kZ5IQso31oZLqfI9XeK7yXJ48i/cTPeJPzIXND5hGmbhiALYVUS1SKCru
	 9oMbKw0XcVL3c22x2xqMT0S7lqb9jc7ai5DM/fJF6nhwM16wfKKHv3tGggjAjML9Tj
	 qE3jBiWPSxeKixNGF4bUCd6qumP3XObdJeY8/NQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 858D8F804C2;
	Fri, 29 Jan 2021 16:10:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37603F80259; Wed, 27 Jan 2021 14:49:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2D1DF800F0
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 14:48:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2D1DF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="S61Lkbap"
Received: by mail-pg1-x532.google.com with SMTP id o7so1639403pgl.1
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 05:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GOVWTXj4nljNWAGndXCSQhwNAHq21QwCCU0BbxAkemM=;
 b=S61LkbapPO5wtP/iFjrfZjum1CifQ43xjsAvvSgR3NC3FPrGogaH406qrml2pjzoVh
 UftzrJIcnVtQk82gWKk0Z14JBuNXV7Rit5kPBDuN1h3wHHVuNrVFfhCjMAWwvb9zTbAj
 5e5elp2cAPtvAzQwy04ZpK80tqOai2dG1WoGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GOVWTXj4nljNWAGndXCSQhwNAHq21QwCCU0BbxAkemM=;
 b=FobvAdLJQS0tHwvmGE0k0UGI0w5z2Nis8GsBtL/jdm8x9ueoD/Y+X0NgZoNVgGc9jF
 m3Vtdvf/tXh69P87eNEytcy/8o+7m0crepa0020slAPDDVKqX9fLazymw9Bn/NeBFlK/
 FEFTL2gmf1KYwcg0ekmKgZE1yQC2cHxCSW0JgNVYe/Ks5mfVSHnYKo6+ajsxexBFYcdt
 OyWchMKLr7btr/jUZAxV46ombcEA9esmjC+AmNaF722OMw+CEm1DeIWmANmkmYUtULcu
 Td5LZPio+W2XI5O9Xm44oIV5Qs4Kbe+ja+BP91/buvfWvNMnAwbQDOlvTmqYdQZUnDp3
 dseg==
X-Gm-Message-State: AOAM5305yBtyU2AoOm4WF/n4kDgCRGyYWFVmcid+8N50bKbCOVszBMj2
 e8A4dSdAlXIz8VocdO5JrMwMSQ==
X-Google-Smtp-Source: ABdhPJxj3AfmDtcS78/eiVZjOQCAdD1+dtFL9Ey808WBkRMOqWpHN+sUItYHU3PvPVP3A1f1np5O1g==
X-Received: by 2002:a63:f953:: with SMTP id q19mr11222117pgk.120.1611755337075; 
 Wed, 27 Jan 2021 05:48:57 -0800 (PST)
Received: from judyhsiao-p920.tpe.corp.google.com
 ([2401:fa00:1:10:a53b:f71a:ed56:92d8])
 by smtp.gmail.com with ESMTPSA id e12sm2653271pga.13.2021.01.27.05.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 05:48:56 -0800 (PST)
From: Judy Hsiao <judyhsiao@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: max98373: Fixes a typo max98373_feedback_get
Date: Wed, 27 Jan 2021 21:48:47 +0800
Message-Id: <20210127134847.1143535-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 29 Jan 2021 16:10:20 +0100
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 Andy Gross <agross@kernel.org>, dgreid@chromium.org,
 devicetree@vger.kernel.org, Judy Hsiao <judyhsiao@google.com>,
 tzungbi@chromium.org, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 cychiang@google.com, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
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

From: Judy Hsiao <judyhsiao@google.com>

The snd_soc_put_volsw in max98373_feedback_get is a typo, change it
to snd_soc_gut_volsw.

Signed-off-by: Judy Hsiao <judyhsiao@google.com>
---
 sound/soc/codecs/max98373.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index 31d571d4fac1c..746c829312b87 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -190,7 +190,7 @@ static int max98373_feedback_get(struct snd_kcontrol *kcontrol,
 		}
 	}
 
-	return snd_soc_put_volsw(kcontrol, ucontrol);
+	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
 static const struct snd_kcontrol_new max98373_snd_controls[] = {
-- 
2.29.2

