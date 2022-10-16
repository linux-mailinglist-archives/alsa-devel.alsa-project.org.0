Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E51B5FFFA3
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 15:29:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4E14618A;
	Sun, 16 Oct 2022 15:28:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4E14618A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665926950;
	bh=AS/Fc++BernZRPv2MU5PFD+QfxQDwYCVSkRIovU5cSs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DZfDPW+U157PJHRorPlZuUbU5nVs8RwE/QTCsPGs+g16UG+uWvPpkVkbim3ZZcsgR
	 C6qdcG3ZduUHFXjUv0CB31cy7NKlxnoGiWuenHoj59sF0JWUo4dA8CCHJz2aqhLn0d
	 4zRSn9aznGi4AUnrKx55PcFz4DqXbiATvrxSoB9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CE11F8027C;
	Sun, 16 Oct 2022 15:27:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4904BF800F8; Sun, 16 Oct 2022 15:27:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C79E4F800F8
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 15:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C79E4F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="niUCUg05"
Received: by mail-ed1-x533.google.com with SMTP id s2so12693888edd.2
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 06:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c4lAtcWLfky+loGkaKS25dVBzZnDMU5TT8sW9dTlDsw=;
 b=niUCUg052VYXiWOHFjdQZ5sJJ4MktbIJOqHDhc//ExUZsYJCWATv5g0cUCpcRddUFx
 r99ae361bpw48kxj10mQS4I40GFhDQ1OONdzTIODgj1/YmP8aoTFAJroCRPozPvZRNhn
 VW/EuAhnTrQ/A9VTzHwqZegJu+uLfZiG0vnAdg/LLy3NJXOXhsE5byfMjFafSEk2Y9lL
 1fAO4U/pOLupTdD7Z2bpskOBp7RxogyW0HPf7X04LtjzlSly38ZKrv4ByBSlykCe+JY/
 2MiC80GxqxV7B5EMagddK/sZpnOQeWmQ5+6gW3tC4cAXtW+1P069RwevO6KtyUC4nGyL
 MyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c4lAtcWLfky+loGkaKS25dVBzZnDMU5TT8sW9dTlDsw=;
 b=pYWG+/axWRZArB29HU6pr1GO3RkhcpiTLy8UuV9z0D1bVCfb3Ke+p9iYQfK2PY9/bH
 cZrVopR/kDQhVWDA4ghwnLlqZ4iuQqoUcvhJjG2YF9z4izQEKVyG6d0amdkjYaWqNwQz
 nkfGlkwt7ecBph2pCTk3ghkTD/ppxmNup7t52awY0zlPMAUKHMD2uUuRU1PrqnDG/a9S
 Yfry7euQp+/NrSpY15cjef3jVJiJu8n3SMWJ6d004rNEdSVKvjO3Vj4507q3lMdAFINS
 luzK+le9dGaRQMm9oHE6KCo8RSiW1mwsHJsar+7qQg6c9rNKNcUebGLxXoRAtxongnqU
 NhBA==
X-Gm-Message-State: ACrzQf3m8UfWwUghTuTBWKmVNv6NiamGtHh9KjDhqi+Gd/q3o8K387aH
 XCu38yTgBWX2uq88hB55k9Q=
X-Google-Smtp-Source: AMsMyM4oPte+j5nh3opt0lyMXuFVe7wHIcXq5jHuN7oNH72qrvZnHH9WahPiRurqO7hOrJMsGwTcBg==
X-Received: by 2002:a05:6402:5406:b0:452:1560:f9d4 with SMTP id
 ev6-20020a056402540600b004521560f9d4mr6185254edb.333.1665926864759; 
 Sun, 16 Oct 2022 06:27:44 -0700 (PDT)
Received: from hp-power-15.localdomain
 (mm-39-7-212-37.vitebsk.dynamic.pppoe.byfly.by. [37.212.7.39])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa7ce85000000b0045c72bba0bfsm5572057edv.4.2022.10.16.06.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 06:27:44 -0700 (PDT)
From: Siarhei Volkau <lis8215@gmail.com>
To: 
Subject: [PATCH v3 1/7] ASoC: codecs: jz4725b: add missed Line In power
 control bit
Date: Sun, 16 Oct 2022 16:26:42 +0300
Message-Id: <20221016132648.3011729-2-lis8215@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221016132648.3011729-1-lis8215@gmail.com>
References: <20221016132648.3011729-1-lis8215@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Siarhei Volkau <lis8215@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

Line In path stayed powered off during capturing or
bypass to mixer.

Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
---
 sound/soc/codecs/jz4725b.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index 5201a8f6d..cc7a48c96 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -236,7 +236,8 @@ static const struct snd_soc_dapm_widget jz4725b_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_MIXER("DAC to Mixer", JZ4725B_CODEC_REG_CR1,
 			   REG_CR1_DACSEL_OFFSET, 0, NULL, 0),
 
-	SND_SOC_DAPM_MIXER("Line In", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("Line In", JZ4725B_CODEC_REG_PMR1,
+			   REG_PMR1_SB_LIN_OFFSET, 1, NULL, 0),
 	SND_SOC_DAPM_MIXER("HP Out", JZ4725B_CODEC_REG_CR1,
 			   REG_CR1_HP_DIS_OFFSET, 1, NULL, 0),
 
-- 
2.36.1

