Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF7E245697
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Aug 2020 09:54:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1FC7166F;
	Sun, 16 Aug 2020 09:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1FC7166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597564462;
	bh=ELAIzMTXYv0qdgG/tta+RU4VKlrwfgcw9W5UpPBzA0o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LFRKQMX48yFBeN5YrOhEEdbfIyHIjY9doNcgtwjvLRffLoEM6p9byX6EYfLZ94WEw
	 TVR7WjJfibZ5VniJ1SJlDlxtXPS/dqzP4JZu4W/TnhMUrzj1ymKfyM950+7JfF3jgH
	 N17tIC2UZ0GAr2qAobKEOk5L7O6BaiOf+zq2VtT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2756CF80273;
	Sun, 16 Aug 2020 09:52:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 855D5F8015B; Thu, 13 Aug 2020 08:13:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by alsa1.perex.cz (Postfix) with ESMTP id 0EBAEF80100
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 08:12:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EBAEF80100
Received: from bogon.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb93V2TRfUU0IAA--.16S2;
 Thu, 13 Aug 2020 14:12:37 +0800 (CST)
From: Youling Tang <tangyouling@loongson.cn>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] sound/soc/intel: Fix spelling mistake "cant" --> "can't"
Date: Thu, 13 Aug 2020 14:12:37 +0800
Message-Id: <1597299157-32221-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxb93V2TRfUU0IAA--.16S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFWxtF1fGF48uF4ftw1xAFb_yoW8uw4kpa
 18GayDKFWqgF4ruFyUtw47WF10yws5Jw47Gr4aka4xJF1DJr4rCwnrtw1j9FWF9rZ3ua9x
 Za17Za48Ar1rWFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_GF1l42xK
 82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
 C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
 MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
 IF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
 z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8N18PUUUUU==
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Mailman-Approved-At: Sun, 16 Aug 2020 09:52:38 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

There is some spelling mistakes in a dev_err message. Fix it.

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 sound/soc/intel/common/sst-firmware.c     | 4 ++--
 sound/soc/intel/haswell/sst-haswell-ipc.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/common/sst-firmware.c b/sound/soc/intel/common/sst-firmware.c
index 0594f89..1189ec3 100644
--- a/sound/soc/intel/common/sst-firmware.c
+++ b/sound/soc/intel/common/sst-firmware.c
@@ -130,7 +130,7 @@ static void block_list_remove(struct sst_dsp *dsp,
 			err = block->ops->disable(block);
 			if (err < 0)
 				dev_err(dsp->dev,
-					"error: cant disable block %d:%d\n",
+					"error: can't disable block %d:%d\n",
 					block->type, block->index);
 		}
 	}
@@ -158,7 +158,7 @@ static int block_list_prepare(struct sst_dsp *dsp,
 			ret = block->ops->enable(block);
 			if (ret < 0) {
 				dev_err(dsp->dev,
-					"error: cant disable block %d:%d\n",
+					"error: can't disable block %d:%d\n",
 					block->type, block->index);
 				goto err;
 			}
diff --git a/sound/soc/intel/haswell/sst-haswell-ipc.c b/sound/soc/intel/haswell/sst-haswell-ipc.c
index 0ff89ea..773688b 100644
--- a/sound/soc/intel/haswell/sst-haswell-ipc.c
+++ b/sound/soc/intel/haswell/sst-haswell-ipc.c
@@ -1507,7 +1507,7 @@ static int sst_hsw_dx_state_dump(struct sst_hsw *hsw)
 
 	ret = sst_dsp_dma_get_channel(sst, 0);
 	if (ret < 0) {
-		dev_err(hsw->dev, "error: cant allocate dma channel %d\n", ret);
+		dev_err(hsw->dev, "error: can't allocate dma channel %d\n", ret);
 		return ret;
 	}
 
@@ -1587,7 +1587,7 @@ int sst_hsw_dsp_load(struct sst_hsw *hsw)
 
 	ret = sst_dsp_dma_get_channel(dsp, 0);
 	if (ret < 0) {
-		dev_err(hsw->dev, "error: cant allocate dma channel %d\n", ret);
+		dev_err(hsw->dev, "error: can't allocate dma channel %d\n", ret);
 		return ret;
 	}
 
@@ -1616,7 +1616,7 @@ static int sst_hsw_dsp_restore(struct sst_hsw *hsw)
 
 	ret = sst_dsp_dma_get_channel(dsp, 0);
 	if (ret < 0) {
-		dev_err(hsw->dev, "error: cant allocate dma channel %d\n", ret);
+		dev_err(hsw->dev, "error: can't allocate dma channel %d\n", ret);
 		return ret;
 	}
 
-- 
2.1.0

