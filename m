Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C879F312D76
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 10:39:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 505B51675;
	Mon,  8 Feb 2021 10:38:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 505B51675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612777185;
	bh=pr10r41ETmzCz+PeMSqUqL/+QGEqTmrBgui7zRFvqfM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Itag+0LMCsI9s1XIPwDQWinu5ii4Lhdsyn7LMpTgwTXgTKF0Esct6Xs+hO6pQv4VK
	 KQWdFkoXvYDC95ee80RxMIB/OmmxQliNu4ruqeDtMaVAzGGR/4VzruP8kSLlk5R5uV
	 VTRvvPFHscoqJCzWDX/FOGl5VoVKdw48mZWnJHxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C16DFF80114;
	Mon,  8 Feb 2021 10:38:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34F83F8022B; Mon,  8 Feb 2021 10:38:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB1A4F80114
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 10:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB1A4F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="KgK/Kn1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612777086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G8tnDuY2tKq+vxpS7eSamRY6LX3bxSsGUSKC7QvdPaw=;
 b=KgK/Kn1ESTO1JHeC++9SJ3wFi+FHwSMXMjRQK+DBlKITDTuZ8mhgjgg4VWSLMcLaf9wJND
 V3bcqZunn1U/OvuzisQey0KzAVsWlY2LzFrfgGfyc3DdN19OPaU65FHJGtx+8aBOYXXebD
 TDrA/QaSyARoG0DmXve0+Ny2zCkMCLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-jKFWsyDoMLekSGut3AnIMw-1; Mon, 08 Feb 2021 04:38:04 -0500
X-MC-Unique: jKFWsyDoMLekSGut3AnIMw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95BB779EC1;
 Mon,  8 Feb 2021 09:38:03 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-115-119.ams2.redhat.com
 [10.36.115.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 534815D9D5;
 Mon,  8 Feb 2021 09:38:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/2] ALSA: hda: intel-dsp-config: Add FLAG_BYT_FIRST / _SECOND
 defines
Date: Mon,  8 Feb 2021 10:37:59 +0100
Message-Id: <20210208093800.62099-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

Instead of hardcording the SST driver having the highest prio, add
FLAG_BYT_FIRST and FLAG_BYT_SECOND defines, which get set like this
when both drivers are enabled:

	#define FLAG_BYT_FIRST               FLAG_SST
	#define FLAG_BYT_SECOND              FLAG_SOF

And when only 1 driver is enabled then FLAG_BYT_FIRST gets set to
the flag for that driver.

This is a preparation patch for making which driver is preferred
configurable through Kconfig.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/hda/intel-dsp-config.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index c45686172517..2201a1e6944e 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -452,6 +452,16 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 }
 EXPORT_SYMBOL_GPL(snd_intel_dsp_driver_probe);
 
+/* FLAG_BYT_FIRST / _SECOND determine which driver is preferred on BYT/CHT when both are enabled */
+#if IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+#define FLAG_BYT_FIRST		FLAG_SST
+#define FLAG_BYT_SECOND		FLAG_SOF
+#elif IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI)
+#define FLAG_BYT_FIRST		FLAG_SST
+#elif IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+#define FLAG_BYT_FIRST		FLAG_SOF
+#endif
+
 /*
  * configuration table
  * - the order of similar ACPI ID entries is important!
@@ -459,28 +469,28 @@ EXPORT_SYMBOL_GPL(snd_intel_dsp_driver_probe);
  */
 static const struct config_entry acpi_config_table[] = {
 /* BayTrail */
-#if IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI)
+#if IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI) || IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 	{
-		.flags = FLAG_SST,
+		.flags = FLAG_BYT_FIRST,
 		.acpi_hid = "80860F28",
 	},
 #endif
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+#if IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 	{
-		.flags = FLAG_SOF,
+		.flags = FLAG_BYT_SECOND,
 		.acpi_hid = "80860F28",
 	},
 #endif
 /* CherryTrail */
-#if IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI)
+#if IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI) || IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 	{
-		.flags = FLAG_SST,
+		.flags = FLAG_BYT_FIRST,
 		.acpi_hid = "808622A8",
 	},
 #endif
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+#if IS_ENABLED(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 	{
-		.flags = FLAG_SOF,
+		.flags = FLAG_BYT_SECOND,
 		.acpi_hid = "808622A8",
 	},
 #endif
-- 
2.30.0

