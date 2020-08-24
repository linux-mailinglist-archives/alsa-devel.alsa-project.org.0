Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E23172509DB
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Aug 2020 22:15:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B64D1661;
	Mon, 24 Aug 2020 22:14:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B64D1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598300116;
	bh=0EURdX+W4MgJZeeyO+/lryU4U6hhr6HW/T6Hxr1nVwg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EsLUv4Y/6Yx4EOYGzprtI8YArCaQYOZMTZfIT+RYab4GlUxtIKZ+7YgdmcyDuXax2
	 SfjVKXfyB4nocborafu40F4SVcRTPoqKFYAw3miSKWZpll5aSytDRiYoIlbwrYdWlj
	 sno7MPTM78E7Uq0EAMpqGdl6b67tehweB9LOxWUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 983BFF80304;
	Mon, 24 Aug 2020 22:09:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AA7AF802E7; Mon, 24 Aug 2020 22:09:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C8C6F800EB
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 22:09:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C8C6F800EB
IronPort-SDR: Q/7UtXhJKVJzXq46/zxyb9wQjTXsy765+0YT5yGog3XETjeMYJsSvm6BneQk7YV8evm7YIMZIG
 stJmA9UeYplg==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="157033735"
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; d="scan'208";a="157033735"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 13:09:27 -0700
IronPort-SDR: k7BvBxzUrmIJ0JctJ985A1OqmxS35bzbKwMBhFRb36HPq4wDSE9tgzB9yr+vhkc3i2qv7EBR2j
 snIKSy8PpU5Q==
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; d="scan'208";a="443351209"
Received: from dentoneb-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.223.13])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 13:09:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/8] ASoC: SOF: Intel: add dev_dbg log when driver is not
 selected
Date: Mon, 24 Aug 2020 15:09:11 -0500
Message-Id: <20200824200912.46852-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200824200912.46852-1-pierre-louis.bossart@linux.intel.com>
References: <20200824200912.46852-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
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

Mirror change suggested in legacy HDaudio driver.

On SKL+ Intel platforms, the driver selection is handled by the
snd_intel_dspcfg, and when the HDaudio legacy driver is not selected,
be it with the auto-selection or user preferences with a kernel
parameter, the probe aborts with no logs, only a -ENODEV return value.

Having no dmesg trace, even with dynamic debug enabled, makes support
more complicated than it needs to be, and even experienced users can
be fooled. A simple dev_dbg() trace solves this problem.

BugLink: https://github.com/thesofproject/linux/issues/2330
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-pci-dev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index f3a8140773db..7b85c88cba9c 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -302,10 +302,10 @@ static int sof_pci_probe(struct pci_dev *pci,
 	int ret;
 
 	ret = snd_intel_dsp_driver_probe(pci);
-	if (ret != SND_INTEL_DSP_DRIVER_ANY &&
-	    ret != SND_INTEL_DSP_DRIVER_SOF)
+	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SOF) {
+		dev_dbg(&pci->dev, "SOF PCI driver not selected, aborting probe\n");
 		return -ENODEV;
-
+	}
 	dev_dbg(&pci->dev, "PCI DSP detected");
 
 	/* get ops for platform */
-- 
2.25.1

