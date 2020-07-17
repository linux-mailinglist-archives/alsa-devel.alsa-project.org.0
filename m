Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BA8223535
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 09:11:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B64E1682;
	Fri, 17 Jul 2020 09:10:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B64E1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594969877;
	bh=tJz2dStyk26y6uwVQ1C1gh4gFq3UFiEer5aWhIEyjPQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GY1SuBaguazUsPR4j1WPRF2il3ef4Q6kYqDAPwI8yeDguUAMue+cktl7JRXS+P8g1
	 GO7o5s6cTe8+6vMSwVawSEqY2o8ykFlJbI3ccus+j/1BYpOyfGJS7ZMzMOfhbaBpUm
	 nUSoHms0Hw9UAEdisIukIETceD2ax2OtXS+WYzK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA7B3F80306;
	Fri, 17 Jul 2020 09:05:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40F06F80110; Fri, 17 Jul 2020 04:51:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by alsa1.perex.cz (Postfix) with ESMTP id 15839F801D8
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 04:51:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15839F801D8
Received: from bogon.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf2Y0EhFf7jwAAA--.241S3;
 Fri, 17 Jul 2020 10:51:34 +0800 (CST)
From: Kaige Li <likaige@loongson.cn>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/2] ALSA: hda: Add support for Loongson 7A1000 controller
Date: Fri, 17 Jul 2020 10:51:32 +0800
Message-Id: <1594954292-1703-2-git-send-email-likaige@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1594954292-1703-1-git-send-email-likaige@loongson.cn>
References: <1594954292-1703-1-git-send-email-likaige@loongson.cn>
X-CM-TRANSID: AQAAf9Dxf2Y0EhFf7jwAAA--.241S3
X-Coremail-Antispam: 1UD129KBjvdXoWrZry3Gr4xZF17Xry5WFW3KFg_yoW3Xrb_Kr
 Z3trs7W3yUJr98Cr1Yvwn5ZF4Sk3W8A34rur1IqF45uay3KFWYq34fCrnxCFy7uF18ZFyU
 Zr1qqFyY9ryjgjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbhxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
 0Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
 ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
 8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
 jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4UMxAIw2
 8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
 x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrw
 CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
 42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjQzVUUUUUU==
X-CM-SenderInfo: 5olntxtjh6z05rqj20fqof0/
X-Mailman-Approved-At: Fri, 17 Jul 2020 09:05:03 +0200
Cc: alsa-devel@alsa-project.org, Xuefeng Li <lixuefeng@loongson.cn>,
 linux-kernel@vger.kernel.org, Tiezhu Yang <yangtiezhu@loongson.cn>
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

Add the new PCI ID 0x0014 0x7a07 to support Loongson 7A1000 controller.

Signed-off-by: Kaige Li <likaige@loongson.cn>
---
 sound/pci/hda/hda_intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 1625721..ea1d535 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2735,6 +2735,8 @@ static const struct pci_device_id azx_ids[] = {
 	  .driver_data = AZX_DRIVER_GENERIC | AZX_DCAPS_PRESET_ATI_HDMI },
 	/* Zhaoxin */
 	{ PCI_DEVICE(0x1d17, 0x3288), .driver_data = AZX_DRIVER_ZHAOXIN },
+	/* Loongson */
+	{ PCI_DEVICE(0x0014, 0x7a07), .driver_data = AZX_DRIVER_GENERIC },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, azx_ids);
-- 
2.1.0

