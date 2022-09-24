Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 596145E8B27
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Sep 2022 11:51:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6748827;
	Sat, 24 Sep 2022 11:50:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6748827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664013095;
	bh=E6o7WRvRKXT79c1HRJ8artLwgRXZMKkMBJVZFZQpe4c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pKpa2B+oBCI6+YhVAgE9Dp0ysDKBbquTTSGe35aYn/ctpqPJJ0xU22RT5KpDvWSBO
	 0uiOO7Kg2/wjaKxwoKhaeeXqTOBdkEE1lfeXvw306zMU8sLY04YUk3NovFo5x66k/J
	 bswm71bhv1taNM4AEPfXdnGzn6c2VFlxXA8r0NIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F7DEF801D8;
	Sat, 24 Sep 2022 11:50:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64CA2F80154; Sat, 24 Sep 2022 11:50:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77D68F80124
 for <alsa-devel@alsa-project.org>; Sat, 24 Sep 2022 11:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77D68F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="d6hRO9bx"
Received: by mail-pj1-x102e.google.com with SMTP id
 s90-20020a17090a2f6300b00203a685a1aaso2420326pjd.1
 for <alsa-devel@alsa-project.org>; Sat, 24 Sep 2022 02:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=cSyB+p+NH9fNrvnp1dRITZWO5DlTrkpIl0IbG2JZ8SE=;
 b=d6hRO9bxJ1ZjSbV/CM8zCrtOYWTHbkteregaj59xAYYqXQsh9Sumnhx2Eu/owrSCmQ
 VhvhC2IvEOUA4AxeEffeaULhAUZLSa2EOqKo7HrET4Th1v3nqpoWz+NugarXWBJVXy8p
 DDUfcfhp3EOUvyjuMuw++7mhiOTty7jfehROCgugYaIvl5E77ZGlgQkYpQzPBijcz14q
 H5xjezgPtvVJ0mdElm4hE9JWHHBNNRVmL9VC8Q2NmekeeYZOY54K4X+LEf+DgRSk54hm
 bCzm2RowfBUXsjFZqRE2mRuaQRDiGqdVDLhdkw0tBevmdaQysQJzxsGHD4vlkU7Pk3wK
 CaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=cSyB+p+NH9fNrvnp1dRITZWO5DlTrkpIl0IbG2JZ8SE=;
 b=DB/wImKmAb9bgXjett99gw0tBO4CRr/413Ej8fOmEF16DmekOPnZABbeYteCFp/55k
 f29CTTpBgLPvgphRWmBRIvlVNVohkgFU2q+heibaFHKTP8MwytTosdMgrHuv9zo2AB6l
 gGJjQ1pZapZrkJ34Tiyq1DgPeUSLMXhpaBVMge+RuE5icHZVJZ+mGgWoQlCaK6cuBFQK
 9Q730xHMiXMLeokH84ARMr8LwDz0j5Gimj1Ow8ZZb+Y33JJGODmbW4aObqqoidF8kTvv
 L3nfzg3uSmty2UvWhWw56wWajlyqDZzjQz3B0kSrYxLxOJ6mB5x9hAZkGxecD1bLfy+E
 8NpQ==
X-Gm-Message-State: ACrzQf23KqcdibVSMVupgjErx4KlIlqjMVGQA9Trv15GZmAQj4LfPPDi
 e5D+TP1wcYOD5n4ViHMfZbw=
X-Google-Smtp-Source: AMsMyM5XmEsIHu+v0o9gcoHkJFwQJt+ppfY2jFOO/Jvrjnp0dVY87OczvkyH74GVLtL0QQ/gF9K+rw==
X-Received: by 2002:a17:90b:4b88:b0:202:cbab:980b with SMTP id
 lr8-20020a17090b4b8800b00202cbab980bmr14284036pjb.153.1664013031799; 
 Sat, 24 Sep 2022 02:50:31 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b00176c0e055f8sm7340223pls.64.2022.09.24.02.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:50:31 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 1/2] ASoC: amd: acp3x-5682: Remove SND_JACK_LINEOUT
Date: Sat, 24 Sep 2022 18:50:24 +0900
Message-Id: <20220924095025.7778-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
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

RT5682 only has a headset jack.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 sound/soc/amd/acp3x-rt5682-max9836.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 0543dda75b99..0bdd9c26dd22 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -87,7 +87,7 @@ static int acp3x_5682_init(struct snd_soc_pcm_runtime *rtd)
 	rt5682_dai_bclk = clk_get(component->dev, "rt5682-dai-bclk");
 
 	ret = snd_soc_card_jack_new(card, "Headset Jack",
-				SND_JACK_HEADSET | SND_JACK_LINEOUT |
+				SND_JACK_HEADSET |
 				SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 				SND_JACK_BTN_2 | SND_JACK_BTN_3,
 				&pco_jack);
-- 
2.37.3

