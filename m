Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33912158E2
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 07:23:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDE321886;
	Tue,  7 May 2019 07:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDE321886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557206624;
	bh=NK8YIN4oRnqNrEBrk0bQY+xpSh9U6iTxopxikbEX9Dw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GlqtxDMEKCpXdm/Rm2Lohpm0SbwtHicdygUBFu5Lqj5uZwNvHFnM3eDtRTsbhCUID
	 4czWk2PARF2fbdrmf4j7e0EaGn5Rk2sBUTtb+qiaM/ZxZb4WzwPcRfUHM1hGBhEFNN
	 xWb3k6QXhe/OM7blXcd6R1McWNeIotIYSxZrLjtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4954F8972C;
	Tue,  7 May 2019 07:20:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D564F896F0; Tue,  7 May 2019 00:54:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA050F80C07
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 00:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA050F80C07
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Xqp1nGdv"
Received: by mail-pl1-x643.google.com with SMTP id e92so7101084plb.6
 for <alsa-devel@alsa-project.org>; Mon, 06 May 2019 15:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HGiQcQsNLZSu4O6fjQQo4uRzuuZ+mn8z8Ipe1hIL3NA=;
 b=Xqp1nGdvYAdr3hwiLJW8lG3kT1k7Yy9LxQ5aPzpz6Nocr+Nm86dqowKmEwscybxhPf
 EhVlR0xH5V3jZ0fHsBXC7WYcjwWDuajuIXoY0MNpwhfBrIEA3pTFW5Jjx0ry/Vok2mqC
 dQnYy491jpnktcXfymmYwDTpd5+KS3JVJuNvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HGiQcQsNLZSu4O6fjQQo4uRzuuZ+mn8z8Ipe1hIL3NA=;
 b=dpuGL+LRTlNN5z081bqdJz/cuLPvqmjE1u9TvfTXo1rhCu9EEXVCPFU0A1KY/3WMQS
 NtJ2EyKIorYDiNigoSYZV5E0HBAfsEbSm3iMPUKJhCap4vYDX07Lx1pYLrTD6JFRtusc
 foeqjHRaS5QO9EhVqhh9SCceE3QZulbOLC59gVF8EveatUHob4Dx3SxGmnpZo9gpcP/F
 tPGOnj9YIfYm+Nb9AqrUfrIwQKcywuiPXGoRwTZhaRzdFX0a/PJttOumXS3QsLwqSJ4u
 QBiEe12ksXgDmM86/DebsE+ks9IKG+zLpDmXXaNemkQgFVF8QNRGZJinEtkfGfvrSfJz
 v/7g==
X-Gm-Message-State: APjAAAXFugjhQ65k+b3Yj1dVFT1J0lkQgbipwT+VP6UT3QUXt369CcmK
 CjbywKf0Gj7BMoVSjRNgesqHDg==
X-Google-Smtp-Source: APXvYqxjOUJswIaRnTQ3xdkZLysQ2doJPKtQCCGYKHAnXh29aCBCNNabnZeO15lzHDP+VUQD41L99g==
X-Received: by 2002:a17:902:5ac9:: with SMTP id
 g9mr738635plm.134.1557183241818; 
 Mon, 06 May 2019 15:54:01 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com
 ([2620:15c:202:201:ffda:7716:9afc:1301])
 by smtp.gmail.com with ESMTPSA id i15sm16052204pfr.8.2019.05.06.15.54.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 06 May 2019 15:54:01 -0700 (PDT)
From: Evan Green <evgreen@chromium.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Date: Mon,  6 May 2019 15:53:20 -0700
Message-Id: <20190506225321.74100-2-evgreen@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190506225321.74100-1-evgreen@chromium.org>
References: <20190506225321.74100-1-evgreen@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:44 +0200
Cc: Rajat Jain <rajatja@chromium.org>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Ben Zhang <benzh@chromium.org>, Sathya Prakash <sathya.prakash.m.r@intel.com>,
 Naveen M <naveen.m@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v1 1/2] ASoC: SOF: Add Comet Lake PCI ID
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
for CometLake and the appropriate PCI ID.

Signed-off-by: Evan Green <evgreen@chromium.org>
---

 sound/soc/sof/intel/Kconfig | 16 ++++++++++++++++
 sound/soc/sof/sof-pci-dev.c |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 32ee0fabab92..0b616d025f05 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -24,6 +24,7 @@ config SND_SOC_SOF_INTEL_PCI
 	select SND_SOC_SOF_CANNONLAKE  if SND_SOC_SOF_CANNONLAKE_SUPPORT
 	select SND_SOC_SOF_COFFEELAKE  if SND_SOC_SOF_COFFEELAKE_SUPPORT
 	select SND_SOC_SOF_ICELAKE     if SND_SOC_SOF_ICELAKE_SUPPORT
+	select SND_SOC_SOF_COMETLAKE   if SND_SOC_SOF_COMETLAKE_SUPPORT
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -179,6 +180,21 @@ config SND_SOC_SOF_ICELAKE
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
 
+config SND_SOC_SOF_COMETLAKE
+	tristate
+	select SND_SOC_SOF_CANNONLAKE
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_COMETLAKE_SUPPORT
+	bool "SOF support for CometLake"
+	help
+	  This adds support for Sound Open Firmware for Intel(R) platforms
+	  using the Cometlake processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
 config SND_SOC_SOF_HDA_COMMON
 	tristate
 	select SND_SOC_SOF_INTEL_COMMON
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index b778dffb2d25..5f0128337e40 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -353,6 +353,10 @@ static const struct pci_device_id sof_pci_ids[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
 	{ PCI_DEVICE(0x8086, 0x34C8),
 		.driver_data = (unsigned long)&icl_desc},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE)
+	{ PCI_DEVICE(0x8086, 0x02c8),
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
