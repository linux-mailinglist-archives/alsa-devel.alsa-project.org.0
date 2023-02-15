Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6090469794D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 10:49:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31FFD20F;
	Wed, 15 Feb 2023 10:48:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31FFD20F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676454560;
	bh=mvxOqqapfj6uQfFYJy5MPiAdOHRW9+w+Kgp5tU5Vt24=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=az/A8DAmlm3oEiNwpitfWCzjWMKbJ8iRwI/kTtubnHaEJMFLc2CwPdi85ytRP+A6k
	 OnrqRIVg9FxFUYB+yXq6dqfhuYN7ElDW26za7Z22wm6z6U/UwmWdEodIoykQR7qxoE
	 ascUUUZMcoeHZ8fRvF262828ZojFD9n4KlpcVoqA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68B2AF801C0;
	Wed, 15 Feb 2023 10:48:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB7E2F8047C; Wed, 15 Feb 2023 10:47:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 696A7F800E4
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 10:47:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 696A7F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=UOa9ju30
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ABC386602180;
	Wed, 15 Feb 2023 09:47:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676454425;
	bh=mvxOqqapfj6uQfFYJy5MPiAdOHRW9+w+Kgp5tU5Vt24=;
	h=From:To:Cc:Subject:Date:From;
	b=UOa9ju30eQ5z3xqrvJFXf1I1B4IMdDPpow22dPQQOM9k+1NeZjxer6UzxHum8E2Ci
	 6PgpYOGZjLKH32bmBJPvmM4QVB2Rqno0aF6kcjDJ5vAZ8I2lOwka5kVJxStSkyP2ij
	 fCIVH++sMw+0/7XhYM2sC6qMR3lRSBECK0l3E8OgEqmcE++cgX8d3PKBoVNZ8AcV0B
	 V/JthwmaDpeDbHZe602dGOq6rljDeKi9B7YCNFNfT1NuGWh2z0YnDlK+P0aNxO5Gom
	 jibmBynjTl7+cRbRySmQRrGdiXeGit6aRbS1dH0e8MOBcjH0taK9RO6g1B5Lf8SkID
	 wbEZLkFI7ILlA==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH] ASoC: soc-dapm.h: fixup warning struct snd_pcm_substream not
 declared
Date: Wed, 15 Feb 2023 09:46:43 +0000
Message-Id: <20230215094643.823156-1-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QHCWSFOEZKR2CBK7OSFM446MODOGNHGB
X-Message-ID-Hash: QHCWSFOEZKR2CBK7OSFM446MODOGNHGB
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Lucas Tanure <lucas.tanure@collabora.com>, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QHCWSFOEZKR2CBK7OSFM446MODOGNHGB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add sound/pcm.h header to include struct snd_pcm_substream used in
snd_soc_dapm_update_dai function.

Fixes: 078a85f2806f ("ASoC: dapm: Only power up active channels from a DAI")
Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
---
 include/sound/soc-dapm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 77495e5988c1..8fbb50a11d80 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -14,6 +14,7 @@
 #include <sound/control.h>
 #include <sound/soc-topology.h>
 #include <sound/asoc.h>
+#include <sound/pcm.h>
 
 struct device;
 struct snd_soc_pcm_runtime;
-- 
2.39.1

