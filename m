Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC4979A876
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 16:02:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6571846;
	Mon, 11 Sep 2023 16:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6571846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694440922;
	bh=p5kZRJPy6becEKGze/E8wQRGvbD8Pps2B78lYscLjgQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HitJLdUFAzifddpHdyb5Sn+tOLQK+tS20hBUg9C8ZEXcuULvVTF5CjAz9P6rcGjRz
	 w8hRgwpwvk6EnN8YX9jzRMkgloiQLZACh07vU62kfcIPafRRtG1g6uPhmZ83qBB14F
	 5U2WrCP9MbDv/rMmPmADMIKxV8mYRjPVqsqvOuGQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB77CF80552; Mon, 11 Sep 2023 16:01:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83648F80246;
	Mon, 11 Sep 2023 16:01:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF986F80425; Mon, 11 Sep 2023 16:01:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE644F8007C
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 16:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE644F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=2gEUxzg3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9294DB815CB;
	Mon, 11 Sep 2023 14:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4DFC433C8;
	Mon, 11 Sep 2023 14:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694440856;
	bh=p5kZRJPy6becEKGze/E8wQRGvbD8Pps2B78lYscLjgQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=2gEUxzg3i7Fv/sYGlRhvZkR9zt580f1oyVwDKsWxzSrTyfJj0/vjZWf7YCA5JE8TA
	 LWSBnCLxbEz+GXYf6rICJgEUi4ZQwCy+ttE8yh9uA1T5WxW3BpjjYDqca8+dp5d8II
	 YUnRC+HFO9qiqXXUoKpdlzzcSKg0HnbvWUr9iI08=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.5 210/739] ASoC: stac9766: fix build errors with REGMAP_AC97
Date: Mon, 11 Sep 2023 15:40:09 +0200
Message-ID: <20230911134657.044890830@linuxfoundation.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230911134650.921299741@linuxfoundation.org>
References: <20230911134650.921299741@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3I2YBDNNXGNFVUV2VBLHSR7YFMK7J2D5
X-Message-ID-Hash: 3I2YBDNNXGNFVUV2VBLHSR7YFMK7J2D5
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3I2YBDNNXGNFVUV2VBLHSR7YFMK7J2D5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

6.5-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit c70064b96f509daa78f57992aeabcf274fb2fed4 ]

Select REGMAP_AC97 to fix these build errors:

ERROR: modpost: "regmap_ac97_default_volatile" [sound/soc/codecs/snd-soc-stac9766.ko] undefined!
ERROR: modpost: "__regmap_init_ac97" [sound/soc/codecs/snd-soc-stac9766.ko] undefined!

Fixes: 6bbf787bb70c ("ASoC: stac9766: Convert to regmap")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org
Link: https://lore.kernel.org/r/20230701044836.18789-1-rdunlap@infradead.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index c2de4ee721836..947473d2da7d2 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1708,6 +1708,7 @@ config SND_SOC_STA529
 config SND_SOC_STAC9766
 	tristate
 	depends on SND_SOC_AC97_BUS
+	select REGMAP_AC97
 
 config SND_SOC_STI_SAS
 	tristate "codec Audio support for STI SAS codec"
-- 
2.40.1



