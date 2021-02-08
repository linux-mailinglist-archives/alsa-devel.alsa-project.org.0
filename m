Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3048F313435
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 15:01:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACF66167A;
	Mon,  8 Feb 2021 15:00:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACF66167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612792870;
	bh=T3ZxKaaQdA/YFCxfjCeG8KzFio9TtG4ZdkILaYG7+2w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K8kK4udXP/G5Hzep+oNYTlCv5D0V+iXOOnQougnha/LaT7cB6wuHvTsB2C4i4+VP7
	 d+qMtVqszEamSsOFNaQFijYviz+L2jqGyPwtwwL53nIWSXTWN/CX7AAW8W0GYCLqwZ
	 Pzixt7k8snQ9friKKtl6w++uryYexWYJ2BmcNizI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3EBAF80114;
	Mon,  8 Feb 2021 14:59:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF253F8022D; Mon,  8 Feb 2021 14:59:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A03EF8013A
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 14:59:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A03EF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="KbnNbJlu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612792767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HMuLU2e2F9gweGSdzUTIkLLtvZHyRJe4AWF0OUHTtnk=;
 b=KbnNbJlut3TBz+H7QFuyjL/J+/KI1Rn+153NnYc5z13CWzyMs1pQjdWPjN2kVjvcxDwBaU
 psuovbxKAuoHHPA6RK/ICXFujJUaq3WS33ekWXxiM1m6K2t0/9tCnlGVLgq+C9Stvh7YzR
 hwJHzQJAEq1gyPCX2ElwcVcAezBt4Ec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-2jrZHuPROmOYr-7Bjtfuxg-1; Mon, 08 Feb 2021 08:59:24 -0500
X-MC-Unique: 2jrZHuPROmOYr-7Bjtfuxg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9846C189DF75;
 Mon,  8 Feb 2021 13:59:22 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-115-119.ams2.redhat.com
 [10.36.115.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A889A10016DB;
 Mon,  8 Feb 2021 13:59:20 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2] ALSA: hda: intel-dsp-config: Add SND_INTEL_BYT_PREFER_SOF
 Kconfig option
Date: Mon,  8 Feb 2021 14:59:19 +0100
Message-Id: <20210208135919.135600-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org
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

The kernel has 2 drivers for the Low Power Engine audio-block on
Bay- and Cherry-Trail SoCs. The old SST driver and the new SOF
driver. If both drivers are enabled then the kernel will default
to using the old SST driver, unless told otherwise through the
snd_intel_dspcfg.dsp_driver module-parameter.

Add a boolean SND_INTEL_BYT_PREFER_SOF Kconfig option, which when set to Y
will make the kernel default to the new SOF driver instead.
The option defaults to n, preserving the current behavior.

Making this configurable will help distributions such as Fedora:
https://fedoraproject.org/w/index.php?title=Changes/SofDefaultForIntelLpe
to test using SOF on BYT/CHT during the transition phase where we
have both drivers (eventually the old driver and this option will
be removed).

Note that this drops the acpi_config_table[] containing 2 entries per ACPI
hardware-id if both drivers are enabled. snd_intel_acpi_dsp_find_config()
will always return the first hit, so we only need a single entry with the
flags value set depending on the Kconfig settings.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Rework following Takashi's suggestions
---
 sound/hda/Kconfig            | 14 ++++++++++++++
 sound/hda/intel-dsp-config.c | 29 ++++++++++++-----------------
 2 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/sound/hda/Kconfig b/sound/hda/Kconfig
index 3bc9224d5e4f..9ed5cfa3c18c 100644
--- a/sound/hda/Kconfig
+++ b/sound/hda/Kconfig
@@ -46,3 +46,17 @@ config SND_INTEL_DSP_CONFIG
 	select SND_INTEL_NHLT if ACPI
 	# this config should be selected only for Intel DSP platforms.
 	# A fallback is provided so that the code compiles in all cases.
+
+config SND_INTEL_BYT_PREFER_SOF
+	bool "Prefer SOF driver over SST on BY/CHT platforms"
+	depends on SND_SST_ATOM_HIFI2_PLATFORM_ACPI && SND_SOC_SOF_BAYTRAIL
+	default n
+	help
+	  The kernel has 2 drivers for the Low Power Engine audio-block on
+	  Bay- and Cherry-Trail SoCs. The old SST driver and the new SOF
+	  driver. If both drivers are enabled then the kernel will default
+	  to using the old SST driver, unless told otherwise through the
+	  snd_intel_dspcfg.dsp_driver module-parameter.
+
+	  Set this option to Y to make the kernel default to the new SOF
+	  driver instead.
diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index c45686172517..68bb977c6a37 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -452,35 +452,30 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 }
 EXPORT_SYMBOL_GPL(snd_intel_dsp_driver_probe);
 
+/* Should we default to SOF or SST for BYT/CHT ? */
+#if IS_ENABLED(CONFIG_SND_INTEL_BYT_PREFER_SOF) || \
+    !IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI)
+#define FLAG_SST_OR_SOF_BYT	FLAG_SOF
+#else
+#define FLAG_SST_OR_SOF_BYT	FLAG_SST
+#endif
+
 /*
  * configuration table
  * - the order of similar ACPI ID entries is important!
  * - the first successful match will win
  */
 static const struct config_entry acpi_config_table[] = {
+#if IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI) || \
+    IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 /* BayTrail */
-#if IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI)
-	{
-		.flags = FLAG_SST,
-		.acpi_hid = "80860F28",
-	},
-#endif
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 	{
-		.flags = FLAG_SOF,
+		.flags = FLAG_SST_OR_SOF_BYT,
 		.acpi_hid = "80860F28",
 	},
-#endif
 /* CherryTrail */
-#if IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI)
-	{
-		.flags = FLAG_SST,
-		.acpi_hid = "808622A8",
-	},
-#endif
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 	{
-		.flags = FLAG_SOF,
+		.flags = FLAG_SST_OR_SOF_BYT,
 		.acpi_hid = "808622A8",
 	},
 #endif
-- 
2.30.0

