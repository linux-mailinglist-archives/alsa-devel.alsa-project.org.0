Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 960A72CD934
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 15:33:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94B10181D;
	Thu,  3 Dec 2020 15:32:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94B10181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607005993;
	bh=NP8D/ONgNkgOHwtcQgK7f+RUFSi1XsI55YOLI9VERz8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oCpYcH7Vod6L9jJXqPOM24WUcJhHLdQHyAVYXW4PuSzn/P9BcsDi7ko0ZJiFXE0qF
	 VTqBFBwy+SjzPNVVW0PKj+8RnkWU/G6jSKI7d22EZrs4wXldQ5DXaC+KQFE1QHtlu6
	 Es6vR/c9ZI3M+9nVH65rwT5iPVFUgL+mGFn3tpyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BE0BF8026D;
	Thu,  3 Dec 2020 15:31:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70224F8026B; Thu,  3 Dec 2020 15:31:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97655F80254
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 15:31:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97655F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="syD0iLsQ"
Received: by mail-pl1-x641.google.com with SMTP id b23so1227754pls.11
 for <alsa-devel@alsa-project.org>; Thu, 03 Dec 2020 06:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hnyiBvxmu2Imkb8YDUhf4+16pZ6KZ+zRDyXRDSKsA8M=;
 b=syD0iLsQa6z1saep79dA/xw7JPVfQyJKbp45iEqgSjeQwcTNVtZIQkTT+PVkG6sa3+
 Nh94KSSs0XAR1Vi6QAdBWTQVpVGNDZEuN7AHMg9ZdLWGaxFg6kG0u+dR8sUcA58H7Zbk
 dzhR8W8EgeD/Wv6oG2uFkz2CyClqnlfsAFVgnnBcIfsF5eUZHyY25b2mVTSTN2YAw301
 bmz8Q5poPfBv3ZxnjBsKCUVcKyC4FDm5v7U12ZQTUw6PRwdQPXNaCmx5iXSHPtI99cXG
 0iVAs6RyRn2E7Rqz1EwnNtDMY8lOUSTMq/qRwGuNfroBteC1NsaaMLJhKZXrGQL3S1rt
 Ftnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hnyiBvxmu2Imkb8YDUhf4+16pZ6KZ+zRDyXRDSKsA8M=;
 b=ks5wrOFLaB3uaVGJd2oSvVNxSk4lOhAWj85PRSYiKWnG9ddWjNs3zNdDL/NXpiAhVh
 33RgRG0Y05vs2ex7s+oFnObEVtzaAbM/SuTQg5D1uYufEcxsTSz8PMiJSTTjiqeU6QvC
 s3I4fuXyLBtUgKMgkUm4yCGlRck4dVFxCoW6zxz2+8owvmQmHSCcVsyQhMnHYZhNrylD
 1a/Kt+YjYeAYafE8SoFPDQUf84E1WPT4jsF9JxiR9w28vG2pXxsy/NDU3dMWMikXjoNG
 XDGc/IroFzWYa9i9ESSQyHRboQCByqUWlOQyRSCR/71k1BHL4UyyznewAwkpzRc05iLk
 GLoQ==
X-Gm-Message-State: AOAM530l2RV1fmT6Yu1o17/3Nk+w8Gmgbwoh+x+cPYIVSEoa/KJrn31Q
 7yQeURWNLwBQHUR0oTcVDPo=
X-Google-Smtp-Source: ABdhPJygAEK71UM3UL3r/3tAF+CXzkZXYCEnKN3leuYBtdEK/YM3FiaDOt0VCIDAqg4EN0wj2I8KRQ==
X-Received: by 2002:a17:902:7c8d:b029:da:625c:8218 with SMTP id
 y13-20020a1709027c8db02900da625c8218mr3339949pll.26.1607005885797; 
 Thu, 03 Dec 2020 06:31:25 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id h70sm1971909pfe.49.2020.12.03.06.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 06:31:25 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] ASoC: amd: add missed checks for clk_get()
Date: Thu,  3 Dec 2020 22:31:16 +0800
Message-Id: <20201203143116.405930-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Chuhong Yuan <hslester96@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Agrawal Akshu <Akshu.Agrawal@amd.com>
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

cz_da7219_init() does not check the return value of clk_get(),
while da7219_clk_enable() calls clk_set_rate() to dereference
the pointers.
Add checks to fix the problems.

Fixes: bb24a31ed584 ("ASoC: AMD: Configure wclk and bclk of master codec")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 sound/soc/amd/acp-da7219-max98357a.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index a7702e64ec51..d5185cd3106b 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -74,7 +74,12 @@ static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	da7219_dai_wclk = clk_get(component->dev, "da7219-dai-wclk");
+	if (IS_ERR(da7219_dai_wclk))
+		return PTR_ERR(da7219_dai_wclk);
+
 	da7219_dai_bclk = clk_get(component->dev, "da7219-dai-bclk");
+	if (IS_ERR(da7219_dai_bclk))
+		return PTR_ERR(da7219_dai_bclk);
 
 	ret = snd_soc_card_jack_new(card, "Headset Jack",
 				SND_JACK_HEADSET | SND_JACK_LINEOUT |
-- 
2.26.2

