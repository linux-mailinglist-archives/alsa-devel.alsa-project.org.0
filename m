Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6C46694F5
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 12:03:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01614A733;
	Fri, 13 Jan 2023 12:02:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01614A733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673607829;
	bh=kNTjsqVnMTAp7iXpz8erOyW6Fpz6nYt3juM1BNvcuYA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oVT+1BUcP+To9eKJiuK9aJTfULk1ieTiGXyOrhoXuS7U9Asjb/tKFxoHYjsVDDVyV
	 0DmEsj4N8XB1INRyZ9Q+CdByQVpE4uDIkQ2VhhpA8ORuNRWWV8zph97787cv+uILhh
	 9Uh1Ue6F1k4W0O2fbeRt9bWBFcjNTtPCGGehpIlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58EF2F804D2;
	Fri, 13 Jan 2023 12:02:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6361FF803DC; Fri, 13 Jan 2023 12:02:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7278F8026D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 12:02:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7278F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iTbuZ4uI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673607741; x=1705143741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kNTjsqVnMTAp7iXpz8erOyW6Fpz6nYt3juM1BNvcuYA=;
 b=iTbuZ4uIBaNepq19AVX7ajcHAbdc4VNfXzM6B3cRMFqlf9mSFYItQWwj
 Rvn2Zk860vjDrQFNoJrLZsKTwv5LqPgl3FGl5tJRaOo8gl28NwRqVPc9/
 Qcd2rCo6wQ+2RUC8hzr/uS/tQ3R1Mg0OcQ1L39UP9tew37ht8AQ9SCzP2
 u7vIJGnTErX4d0+HKjRBqNgG6Kh4/me6hkjGzxlyzKLeuTIllo18j2oIZ
 wnsQBteR8Si82WiVIA3jM/KkTy3RuxvoGZ7mksQavQoP2fYb48YPCix/q
 Gpwj3zXd+ADm1eHrgc9v81gAFzRMTTsFTZIIA2DahqwNQ4cXhLCTHMVO3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="325228480"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="325228480"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 03:02:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="832039902"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="832039902"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga005.jf.intel.com with ESMTP; 13 Jan 2023 03:02:14 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] ASoC: Intel: avs: Implement PCI shutdown
Date: Fri, 13 Jan 2023 20:03:08 +0100
Message-Id: <20230113190310.1451693-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113190310.1451693-1-amadeuszx.slawinski@linux.intel.com>
References: <20230113190310.1451693-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?q?Kornel=20Dul=C4=99ba?= <korneld@google.com>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On shutdown reference to i915 driver needs to be released to not spam
logs with unnecessary warnings. While at it do some additional cleanup
to make sure DSP is powered down and interrupts from device are
disabled.

Fixes: 1affc44ea5dd ("ASoC: Intel: avs: PCI driver implementation")
Reported-by: Kornel Dulęba <korneld@google.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/core.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 2ca24273c491..637501850728 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -481,6 +481,29 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	return ret;
 }
 
+static void avs_pci_shutdown(struct pci_dev *pci)
+{
+	struct hdac_bus *bus = pci_get_drvdata(pci);
+	struct avs_dev *adev = hdac_to_avs(bus);
+
+	cancel_work_sync(&adev->probe_work);
+	avs_ipc_block(adev->ipc);
+
+	snd_hdac_stop_streams(bus);
+	avs_dsp_op(adev, int_control, false);
+	snd_hdac_ext_bus_ppcap_int_enable(bus, false);
+	snd_hdac_ext_bus_link_power_down_all(bus);
+
+	snd_hdac_bus_stop_chip(bus);
+	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, false);
+
+	if (avs_platattr_test(adev, CLDMA))
+		pci_free_irq(pci, 0, &code_loader);
+	pci_free_irq(pci, 0, adev);
+	pci_free_irq(pci, 0, bus);
+	pci_free_irq_vectors(pci);
+}
+
 static void avs_pci_remove(struct pci_dev *pci)
 {
 	struct hdac_device *hdev, *save;
@@ -739,6 +762,7 @@ static struct pci_driver avs_pci_driver = {
 	.id_table = avs_ids,
 	.probe = avs_pci_probe,
 	.remove = avs_pci_remove,
+	.shutdown = avs_pci_shutdown,
 	.driver = {
 		.pm = &avs_dev_pm,
 	},
-- 
2.25.1

