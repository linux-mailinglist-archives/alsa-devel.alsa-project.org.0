Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC6B77751
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2019 08:45:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28A9D2055;
	Sat, 27 Jul 2019 08:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28A9D2055
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564209923;
	bh=HaoL39Ng0iEMtsg2lHR0qn9eNJrj4I3uH7BEMnYyruk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZZ9bfehzKzVY3XyGWhiUqnNI0hVkpplGVR64rybsSIpWtzASwbiI7wp4nfwzGg6LD
	 btcVuZXKKAxnqVRfzIUOkQdYRiF3RU+446aaSuhhhXT7tzNPvVSbjMoHNk9yPx+DOO
	 xbX/Q1lzylYhaF73tPWohPOcTDWVzL5uKaKwmsaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CC7CF80394;
	Sat, 27 Jul 2019 08:43:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E4FDF803D1; Wed, 24 Jul 2019 15:17:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9881F800E3
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 15:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9881F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aAZlNgbG"
Received: by mail-pg1-x543.google.com with SMTP id s1so14921685pgr.2
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 06:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XZ7wVAol4MmwCR8qqLkSZFpDoEl3K+dOfXOvnl97TeU=;
 b=aAZlNgbGrO631uA4dTBhkeCQuO+ougCeNujCTmwIi60xQzK8W7h6fg+EoMg2ulbvoI
 j4rKf6Q4ecwOfU/XRmw8OSvIlEcUrrqWmzkLz2EyjeYlz9mWUNBY1Hyatjt9V6Ayf3Ce
 yYh7wV6rkgfWbfqcHMcoh9GERBqkY95OZEeNi44B1mZvSRfaKRRvhDc8c1+UgbaDV3iA
 6/RJ4BSutiLMhvAeygYx8Ut3BroohM4kNixAKTrHNH94qic6ExiKTzUCEtTy+78LeaWk
 FIvzzXhX8GLwAwmXVxpSUBt/b5hDx0jQZFxL4WJD1dMCYNBZR3sRF4klnP68Xgw9sfy+
 tZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XZ7wVAol4MmwCR8qqLkSZFpDoEl3K+dOfXOvnl97TeU=;
 b=rHQxFx0aQLc6gK17IPAfYugN2CPqgfp7YsFaZkGNMElQunv04D33VXmjwg9bzznXGv
 hseJ6cPgtqu1tUCaFRMWL9sILoRUTKTE1rmWTRzqp05b5Ab7Yh1JPdQ8zvdUzztUaWQp
 J+dvzPc2mKoMc6tyOHehjjJYubPwEoPKqeISJs7p7MqvcqnPpUpO6nJVA0vnl9Ist8Ym
 sTj9LZDmF1QlQfmtcHhurqV33lqxHIaJjDoApqIzkx/Gh/V1wZS2yBvEem9Yf1PottsS
 zZMCofh97j8qXzRnjiAaXdIDAqn9WP7dq9dYUsfcf6xeQWAc/vqNJAYlDzlFvOcHjsPI
 cpUQ==
X-Gm-Message-State: APjAAAVX86IrWp47sJQvsx2BCs0nuW8FH33/zf9FmxjFyTVKZN9LRMzM
 Ob3KmW1WZmklFAajC5LbiiU=
X-Google-Smtp-Source: APXvYqwi0sRrTRaqStbjuaz+zMQjtVRZiL1SvumOsFoCHj6qqKXFFgM9byvpvn9R6xFgMTSfElL1OQ==
X-Received: by 2002:aa7:8218:: with SMTP id k24mr10886951pfi.221.1563974253258; 
 Wed, 24 Jul 2019 06:17:33 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id w4sm61053835pfn.144.2019.07.24.06.17.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 06:17:32 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Date: Wed, 24 Jul 2019 21:17:25 +0800
Message-Id: <20190724131725.1655-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 27 Jul 2019 08:43:36 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Chuhong Yuan <hslester96@gmail.com>
Subject: [alsa-devel] [PATCH] ASoC: Intel: Skylake: Use dev_get_drvdata
	where possible
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

Instead of using to_pci_dev + pci_get_drvdata,
use dev_get_drvdata to make code simpler.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 sound/soc/intel/skylake/skl-nhlt.c |  3 +--
 sound/soc/intel/skylake/skl.c      | 12 ++++--------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-nhlt.c b/sound/soc/intel/skylake/skl-nhlt.c
index 1132109cb992..46d9977224d1 100644
--- a/sound/soc/intel/skylake/skl-nhlt.c
+++ b/sound/soc/intel/skylake/skl-nhlt.c
@@ -241,8 +241,7 @@ int skl_nhlt_update_topology_bin(struct skl *skl)
 static ssize_t skl_nhlt_platform_id_show(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
-	struct pci_dev *pci = to_pci_dev(dev);
-	struct hdac_bus *bus = pci_get_drvdata(pci);
+	struct hdac_bus *bus = dev_get_drvdata(dev);
 	struct skl *skl = bus_to_skl(bus);
 	struct nhlt_acpi_table *nhlt = (struct nhlt_acpi_table *)skl->nhlt;
 	char platform_id[32];
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 3362e71b4563..1f625fc65307 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -141,8 +141,7 @@ static int skl_init_chip(struct hdac_bus *bus, bool full_reset)
 
 void skl_update_d0i3c(struct device *dev, bool enable)
 {
-	struct pci_dev *pci = to_pci_dev(dev);
-	struct hdac_bus *bus = pci_get_drvdata(pci);
+	struct hdac_bus *bus = dev_get_drvdata(dev);
 	u8 reg;
 	int timeout = 50;
 
@@ -274,8 +273,7 @@ static int skl_acquire_irq(struct hdac_bus *bus, int do_disconnect)
 
 static int skl_suspend_late(struct device *dev)
 {
-	struct pci_dev *pci = to_pci_dev(dev);
-	struct hdac_bus *bus = pci_get_drvdata(pci);
+	struct hdac_bus *bus = dev_get_drvdata(dev);
 	struct skl *skl = bus_to_skl(bus);
 
 	return skl_suspend_late_dsp(skl);
@@ -400,8 +398,7 @@ static int skl_resume(struct device *dev)
 #ifdef CONFIG_PM
 static int skl_runtime_suspend(struct device *dev)
 {
-	struct pci_dev *pci = to_pci_dev(dev);
-	struct hdac_bus *bus = pci_get_drvdata(pci);
+	struct hdac_bus *bus = dev_get_drvdata(dev);
 
 	dev_dbg(bus->dev, "in %s\n", __func__);
 
@@ -410,8 +407,7 @@ static int skl_runtime_suspend(struct device *dev)
 
 static int skl_runtime_resume(struct device *dev)
 {
-	struct pci_dev *pci = to_pci_dev(dev);
-	struct hdac_bus *bus = pci_get_drvdata(pci);
+	struct hdac_bus *bus = dev_get_drvdata(dev);
 
 	dev_dbg(bus->dev, "in %s\n", __func__);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
