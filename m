Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AD567F650
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Jan 2023 09:29:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28825EDA;
	Sat, 28 Jan 2023 09:29:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28825EDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674894590;
	bh=m9SCHIjomCFY5c7SdHttCipGG7sk/WyZKNvM4n6MjHc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rak792+ZnQq6/9+uVA0BQEOtrDuNYfOTM1FJScsnXshvk2dpt+R4EMXU6U4c1zJYF
	 0IxyGZ/J1gdCKd+cvydkHdW73p9EPRmhIpDNfxhXNABUbievBrhw+ZfN+N/h8susGV
	 m3TX8t9BDLerKFpCkzBDmXSLV9YDPPkl4Z81sl/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36FD7F80171;
	Sat, 28 Jan 2023 09:28:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D699F8030F; Sat, 28 Jan 2023 09:28:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E83F6F8027D
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 09:28:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E83F6F8027D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=shruggie-ro.20210112.gappssmtp.com
 header.i=@shruggie-ro.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=cHeIIXHM
Received: by mail-wr1-x429.google.com with SMTP id a3so209670wrt.6
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 00:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4YjpP2wq6+ACjqyzhOFcNXJo9yIAHLd5oTDFkJ5vDJI=;
 b=cHeIIXHM4bx0Is3aXKU0uDRppZwmHutmnygekfW361UPV0o049tzog/tnrlz+T0uxz
 45480jh5NQjEXaNuVHJ4aQZZAj3qW2jm6DV/o35i72+PIU5Lu6yJTuT2AbXgDV7tssE6
 HZ1Yq5Fx/r/4U8A8fu7VG7dee4wql+LJiRgM1KfJrjFYmcUT3N5Kr9N0u8CnDG4isdAf
 0riz/NXLyCy45OwIXEt1F8BFw3vsoNNIBuOuvRgWrblBobf1jaLpEwd5N5LRZ5C94792
 a9f+caVK0fa7uZibFLzVCqe2FegbCRhAaIIBN5mAmv8UIAX/dco33j66T+pnR+vjiNUx
 BKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4YjpP2wq6+ACjqyzhOFcNXJo9yIAHLd5oTDFkJ5vDJI=;
 b=TY05FFhvAtyIm4TpvVM4cyiUIic2+K0s0n0fPhd00v0ZGuWluZKTFrN3myd0fprayl
 DIifqJw2o9BZs9AvBt8OQl7+x84dTe2WVNgr6nujFxztJUI0e+TaOgxDAaRDcp+y3KyU
 bdeAGA5mNmvprPxdqKkXW6dq4P85nehVl9GXDt9dLiytga/4kEmfRLJAtukTHOF2l2Nk
 Om4mTGX4P7rWkuzwxpOm0Dt89hy0/DtLv5l1laijaSfuASiqEzYqr1lXgJi4ow7fRYyj
 75y2oWDZ1V6Tt9J7+BaQ4SoIypJ5GlDwlcupJrD4dMqmpRyD6tTxWuKOjLeGVgqrqbwo
 hgjQ==
X-Gm-Message-State: AO0yUKUIYy6wQK08PyTYuSGsnCrSzwKk7lCY8vgh0HMsv2QJOzd4Ghlz
 3bX5T3s2AxPaEjtw5Q3axJp+Kg==
X-Google-Smtp-Source: AK7set/odpPYKeDI4Gh3Vd6c879W5kwr82f80JtMSa7PjyX5HpudarZJ3fBJJU2wChXc+YL0x2Xldg==
X-Received: by 2002:a5d:4ac5:0:b0:2bf:c0f2:4b0 with SMTP id
 y5-20020a5d4ac5000000b002bfc0f204b0mr10197056wrs.19.1674894485169; 
 Sat, 28 Jan 2023 00:28:05 -0800 (PST)
Received: from neptune.. ([188.27.130.91]) by smtp.gmail.com with ESMTPSA id
 c17-20020a5d4cd1000000b002bfd52f31f6sm3815338wrt.9.2023.01.28.00.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 00:28:04 -0800 (PST)
From: Alexandru Ardelean <alex@shruggie.ro>
To: devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 3/4] ASoC: tas5720: set bit 7 in ANALOG_CTRL_REG for
 TAS5720A-Q1 during probe
Date: Sat, 28 Jan 2023 10:27:43 +0200
Message-Id: <20230128082744.41849-3-alex@shruggie.ro>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128082744.41849-1-alex@shruggie.ro>
References: <20230128082744.41849-1-alex@shruggie.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Signed-off-by: Steffen Aschbacher <steffen.aschbacher@stihl.de>
Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
---

Changelog v1 -> v2:
- https://lore.kernel.org/alsa-devel/20230115193347.24190-3-alex@shruggie.ro/
- No change

 sound/soc/codecs/tas5720.c | 13 +++++++++++++
 sound/soc/codecs/tas5720.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/sound/soc/codecs/tas5720.c b/sound/soc/codecs/tas5720.c
index 2ad8fb29d005..de6d01c8fdd3 100644
--- a/sound/soc/codecs/tas5720.c
+++ b/sound/soc/codecs/tas5720.c
@@ -351,6 +351,19 @@ static int tas5720_codec_probe(struct snd_soc_component *component)
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

