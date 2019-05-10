Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DFF1A56C
	for <lists+alsa-devel@lfdr.de>; Sat, 11 May 2019 00:42:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF6CD17E7;
	Sat, 11 May 2019 00:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF6CD17E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557528173;
	bh=wUTbdhZFu+xPWlh8ZdVdt/KNDY1aM2Ad//Hc2avqwVY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PkNp8RWpQRpL4HSPaflJmY2XKaEaTWvHFFQEiU3kRKCj6pK0SsZTPA4hxfiRKLnb7
	 JSKp2YjtEezTuzX4KpSvK54PlrKJ2Wb0yOrWegnw0jA+V+0sqinQhTzCgSNtsoGNge
	 qtx9MZIWwmXoPB5EmYqkNZI20XvbVSROhM991zCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D166F89728;
	Sat, 11 May 2019 00:39:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0FC6F8970E; Sat, 11 May 2019 00:39:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2AD9F8970E
 for <alsa-devel@alsa-project.org>; Sat, 11 May 2019 00:39:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2AD9F8970E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="CW3FW1Qa"
Received: by mail-pg1-x544.google.com with SMTP id e6so3660374pgc.4
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 15:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9SfaLLvXepQRjPBSTX7ofFVM9xFaCs9uEAd6y7Vf/jI=;
 b=CW3FW1QaMndV6cwwyiyNA8R53BhYSKmW1OSkoFcainmLy819+8sTqcbkORQZyJkm+j
 Xv2ZITvIK9F7I695Ipiy4gQ1xDUxh0NYNr8Kjztz40o19XH6MbspMyOdaQVO0Y1twGp7
 hRTBhLibmNvg9nBN/yrN6K3nY6blDcUvKTMQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9SfaLLvXepQRjPBSTX7ofFVM9xFaCs9uEAd6y7Vf/jI=;
 b=du/02VBcoYqB60groL9APosZm1dZs928o56r3yPMpmp+ScOjZaetD/CbOo8jzFjnGE
 VFuEdhMSu/6XFKK8bzByBHBuqDKElHOXfLThb9F4mfH1+xKLzwUv0Ss1FQGWfeOPm9Qr
 YNMLlm4PkrfcuoD9NqtUAOZDYh2CpwiHtN1g5zkDuGmqqDjacjt6xFnZU5tTn3jdDAi4
 alVIY8pJkpCAJ7xXlue82IcaL1QtbeoK+BFnbdrYvIfUShSvft4oDjJOILxDTxJo007m
 LD8cssCqNdCcIYziC/1z2d0qFojPHP8mPaHW4nMlVi8pFbJIFBsM64LV49BVaL9T0XaE
 /S7A==
X-Gm-Message-State: APjAAAXG+ww6HFazwG6KyDvwlTLWrbih5/QC/mSP5wf6TF8RX6ZN5tO6
 a4aIHsmgUBhMFQ/yROqWo5uCHA==
X-Google-Smtp-Source: APXvYqyRgDz+Yrd5PgXej0kYFwSP00cOYoCC+OFOn+fT0I0FzCSLjsERw1RyZahadf+YpZ58Uxujag==
X-Received: by 2002:aa7:8a53:: with SMTP id n19mr17229422pfa.11.1557527988266; 
 Fri, 10 May 2019 15:39:48 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com
 ([2620:15c:202:201:ffda:7716:9afc:1301])
 by smtp.gmail.com with ESMTPSA id u66sm13300540pfa.36.2019.05.10.15.39.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 10 May 2019 15:39:47 -0700 (PDT)
