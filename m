Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 387652F4EB5
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 16:32:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7E72172F;
	Wed, 13 Jan 2021 16:31:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7E72172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610551921;
	bh=va7HwhRMxGVoMRw3bUAdYWwRxGS2kQzCEz6CNFlgqdQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jMMMOo1oOybF3aMxQTCjVu9n2CpwgXuh7qvkxHovOF/oRwcqcC/Fxe8/4EWOby8bQ
	 /891RWH1ILWg7HRX/qUrmTst/mBGPXbp07o2CqEZZPogfuU1JzUMCIAO76TL1sb348
	 KP1R7a+RC6YDofVX1GA4xFyIw/xxxrap/ghnaSgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42063F804D2;
	Wed, 13 Jan 2021 16:29:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55CE4F804A9; Wed, 13 Jan 2021 16:29:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F0DCF801ED
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 16:29:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F0DCF801ED
IronPort-SDR: dlAlSyFSRkGViG8A7vCSI5oFwpsG8gRa8ePNDO6bzkcsWS6I5V2J3vTwWGzJQcf0Q4bGrmntJu
 rHyiF9XFi2Uw==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="175640170"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="175640170"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 07:29:29 -0800
IronPort-SDR: PdfcH+w+gzkzyMcmgPFMR4AldD7wwIMKxpOTBv2ewII5fwwFIMZMqVXpw++PdPFXRpkL+mBAKa
 53H77N0U1BMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="569445152"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 13 Jan 2021 07:29:27 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/4] ASoC: SOF: sof-pci-dev: add .shutdown() callback
Date: Wed, 13 Jan 2021 17:26:16 +0200
Message-Id: <20210113152617.4048541-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113152617.4048541-1-kai.vehmanen@linux.intel.com>
References: <20210113152617.4048541-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, Keyon Jie <yang.jie@linux.intel.com>,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
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

From: Keyon Jie <yang.jie@linux.intel.com>

Add the .shutdown() callback to the sof-pci-dev driver, to help to
handle shutting down specific tasks for SOF PCI platforms.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-pci-dev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 63b989e3ec40..5f53c3e76e6f 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -450,6 +450,11 @@ static void sof_pci_remove(struct pci_dev *pci)
 	pci_release_regions(pci);
 }
 
+static void sof_pci_shutdown(struct pci_dev *pci)
+{
+	snd_sof_device_shutdown(&pci->dev);
+}
+
 /* PCI IDs */
 static const struct pci_device_id sof_pci_ids[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_MERRIFIELD)
@@ -523,6 +528,7 @@ static struct pci_driver snd_sof_pci_driver = {
 	.id_table = sof_pci_ids,
 	.probe = sof_pci_probe,
 	.remove = sof_pci_remove,
+	.shutdown = sof_pci_shutdown,
 	.driver = {
 		.pm = &sof_pci_pm,
 	},
-- 
2.29.2

