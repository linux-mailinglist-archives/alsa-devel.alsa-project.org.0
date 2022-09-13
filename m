Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 545FE5B7CB1
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 23:24:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D81DC17DD;
	Tue, 13 Sep 2022 23:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D81DC17DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663104276;
	bh=xNrsv2MyEJ3FHOW/gD5EaKJ/v3TZwtZWcmHwJKaHJSY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kKzufXHR3d+h7RgQMbwDWEeYqxF0NqYxwuCDl6lw4KiEmFLnHTyAseXR81pjgPcq8
	 y8esJgLWweHzwE8j+ZKYFeFgE00ssouwyW7Ska9Qewll2Es5ohArJayjD9PFaZJd1P
	 4FpjfzZXXroMkBQ3zz0T0MuOGloO2sag3+IH8qoY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BA68F80431;
	Tue, 13 Sep 2022 23:23:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30654F80431; Tue, 13 Sep 2022 23:23:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 635C3F8008E
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 23:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 635C3F8008E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PFSKJZ6g"
Received: by mail-lf1-x12f.google.com with SMTP id f14so21157992lfg.5
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 14:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=s9fWB+KIpWEfG0ChDe1LcnxfLz16/kGFFSIfjNPpFqg=;
 b=PFSKJZ6gXwhxNTRmtTVhaeQp46N+lP4VFWn/lQvm2dv0lKJ+ah8FUS5waaRZoZ9RVs
 TJHS2AGrgxI29RRAmLT9EJZFTvbQSopCWNEjNpAUL2QijGQFQJECoAEAIAsTTC2ZskBg
 qIn79PNZHDQ8/Ae27hX0fyiU/UHXr9+jbNzxtHFAMCD4Ju/UQ++1zPEP9yaDLxTMEUVn
 r58L3YJxIdUuZVPZeU471yBBWlLnj1+li4hj1sKKKkwHWET7uWm3Mja8T5hG8M9oFAJO
 1w4d5oy3+pqBl3WbCafGgg6rWWnwSHXXt7fAA1z+rGzILMywDlcP1EEDGx19P37AfpbR
 x/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=s9fWB+KIpWEfG0ChDe1LcnxfLz16/kGFFSIfjNPpFqg=;
 b=RNWygbCim2AtETDt52DdWpoii72Bzsan1dzXgP0t1SuZKDEuZRnRfXSQ5ENNVHL/SX
 QfqNecSFb9VV5ivK2uEiRYePK2WD820KZYDLweOHThfc0xY9vRY5FxwWHBmM7ooWbSAi
 u7W84VsjtQOKhI6vQKu5eRjOOiBB3pikD7sRHKbsYBdLBDwNPtuIBRxx1SHQ5s9jw+Hx
 rUJPtnVIhFZWQQxQfEv1UpjbSdgstRELe8qgeCSnkrB5baFWtKATk/9ncvTRqFvd91z1
 oHQJATXXRTMcpWfYAitvhdH5rYmpxp/BtJpUU+yXaZ2V1Y7SPf5jeZYFsCMjaPk6DAkQ
 mlAg==
X-Gm-Message-State: ACgBeo3u598vEzOcaTxGQ9KEym1fzbM+Cd03fm/5lEGv/2QRr87sJ9XD
 j5qmmJT7lbhxPhcJnb8zINLlOx2AMEtWGQ==
X-Google-Smtp-Source: AA6agR7Omz0Ba3AN6qiv2ULvX39qzey9tyjPowF3y2cHjuujTfPT0e38hrLtPKHjw1JIch+djby9Zw==
X-Received: by 2002:a05:6512:4002:b0:499:280:9c5b with SMTP id
 br2-20020a056512400200b0049902809c5bmr7376695lfb.593.1663104185266; 
 Tue, 13 Sep 2022 14:23:05 -0700 (PDT)
Received: from localhost (95-31-185-216.broadband.corbina.ru. [95.31.185.216])
 by smtp.gmail.com with ESMTPSA id
 28-20020ac25f5c000000b004998d9ccb62sm1597517lfz.99.2022.09.13.14.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 14:23:04 -0700 (PDT)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Li Chen <lchen@ambarella.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/2] ASoC: sunxi: sun4i-codec: set debugfs_prefix for CPU
 DAI component
Date: Wed, 14 Sep 2022 00:22:55 +0300
Message-Id: <20220913212256.151799-2-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913212256.151799-1-mike.rudenko@gmail.com>
References: <YyCqC2EypxnoJFk7@sirena.org.uk>
 <20220913212256.151799-1-mike.rudenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Mikhail Rudenko <mike.rudenko@gmail.com>
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

At present, succesfull probing of H3 Codec results in an error

    debugfs: Directory '1c22c00.codec' with parent 'H3 Audio Codec' already present!

This is caused by a directory name conflict between codec
components. Fix it by setting debugfs_prefix for the CPU DAI
component.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
changes in v2:
- rebase against current tree
- add #ifdef CONFIG_DEBUG_FS guard
- change prefix from "dai" to more specific "cpu"

 sound/soc/sunxi/sun4i-codec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 3a7075d03c23..835dc3404367 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1232,6 +1232,9 @@ static const struct snd_soc_component_driver sun8i_a23_codec_codec = {
 static const struct snd_soc_component_driver sun4i_codec_component = {
 	.name			= "sun4i-codec",
 	.legacy_dai_naming	= 1,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_prefix		= "cpu",
+#endif
 };

 #define SUN4I_CODEC_RATES	SNDRV_PCM_RATE_CONTINUOUS
--
2.37.3
