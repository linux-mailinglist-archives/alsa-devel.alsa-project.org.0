Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA17716D56
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 23:57:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BB05181F;
	Tue,  7 May 2019 23:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BB05181F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557266262;
	bh=6XIVJSb0jVtCFPFvtagszBUy++v9o+gWHTWtkgf2mJk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z4IbzzqFwFh908VQjnLHsDZ77P9nu5WzVFFvuBa45CzxG3xsCpCNJCBOiFU1YBKTZ
	 wOFclRVwyez5BsdIqo/4YMrHxivEMvZf1iJdhqVvzA8sxc7gE9S7U1nAE9BIZMrjV0
	 RLF3cyA1Gn/ZhxyuDlpity0Lo/w58gSMVCSoB77o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7D4FF8972E;
	Tue,  7 May 2019 23:54:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2A89F89674; Tue,  7 May 2019 23:54:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 812F4F807B5
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 23:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 812F4F807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="TJHz7SXm"
Received: by mail-pg1-x541.google.com with SMTP id c13so8988344pgt.1
 for <alsa-devel@alsa-project.org>; Tue, 07 May 2019 14:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2mZ3KmK2gCP50bBQ3mZ2/amM1EISbfPLkjJEim0ThDA=;
 b=TJHz7SXm4sQDBvLL20U3wXDmPm2umD/JEJdBHusPXQlRJXVPHuh/hNTeEl4REtZ8zl
 bzJNj25iP1+UU9YJx/X5nvdnCPA4aHELx7s60A9KfmUvaOa5gKS0gdCzfhGLlHImU3rR
 WILEyNTWWw1BiZbDnkX2kIjeuQqZxxXF1Ij/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2mZ3KmK2gCP50bBQ3mZ2/amM1EISbfPLkjJEim0ThDA=;
 b=mpkAXMFKu4bIdTkCI+vsVGOvX+ZkH0YHrZk55WHAGjql3HDbjk6w5uNpKCqewsWUrz
 +ecUlMTcQK0W3c8QxcYMPPIhxONdKtCLZWdIE3lrbhC5xzsEAqov0BXFnS1cDhsp3TV/
 K86DfsZR2ml5deKCKp41mBU51YmNTQazR8ikigKn9XSgVTTFgRH6DJW+lkJKs1aXIw7P
 JfKTJX1uI5krH5UDsTx7qAP4e2sTeW4b8Se/uZ79iTtFReR0E6i3Tz024IsN3zSPyZ6r
 SIKapIQvQT1l7xQDYEHAK27FPzkjN5SmlvUXFDOaKGvdEE61/jvf1tlBtfs91ptf+aIk
 efyQ==
X-Gm-Message-State: APjAAAUF46Ktg4UqvsVXyYUT/VY48Q0Pberw4m6fj0pXMmQWlDPKA6k9
 UkCRpyY5rnh4deSssiwMR/7UAQ==
X-Google-Smtp-Source: APXvYqydcKF3Z8iHDFH4RujwANE5rKFdGwfbt6zKY8Tl+Ss3XTeF8BK+ZIiIkMZtGZR4HomzrpIF7A==
X-Received: by 2002:a63:5443:: with SMTP id e3mr42240547pgm.265.1557266070836; 
 Tue, 07 May 2019 14:54:30 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com
 ([2620:15c:202:201:ffda:7716:9afc:1301])
 by smtp.gmail.com with ESMTPSA id 19sm36854191pfs.104.2019.05.07.14.54.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 07 May 2019 14:54:30 -0700 (PDT)
From: Evan Green <evgreen@chromium.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Date: Tue,  7 May 2019 14:53:59 -0700
Message-Id: <20190507215359.113378-3-evgreen@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507215359.113378-1-evgreen@chromium.org>
References: <20190507215359.113378-1-evgreen@chromium.org>
MIME-Version: 1.0
Cc: Rajat Jain <rajatja@chromium.org>, alsa-devel@alsa-project.org,
 Yu Zhao <yuzhao@google.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Evan Green <evgreen@chromium.org>, Ben Zhang <benzh@chromium.org>,
 Rakesh Ughreja <rakesh.a.ughreja@intel.com>,
 Sathya Prakash <sathya.prakash.m.r@intel.com>, Naveen M <naveen.m@intel.com>,
 Guenter Roeck <groeck@chromium.org>, Jenny TC <jenny.tc@intel.com>
Subject: [alsa-devel] [PATCH v2 2/2] ASoC: Intel: Skylake: Add Cometlake PCI
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

Changes in v2:
- Add 0x06c8 for CML-H (Pierre-Louis)

 sound/soc/intel/Kconfig                | 18 ++++++++++++++++++
 sound/soc/intel/skylake/skl-messages.c | 16 ++++++++++++++++
 sound/soc/intel/skylake/skl.c          | 10 ++++++++++
 3 files changed, 44 insertions(+)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index fc1396adde71..1ebac54b7081 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -110,6 +110,8 @@ config SND_SOC_INTEL_SKYLAKE
 	select SND_SOC_INTEL_GLK
 	select SND_SOC_INTEL_CNL
 	select SND_SOC_INTEL_CFL
+	select SND_SOC_INTEL_CML_H
+	select SND_SOC_INTEL_CML_LP
 	help
           This is a backwards-compatible option to select all devices
 	  supported by the Intel SST/Skylake driver. This option is no
@@ -165,6 +167,22 @@ config SND_SOC_INTEL_CFL
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
