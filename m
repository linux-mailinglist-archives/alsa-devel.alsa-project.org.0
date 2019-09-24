Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 852A9BC18D
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 07:57:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF61B16B6;
	Tue, 24 Sep 2019 07:56:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF61B16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569304660;
	bh=HNOkwV4HOIE3GxiTa7AKfkYD1qQQ7IOacoyjt+96D7A=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XLUdrIuYM0u4bNYyZOndbmjpKLi9MsNmGZvBQwMkUiGPRn9qHPZfhfcBnR99oM2XN
	 sVt43oJDd+BORdMMShtsSbiuWEV9LYIgfE8olBZ4ywFCkRWSGlbcQLZB6pbL3Hx84u
	 tdNwMz5P2tw9nMeo563sJgbmlU2sxX5VvBMl9wUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EC00F80533;
	Tue, 24 Sep 2019 07:55:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C82AF8045F; Tue, 24 Sep 2019 07:55:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49647F80213
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 07:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49647F80213
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 22:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; d="scan'208";a="388743625"
Received: from chrome-audio.sc.intel.com ([172.25.206.186])
 by fmsmga005.fm.intel.com with ESMTP; 23 Sep 2019 22:55:47 -0700
From: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
To: tiwai@suse.de,
	broonie@kernel.org
Date: Mon, 23 Sep 2019 22:37:23 -0700
Message-Id: <1569303443-6838-1-git-send-email-sathyanarayana.nujella@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: alsa-devel@alsa-project.org, harshapriya.n@intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 yung-chuan.liao@linux.intel.com, Joyce Toh <joyce.toh@intel.com>
Subject: [alsa-devel] [PATCH] ALSA: hda - Force polling mode on CML for
	fixing codec communication
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

We observed the same issue as reported by commit a8d7bde23e7130686b7662
("ALSA: hda - Force polling mode on CFL for fixing codec communication")
Apply the same fix to CML.

Signed-off-by: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Signed-off-by: Joyce Toh <joyce.toh@intel.com>
---
 sound/pci/hda/hda_intel.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 91e71be42fa4..e6997a5bf098 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -370,6 +370,7 @@ enum {
 #define IS_BXT(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x5a98)
 #define IS_CFL(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0xa348)
 #define IS_CNL(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x9dc8)
+#define IS_CML(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x02c8)
 
 static char *driver_short_names[] = {
 	[AZX_DRIVER_ICH] = "HDA Intel",
@@ -1754,7 +1755,7 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 		azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_UC;
 
 	/* Workaround for a communication error on CFL (bko#199007) and CNL */
-	if (IS_CFL(pci) || IS_CNL(pci))
+	if (IS_CFL(pci) || IS_CNL(pci) || IS_CML(pci))
 		azx_bus(chip)->polling_mode = 1;
 
 	if (chip->driver_type == AZX_DRIVER_NVIDIA) {
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
