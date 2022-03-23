Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F1C4E4F04
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 10:14:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B5641746;
	Wed, 23 Mar 2022 10:13:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B5641746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648026857;
	bh=i2KOOwGkPefud8uEjfSEW99awEvXTTup/pS8oavJJcE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RG3RJQ83fug/ICxLb1W/KU/YLiBAzqD6i6Y/iSzdqTMvKvB3cJJWSFq0nFQ3cRUfD
	 gzYTyOZsFNBpdDuIv18yJOuQONv/tF3PDW/MD/ee9aqi/OzUuS77Vql8RX+cQoxaQo
	 KOqhZxjoSjeTUlz6+GNuc0BmaN9Dfqn55xrJXLN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A306EF800C1;
	Wed, 23 Mar 2022 10:12:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34F1FF802DB; Wed, 23 Mar 2022 10:10:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AC47F800AA;
 Wed, 23 Mar 2022 10:10:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AC47F800AA
Received: from kwepemi500015.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4KNjBj2pW5zBrft;
 Wed, 23 Mar 2022 17:06:05 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemi500015.china.huawei.com
 (7.221.188.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Wed, 23 Mar
 2022 17:10:00 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <pierre-louis.bossart@linux.intel.com>, <lgirdwood@gmail.com>,
 <ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
 <daniel.baluta@nxp.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <peter.ujfalusi@linux.intel.com>,
 <sound-open-firmware@alsa-project.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] ASoC: SOF: Intel: Fix build error without
 SND_SOC_SOF_PCI_DEV
Date: Wed, 23 Mar 2022 17:25:01 +0800
Message-ID: <20220323092501.145879-1-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500015.china.huawei.com (7.221.188.92)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 23 Mar 2022 10:12:33 +0100
Cc: tangyizhou@huawei.com, limingming.li@huawei.com
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

If SND_SOC_SOF_PCI_DEV is n, bulding fails:

sound/soc/sof/intel/pci-tng.o:(.data+0x1c0): undefined reference to `sof_pci_probe'
sound/soc/sof/intel/pci-tng.o:(.data+0x1c8): undefined reference to `sof_pci_remove'
sound/soc/sof/intel/pci-tng.o:(.data+0x1e0): undefined reference to `sof_pci_shutdown'
sound/soc/sof/intel/pci-tng.o:(.data+0x290): undefined reference to `sof_pci_pm'

Make SND_SOC_SOF_MERRIFIELD select SND_SOC_SOF_PCI_DEV to fix this.

Fixes: 8d4ba1be3d22 ("ASoC: SOF: pci: split PCI into different drivers")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 sound/soc/sof/intel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index b53f216d4ecc..172419392b33 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -84,6 +84,7 @@ if SND_SOC_SOF_PCI
 config SND_SOC_SOF_MERRIFIELD
 	tristate "SOF support for Tangier/Merrifield"
 	default SND_SOC_SOF_PCI
+	select SND_SOC_SOF_PCI_DEV
 	select SND_SOC_SOF_INTEL_ATOM_HIFI_EP
 	help
 	  This adds support for Sound Open Firmware for Intel(R) platforms
--
2.31.1

