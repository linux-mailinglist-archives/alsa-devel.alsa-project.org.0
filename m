Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE339547AEA
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Jun 2022 17:58:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B37B1877;
	Sun, 12 Jun 2022 17:57:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B37B1877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655049493;
	bh=dop5ZiO9fC11bdgD63DowIsasFXwGGOicQMICB61gd4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IVf1HVkQrup8KAy61hf4fVSkrI9flnpEYK9mFi8W7js+2dNLfGyeQWV36BOp8lUFa
	 aFX0GLmEYY0hTF6vOC9VGGBj6R9eS+MbKMI5G4AW6U9FJ+W/9ThHjTglOmT96lDCDm
	 xC3Hpz116VoiOIIyYnGgr6GS31C6dxwze8xw38Hc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD5FBF80107;
	Sun, 12 Jun 2022 17:57:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70044F800BD; Sun, 12 Jun 2022 17:57:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5A96F800BD
 for <alsa-devel@alsa-project.org>; Sun, 12 Jun 2022 17:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5A96F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="GgpDT8JB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655049426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=veM1vj4CnQczfcsL6jmmZ+4obqvN014yQcblGfxcC0E=;
 b=GgpDT8JBX2Pm4GdiujPWXrbjqPgTv1h0Q/QruQ+S54f+eoGa5r0lh97FsaeJq21Fa1/0fJ
 GlSziEeN89uni7BGS3Hu044/tiSsckiTJastQKT/57wCezm7kFguZxc9F9a8Qzy2NZOXXG
 T/DsrjacD6JTI+FdfCCF3S/EIN9Rm6s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-RR7F54ciNKWyq_CzASbbBw-1; Sun, 12 Jun 2022 11:57:03 -0400
X-MC-Unique: RR7F54ciNKWyq_CzASbbBw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93242101A56C;
 Sun, 12 Jun 2022 15:57:02 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86EAB456CD5;
 Sun, 12 Jun 2022 15:57:00 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: bytcr_wm5102: Fix GPIO related probe-ordering
 problem
Date: Sun, 12 Jun 2022 17:56:52 +0200
Message-Id: <20220612155652.107310-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

The "wlf,spkvdd-ena" GPIO needed by the bytcr_wm5102 driver
is made available through a gpio-lookup table.

This gpio-lookup table is registered by drivers/mfd/arizona-spi.c, which
may get probed after the bytcr_wm5102 driver.

If the gpio-lookup table has not registered yet then the gpiod_get()
will return -ENOENT. Treat -ENOENT as -EPROBE_DEFER to still keep
things working in this case.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_wm5102.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index 00384c6fbcaa..330c0ace1638 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -421,8 +421,17 @@ static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
 	priv->spkvdd_en_gpio = gpiod_get(codec_dev, "wlf,spkvdd-ena", GPIOD_OUT_LOW);
 	put_device(codec_dev);
 
-	if (IS_ERR(priv->spkvdd_en_gpio))
-		return dev_err_probe(dev, PTR_ERR(priv->spkvdd_en_gpio), "getting spkvdd-GPIO\n");
+	if (IS_ERR(priv->spkvdd_en_gpio)) {
+		ret = PTR_ERR(priv->spkvdd_en_gpio);
+		/*
+		 * The spkvdd gpio-lookup is registered by: drivers/mfd/arizona-spi.c,
+		 * so -ENOENT means that arizona-spi hasn't probed yet.
+		 */
+		if (ret == -ENOENT)
+			ret = -EPROBE_DEFER;
+
+		return dev_err_probe(dev, ret, "getting spkvdd-GPIO\n");
+	}
 
 	/* override platform name, if required */
 	byt_wm5102_card.dev = dev;
-- 
2.36.0

