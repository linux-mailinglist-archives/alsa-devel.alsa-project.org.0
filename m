Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 215E189AF2C
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:25:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A218D2BCE;
	Sun,  7 Apr 2024 09:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A218D2BCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474700;
	bh=jp/ItmKjNW3lwD3HqdoO06DYpz1adMSLKDyVPElM/+g=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pJgWTkyHviu88FiOjAo09n4fomiPaTet3zTnCYtR1wVNmi/m7LXhZ209MJ77bWBhH
	 dd/fWA8kxrw8p5Z/928kh0x2U9CZKKswwJpwKRlCS4ew945ST4lHa3OT2kHvSuP7p2
	 lXq/V2Dh4Vc/CeKsIqC1OCgACe2pYY1q1OA2zDeM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 608FFF80600; Sun,  7 Apr 2024 09:18:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D0C9F897B6;
	Sun,  7 Apr 2024 09:18:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA737F8020D; Fri,  5 Apr 2024 19:12:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55923F80007
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 19:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55923F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ispras.ru header.i=@ispras.ru header.a=rsa-sha256
 header.s=default header.b=eVDQ7fDg
Received: from tundra.lovozera (unknown [178.176.73.54])
	by mail.ispras.ru (Postfix) with ESMTPSA id 33E7440737DC;
	Fri,  5 Apr 2024 17:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 33E7440737DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1712337118;
	bh=zxli1M6t4+mmVUuqsEAwsb92XAAipwuHZ0h0RJ1Q04E=;
	h=From:To:Cc:Subject:Date:From;
	b=eVDQ7fDg7MTjYAXLcnt/MpMf1pjj9763Prk9QR8SbfcHQDleljuaSVRU5eRdI3Ldu
	 AHjNVIpvKJBaE2WOH9fFa900b5O5CoF32/I3cC7gHHTpsiUqS3zdGC95FFvSDvg48M
	 MdE2Sds5BvS+ruCEmn7RDKwFLXyUbUYCKXi3FGrc=
From: Mikhail Kobuk <m.kobuk@ispras.ru>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Mikhail Kobuk <m.kobuk@ispras.ru>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
	Venkata Prasad Potturu <quic_potturu@quicinc.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: qcom: Fix out of bounds access
Date: Fri,  5 Apr 2024 20:11:47 +0300
Message-ID: <20240405171148.12665-1-m.kobuk@ispras.ru>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: m.kobuk@ispras.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GQMQHTUNETEYNJXINRQI3PSFNSOV4YLF
X-Message-ID-Hash: GQMQHTUNETEYNJXINRQI3PSFNSOV4YLF
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:15:59 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GQMQHTUNETEYNJXINRQI3PSFNSOV4YLF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Case values introduced in commit
5f78e1fb7a3e ("ASoC: qcom: Add driver support for audioreach solution")
cause out of bounds access in arrays of sc7280 driver data (e.g. in case
of RX_CODEC_DMA_RX_0 in sc7280_snd_hw_params()).

Redefine LPASS_MAX_PORTS to consider the maximum possible port id for
q6dsp as sc7280 driver utilizes some of those values.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 77d0ffef793d ("ASoC: qcom: Add macro for lpass DAI id's max limit")
Cc: <stable@vger.kernel.org>
Signed-off-by: Mikhail Kobuk <m.kobuk@ispras.ru>
---
 sound/soc/qcom/lpass.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 27a2bf9a6613..10a507c95312 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -13,10 +13,11 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <dt-bindings/sound/qcom,lpass.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "lpass-hdmi.h"
 
 #define LPASS_AHBIX_CLOCK_FREQUENCY		131072000
-#define LPASS_MAX_PORTS			(LPASS_CDC_DMA_VA_TX8 + 1)
+#define LPASS_MAX_PORTS			(QUINARY_MI2S_TX + 1)
 #define LPASS_MAX_MI2S_PORTS			(8)
 #define LPASS_MAX_DMA_CHANNELS			(8)
 #define LPASS_MAX_HDMI_DMA_CHANNELS		(4)
-- 
2.44.0

