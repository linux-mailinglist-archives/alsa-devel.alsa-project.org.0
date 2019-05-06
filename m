Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C58158E4
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 07:24:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FEB01838;
	Tue,  7 May 2019 07:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FEB01838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557206670;
	bh=hx+1AoSPh6DXPNACI6D+ZhirDBTCiHa82pcnZLKdRw0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=svdH7ByP4fIlULaIFgfQQjxZF4WKKy8nIrBf/XoITh1DWJj3fdnsX+1PvAV5vNhjC
	 ivM7tfHAO8ZzBjtKCEGiLduzZStescL80px9f/5TUL0nyNbMbz4hVCH2vHKnkVJ9Cg
	 xNGrlCAemJRWI5Ae1/Rrur2xgf+GaqJNzhm6VTkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E3EDF89731;
	Tue,  7 May 2019 07:20:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78B69F896FD; Tue,  7 May 2019 00:54:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D00A4F80726
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 00:54:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D00A4F80726
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="l3Ojkz9K"
Received: by mail-pf1-x443.google.com with SMTP id c6so2329595pfa.10
 for <alsa-devel@alsa-project.org>; Mon, 06 May 2019 15:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L5NX6UdjTtgyLhTG27pUpjzYT4XZYiXb70lYN/n1LfU=;
 b=l3Ojkz9Kx0UoD8mJ28v84u+3hN5a5hHyIRJ7s+kZXtdFq/gt3GfoAoPpnPfJtSuT/O
 FbBWXqsZ87BV7hUKd1phpYpv1DJoPQTDMn8/TB7RXoLpYhkahaXBhfam/nbRrX/ilHjE
 HxLCC6vyjtJw5WqMVmYGpH99s1FTjxGyc5iNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L5NX6UdjTtgyLhTG27pUpjzYT4XZYiXb70lYN/n1LfU=;
 b=fpKkQ9T95NbsZ0/fk1kSFqQzRd/gngxEaJJ/F4jNmZ0Er98CdtIrG+BWDAC9625Jgn
 FqMhn9oKAxdHc7KIDTsU7HnyCh0cu2NExBq+YZcrjppW+OsMZumNqhM3yagu6zF6fo0X
 W9dmljWM/cOH8F3FeFZ3tpLwSwmK+CuDO2wA3MIGDxiXRX5G0CCkkiiIjvaH6/1FRZwI
 BLMtmYu+Rlip/VidjZr1+PQNgxRH2hHmlzk4ijNRAeUjkIMm1HNBFjRRrb9yjiQBvnNe
 OCmS4q8f9KkitJfDhds4sjHuqXHhFYzYDH+RBOzVKPRDSRoQna5HsNZwIb9IOBgSvRkS
 PjfQ==
X-Gm-Message-State: APjAAAVFl6Qc6fopbGWwQL2psykTicQ+0ME4doN8P8utGXsgtog2jgIA
 U+r3XMReuE56hRLi3BP+MG+5PQ==
X-Google-Smtp-Source: APXvYqwNnGdQJp9gwELfUY9wZmF/dWP2Oo+RWeMx6qHAIWlNWMHxnD7YS6x+eRVEg2u8SQEdjkwQ6g==
X-Received: by 2002:a62:1a51:: with SMTP id a78mr27784562pfa.133.1557183244836; 
 Mon, 06 May 2019 15:54:04 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com
 ([2620:15c:202:201:ffda:7716:9afc:1301])
 by smtp.gmail.com with ESMTPSA id i15sm16052204pfr.8.2019.05.06.15.54.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 06 May 2019 15:54:04 -0700 (PDT)
From: Evan Green <evgreen@chromium.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Date: Mon,  6 May 2019 15:53:21 -0700
Message-Id: <20190506225321.74100-3-evgreen@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190506225321.74100-1-evgreen@chromium.org>
References: <20190506225321.74100-1-evgreen@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:44 +0200
Cc: Rajat Jain <rajatja@chromium.org>, alsa-devel@alsa-project.org,
 Yu Zhao <yuzhao@google.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Ben Zhang <benzh@chromium.org>,
 Rakesh Ughreja <rakesh.a.ughreja@intel.com>,
 Sathya Prakash <sathya.prakash.m.r@intel.com>, Naveen M <naveen.m@intel.com>,
 Guenter Roeck <groeck@chromium.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jenny TC <jenny.tc@intel.com>
Subject: [alsa-devel] [PATCH v1 2/2] ASoC: Intel: Skylake: Add Cometlake PCI
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

 sound/soc/intel/Kconfig                | 9 +++++++++
 sound/soc/intel/skylake/skl-messages.c | 8 ++++++++
 sound/soc/intel/skylake/skl.c          | 5 +++++
 3 files changed, 22 insertions(+)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index fc1396adde71..6b45082f8bd1 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -110,6 +110,7 @@ config SND_SOC_INTEL_SKYLAKE
 	select SND_SOC_INTEL_GLK
 	select SND_SOC_INTEL_CNL
 	select SND_SOC_INTEL_CFL
+	select SND_SOF_INTEL_CML
 	help
           This is a backwards-compatible option to select all devices
 	  supported by the Intel SST/Skylake driver. This option is no
@@ -165,6 +166,14 @@ config SND_SOC_INTEL_CFL
 	  If you have a Intel CoffeeLake platform with the DSP
 	  enabled in the BIOS then enable this option by saying Y or m.
 
+config SND_SOC_INTEL_CML
+	tristate "CometLake Platforms"
+	depends on PCI && ACPI
+	select SND_SOC_INTEL_SKYLAKE_FAMILY
+	help
+	  If you have a Intel CometLake platform with the DSP
+	  enabled in the BIOS then enable this option by saying Y or m.
+
 config SND_SOC_INTEL_SKYLAKE_FAMILY
 	tristate
 	select SND_SOC_INTEL_SKYLAKE_COMMON
diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index 4bf70b4429f0..e0e404b08627 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -255,6 +255,14 @@ static const struct skl_dsp_ops dsp_ops[] = {
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
 };
 
 const struct skl_dsp_ops *skl_get_dsp_ops(int pci_id)
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 4ed5b7e17d44..a9f6f5184639 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -1166,6 +1166,11 @@ static const struct pci_device_id skl_ids[] = {
 	/* CFL */
 	{ PCI_DEVICE(0x8086, 0xa348),
 		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_CML)
+	/* CML */
+	{ PCI_DEVICE(0x8086, 0x02c8),
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
