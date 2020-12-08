Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5702D236C
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 07:06:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1374416E1;
	Tue,  8 Dec 2020 07:05:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1374416E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607407573;
	bh=KBqN1iCggfIZyvOnQO6LkP90ZJiCt9W7RgNHLRbVpyo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qvfX9BX9/qlR9/G6/Pq+sifQ7PCXb/jM1NgkzZSvN40/3z5ejkOxtF0rDeAeztvzA
	 6OuEMtPCtPrbFnUeObzNkkA37lRLZhOp7W9wqLu+BtdZb8eXTyVTqzn4kfPiu/Irbd
	 7UQYQiL4/QqNQD9SDj3rsgKrN2xiqk9TxOBAndBQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43807F80164;
	Tue,  8 Dec 2020 07:04:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08035F8019D; Tue,  8 Dec 2020 07:04:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91486F800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 07:04:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91486F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="Qyoemjm4"
Received: by mail-pf1-x441.google.com with SMTP id p4so6996583pfg.0
 for <alsa-devel@alsa-project.org>; Mon, 07 Dec 2020 22:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WMuZSE/uoFYolW2OlTfv3RER4FPEswrWEWDqIA4AjXQ=;
 b=Qyoemjm4Cg39/yxDoF8iiqYCMs1sPutlX9o+JmeiG9ZmSBixbBCSYKnEtRR2dUB9uQ
 fOs1eIl4DYk0FSY1Q8Pe1h1nvh3nPi7I71EFegeWGw9gmukg9mCWzgxwp2TXX/0FKtGp
 GMhrNRNvbHHz5YhxyDPIjkrxmppVffuUaiyj9SMO0YAc4ul7QoArir3saw32T0PqVR9L
 ScL5nugtH6t2XBuvLgoBrDR+o2EmkeqvRHRosE2+GDL5DegYFeezOk0ci2eF42cW/sQN
 Izxgj0a3GFjErxSXkai1Of2J7KPa6xRSrHt+6Bx1bJNSxKqr2zVCNhT4+8Ro+dYmVJjP
 EeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WMuZSE/uoFYolW2OlTfv3RER4FPEswrWEWDqIA4AjXQ=;
 b=aV7wFJVdQb/SqcppQnsHGJO780NXss4+eb5WbJCdNimSMvHGJeE8bjuN2fFSmejaaV
 +RQm/hYpo35+VL3Ols0SCAyk10NKV5+rDIvXVkeYO/WSkHYycQx7TwGEpbleiHmKG139
 GfWp3Hqn94vwzDJ5GRMLgu94qnovmrXJ2Ow0Rv8BA+MZrvaU15ZijagzfP+mw1lP5V8u
 c4p6OSJRiHXd8dImkDE6tGaE2Ulr1/rHFnA3pcwAc0JuVGvCdpAqkBUojsJHORrRiNAo
 3ZqFYYvjLuhHcUwchW+D8vNXi56zyz713GYzla0KS6qjBip7GruTw3eF4gCwANlgRK7f
 O6Og==
X-Gm-Message-State: AOAM532AFu5fdMH2Jc3RtnSKWYx03df0RezPuLS0SG4BIJ8SZtMfyr4f
 xuqJNhTYuNLtRUXu3uoZ3zr0fQ==
X-Google-Smtp-Source: ABdhPJxx7alrk0jc+iLSK57paLZQN/zJcOWCv7kDfvNGIjWLPdejZP3xOKqO2/iPOTo4TggKi4kc3w==
X-Received: by 2002:a17:90b:19cf:: with SMTP id
 nm15mr2603816pjb.63.1607407461666; 
 Mon, 07 Dec 2020 22:04:21 -0800 (PST)
Received: from endless.endlessm-sf.com
 (ec2-34-209-191-27.us-west-2.compute.amazonaws.com. [34.209.191.27])
 by smtp.googlemail.com with ESMTPSA id
 k189sm18632615pfd.99.2020.12.07.22.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 22:04:21 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: Intel: bytcr_rt5640: Add quirk for ARCHOS Cesium 140
Date: Tue,  8 Dec 2020 14:04:14 +0800
Message-Id: <20201208060414.27646-1-chiu@endlessos.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Chris Chiu <chiu@endlessos.org>,
 linux-kernel@vger.kernel.org, linux@endlessos.org
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

Tha ARCHOS Cesium 140 tablet has problem with the jack-sensing,
thus the heaset functions are not working.

Add quirk for this model to select the correct input map, jack-detect
options and channel map to enable jack sensing and headset microphone.
This device uses IN1 for its internal MIC and JD2 for jack-detect.

Signed-off-by: Chris Chiu <chiu@endlessos.org>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index f790514a147d..cd6f7caa43c8 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -421,6 +421,18 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_SSP0_AIF1 |
 					BYT_RT5640_MCLK_EN),
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ARCHOS"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ARCHOS 140 CESIUM"),
+		},
+		.driver_data = (void *)(BYT_RT5640_IN1_MAP |
+					BYT_RT5640_JD_SRC_JD2_IN4N |
+					BYT_RT5640_OVCD_TH_2000UA |
+					BYT_RT5640_OVCD_SF_0P75 |
+					BYT_RT5640_SSP0_AIF1 |
+					BYT_RT5640_MCLK_EN),
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
2.20.1

