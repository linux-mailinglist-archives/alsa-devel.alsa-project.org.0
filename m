Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3526AD5ECE
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 11:25:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DACB1674;
	Mon, 14 Oct 2019 11:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DACB1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571045151;
	bh=4zDOsgpJobvmKiiltC8ltwkWjZxDV9ILpHZ9tbjItk0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CxBtdoF2vXzcqQVtVlTmvNBWjNvvFaLTECx2vaqoQohrR3PVdOKvAzTjGj2bKD65P
	 BXZ77cCsvojJzc7MGNYKayOF+drpXXR5KG/zZQHN3M9b9EgNhYBrEqV7bdct0ofa3U
	 Lg5EgiISQsWCS9lVFRYRnVfI+QmBY2UMXbWGjniw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 140A8F80362;
	Mon, 14 Oct 2019 11:24:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82F4BF80362; Mon, 14 Oct 2019 11:24:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7539FF8011D
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 11:24:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7539FF8011D
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 170999F73C384615EB6A;
 Mon, 14 Oct 2019 17:23:57 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 14 Oct 2019
 17:23:46 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <pierre-louis.bossart@linux.intel.com>,
 <jaska.uimonen@linux.intel.com>, <yuehaibing@huawei.com>,
 <yang.jie@linux.intel.com>, <yung-chuan.liao@linux.intel.com>
Date: Mon, 14 Oct 2019 17:13:08 +0800
Message-ID: <20191014091308.23688-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH -next] ASoC: SOF: Fix randbuild error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When LEDS_TRIGGER_AUDIO is m and SND_SOC_SOF is y,

sound/soc/sof/control.o: In function `snd_sof_switch_put':
control.c:(.text+0x587): undefined reference to `ledtrig_audio_set'
control.c:(.text+0x593): undefined reference to `ledtrig_audio_set'

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 5d43001ae436 ("ASoC: SOF: acpi led support for switch controls")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/sof/control.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 41551e8..2c4abd4 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -36,10 +36,12 @@ static void update_mute_led(struct snd_sof_control *scontrol,
 
 	scontrol->led_ctl.led_value = temp;
 
+#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
 	if (!scontrol->led_ctl.direction)
 		ledtrig_audio_set(LED_AUDIO_MUTE, temp ? LED_OFF : LED_ON);
 	else
 		ledtrig_audio_set(LED_AUDIO_MICMUTE, temp ? LED_OFF : LED_ON);
+#endif
 }
 
 static inline u32 mixer_to_ipc(unsigned int value, u32 *volume_map, int size)
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
