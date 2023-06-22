Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFA6739E19
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 12:13:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB2FB82C;
	Thu, 22 Jun 2023 12:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB2FB82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687428797;
	bh=LHQoMIKlPCUVdYDVCU+rYUKAonEIdfte0Fij6zTMRmM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EsUapgzjAQe2yjlvgv4rV2UANz0CwkfB1VgskjUOEpcjKC+B5jAu+mk2RmPErhmNe
	 kGbEv6hz7+FKhg2Co62QJolXJ/Zaj7am4q5CJzDf/FJNcoYfQ+aP/tLvUpml9GY6ic
	 NMXKi/s2RUQd3tELp9H0Vq+qn601oRlXc/S+2zyw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55079F80124; Thu, 22 Jun 2023 12:12:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D343DF80132;
	Thu, 22 Jun 2023 12:12:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6548CF80141; Thu, 22 Jun 2023 12:12:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A932F80124
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 12:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A932F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rxLossX0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A7456179B;
	Thu, 22 Jun 2023 10:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A930C433C8;
	Thu, 22 Jun 2023 10:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687428730;
	bh=LHQoMIKlPCUVdYDVCU+rYUKAonEIdfte0Fij6zTMRmM=;
	h=From:To:Cc:Subject:Date:From;
	b=rxLossX0EbeSaaBeVLTFvPuG7sSp18ayt72v2KAtT/YGRyU4hKHuUo6kbsVZ8B9K4
	 ucwp80MO1u8fUoMOms09Kw8YM3Nd0JMp2MkepNIsN2dckdiiFXY+KJjR+UBES6ExcD
	 zr1njea+km9wev3tF+JjGyjZ12NRw+t9oSKnxJroYrYwaVSE2/hhwJmQiZdRYfBF5b
	 sAORaC1pCfMDuQ2USst8jnSEKu6PkL7ftZRwhfKI/GItuE08mmorW9pSv9mbHtXHFq
	 i+OViyXgiGJjfjQM5sFEUec5ShO+P4IFp9esgUqLT3Avs3dv/aWLkokJXZd+3pMtkW
	 vWHCB7ORroxQw==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shenghao Ding <13916275206@139.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tas2781: fix Kconfig dependencies
Date: Thu, 22 Jun 2023 12:11:23 +0200
Message-Id: <20230622101205.3180938-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EKNSJ6XMHMUHJ4UAK4KJKXCDOKTBZV4E
X-Message-ID-Hash: EKNSJ6XMHMUHJ4UAK4KJKXCDOKTBZV4E
X-MailFrom: arnd@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EKNSJ6XMHMUHJ4UAK4KJKXCDOKTBZV4E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

The new driver has two modules that both get enabled for build testing
when all codecs are selected. The comlib part has an i2c dependency,
so this remains disabled on builds without i2c, but then the other
one fails to link:

ERROR: modpost: "tasdevice_dev_bulk_write" [sound/soc/codecs/snd-soc-tas2781-fmwlib.ko] undefined!
ERROR: modpost: "tasdevice_dev_update_bits" [sound/soc/codecs/snd-soc-tas2781-fmwlib.ko] undefined!
ERROR: modpost: "tasdevice_dev_bulk_read" [sound/soc/codecs/snd-soc-tas2781-fmwlib.ko] undefined!
ERROR: modpost: "tasdevice_dev_read" [sound/soc/codecs/snd-soc-tas2781-fmwlib.ko] undefined!
ERROR: modpost: "tasdevice_dev_write" [sound/soc/codecs/snd-soc-tas2781-fmwlib.ko] undefined!

There are many ways to address this, adding an explicit dependency seems
to be the clearest method that keeps the structure of the driver otherwise
unchanged.

Fixes: ef3bcde75d06d ("ASoC: tas2781: Add tas2781 driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index f481f02a35710..2a62dbd5339e4 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1741,6 +1741,7 @@ config SND_SOC_TAS2781_COMLIB
 	tristate
 
 config SND_SOC_TAS2781_FMWLIB
+	depends on SND_SOC_TAS2781_COMLIB
 	tristate
 	default n
 
-- 
2.39.2

