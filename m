Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 399B766B8A5
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 09:02:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 318A75175;
	Mon, 16 Jan 2023 09:02:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 318A75175
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673856171;
	bh=DGx1o7uaxjw5WhwId+Jv4OCPunpFr4t6sp2jnAeAR0w=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lMooHDq82hKajWfh65cNvmzXpGJ5EcfhODx8RKt3cxnF8s4GEmmBboTprlpM8SQoW
	 UsHfy2efKAyRG2jpvdVLDPgH3KYFTzK5V9KQxv+JEcRo2A08e020eI9Qs7CtiGklCt
	 A/Dc3vOif9enGUlEKG/51XmYJ8SngOtrFfa+LpK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CA40F8053D;
	Mon, 16 Jan 2023 09:01:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C09FDF804A9; Sun, 15 Jan 2023 20:34:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F127DF804A9
 for <alsa-devel@alsa-project.org>; Sun, 15 Jan 2023 20:33:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F127DF804A9
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=shruggie-ro.20210112.gappssmtp.com
 header.i=@shruggie-ro.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=DtCiw1NH
Received: by mail-wm1-x332.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so17432867wma.1
 for <alsa-devel@alsa-project.org>; Sun, 15 Jan 2023 11:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RdGFTu0+gJFSj/8XHnsdu0rCr80zWB94xuGGcTk9DzY=;
 b=DtCiw1NHdmxQJIKbNUF2jDVAWvfkmHVzLqaptp/gtjyxyu/dzl5DdqtuT3R1yujcTi
 /mQcyqha7oePumtCuXYD6K5nOfJTt6MF48LnehoK1vwZ93MDTIaiPUp4BKrD+VQ31ylw
 a0EaD9+IzbL+UaITbsyx0ZwMgAgX9ZFAZ7qotmaLdDhMuiynHt449qaoYlVNST3VNGri
 7oOW234OO8mzIRU067JlAGHu0HGoNSllC+yw3Yi8nM+JcqY692mi6e++5uWC7MazkrZg
 LSu4V+WFRnbRuFLetB1GUYYxBztnl5Sw9RRoGhpZVUjaM2u3tZPBuhgi+z8dlojcc9vH
 X7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RdGFTu0+gJFSj/8XHnsdu0rCr80zWB94xuGGcTk9DzY=;
 b=f3kaDMkZRSa+oIYanu081MaIH8plOs/zNtaEHA1DQkvou7f8UVM15shHm9ZAd4mDor
 H/Ctum0rPYLM8+VrQcbeA3XomxuqzD36LNU1pHvNhTTZCv27IpaLb6SFTMF0XJ9bChpB
 tmz8MY11mv8DaDHzdvJVHMO0LfGUurByzOV9vHumJrODA47LI8Bs09SLhyP1vmWvlLj/
 kTdEGT71azjceLJ8TILZovurXY/QXbUXkQ3/iaqziSQfq/RpcaFQkgmIdtB8KL/TTAxo
 ksBTcm7jj9LlkVekDcRmU2vpmLJNTE85opv1sqxA2kKLzor49Pm/vYpE9mb+2Q5WkLzK
 801A==
X-Gm-Message-State: AFqh2ko3WriNUfjiVQQttWn4wD12/q74BXmX6qZMev2coetP1VP1E3en
 IgXIkokCgWrUGYeLfwk/tBCD2w==
X-Google-Smtp-Source: AMrXdXsf88QsrQS+bBRWF2ObE/qOTjRiOO+AcdGPX3HSkOUKTGIfncKFoLGDXZgmrn68DeJPlx/PeQ==
X-Received: by 2002:a05:600c:348b:b0:3d2:2a72:2577 with SMTP id
 a11-20020a05600c348b00b003d22a722577mr63486573wmq.27.1673811237183; 
 Sun, 15 Jan 2023 11:33:57 -0800 (PST)
Received: from neptune.hotspot.internet-for-guests.com
 (ip-078-094-237-238.um19.pools.vodafone-ip.de. [78.94.237.238])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a7bcd0f000000b003d9a71ee54dsm30559281wmj.36.2023.01.15.11.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 11:33:56 -0800 (PST)
From: Alexandru Ardelean <alex@shruggie.ro>
To: devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ASoC: tas5720: set bit 7 in ANALOG_CTRL_REG for
 TAS5720A-Q1 during probe
Date: Sun, 15 Jan 2023 21:33:46 +0200
Message-Id: <20230115193347.24190-3-alex@shruggie.ro>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115193347.24190-1-alex@shruggie.ro>
References: <20230115193347.24190-1-alex@shruggie.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 Jan 2023 09:01:06 +0100
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
Cc: steffen.aschbacher@stihl.de, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Alexandru Ardelean <alex@shruggie.ro>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Steffen Aschbacher <steffen.aschbacher@stihl.de>

Set the reserved bit 7 in the ANALOG_CTRL_REG for the TAS5720A-Q1 device,
when probing.
The datasheet mentions that the bit should be 1 during reset/powerup.

The device did not initialize before setting this value to 1. So, this
could be a quirk of this device. Or it could be a quirk with the board on
which it was tested.

That is why this patch is separate from the patch that adds support for the
TAS5720A-Q1 device.
It's unclear whether this change is the proper way to do it.

Signed-off-by: Steffen Aschbacher <steffen.aschbacher@stihl.de>
Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
---
 sound/soc/codecs/tas5720.c | 13 +++++++++++++
 sound/soc/codecs/tas5720.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/sound/soc/codecs/tas5720.c b/sound/soc/codecs/tas5720.c
index d9d08593ff7a..0a7ad35c3b9b 100644
--- a/sound/soc/codecs/tas5720.c
+++ b/sound/soc/codecs/tas5720.c
@@ -350,6 +350,19 @@ static int tas5720_codec_probe(struct snd_soc_component *component)
 	if (ret < 0)
 		goto error_snd_soc_component_update_bits;
 
+	/* Set Bit 7 in TAS5720_ANALOG_CTRL_REG to 1 for TAS5720A_Q1 */
+	switch (tas5720->devtype) {
+	case TAS5720A_Q1:
+		ret = snd_soc_component_update_bits(component, TAS5720_ANALOG_CTRL_REG,
+						    TAS5720_Q1_RESERVED7_BIT,
+						    TAS5720_Q1_RESERVED7_BIT);
+		break;
+	default:
+		break;
+	}
+	if (ret < 0)
+		goto error_snd_soc_component_update_bits;
+
 	/*
 	 * Enter shutdown mode - our default when not playing audio - to
 	 * minimize current consumption. On the TAS5720 there is no real down
diff --git a/sound/soc/codecs/tas5720.h b/sound/soc/codecs/tas5720.h
index b38459570241..54b59b05ef0a 100644
--- a/sound/soc/codecs/tas5720.h
+++ b/sound/soc/codecs/tas5720.h
@@ -81,6 +81,7 @@
 #define TAS5720_ANALOG_GAIN_SHIFT	(0x2)
 
 /* TAS5720_Q1_ANALOG_CTRL_REG */
+#define TAS5720_Q1_RESERVED7_BIT	BIT(7)
 #define TAS5720_Q1_CHAN_SEL		BIT(1)
 
 /* TAS5720_FAULT_REG */
-- 
2.34.1

