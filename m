Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 933C71A835
	for <lists+alsa-devel@lfdr.de>; Sat, 11 May 2019 17:14:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C00EB180D;
	Sat, 11 May 2019 17:13:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C00EB180D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557587639;
	bh=uGsUeBfprEuNrWtRgSK6YU+MRqyonW/qQWyLW2app3c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jmtpAfhfUpOv2PtUYh6TlC5+ZY9WEbdIzpHH0y4Q73k6tBJ8ZguAOv32dm/qQVZ+W
	 wAbxg9pshQ3KIA7khOmMi4EpzYQ+NZXqn/KJ2wgOdb/PrJLjCoT40mG3X1vnv2U/8t
	 g7L482ETpFKNZ6l+ZtC0sv8wFmcFMo4JGHIiEPag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15D6EF89682;
	Sat, 11 May 2019 17:12:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53C05F89682; Sat, 11 May 2019 17:12:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B0F5F80737
 for <alsa-devel@alsa-project.org>; Sat, 11 May 2019 17:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B0F5F80737
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="edW68aqi"
Received: by mail-wr1-x442.google.com with SMTP id r7so10107765wrr.13
 for <alsa-devel@alsa-project.org>; Sat, 11 May 2019 08:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=C9xJNH3rQETX8Uvs3BiVRbTmI3eQORXEanCcAES6EWo=;
 b=edW68aqiIHYXtk5/iyC/IjpLFuHH5sNyT/MWGYlKWphrNuWw6CC4sAOLKhR+YYuFjY
 wAdYHFoArU5lVWImIRBdWDF0fhK8aEMDjL4/3KVfbNk3dEDIwVa4PXdlhtkLCQSfNFSu
 Alc4+s7PmH0P3dmVS1JlC1J59yekcgeWRdNw/NXDpyhkj/hD5dcuy8/CNEKNtNfP8MMD
 VeBFVLvzem3RIthSx+dOCgrGxTTxwMxh4e+C2aEl/urK1grtbM3umIY5Jx9l39bBo3oI
 BJelrPxkXR1wZWnYk6f1emsArtADKTW3V8WJSHtSrobvE1pMl/TIAYUxOyHzSeq6oRTz
 Bzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=C9xJNH3rQETX8Uvs3BiVRbTmI3eQORXEanCcAES6EWo=;
 b=ZXodtGEJDyNiF8Jbs9rPq3nS3bSwFdRV6y9go7wCbRYcNHfREZvE2BY9CN5nD5oP9H
 AY9VLpRwCHmqFRXy3DHiaxatheZLc9A6GK71XUyQCRhXLPt98jZ7KlBlq0ptRHio1h71
 +hNmyt7mwSiVLsr87hhB0ztXquvDEoKQolflluxSUOY3VpgOG8/IfIhzhYY6+O7qOo3V
 RpfK+Qltd6IX7bKL6aUpR+0RiM65wdTsVwhaFj74o1RW50+Knvev3OLpl3wvJpkH0BfU
 Y3dlAG0IpvUQim0mXV3m5Pj8Q30LMzYP92GfO8bHNrdomfvOJjWbxXrNwqwr/nXo7bJu
 zS5Q==
X-Gm-Message-State: APjAAAXYNXVgZtoP5v4gVtaqm0Gp8YIXYttc5IJGjuic6aoSYNNzNaaa
 kBOvTfX579VKx62rkR/aLSg=
X-Google-Smtp-Source: APXvYqyWfcN3Yu3qXJX1XKz4kwKny7FzO4sA95+9hvM0ipCvNtla9/0vQyTesyjVdmZHRW/aV4yrqA==
X-Received: by 2002:a5d:6b46:: with SMTP id x6mr11143117wrw.313.1557587529021; 
 Sat, 11 May 2019 08:12:09 -0700 (PDT)
Received: from localhost.localdomain (p5DCFEB77.dip0.t-ipconnect.de.
 [93.207.235.119])
 by smtp.gmail.com with ESMTPSA id c9sm5650992wrv.62.2019.05.11.08.12.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 May 2019 08:12:07 -0700 (PDT)
From: Saravanan Sekar <sravanhome@gmail.com>
To: sravanhome@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Date: Sat, 11 May 2019 17:11:49 +0200
Message-Id: <20190511151149.28823-1-sravanhome@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [alsa-devel] [PATCH v4] ASoC: tlv320aic3x: Add support for high
	power analog output
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support to output level control for the analog high power output
drivers HPOUT and HPCOM.

Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>
---

Notes:
    Notes:
        Changes in V4:
        -Added separate mono playback volume control
        -grouped volume controls with corresponding switch
    
        Changes in V3:
        -Fixed compilation error
    
        Changes in V2:
        - Removed power control as it is handled by DAPM
        - Added level control for left channel

 sound/soc/codecs/tlv320aic3x.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index 516d17cb2182..599e4ed3850b 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -324,6 +324,9 @@ static DECLARE_TLV_DB_SCALE(adc_tlv, 0, 50, 0);
  */
 static DECLARE_TLV_DB_SCALE(output_stage_tlv, -5900, 50, 1);
 
+/* Output volumes. From 0 to 9 dB in 1 dB steps */
+static const DECLARE_TLV_DB_SCALE(out_tlv, 0, 100, 0);
+
 static const struct snd_kcontrol_new aic3x_snd_controls[] = {
 	/* Output */
 	SOC_DOUBLE_R_TLV("PCM Playback Volume",
@@ -386,11 +389,17 @@ static const struct snd_kcontrol_new aic3x_snd_controls[] = {
 			 DACL1_2_HPLCOM_VOL, DACR1_2_HPRCOM_VOL,
 			 0, 118, 1, output_stage_tlv),
 
-	/* Output pin mute controls */
+	/* Output pin controls */
+	SOC_DOUBLE_R_TLV("Line Playback Volume", LLOPM_CTRL, RLOPM_CTRL, 4,
+			 9, 0, out_tlv),
 	SOC_DOUBLE_R("Line Playback Switch", LLOPM_CTRL, RLOPM_CTRL, 3,
 		     0x01, 0),
+	SOC_DOUBLE_R_TLV("HP Playback Volume", HPLOUT_CTRL, HPROUT_CTRL, 4,
+			 9, 0, out_tlv),
 	SOC_DOUBLE_R("HP Playback Switch", HPLOUT_CTRL, HPROUT_CTRL, 3,
 		     0x01, 0),
+	SOC_DOUBLE_R_TLV("HPCOM Playback Volume", HPLCOM_CTRL, HPRCOM_CTRL,
+			 4, 9, 0, out_tlv),
 	SOC_DOUBLE_R("HPCOM Playback Switch", HPLCOM_CTRL, HPRCOM_CTRL, 3,
 		     0x01, 0),
 
@@ -472,6 +481,9 @@ static const struct snd_kcontrol_new aic3x_mono_controls[] = {
 			 0, 118, 1, output_stage_tlv),
 
 	SOC_SINGLE("Mono Playback Switch", MONOLOPM_CTRL, 3, 0x01, 0),
+	SOC_SINGLE_TLV("Mono Playback Volume", MONOLOPM_CTRL, 4, 9, 0,
+			out_tlv),
+
 };
 
 /*
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
