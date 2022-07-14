Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E81B5742CD
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:26:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB46D1816;
	Thu, 14 Jul 2022 06:26:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB46D1816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657772818;
	bh=U3MgG21b5SazhZDFf0lLfuAYMuBp9MqEc7e1BPZoKXY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eAZ8susG4869zRZEbBFatpteaD+t43/ddhjxRx34WanfF3wW72Nr/DN6LZM/ZMeIo
	 uJeK/MC7XaK65LUdWQmlvm9fQdixKttK/NRaKhv7NUlZLtD9GzAdrORVBlJKtV+FjC
	 fQYVY0kmN2yOiT32becJR7BgybfQxhC88v96odXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79A73F805C3;
	Thu, 14 Jul 2022 06:23:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D209F805C0; Thu, 14 Jul 2022 06:23:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E0B4F805B5
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E0B4F805B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="incIr6Yb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 63556B82378;
 Thu, 14 Jul 2022 04:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C398C34114;
 Thu, 14 Jul 2022 04:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772584;
 bh=U3MgG21b5SazhZDFf0lLfuAYMuBp9MqEc7e1BPZoKXY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=incIr6Yb1kuIym+Onkrklx4Szpjn16g6ilN8ivXHMdD2QvOCPshbDhS81FJfPjA8+
 Q3M1AEOcur2TiLx5vX1aeKJEuQRfiRq4yZG1O4DKSM2mzsKRwlO9IkddV0vI9f7j01
 dR4Adp6grI9N/98j9i+5uod+1bMXywG9KpvjdQarTpSjw484MWEy/PbH0nO92GFEH9
 s3o8TvtFd1LaAAYZXzO8AXBP/CglQ/+WYhgzHxsiByJ0FID6S9JVGqTu8wrj0Dv005
 zGNumtGEx8cUsv27Z20yWnQzPDWCnLFhe2nYUM1eMIvYGsNZj2jAj2DVDGmratLICa
 Tcx+z+wQauUYQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 15/41] ASoC: Intel: bytcr_wm5102: Fix GPIO
 related probe-ordering problem
Date: Thu, 14 Jul 2022 00:21:55 -0400
Message-Id: <20220714042221.281187-15-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042221.281187-1-sashal@kernel.org>
References: <20220714042221.281187-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Julia.Lawall@inria.fr,
 cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 akihiko.odaki@gmail.com, peter.ujfalusi@linux.intel.com
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

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 4e07479eab8a044cc9542414ccb4aeb8eb033bde ]

The "wlf,spkvdd-ena" GPIO needed by the bytcr_wm5102 driver
is made available through a gpio-lookup table.

This gpio-lookup table is registered by drivers/mfd/arizona-spi.c, which
may get probed after the bytcr_wm5102 driver.

If the gpio-lookup table has not registered yet then the gpiod_get()
will return -ENOENT. Treat -ENOENT as -EPROBE_DEFER to still keep
things working in this case.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20220612155652.107310-1-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_wm5102.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index 8d8e96e3cd2d..f6d0cef1b28c 100644
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
2.35.1

