Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEF55A1CF2
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Aug 2022 01:08:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91CA81622;
	Fri, 26 Aug 2022 01:07:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91CA81622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661468884;
	bh=98r5FBWtGZU73aTtBMFfeCAXP5/TVsfwDrGxUdo2Asg=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I1tChZq7C1gkzVPhTz5TDZv9Knb2OCFUj6OJzDK7gZJuyT4J9GyAOvQyzDoQxTGQ3
	 K8ALpJic/LiZMrchtthmDnN/6tJftuKPGh26GggERzVlBREdbLPEEuz0WrZhIGfdf+
	 kv7tnibIrSr2VdczlCe82B3YdHsBhEJH+M+1KYDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9A34F80271;
	Fri, 26 Aug 2022 01:07:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07F7AF8025A; Fri, 26 Aug 2022 01:07:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 921F7F8014B
 for <alsa-devel@alsa-project.org>; Fri, 26 Aug 2022 01:06:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 921F7F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MBi4DceF"
Received: by mail-pj1-x1035.google.com with SMTP id o4so10849pjp.4
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 16:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc; bh=ASZScAFd3xb4cxD9Q6pxtvg/PLB75WgObzDXhoHRnHI=;
 b=MBi4DceFS6uNfPfQDQuupqVrJDGVvnFAF0d4SJ3Jyiaq1+Coztny5KKsMuKgfbRhIA
 ySY/9HH/hBiEXlpXZHsY417asgqSycnkxF124alsUfxHPOKkZLUyWit3zU6SjcVWhVK+
 MTvCrnHUgNJW4ZKQZo9JbKSL797sXZEK+IWd72Iyx+r81F7yhTW3ohoIm7Yhm5CPukao
 qPZC7J/I1mcMwmHso3jsLJbDOBNB4TDUq36V+Gp8Yg1AoXTGSNabWzdMABBAjBKG1d3M
 CPlS8vbn0xZ+FArVglRe+TPAYivNt6oJE36EDPU+ciXG6OK8SKJ2gNL5a8reOuclj3ii
 65Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=ASZScAFd3xb4cxD9Q6pxtvg/PLB75WgObzDXhoHRnHI=;
 b=S5r9UtH7yOgCcq1CQAmpl4YAiH8VgptU1KPSYsiUSKAuNPeIPi3GwN0dYRfeSV3cx8
 OdXzQYDOZtRWZH6//TN3TFDgriavrFFCbwBQaDSDQeDQezcBDX89G94im1WWALfGddYl
 BPHtgC7OlhCbqFDrsDYIQkSXZikfiBUUMpODRBQ4OiZbmF4MXe96jbVj2eYWsHSQIlx/
 bVUEr2VtAxIJBp02cbJ+KosQ7fhJpyvdHE8BgJwyiqbQ9EvRih9X+EQpyyDtGf28HZmt
 +XxfdixX38nrxh91QOlPlkKwoCPAR0kOQVqjdnvyMv+dmVBLp6mNi3UdFT94WRsS6hYk
 Qx2Q==
X-Gm-Message-State: ACgBeo1e9OiZLUtBBpdTaH5DPEGBL8ugOY8OFF+47HIrE+sH8RzgZtDc
 UaENBXBOHGnW/Dv2825/tAE=
X-Google-Smtp-Source: AA6agR6fsrtfyVgnfxR8WD3JDLKLSe75uRq7/VgAnlTUlzYPtUAFZE1Lt10i99EB7JmrUoyD8SWOdA==
X-Received: by 2002:a17:903:2585:b0:172:9ac6:30f3 with SMTP id
 jb5-20020a170903258500b001729ac630f3mr1182621plb.0.1661468813706; 
 Thu, 25 Aug 2022 16:06:53 -0700 (PDT)
Received: from thinbox (23-122-134-180.lightspeed.sntcca.sbcglobal.net.
 [23.122.134.180]) by smtp.gmail.com with ESMTPSA id
 ds21-20020a17090b08d500b001fbc4b7eafesm247248pjb.49.2022.08.25.16.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 16:06:53 -0700 (PDT)
Date: Thu, 25 Aug 2022 16:06:51 -0700
From: Maurycy Z <10maurycy10@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: Fix misspelling of 'system' as 'ststem'.
Message-ID: <YwgAi68IzghNf0Dl@thinbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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

Signed-off-by: Maurycy Zalewski <10maurycy10@gmail.com>
---
 sound/pci/ice1712/ice1712.c | 2 +-
 sound/pci/ice1712/ice1724.c | 2 +-
 sound/soc/fsl/Kconfig       | 2 +-
 sound/soc/generic/Kconfig   | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index a5241a287..ff6ce91bf 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2247,7 +2247,7 @@ static int snd_ice1712_read_eeprom(struct snd_ice1712 *ice,
 				(snd_ice1712_read_i2c(ice, dev, 0x03) << 24);
 		if (ice->eeprom.subvendor == 0 ||
 		    ice->eeprom.subvendor == (unsigned int)-1) {
-			/* invalid subvendor from EEPROM, try the PCI subststem ID instead */
+			/* invalid subvendor from EEPROM, try the PCI subsystem ID instead */
 			u16 vendor, device;
 			pci_read_config_word(ice->pci, PCI_SUBSYSTEM_VENDOR_ID, &vendor);
 			pci_read_config_word(ice->pci, PCI_SUBSYSTEM_ID, &device);
diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index 6fab2ad85..9e81e6335 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -2266,7 +2266,7 @@ static int snd_vt1724_read_eeprom(struct snd_ice1712 *ice,
 		if (ice->eeprom.subvendor == 0 ||
 		    ice->eeprom.subvendor == (unsigned int)-1) {
 			/* invalid subvendor from EEPROM, try the PCI
-			 * subststem ID instead
+			 * subsystem ID instead
 			 */
 			u16 vendor, device;
 			pci_read_config_word(ice->pci, PCI_SUBSYSTEM_VENDOR_ID,
diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 614eceda6..c7fe12fbd 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -366,7 +366,7 @@ config SND_SOC_IMX_CARD
 	help
 	  This option enables audio sound card support for i.MX boards
 	  with OF-graph DT bindings.
-	  It also support DPCM of single CPU multi Codec ststem.
+	  It also support DPCM of single CPU multi Codec system.
 
 endif # SND_IMX_SOC
 
diff --git a/sound/soc/generic/Kconfig b/sound/soc/generic/Kconfig
index b6df4e26b..955ac8d3f 100644
--- a/sound/soc/generic/Kconfig
+++ b/sound/soc/generic/Kconfig
@@ -7,7 +7,7 @@ config SND_SIMPLE_CARD
 	select SND_SIMPLE_CARD_UTILS
 	help
 	  This option enables generic simple sound card support
-	  It also support DPCM of multi CPU single Codec ststem.
+	  It also support DPCM of multi CPU single Codec system.
 
 config SND_AUDIO_GRAPH_CARD
 	tristate "ASoC Audio Graph sound card support"
@@ -16,7 +16,7 @@ config SND_AUDIO_GRAPH_CARD
 	help
 	  This option enables generic simple sound card support
 	  with OF-graph DT bindings.
-	  It also support DPCM of multi CPU single Codec ststem.
+	  It also support DPCM of multi CPU single Codec system.
 
 config SND_AUDIO_GRAPH_CARD2
 	tristate "ASoC Audio Graph sound card2 support"
-- 
2.37.2

