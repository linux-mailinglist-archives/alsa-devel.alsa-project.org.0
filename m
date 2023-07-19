Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE33275C0EF
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:11:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23EF9851;
	Fri, 21 Jul 2023 10:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23EF9851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689927063;
	bh=9HmL6BJn+o1bn7JO6lTma1eAKbxz9iQNvjcj44QkCyc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jEFgkAgJPoBK7nVVg1S7YDXE13bcGoOX2QtpanxbEaIsKlyUt2tvA7DL+aHQmC0Bo
	 2k90Q73dJu/6J0lk/GrfNMajeothgaURb66pEJRBNhtMWIrHsR+W6nyCiS/MCfnFDe
	 cnecBGAwwX4G5WOVbCXvr9hbxjllgRZkXB9v8E04=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8970F805AA; Fri, 21 Jul 2023 10:08:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45729F80588;
	Fri, 21 Jul 2023 10:08:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FC64F8047D; Wed, 19 Jul 2023 18:48:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8720CF80153
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 18:48:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8720CF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Y0sBPXTz
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51e99584a82so9775760a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 19 Jul 2023 09:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689785296; x=1692377296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yixFqSzT/c4E0mvGw1Uo9KfL2QY9NEvmj8leiEc3puY=;
        b=Y0sBPXTz9dyJZPRwFkzpcMAF8C1+t5QmrsdtFb5qSp1+uPUnaGSzooAFfj2OI2jVWj
         jXB5pXt+6XqggnKKndNnkx0iufj5VXa70c5mH8xOC0FXX7T++VZIlcySPT14vXHduATU
         HsQa6hNZPhbnOmZQOUp6D8ajoMITXzwzGD0dRYoCMLmaqb0gN4AQY727/hfxPSuFik16
         tK4Bq8uQdo820l+L3JHF5LFE/DaQZvenIfCYOUtOuyHHm+an7aqRO/nV05GUQzCYciPc
         oqZJPtv4nR8xNP9OXIgVXRJXvQwy4Q9D88KHaHF7OX1QtbdhcOziKcFxEtGUOB9sFZhG
         jXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689785296; x=1692377296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yixFqSzT/c4E0mvGw1Uo9KfL2QY9NEvmj8leiEc3puY=;
        b=dshbuvYa1majrvSC0JO9G6qOtfQcdOIhJKt8uGSCd15IZotJwlD0WDgl8/aPIPiuQI
         kv/0HL73zbpfRmbsA6wRnD8cxW821ALZqQ2CMe4p1UmKIAtacmclwo4KJQ0iY8+VfDIS
         jk9tF1NjtZnVObUaNPqo3KK/mN6O3nLeu0NrbKa6kmRQ6YtwaLQm/YaV2Gk2HFi5ai4c
         mauizlLCu9JjbLlTyMm1e0PXJZDeOC0LDWJDP6bzfjJHWksDldkpvt4QXtepRtu0yz32
         o8rtFFOlb/iItFDadz/gRhX4JTde6DwU3x0jq00fPTnvzmjI2dtCCVTfmEFxitGH3PKG
         pLLQ==
X-Gm-Message-State: ABy/qLZ8jvHpwYdcIoXj0I6OwNUBRSQwZXPwlqvXbA1RGNYnBxPmxYU5
	4i6OGfNgBmB2Oqq2lYdykhc=
X-Google-Smtp-Source: 
 APBJJlEHbfz/pFyUepLd7VKG/NuQoD7KORKklONmdm98pXW6g5MHna6cHYzQND91adVXuiGLISQbhg==
X-Received: by 2002:a17:907:6d25:b0:982:9daf:9fcf with SMTP id
 sa37-20020a1709076d2500b009829daf9fcfmr3870702ejc.66.1689785295815;
        Wed, 19 Jul 2023 09:48:15 -0700 (PDT)
Received: from localhost.localdomain
 ([2a01:c844:242b:b300:215:5dff:fe9c:4c81])
        by smtp.gmail.com with ESMTPSA id
 gl7-20020a170906e0c700b00989027eb30asm2566959ejb.158.2023.07.19.09.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 09:48:15 -0700 (PDT)
From: Matus Gajdos <matuszpd@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stephen Warren <swarren@nvidia.com>
Cc: Matus Gajdos <matuszpd@gmail.com>,
	Mark Brown <broonie@linaro.org>,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_spdif: Silence output on stop
Date: Wed, 19 Jul 2023 18:47:29 +0200
Message-Id: <20230719164729.19969-1-matuszpd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: matuszpd@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SGRES6QJW6OFRSJULCUN3U76PJ77O6P7
X-Message-ID-Hash: SGRES6QJW6OFRSJULCUN3U76PJ77O6P7
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:08:44 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SGRES6QJW6OFRSJULCUN3U76PJ77O6P7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Clear TX registers on stop to prevent the SPDIF interface from sending
last written word over and over again.

Fixes: a2388a498ad2 ("ASoC: fsl: Add S/PDIF CPU DAI driver")
Signed-off-by: Matus Gajdos <matuszpd@gmail.com>
---
 sound/soc/fsl/fsl_spdif.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 95e639711eba..95bb8b10494a 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -755,6 +755,8 @@ static int fsl_spdif_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		regmap_update_bits(regmap, REG_SPDIF_SCR, dmaen, 0);
 		regmap_update_bits(regmap, REG_SPDIF_SIE, intr, 0);
+		regmap_write(regmap, REG_SPDIF_STL, 0x0);
+		regmap_write(regmap, REG_SPDIF_STR, 0x0);
 		break;
 	default:
 		return -EINVAL;
-- 
2.25.1

