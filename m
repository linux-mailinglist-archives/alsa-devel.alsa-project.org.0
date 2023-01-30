Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9853D680D08
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 13:09:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32459EAC;
	Mon, 30 Jan 2023 13:08:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32459EAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675080540;
	bh=rU46NQL4hbbHQR9L/65OOymuaCyWdxogbhBIy2BOVDA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nw0MDFJ1HTyrdzi0CrT/RSgtOEHZw8VHb6DCzGhDLkZkVWRu7qzcCLvM35eGPw1a/
	 onadciJLJCITOelGkoJclRv0DBdusnyGdBYsXUWwMztc758B3mXOWYUHVxbhGjZNZ8
	 GCJzuNh/moPjnxvOMJNQ3sYReiINIqLdi4leSjrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95EFBF80494;
	Mon, 30 Jan 2023 13:07:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E908F80494; Mon, 30 Jan 2023 13:07:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0418AF80236
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 13:07:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0418AF80236
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=ad8rE9hx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1675080453; x=1706616453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rU46NQL4hbbHQR9L/65OOymuaCyWdxogbhBIy2BOVDA=;
 b=ad8rE9hx1zTTIZNrTtFrcu8uP/60ISLuoEFS+/OwUWfS3rR47s17GwtP
 +fOJLSTa25I02noCI9sn+iNJN9pLrPwN8M+bWcYA9FQL5ebhDuJnNUtYA
 huNdEVHflr9V4B9HZJNH2UEK58cHLZQLNlYHuwQBzXfxY8RlkB467RBZ2
 +JO7w9n0+GjCQ+L0+EhvBC7hp7xzybTAgEGZ5GD4gFhOlGuPG80vbg6DL
 i/UXgHMqtwFL27N/X4vxkt2wd0HbExnvPymc+K7V0iBltIhvNUsnQWGBX
 rHMAFgYT3DyW/jXNMwzN2pX4AqWih2Y9JMhXvcrOM4B03h6ejNHlmDp0N A==;
X-IronPort-AV: E=Sophos;i="5.97,257,1669100400"; d="scan'208";a="197975239"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Jan 2023 05:07:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 05:07:28 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 30 Jan 2023 05:07:24 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/8] ASoC: mchp-spdifrx: fix return value in case completion
 times out
Date: Mon, 30 Jan 2023 14:06:41 +0200
Message-ID: <20230130120647.638049-3-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130120647.638049-1-claudiu.beznea@microchip.com>
References: <20230130120647.638049-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

wait_for_completion_interruptible_timeout() returns 0 in case of
timeout. Check this into account when returning from function.

Fixes: ef265c55c1ac ("ASoC: mchp-spdifrx: add driver for SPDIF RX")
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 2d86e0ec930f..7f359371b31b 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -524,9 +524,10 @@ static int mchp_spdifrx_cs_get(struct mchp_spdifrx_dev *dev,
 	ret = wait_for_completion_interruptible_timeout(&ch_stat->done,
 							msecs_to_jiffies(100));
 	/* IP might not be started or valid stream might not be present */
-	if (ret < 0) {
+	if (ret <= 0) {
 		dev_dbg(dev->dev, "channel status for channel %d timeout\n",
 			channel);
+		return ret ? : -ETIMEDOUT;
 	}
 
 	memcpy(uvalue->value.iec958.status, ch_stat->data,
@@ -580,7 +581,7 @@ static int mchp_spdifrx_subcode_ch_get(struct mchp_spdifrx_dev *dev,
 		dev_dbg(dev->dev, "user data for channel %d timeout\n",
 			channel);
 		mchp_spdifrx_isr_blockend_dis(dev);
-		return ret;
+		return ret ? : -ETIMEDOUT;
 	}
 
 	spin_lock_irqsave(&user_data->lock, flags);
-- 
2.34.1

