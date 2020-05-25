Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFFD1E0A93
	for <lists+alsa-devel@lfdr.de>; Mon, 25 May 2020 11:31:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6053A1730;
	Mon, 25 May 2020 11:30:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6053A1730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590399079;
	bh=YsH0IvlpbgP+PbFVSBzx1Ic+yOd8Yoj2pmo6Nls9448=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sZg4x0J86tQuloAK8P3fwCBx8B/pBiHwegjv0f5C5aF6XL8/35zQq+i3e5lvycPnF
	 t0fo66pEMnC1M2UoZplpZP2LVhnVhINvF6XYBvPiI3XtZ+3gPdLOBJLZjRqj3MSzrv
	 NI7LGxe0bOIPMCt6m+KvjHnGMjxmt2+Xj54RTN10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7424F802E2;
	Mon, 25 May 2020 11:25:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F277F8016F; Mon, 25 May 2020 09:07:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
 by alsa1.perex.cz (Postfix) with ESMTP id 6AAF1F8014A
 for <alsa-devel@alsa-project.org>; Mon, 25 May 2020 09:07:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AAF1F8014A
Received: from localhost.localdomain (unknown [222.205.77.158])
 by mail-app4 (Coremail) with SMTP id cS_KCgDXyCyVbsteklsDAA--.9986S4;
 Mon, 25 May 2020 15:07:04 +0800 (CST)
From: Dinghao Liu <dinghao.liu@zju.edu.cn>
To: dinghao.liu@zju.edu.cn,
	kjlu@umn.edu
Subject: [PATCH] ASoC: Intel: sst: Fix runtime PM imbalance in
 sst_power_control
Date: Mon, 25 May 2020 15:06:59 +0800
Message-Id: <20200525070701.3888-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cS_KCgDXyCyVbsteklsDAA--.9986S4
X-Coremail-Antispam: 1UD129KBjvdXoW7XrW7tw4DGF1xXrWkZr43Jrb_yoWfCFc_Kw
 4F9as5Xa95GrWSg34UuF43ZFn5Aa97GryfJF18Kr43AFWYgrZY9w1DXF97ur1fWr48Xr1a
 9wn0gr4ayrW8CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb-8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26rxl6s0DM28EF7xvwVC2z280
 aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07
 x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18
 McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkIecxEwVAF
 wVW8CwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fKr1UJr1l4I8I3I0E4I
 kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
 WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
 0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWr
 Zr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
 1UYxBIdaVFxhVjvjDU0xZFpf9x0JUBpB-UUUUU=
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgEJBlZdtORShQAlsl
X-Mailman-Approved-At: Mon, 25 May 2020 11:25:08 +0200
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
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

When sst_load_fw() returns an error code, a pairing runtime
PM usage counter decrement is needed to keep the counter
balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 sound/soc/intel/atom/sst/sst_drv_interface.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/atom/sst/sst_drv_interface.c b/sound/soc/intel/atom/sst/sst_drv_interface.c
index 762495385d5c..3897985b254f 100644
--- a/sound/soc/intel/atom/sst/sst_drv_interface.c
+++ b/sound/soc/intel/atom/sst/sst_drv_interface.c
@@ -150,6 +150,7 @@ static int sst_power_control(struct device *dev, bool state)
 		if ((ctx->sst_state == SST_RESET) && (usage_count == 1)) {
 			ret = sst_load_fw(ctx);
 			if (ret) {
+				pm_runtime_put_sync(dev);
 				dev_err(dev, "FW download fail %d\n", ret);
 				sst_set_fw_state_locked(ctx, SST_RESET);
 				ret = sst_pm_runtime_put(ctx);
-- 
2.17.1

