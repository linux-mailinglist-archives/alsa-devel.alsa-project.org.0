Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B3A1839E5
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 20:54:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33E441774;
	Thu, 12 Mar 2020 20:53:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33E441774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584042887;
	bh=dO1aZDexHNnh53JodSl09T+U2eHM2GO0g6dawGYnKzA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AL0+r+HYnC2tNm5BHN3NxUrmB1td7Xbo5yTAE1wnhwsYcV97xIE+Tq9gaKxvHwyLh
	 X9MQ4/T93D9KNmR59l8Rss6cy+x3vBdI4BLZm4lE7dz9DmoJb+riJPohXKH7ScWmpz
	 IViJhQXluUjP+BZLb9zSkJDGcECXiORgIKHQik58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93013F802D2;
	Thu, 12 Mar 2020 20:49:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29DA9F802A8; Thu, 12 Mar 2020 20:49:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A56EAF80276
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 20:49:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A56EAF80276
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 12:49:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="416058392"
Received: from unknown (HELO pbossart-mobl3.amr.corp.intel.com)
 ([10.251.241.169])
 by orsmga005.jf.intel.com with ESMTP; 12 Mar 2020 12:49:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 06/10] ASoC: Intel: skylake: (cosmetic) remove redundant
 variable initialisations
Date: Thu, 12 Mar 2020 14:48:55 -0500
Message-Id: <20200312194859.4051-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194859.4051-1-pierre-louis.bossart@linux.intel.com>
References: <20200312194859.4051-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

Variables, used as loop iterators, don't need to be initialised.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/skylake/skl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index f755ca2484cf..1aa8114a4f77 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -359,7 +359,7 @@ static int skl_resume(struct device *dev)
 	struct pci_dev *pci = to_pci_dev(dev);
 	struct hdac_bus *bus = pci_get_drvdata(pci);
 	struct skl_dev *skl  = bus_to_skl(bus);
-	struct hdac_ext_link *hlink = NULL;
+	struct hdac_ext_link *hlink;
 	int ret;
 
 	/*
@@ -794,7 +794,7 @@ static void skl_probe_work(struct work_struct *work)
 {
 	struct skl_dev *skl = container_of(work, struct skl_dev, probe_work);
 	struct hdac_bus *bus = skl_to_bus(skl);
-	struct hdac_ext_link *hlink = NULL;
+	struct hdac_ext_link *hlink;
 	int err;
 
 	if (IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)) {
-- 
2.20.1

