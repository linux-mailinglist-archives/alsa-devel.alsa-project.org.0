Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B80B46442D
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 01:50:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F69622A6;
	Wed,  1 Dec 2021 01:49:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F69622A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638319831;
	bh=BO3gveHlZY/gEPPCY5ApjZ6mt/Op/nmlb/KIk8Rr4sc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hv87mX61gsx3aXDSl9j95/8rKnxR3TQnoVnFipskRQF3EqNq8kv4ffyGOfBkgKPRM
	 8SX/+NmxKJkwouc2tY/eN/Qc/RRS2qGHMNGXkOadZzNVgIll86a3uxFv/Qov+JccGR
	 vAZpmgaEb/WtgpdjhUxQxibO1G0/4FmUxk3z6YMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54604F8020D;
	Wed,  1 Dec 2021 01:49:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06CE3F80290; Wed,  1 Dec 2021 01:49:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5666F8020D
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 01:48:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5666F8020D
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="216368116"
X-IronPort-AV: E=Sophos;i="5.87,277,1631602800"; d="scan'208";a="216368116"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 16:48:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,277,1631602800"; d="scan'208";a="540619572"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.25])
 by orsmga001.jf.intel.com with ESMTP; 30 Nov 2021 16:48:53 -0800
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: intel-dsp-config: add JasperLake support
Date: Wed,  1 Dec 2021 08:46:28 +0800
Message-Id: <20211201004628.1153763-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Xiuli Pan <xiuli.pan@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, Brent Lu <brent.lu@intel.com>,
 Bard Liao <bard.liao@intel.com>
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

Add rules to select SOF driver for Jasper Lake systems if digital
microphone is present or the system is a Chromebook.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/hda/intel-dsp-config.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index b9ac9e9e45a4..be47a1ca12b6 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -299,6 +299,27 @@ static const struct config_entry config_table[] = {
 	},
 #endif
 
+/* Jasper Lake */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_JASPERLAKE)
+	{
+		.flags = FLAG_SOF,
+		.device = 0x4dc8,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.device = 0x4dc8,
+	},
+#endif
+
 /* Tigerlake */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
 	{
-- 
2.25.1