From: Evan Green <evgreen@chromium.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Date: Fri, 10 May 2019 15:39:29 -0700
Message-Id: <20190510223929.165569-3-evgreen@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190510223929.165569-1-evgreen@chromium.org>
References: <20190510223929.165569-1-evgreen@chromium.org>
MIME-Version: 1.0
Cc: Rajat Jain <rajatja@chromium.org>, alsa-devel@alsa-project.org,
 Yu Zhao <yuzhao@google.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Evan Green <evgreen@chromium.org>, Ben Zhang <benzh@chromium.org>,
 Rakesh Ughreja <rakesh.a.ughreja@intel.com>,
 Sathya Prakash <sathya.prakash.m.r@intel.com>, Naveen M <naveen.m@intel.com>,
 Guenter Roeck <groeck@chromium.org>
Subject: [alsa-devel] [PATCH v3 2/2] ASoC: Intel: Skylake: Add Cometlake PCI
	IDs
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

Add PCI IDs for Intel CometLake platforms, which from a software
point of view are extremely similar to Cannonlake platforms.

Signed-off-by: Evan Green <evgreen@chromium.org>
---

Changes in v3:
- Don't select CML_* in SND_SOC_INTEL_SKYLAKE (Pierre-Louis)

Changes in v2:
- Add 0x06c8 for CML-H (Pierre-Louis)

 sound/soc/intel/Kconfig                | 16 ++++++++++++++++
 sound/soc/intel/skylake/skl-messages.c | 16 ++++++++++++++++
 sound/soc/intel/skylake/skl.c          | 10 ++++++++++
 3 files changed, 42 insertions(+)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index fc1396adde71..b089ed3bf77f 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -165,6 +165,22 @@ config SND_SOC_INTEL_CFL
 	  If you have a Intel CoffeeLake platform with the DSP
 	  enabled in the BIOS then enable this option by saying Y or m.
 
+config SND_SOC_INTEL_CML_H
+	tristate "CometLake-H Platforms"
+	depends on PCI && ACPI
+	select SND_SOC_INTEL_SKYLAKE_FAMILY
+	help
+	  If you have a Intel CometLake-H platform with the DSP
+	  enabled in the BIOS then enable this option by saying Y or m.
+
+config SND_SOC_INTEL_CML_LP
+	tristate "CometLake-LP Platforms"
+	depends on PCI && ACPI
+	select SND_SOC_INTEL_SKYLAKE_FAMILY
+	help
+	  If you have a Intel CometLake-LP platform with the DSP
+	  enabled in the BIOS then enable this option by saying Y or m.
+
 config SND_SOC_INTEL_SKYLAKE_FAMILY
 	tristate
 	select SND_SOC_INTEL_SKYLAKE_COMMON
diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index 4bf70b4429f0..df01dc952521 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -255,6 +255,22 @@ static const struct skl_dsp_ops dsp_ops[] = {
 		.init_fw = cnl_sst_init_fw,
 		.cleanup = cnl_sst_dsp_cleanup
 	},
+	{
+		.id = 0x02c8,
+		.num_cores = 4,
+		.loader_ops = bxt_get_loader_ops,
+		.init = cnl_sst_dsp_init,
+		.init_fw = cnl_sst_init_fw,
+		.cleanup = cnl_sst_dsp_cleanup
+	},
+	{
+		.id = 0x06c8,
+		.num_cores = 4,
+		.loader_ops = bxt_get_loader_ops,
+		.init = cnl_sst_dsp_init,
+		.init_fw = cnl_sst_init_fw,
+		.cleanup = cnl_sst_dsp_cleanup
+	},
 };
 
 const struct skl_dsp_ops *skl_get_dsp_ops(int pci_id)
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 4ed5b7e17d44..f864f7b3df3a 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -1166,6 +1166,16 @@ static const struct pci_device_id skl_ids[] = {
 	/* CFL */
 	{ PCI_DEVICE(0x8086, 0xa348),
 		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_CML_LP)
+	/* CML-LP */
+	{ PCI_DEVICE(0x8086, 0x02c8),
+		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_CML_H)
+	/* CML-H */
+	{ PCI_DEVICE(0x8086, 0x06c8),
+		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
 #endif
 	{ 0, }
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
