Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 306E24B6BB0
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Feb 2022 13:06:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B811216F8;
	Tue, 15 Feb 2022 13:05:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B811216F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644926809;
	bh=wBEtvqwm856URuZ/VkPa224eOOl0iGZVIXs8zl06sko=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FrH/QrxWpHPBbdrOnozUantS6T35zugXy8bc2AyFEclRFiTb3XnHgbqQSHzurt2Z4
	 smkO9Dv+JDH+WbhpLjohVkfTgILwGVZRO/n4fUNT2XcMwRiYWN5VjNF1f4APQKWKZB
	 8/II/UsmW9TfwxH73FgVe3V4mVtNhZCFi0T99njY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F9C0F80159;
	Tue, 15 Feb 2022 13:05:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C98CFF80100; Tue, 15 Feb 2022 13:05:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A6C4F80100
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 13:05:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A6C4F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DJ0EWL3c"
Received: by mail-ot1-x329.google.com with SMTP id
 o9-20020a9d7189000000b0059ee49b4f0fso13639242otj.2
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 04:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pYhS0apfz0IFZeCL8KKVicu3GmtHfSiJaDz4ZqvCTo0=;
 b=DJ0EWL3crc9a5S98UZD6KflTZHK2ieVDelKosShjh37UiuFpoaVPWuzNHoPl1nYO0Y
 weyfquS9Qusar9zN7nT+xbPC78hDpJxtIENXXFbKYzQ1wcDhU102lF2eGPiLiAvFxAXJ
 MCRJvG1zPdLg2HCxrJZVNyfyFNaEgHLVWdTaaP5WzZteeeIADn4r5KLspYveic+DPLeq
 ZlN3MSLHKRquyFiLk1L9mXD32lfKpzW2fPmYYHLA0pwKt4OgEA+pGSOKCsrr3tPWvJg4
 fkgN31gJ4fdU5TfIJq4cWX0lyI5JdXRU6AJSbSTVhaQfzVI6IIFncf8boNnjt2RLGCSp
 yJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pYhS0apfz0IFZeCL8KKVicu3GmtHfSiJaDz4ZqvCTo0=;
 b=GEPO2ETDCBtTFvga6HQ/IhSXVvU7M0DB7g5VMmr5xC9pa88TfgMhfqO7N/2yms9yhH
 Q/E4x3JydwBK53i4GMetVI9CCldeYxlDsoKcV7I/LGMrJpAk0Ulq9KKiDP5Qyaj3jvuA
 C12yZOa3APXgAYRe0K9Z8iVggfc+2DdOXuu0Cg6E0GyNXl1HgE3oe/CuhLJNXU9bQvNh
 SH1YlkJoimmXEDDZS2UqVDkoiyS/w8yMsx7YmAbzNIrMe462RieT6GiqP47LAajYf0Tw
 7PEiKHjBeXjbtcjNEvuE5VtKGILb+8AFXc2xnNiPOGNTxCmUpnk28b7R4m6GaTS/ILit
 E0qg==
X-Gm-Message-State: AOAM532/1PUiLNlZDTUj9dcmOnLyaG3n3FXnZV6sT7bz5/l7ooAOyYof
 rPZCeFHUKXL524EOMgPvVcw=
X-Google-Smtp-Source: ABdhPJwDJpdlH0RpGWaGZQPh94GijKoOhY9FIF01pim0im39IFXAN3xol3nH9606dXVe4wmrHKXHCA==
X-Received: by 2002:a05:6830:92:: with SMTP id
 a18mr1165606oto.373.1644926732429; 
 Tue, 15 Feb 2022 04:05:32 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:775a:3c0e:c7d1:9611])
 by smtp.gmail.com with ESMTPSA id
 j3sm13948080oig.37.2022.02.15.04.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 04:05:31 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH v2] ASoC: cs4265: Fix the duplicated control name
Date: Tue, 15 Feb 2022 09:05:14 -0300
Message-Id: <20220215120514.1760628-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@denx.de>,
 ckeepax@opensource.cirrus.com, flatmax@flatmax.org
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

From: Fabio Estevam <festevam@denx.de>

Currently, the following error messages are seen during boot:

asoc-simple-card sound: control 2:0:0:SPDIF Switch:0 is already present
cs4265 1-004f: ASoC: failed to add widget SPDIF dapm kcontrol SPDIF Switch: -16

Quoting Mark Brown:

"The driver is just plain buggy, it defines both a regular SPIDF Switch
control and a SND_SOC_DAPM_SWITCH() called SPDIF both of which will
create an identically named control, it can never have loaded without
error.  One or both of those has to be renamed or they need to be
merged into one thing."

Fix the duplicated control name by combining the two SPDIF controls here
and move the register bits onto the DAPM widget and have DAPM control them.

Fixes: f853d6b3ba34 ("ASoC: cs4265: Add a S/PDIF enable switch")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Combine the two controls (Charles)

 sound/soc/codecs/cs4265.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index 4aaee1873a11..4415fb364d4d 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -150,7 +150,6 @@ static const struct snd_kcontrol_new cs4265_snd_controls[] = {
 	SOC_SINGLE("E to F Buffer Disable Switch", CS4265_SPDIF_CTL1,
 				6, 1, 0),
 	SOC_ENUM("C Data Access", cam_mode_enum),
-	SOC_SINGLE("SPDIF Switch", CS4265_SPDIF_CTL2, 5, 1, 1),
 	SOC_SINGLE("Validity Bit Control Switch", CS4265_SPDIF_CTL2,
 				3, 1, 0),
 	SOC_ENUM("SPDIF Mono/Stereo", spdif_mono_stereo_enum),
@@ -186,7 +185,7 @@ static const struct snd_soc_dapm_widget cs4265_dapm_widgets[] = {
 
 	SND_SOC_DAPM_SWITCH("Loopback", SND_SOC_NOPM, 0, 0,
 			&loopback_ctl),
-	SND_SOC_DAPM_SWITCH("SPDIF", SND_SOC_NOPM, 0, 0,
+	SND_SOC_DAPM_SWITCH("SPDIF", CS4265_SPDIF_CTL2, 5, 1,
 			&spdif_switch),
 	SND_SOC_DAPM_SWITCH("DAC", CS4265_PWRCTL, 1, 1,
 			&dac_switch),
-- 
2.25.1

