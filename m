Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E18874900EA
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 05:54:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C58C1739;
	Mon, 17 Jan 2022 05:53:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C58C1739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642395248;
	bh=U6WZlBgGqAJNrUds4CEOgT2WKYNbGKdWFki0zpEkBV8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A33hxfTF49GofI6BvheB1H92OB2BeHZVoGdRXLHZo8Ib8EcQCeasp0ZKvHJ4GVtkJ
	 7018EJWfj88vH859CnBu2hShUIWKvrTbgW7F25K+WArLLsoGxAMYbFl6YoVkPiT6zg
	 TZMyAqNjmLroWOPxAp4Ftvx0YVNGTIzrZAPCFWgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9D5CF80254;
	Mon, 17 Jan 2022 05:53:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 674B5F80249; Mon, 17 Jan 2022 05:53:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8BD5F80100
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 05:52:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8BD5F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pZteWOub"
Received: by mail-ua1-x933.google.com with SMTP id x33so28284854uad.12
 for <alsa-devel@alsa-project.org>; Sun, 16 Jan 2022 20:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DZav6Qqz69x1CPSgB4unUJNOmMH6xqSsa+fH5HgealQ=;
 b=pZteWOubU+1UNF549R/VdU3j2v5g75Ql8w0yBUEUItb+LsNq2x+fhD9dfr2t39T03e
 pdjb9t4kVFHbaCIBwaY//+b7nrxuRUsq77kszp1fCsxJr+bw3SQHSvsUvye8kslo232F
 W/3/89gVntb3xldfzInpImetLXvzDYRakmNtxgwkvreU+wlonEfwcpteb6iRMhwLPyE6
 KtvV9i1HohETc9mFDN0IQIyrD+m7Cx2Gj8I3G76JbroMsH2HbEXmGT50Y3WrKBsso/XT
 t3KJnY/I6Lu+k0hcfgOLAbEBKFCpzae+qBRJqoAtHNB7+LQWsAR1uRrzwAe+fxplwDVv
 sv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DZav6Qqz69x1CPSgB4unUJNOmMH6xqSsa+fH5HgealQ=;
 b=vzwu0gRnodJJV5Hm3d5oUmdl018ez4HKQ7zFvhFR5G7B1X6iUhYPDTpAVhfgxNeeLG
 WZjzkvIjyf8pQ0zgLRZL+GDSOhniCKYEg4HirSVI5Qxau+qrCuIIATCRcqUgJSJ//aIo
 irGMQ8ZKdvW9XFwc1rLaXcTLPaQPXgqEAG7xJod6Cil54Noyr9lYQVDXKGf57czOaSAT
 q/85H3XDbKrlqoS8VFpc+adlvvIQFNOUD6kpI6le/hjyjQL1Z4hUDSiypZG+SFCmG+Xo
 eLbRN7C7phEGNJoTwU29PnUIdBFjHDmt/kSxq3z75NzswPPH2BwH8BUvw7n4T2deNB8q
 YxEQ==
X-Gm-Message-State: AOAM531ov17E4ON3BuIPfg7Rvs18v+pIETyro5B7TKjzZdx6i19Qdlhc
 0y79wFUXneAYOdxlrXieRI4=
X-Google-Smtp-Source: ABdhPJz/tUBtqlzg2AR1oV/Aliq6lC+BH3Q4UMsbZpyzPGwjpOjFJ53tUnPE3zE8cr2IyYOA+wQ8ew==
X-Received: by 2002:a05:6102:3a08:: with SMTP id
 b8mr1821474vsu.53.1642395176043; 
 Sun, 16 Jan 2022 20:52:56 -0800 (PST)
Received: from kubuntu-desktop.. ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id s32sm3409994uas.3.2022.01.16.20.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 20:52:55 -0800 (PST)
From: Julian Braha <julianbraha@gmail.com>
To: broonie@kernel.org, cezary.rojewski@intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 yang.jie@linux.intel.com, perex@perex.cz, tiwai@suse.com,
 brent.lu@intel.com, kai.vehmanen@linux.intel.com, mac.chiang@intel.com
Subject: [PATCH] ASoC: intel: fix unmet dependencies on GPIOLIB for
 SND_SOC_DMIC and SND_SOC_MAX98357A
Date: Sun, 16 Jan 2022 23:52:54 -0500
Message-Id: <20220117045254.66037-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, fazilyildiran@gmail.com,
 linux-kernel@vger.kernel.org
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

When SND_SOC_INTEL_SOF_CS42L42_MACH is selected,
and GPIOLIB is not selected,
Kbuild gives the following warnings:

WARNING: unmet direct dependencies detected for SND_SOC_MAX98357A
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_INTEL_SOF_CS42L42_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y] && (SND_SOC_SOF_HDA_LINK [=y] || SND_SOC_SOF_BAYTRAIL [=y]) && I2C [=y] && ACPI [=y] && SND_HDA_CODEC_HDMI [=y] && SND_SOC_SOF_HDA_AUDIO_CODEC [=y] && (MFD_INTEL_LPSS [=y] || COMPILE_TEST [=n])

WARNING: unmet direct dependencies detected for SND_SOC_DMIC
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_INTEL_SOF_CS42L42_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y] && (SND_SOC_SOF_HDA_LINK [=y] || SND_SOC_SOF_BAYTRAIL [=y]) && I2C [=y] && ACPI [=y] && SND_HDA_CODEC_HDMI [=y] && SND_SOC_SOF_HDA_AUDIO_CODEC [=y] && (MFD_INTEL_LPSS [=y] || COMPILE_TEST [=n])

This is because SND_SOC_INTEL_SOF_CS42L42_MACH
selects SND_SOC_MAX98357A and SND_SOC_DMIC without
selecting or depending on GPIOLIB, despite these
config options depending on GPIOLIB.

These unmet dependency bugs were detected by Kismet,
a static analysis tool for Kconfig. Please advise
if this is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 sound/soc/intel/boards/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 34ccefcc30c7..6309a37789c7 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -279,6 +279,7 @@ endif ## SND_SOC_INTEL_SKL
 
 config SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
 	tristate
+	depends on GPIOLIB
 	select SND_SOC_DA7219
 	select SND_SOC_MAX98357A
 	select SND_SOC_MAX98390
@@ -288,6 +289,7 @@ config SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
 
 config SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
 	tristate
+	depends on GPIOLIB
 	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
 
 if SND_SOC_INTEL_APL
@@ -485,7 +487,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 
 config SND_SOC_INTEL_SOF_CS42L42_MACH
 	tristate "SOF with cs42l42 codec in I2S Mode"
-	depends on I2C && ACPI
+	depends on I2C && ACPI && GPIOLIB
 	depends on ((SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC) &&\
 		    (MFD_INTEL_LPSS || COMPILE_TEST))
 	select SND_SOC_CS42L42
-- 
2.32.0

