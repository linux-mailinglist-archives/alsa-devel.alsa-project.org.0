Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2314608F31
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 21:16:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54855C057;
	Sat, 22 Oct 2022 21:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54855C057
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666466165;
	bh=UjmgI9+q/8WIGaKASFpwVsOOOS8ERBdZMKv8fLzyang=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LY1lvZXR+vMNJgSjGpf0IKYKh9kl9/zmd2H3SG3PkqxZiFImPbrPa9jlnFGft3gr9
	 gUKsfOXfuk+NRmvJURDWJ77jLFl15G2OP7aQX4nKQgzEOYXRbhrXnNKtkCJct+wKJH
	 xh6FUxYsYmLaLM1PgX1FtYo+nKMjT8vgURfuBDuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3B5EF80579;
	Sat, 22 Oct 2022 21:13:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3142EF80568; Sat, 22 Oct 2022 21:13:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCBE0F8012A
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 21:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCBE0F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Mk32tiD+"
Received: by mail-wr1-x42f.google.com with SMTP id bv10so9729418wrb.4
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 12:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pvKXzpxFzZWAwh4ulfZ9nH6QQVrhwgz8YLgYLKE7oQk=;
 b=Mk32tiD+7lGM2PB2KBnwrwRs/5pG1IM2VWwXn+K1X6q+vW0rzntqHq9asZQRoo4Lgu
 xpPq180y9ajoqHiSIw0RZuV1Jb7inx+Uxtaj42O5pNtCga+OsbxRmM7GF3ID7PVGg+fH
 RZ/wecg6JaLqAIxZc8jwWP3koFUs6X4AeeDZmuR9egW6QaxA3cJdiToK5kH1bFQ4wfhq
 bKpkxSF4VlzukSPq3CNgo1Bq0AqRR13XagfzPvLe+wC/NkzTCymBnuC8OYehqcw2EksS
 M0xfBrJnVjTGfZ09pIuL/B7T42kEZThfIBaoYfGtH6kc8YWsDWvMyoTks+h36yORRDnP
 iBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pvKXzpxFzZWAwh4ulfZ9nH6QQVrhwgz8YLgYLKE7oQk=;
 b=S7xcHlXbMPJaKB0PO/r6OpbYexqW0KDdjemDrUDVz0MI2owUCEOZzRI7JRFT43yg2W
 kOmoBqNZ2QdclQMBWbZEVyCdlkdYQtZIBFsLFTNEUaO9F1K7rRXYwEhPC//zk76TNQ4C
 PeL3+Y/QFNvJNeFvDtUuCCOvuj5Gsmg587rZbTg1IZdy5pLGgVtKS1Q2GS0zxsJILFQ9
 yl8mHm+L9bDIKkmv1TTb0R1PUqW0H2H9JeSg51nPIrUlstYE5P47DAymp51uGnlslFSK
 kM/+2nbYGinqEJHFVgVLivX0CtDI0lVqmWya6H62gHZTPxZdTYxtKetlmrnB05IqD1k6
 HMIA==
X-Gm-Message-State: ACrzQf2AwkKRQZ2KPnOjBv9SMP7w/AO9HErP3rZVSMAKlVBQ/+PpYw9l
 BABIF2HqFVp3HAIKzTKuQPk=
X-Google-Smtp-Source: AMsMyM4ZgiMk56yHI2oeiWzNd5O/Bb+8ZyfhfgGtlPvoGmNJ0BN1+6zyBptA05Wp39LxFyKTH4gDQQ==
X-Received: by 2002:a5d:5691:0:b0:22c:db35:7939 with SMTP id
 f17-20020a5d5691000000b0022cdb357939mr15694848wrv.102.1666466010555; 
 Sat, 22 Oct 2022 12:13:30 -0700 (PDT)
Received: from localhost (94.197.1.68.threembb.co.uk. [94.197.1.68])
 by smtp.gmail.com with ESMTPSA id
 j16-20020adfea50000000b00228d6bc8450sm26311735wrn.108.2022.10.22.12.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 12:13:30 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v5 7/9] ASoC: jz4740-i2s: Support continuous sample rate
Date: Sat, 22 Oct 2022 20:13:06 +0100
Message-Id: <20221022191308.82348-8-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20221022191308.82348-1-aidanmacdonald.0x0@gmail.com>
References: <20221022191308.82348-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 zhouyu@wanyeetech.com, linux-mips@vger.kernel.org
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

The I2S controller on JZ47xx SoCs doesn't impose restrictions on
sample rate and the driver doesn't make any assumptions about it,
so the DAI should advertise a continuous sample rate range.

Acked-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index fd35a8a51f60..201368f828ff 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -390,13 +390,13 @@ static struct snd_soc_dai_driver jz4740_i2s_dai = {
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_48000,
+		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.formats = JZ4740_I2S_FMTS,
 	},
 	.capture = {
 		.channels_min = 2,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_48000,
+		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.formats = JZ4740_I2S_FMTS,
 	},
 	.symmetric_rate = 1,
@@ -426,13 +426,13 @@ static struct snd_soc_dai_driver jz4770_i2s_dai = {
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_48000,
+		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.formats = JZ4740_I2S_FMTS,
 	},
 	.capture = {
 		.channels_min = 2,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_48000,
+		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.formats = JZ4740_I2S_FMTS,
 	},
 	.ops = &jz4740_i2s_dai_ops,
-- 
2.38.1

