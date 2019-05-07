Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1375216D55
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 23:56:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 929691817;
	Tue,  7 May 2019 23:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 929691817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557266217;
	bh=kXmpSzOgHAuAciThkHo06JsylbM+18bxbosGY44O2sA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X+bUnY3UWtAq8BhyJKPqogInJTkFhaGq3GZms4fmALbJ7/mPZNol+ZCQH2UBqcAID
	 vw832h+weCALUOkJGWhBss6a0ZtEVtms7x+dr82e4NJIQ5LWuK2BjDYjz+QY2EX99r
	 3g34robFEzvHoVkxeCaz1GRKsxYjCo0xmlaZhezM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A946CF896DF;
	Tue,  7 May 2019 23:54:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19823F89678; Tue,  7 May 2019 23:54:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A140F89673
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 23:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A140F89673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="V6xCCkTO"
Received: by mail-pf1-x442.google.com with SMTP id 10so9347100pfo.5
 for <alsa-devel@alsa-project.org>; Tue, 07 May 2019 14:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wo1uH0ylotnTiIgpcBv8Fglh9i6GTYOrB2xHSboADtc=;
 b=V6xCCkTO4jlGJ++M+dImXdNgyseWeYSP2BtuT9N/KmOmPgYyBmVoAbvY1QY7X+ZFoj
 JVk/Fk+71VCwkxbV725166sVXHwLpEkjueMJvXww0vne0TyP5/Vm3ClpvxGC6vgJSVdv
 2PiDF2XOwi22Ri3v3e+yG9nA1rv9yYAWfkMd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wo1uH0ylotnTiIgpcBv8Fglh9i6GTYOrB2xHSboADtc=;
 b=eVaU/Jkwc95/SzfAZMTH5W929UUXBWQG5LFcfxwFEcPvoKsk3eSTIkRJLXfnvz7xhP
 jpqoYxjl2aXnksOCyDAfbF5Bi3j+RblUJyhkB5qNdFfhbmBjFLMscDBcsjUtKjq7DmHu
 viklyrnvxkKc0YJLla+n9tn9wmOnvp6r1NvbQO4M5x5ybekUS7Z2XgYceUCLc1Cv3pzX
 r58rq/8cZ4SDYFuuAg4rfhppjSNt38P/sVZ/MffK3JoSHzVW4CSrjN7QwwSkEgdCSG+F
 nu9UMqlNiIz0q5rSTHikkeMqeVK4uyp/n49eoKloHCE2Jnzy5X/AFUn/bGwkLKrY9MZX
 HSiA==
X-Gm-Message-State: APjAAAX2bB4dzjF49oS7MBptTBWuBXBTY62JFejDunFZ5dS4dhbquZXE
 jbkgI/6Mklk/4033SYYtDziLQQ==
X-Google-Smtp-Source: APXvYqzEdUL4jjUuQFEi6eH10frUgDtP+jcneWRtKHVq/LVemZMy4gGAgflPJLxLdN2o2wjiZeu/4w==
X-Received: by 2002:a62:6f02:: with SMTP id k2mr45236465pfc.136.1557266066711; 
 Tue, 07 May 2019 14:54:26 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com
 ([2620:15c:202:201:ffda:7716:9afc:1301])
 by smtp.gmail.com with ESMTPSA id 19sm36854191pfs.104.2019.05.07.14.54.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 07 May 2019 14:54:26 -0700 (PDT)
From: Evan Green <evgreen@chromium.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Date: Tue,  7 May 2019 14:53:58 -0700
Message-Id: <20190507215359.113378-2-evgreen@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507215359.113378-1-evgreen@chromium.org>
References: <20190507215359.113378-1-evgreen@chromium.org>
MIME-Version: 1.0
Cc: Rajat Jain <rajatja@chromium.org>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Evan Green <evgreen@chromium.org>, Ben Zhang <benzh@chromium.org>,
 Sathya Prakash <sathya.prakash.m.r@intel.com>, Naveen M <naveen.m@intel.com>
Subject: [alsa-devel] [PATCH v2 1/2] ASoC: SOF: Add Comet Lake PCI IDs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support for Intel Comet Lake platforms by adding a new Kconfig
for CometLake and the appropriate PCI IDs.

Signed-off-by: Evan Green <evgreen@chromium.org>
---

Changes in v2:
- Add CML-H ID 0x06c8 (Pierre-Louis)

 sound/soc/sof/intel/Kconfig | 32 ++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-pci-dev.c |  8 ++++++++
 2 files changed, 40 insertions(+)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 32ee0fabab92..b3f4463100ce 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -24,6 +24,8 @@ config SND_SOC_SOF_INTEL_PCI
 	select SND_SOC_SOF_CANNONLAKE  if SND_SOC_SOF_CANNONLAKE_SUPPORT
 	select SND_SOC_SOF_COFFEELAKE  if SND_SOC_SOF_COFFEELAKE_SUPPORT
 	select SND_SOC_SOF_ICELAKE     if SND_SOC_SOF_ICELAKE_SUPPORT
+	select SND_SOC_SOF_COMETLAKE_LP if SND_SOC_SOF_COMETLAKE_LP_SUPPORT
+	select SND_SOC_SOF_COMETLAKE_H if SND_SOC_SOF_COMETLAKE_H_SUPPORT
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -179,6 +181,36 @@ config SND_SOC_SOF_ICELAKE
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
 
+config SND_SOC_SOF_COMETLAKE_LP
+	tristate
+	select SND_SOC_SOF_CANNONLAKE
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_COMETLAKE_LP_SUPPORT
+	bool "SOF support for CometLake-LP"
+	help
+	  This adds support for Sound Open Firmware for Intel(R) platforms
+	  using the Cometlake-LP processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
+config SND_SOC_SOF_COMETLAKE_H
+	tristate
+	select SND_SOC_SOF_CANNONLAKE
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_COMETLAKE_H_SUPPORT
+	bool "SOF support for CometLake-H"
+	help
+	  This adds support for Sound Open Firmware for Intel(R) platforms
+	  using the Cometlake-H processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
 config SND_SOC_SOF_HDA_COMMON
 	tristate
 	select SND_SOC_SOF_INTEL_COMMON
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index b778dffb2d25..f559a56d18ab 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -353,6 +353,14 @@ static const struct pci_device_id sof_pci_ids[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
 	{ PCI_DEVICE(0x8086, 0x34C8),
 		.driver_data = (unsigned long)&icl_desc},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
+	{ PCI_DEVICE(0x8086, 0x02c8),
+		.driver_data = (unsigned long)&cnl_desc},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_H)
+	{ PCI_DEVICE(0x8086, 0x06c8),
+		.driver_data = (unsigned long)&cnl_desc},
 #endif
 	{ 0, }
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
