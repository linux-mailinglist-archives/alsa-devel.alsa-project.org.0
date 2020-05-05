Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7962F1C4C79
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 05:06:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9370E1729;
	Tue,  5 May 2020 05:05:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9370E1729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588647981;
	bh=YJqjCEqSRZO6VjgE6/Jb5f1/63y0zqlxxpUFhYqa71E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ELHsE+IYHq4lpNf4SxwQxorGlsN/BHFtPV63aG7qRSHgE82wjYZKIiBcWcyEZoY5m
	 vyhRRlF5RpfqvUpqDfRyl6J+nMDC8j0skFRxl9m2khH4UDg/L5doxFozGgzcn0yH/A
	 bnaGMDNGiFOftD1eGpBRhQ2r88M3+WWWY674ipPM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF993F8015F;
	Tue,  5 May 2020 05:04:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C961BF8015F; Tue,  5 May 2020 05:04:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 768E6F800AD
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 05:04:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 768E6F800AD
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1jVnsJ-0003LT-4I; Tue, 05 May 2020 03:04:03 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH 1/2] ALSA: hda: Use dev_to_hdac_dev macro
Date: Tue,  5 May 2020 11:03:52 +0800
Message-Id: <20200505030357.28004-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Evan Green <evgreen@chromium.org>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 open list <linux-kernel@vger.kernel.org>
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

Use dev_to_hdac_dev() instead of container_of().

No functional change intended.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 sound/hda/ext/hdac_ext_bus.c | 2 +-
 sound/hda/hdac_device.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/ext/hdac_ext_bus.c b/sound/hda/ext/hdac_ext_bus.c
index 73bfa71845f6..d0a604c939df 100644
--- a/sound/hda/ext/hdac_ext_bus.c
+++ b/sound/hda/ext/hdac_ext_bus.c
@@ -62,7 +62,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_exit);
 
 static void default_release(struct device *dev)
 {
-	snd_hdac_ext_bus_device_exit(container_of(dev, struct hdac_device, dev));
+	snd_hdac_ext_bus_device_exit(dev_to_hdac_dev(dev));
 }
 
 /**
diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index e3119f5cb0d5..333220f0f8af 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -20,7 +20,7 @@ static int get_codec_vendor_name(struct hdac_device *codec);
 
 static void default_release(struct device *dev)
 {
-	snd_hdac_device_exit(container_of(dev, struct hdac_device, dev));
+	snd_hdac_device_exit(dev_to_hdac_dev(dev));
 }
 
 /**
-- 
2.17.1

