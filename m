Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC3E603A6B
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 09:16:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA135AB64;
	Wed, 19 Oct 2022 09:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA135AB64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666163769;
	bh=d3/Z0ftXUDI7slnkA6KlZUazip4w40n+UE4CsR4w5Rw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T3jzWBPho5fZcuhO5cQ2gHP8KGPuzabiOM42QldTc7TPFK+cxeOfM/clkrw1r/IiK
	 9TMKAAYjxWa+oZNOhnU6AkwFFhFiz3DH1hhf4HAYMbrVRbsGg13MsEceMpKJk0YUz7
	 0Ab5SkY4rnQIR4vFb/K62GFXB0F2foNiLx0UbclM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EBEEF80137;
	Wed, 19 Oct 2022 09:15:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20953F804CC; Wed, 19 Oct 2022 09:15:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65B2BF80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 09:15:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65B2BF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Hd1D8RDB"
Received: by mail-wm1-x333.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so13930515wmq.1
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 00:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qzG7rF/hL8AaILutgmFHP6Nzj7X2cB1iupzaPr0EybQ=;
 b=Hd1D8RDBZUiOgSklpaiMmMXGgKPJP7htFBWoSGkCxqDPip1mFLver9vAhpI/BudG4Y
 E6Tqf6+dOpiJwF708AlDuej6WaU/X33lqFanuH4Ic1057FwVfLFDLU/Axp5fR1g2iTZq
 1R4nYVewDuXIqd94yGenrt33+gW8w3+sjg8UJR2KDSf+MQae9vQFhwd2cItsUHpDV+Ri
 WXoIhFLy0ozob6V/FAmLdrX/3OqxPdrlYgUq2Zrl+z4ODNTzEMjPD+KQ1n/HueSVpg++
 2jYi7EWi2R/y3b33RGUfhAeztps642ZGufHet6lfjUf3yRts1l1n/OC2myMtPQ8xFKyU
 YsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qzG7rF/hL8AaILutgmFHP6Nzj7X2cB1iupzaPr0EybQ=;
 b=agpR6jYG0wEJpf/1QsCiqFK2GPUQ3BcPHoyz70ukrpvKY4IqTkCJttcP4mIWhBAIFJ
 nSPRyt1hhRLaer/PKdHOGSga1xQ/OzWVS28Yvcpd1NWxQwq3x6L4m9LegusUXOO95njQ
 mSg1Gi0Wg+KA8TmeJmNMarIvBOI5a2N7ue5cx8QT3aEmu4JpMTF8+SgzBYsk2Vu4SWt8
 +F1vkK6RaB5+VmFd3xL6c09T0WFLYXgNTK+it+lw+vRXXwH5w9y5l6haUC94+OCK+ERE
 j2Eb2GmP7saLGhZaz74oe1CQAbKgJ2sqE4i4NcZ1aQxCZ0VSQE7dmqXn9GT0wfvKLcKF
 z9+A==
X-Gm-Message-State: ACrzQf13EowH0CoquM5hscmu8+t9nRegc6p8VB/+p+t5pwkI/8TMERLJ
 0was2DWh7SraxL/OEsRtwns=
X-Google-Smtp-Source: AMsMyM77uAhaOzr8WSUOTle4NC05TESdssMRf6wmJL4tpYpF7Ha9ugCvBiXdebOzOSl4APveHHHK2A==
X-Received: by 2002:a7b:c34a:0:b0:3c6:e069:d41c with SMTP id
 l10-20020a7bc34a000000b003c6e069d41cmr20834649wmj.180.1666163710295; 
 Wed, 19 Oct 2022 00:15:10 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c314c00b003c6ee9e254dsm13468311wmo.32.2022.10.19.00.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 00:15:09 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-mips@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH][next] ASoC: codecs: jz4725b: Fix spelling mistake "Sourc" ->
 "Source"
Date: Wed, 19 Oct 2022 08:15:08 +0100
Message-Id: <20221019071508.1003680-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

There is a spelling mistake in codec routing description. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/jz4725b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index 685ba1d3a644..64b14b1c74b9 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -359,7 +359,7 @@ static const struct snd_soc_dapm_route jz4725b_codec_dapm_routes[] = {
 
 	{"Mixer to ADC", NULL, "Mixer"},
 	{"ADC Source Capture Route", "Mixer", "Mixer to ADC"},
-	{"ADC Sourc Capture Routee", "Line In", "Line In"},
+	{"ADC Source Capture Routee", "Line In", "Line In"},
 	{"ADC Source Capture Route", "Mic 1", "Mic 1"},
 	{"ADC Source Capture Route", "Mic 2", "Mic 2"},
 	{"ADC", NULL, "ADC Source Capture Route"},
-- 
2.37.3

