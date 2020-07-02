Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9372117CA
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 03:26:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D8621680;
	Thu,  2 Jul 2020 03:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D8621680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593653180;
	bh=K+8DiW78hpyxOFxK1fhgrYHAc5PufAYISdcBtUkSMz0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bjgb8ea7DtvHwvxQgBw9uUZqw7RTpwsMoQusnq4c5nAn87BA+GvHFXGDXQJ6ow59H
	 oyL0e1/o6MQW1IUxUjEM9isxi5bjLPa4DPhx1+xB5pGeclCi7wcEwH2oiueKj62XFp
	 2vxocx3XKuIRTKIkdqYua8ijOLLW967F9iYwY8ws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 249CEF802C2;
	Thu,  2 Jul 2020 03:23:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D09AF80134; Thu,  2 Jul 2020 03:23:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9983F80134;
 Thu,  2 Jul 2020 03:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9983F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eXGtN+Y/"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C4CF2083E;
 Thu,  2 Jul 2020 01:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593652993;
 bh=K+8DiW78hpyxOFxK1fhgrYHAc5PufAYISdcBtUkSMz0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eXGtN+Y/1XL9y2YWtxkFE1kgTvZizbzWIrmhtUhjVsFWz5sPcTAnagZUOly31VS8b
 636G61Jbu0KVWqonYma6mdQGtno1n+wNOYjMYeDNyWnh9q3/MitLENFVRMjPIa7Rr5
 SiA73IsqC2dVbJIOcO3dywJJUYde/5sGJ7uRWQro=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 15/53] ASoC: SOF: Intel: add PCI IDs for ICL-H and
 TGL-H
Date: Wed,  1 Jul 2020 21:21:24 -0400
Message-Id: <20200702012202.2700645-15-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702012202.2700645-1-sashal@kernel.org>
References: <20200702012202.2700645-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, sound-open-firmware@alsa-project.org
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit c8d2e2bfaeffa0f914330e8b4e45b986c8d30b58 ]

Usually the DSP is not traditionally enabled on H skews but this might
be used moving forward.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20200617164755.18104-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/sof-pci-dev.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 7b1846aeadd59..3a71f813fb563 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -411,8 +411,11 @@ static const struct pci_device_id sof_pci_ids[] = {
 		.driver_data = (unsigned long)&cfl_desc},
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
-	{ PCI_DEVICE(0x8086, 0x34C8),
+	{ PCI_DEVICE(0x8086, 0x34C8), /* ICL-LP */
 		.driver_data = (unsigned long)&icl_desc},
+	{ PCI_DEVICE(0x8086, 0x3dc8), /* ICL-H */
+		.driver_data = (unsigned long)&icl_desc},
+
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_JASPERLAKE)
 	{ PCI_DEVICE(0x8086, 0x38c8),
@@ -431,8 +434,11 @@ static const struct pci_device_id sof_pci_ids[] = {
 		.driver_data = (unsigned long)&cml_desc},
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
-	{ PCI_DEVICE(0x8086, 0xa0c8),
+	{ PCI_DEVICE(0x8086, 0xa0c8), /* TGL-LP */
 		.driver_data = (unsigned long)&tgl_desc},
+	{ PCI_DEVICE(0x8086, 0x43c8), /* TGL-H */
+		.driver_data = (unsigned long)&tgl_desc},
+
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ELKHARTLAKE)
 	{ PCI_DEVICE(0x8086, 0x4b55),
-- 
2.25.1

