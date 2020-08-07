Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D76F623E795
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 09:14:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74E7415F9;
	Fri,  7 Aug 2020 09:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74E7415F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596784493;
	bh=RdvMiUCKF4djFC+UEiFcwjCT5iQydTS7NWGjg6dmw4Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gs3Jk2YO2zyCytFeXr89IOyM66nQWX9EqxP2vnlFZMKpFi+mV+WuOM4bnF9S5sPD9
	 Xr1uXMhMrFaNAXLW/2ZR98OR7NJHtrVrUnBqFh9K1tvmRKeDOgjlI5r1lfuPSToPxu
	 d+tYegmWLBRw3xgF6RhBKRAyOMIwhiwbGMtPHYKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98DC3F801F7;
	Fri,  7 Aug 2020 09:13:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AC0EF80218; Fri,  7 Aug 2020 09:13:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
 by alsa1.perex.cz (Postfix) with ESMTP id 7A127F801F7
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 09:12:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A127F801F7
Received: from localhost.localdomain (unknown [210.32.144.186])
 by mail-app4 (Coremail) with SMTP id cS_KCgBXznnl_ixfYKOuAA--.36381S4;
 Fri, 07 Aug 2020 15:12:41 +0800 (CST)
From: Dinghao Liu <dinghao.liu@zju.edu.cn>
To: dinghao.liu@zju.edu.cn,
	kjlu@umn.edu
Subject: [PATCH] ALSA: usb-audio: Fix memleak in scarlett2_add_new_ctl
Date: Fri,  7 Aug 2020 15:12:27 +0800
Message-Id: <20200807071229.9533-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cS_KCgBXznnl_ixfYKOuAA--.36381S4
X-Coremail-Antispam: 1UD129KBjvdXoW7GrWUXr43WrW8ZFW7Xr18Zrb_yoWftwc_Wa
 1rXw1kuF1UG3sIyr1UCr1fArn0y3WfA3WFyFsrKa97ZFyjy3yrtryxXr93Cr1IkFs5Kr1D
 Crn7ZFyakryIvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbxkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26rxl6s0DM28EF7xvwVC2z280
 aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07
 x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18
 McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCF
 04k20xvE74AGY7Cv6cx26r4fKr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
 xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1D
 MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
 0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v2
 6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
 hiSPUUUUU==
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgECBlZdtPbBHgACsT
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 "Geoffrey D. Bennett" <g@b4.vu>, Takashi Iwai <tiwai@suse.com>
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

When snd_usb_mixer_add_control() fails, elem needs to be
freed just like when snd_ctl_new1() fails. However, current
code is returning directly and ends up leaking memory.

Fixes: 9e4d5c1be21f0 ("ALSA: usb-audio: Scarlett Gen 2 mixer interface")
Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 sound/usb/mixer_scarlett_gen2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 74c00c905d24..4b2da0866cdc 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -964,8 +964,10 @@ static int scarlett2_add_new_ctl(struct usb_mixer_interface *mixer,
 	strlcpy(kctl->id.name, name, sizeof(kctl->id.name));
 
 	err = snd_usb_mixer_add_control(&elem->head, kctl);
-	if (err < 0)
+	if (err < 0) {
+		kfree(elem);
 		return err;
+	}
 
 	if (kctl_return)
 		*kctl_return = kctl;
-- 
2.17.1

