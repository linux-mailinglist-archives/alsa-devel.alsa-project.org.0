Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9EC680866
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 10:23:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9BDF1EF;
	Mon, 30 Jan 2023 10:22:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9BDF1EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675070588;
	bh=WX6TuRBI8e3/bf52Yz9fx1s/v4OHiXvVZajYeOk30Bk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=n/m9V0idMNTGCS2i5ejj0Vp0fzhThK06N0a+DER9aiN75nvmdBu6y5y2fYvMbF8bc
	 fpdhNf9qRq5rjpME6l+yOfHaVVPaqrtnBIGcvKUx75E8nbZszK+TL/XCKNFWzW7rQS
	 EjCK+zHYz6MJef1qMVdIeQrcaBc4ygjeyDZyOitI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC78AF80423;
	Mon, 30 Jan 2023 10:22:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECF41F8032B; Mon, 30 Jan 2023 10:22:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5AF8F800A7
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 10:22:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5AF8F800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=heFkggjZ
Received: by mail-wm1-x334.google.com with SMTP id bg26so1646181wmb.0
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 01:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GGUEVcAPqc3ntFlXLDsn+VtadZ+2wmI0bSmlamuFI1w=;
 b=heFkggjZxYLMIntkP1VjyCKEUKwu6aOiFm6NB0rJJTLoOYIZISDNYEAWvEFRajqXL6
 kK44PaSkuRHigjnWxLRS/ggB91RDuh9mj6z7mSYuDD7Lj8QDNc3g2tgc56ly8yXs+8q8
 5aR9YePGg2D9zhTP63ufenslUPaZ3NKjakW9ZY0BiIWoOUnmSEtUdBKfao8RP8DyhOa3
 dL2heRT+utCzhrG1XFB2AvkaUiT6imMgmUykFjSJQSmsTsCznfhlglGlumwFAXTFHSe6
 yyL0T9Kv5nvTeA5EZK4Q6Fli3hha8qxzv87z+OijRYGSFirWEroUrC9NnKaH6LhZSuKw
 9A5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GGUEVcAPqc3ntFlXLDsn+VtadZ+2wmI0bSmlamuFI1w=;
 b=g/S+436eGacjpthJcpUdec17ZiovuBPbU7lrGV3PwRlIjx5Dcfg0bDp3PPq8TLRN3B
 x1uNMsbXSa5Vlbn5iwVrrvR/SaNrgoJGaPVpr+/K/vGtzo2P7hE5zywmaSJr9g9MILkj
 AoqfMjPGqLBif8fFlwg9c7VmGLOD6wZK4DJSwl5mNLYsaQ5h08ylVSMcDcemMJWz/HHC
 0msob0nTF06c86v3f0klLEhv/Twf1eChJf9dG3ZyGMQmmRGAqa2aM1/CatcSeglEQLgI
 /exyDuqAPyp1EBkqnVEjHCgfVaONRtVShkYprKe1og7IoSl/uT4UoUxsz1kZ6BKRWrB9
 O3NQ==
X-Gm-Message-State: AFqh2kphNailhoeEA864qhPRb/qRswbkJ5rYMXWjCBQ9t2Lg8SI5x7Oz
 +YUnd4qRw7EkjXA+e52cXEA=
X-Google-Smtp-Source: AMrXdXvH4jwg86yGTRFJ5HRm3uZIAeg7hodaP8VUpLyT2Nuwyprlwgapu+iRrvgaS05M5aPObfeymg==
X-Received: by 2002:a05:600c:5114:b0:3db:254e:59a9 with SMTP id
 o20-20020a05600c511400b003db254e59a9mr39478716wms.15.1675070518868; 
 Mon, 30 Jan 2023 01:21:58 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 d11-20020a05600c3acb00b003db30be4a54sm15357905wms.38.2023.01.30.01.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 01:21:58 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 KiseokJo <kiseok.jo@irondevice.com>, alsa-devel@alsa-project.org
Subject: [PATCH][next] ASoC: SMA1303: Fix spelling mistake "Invald" ->
 "Invalid"
Date: Mon, 30 Jan 2023 09:21:57 +0000
Message-Id: <20230130092157.36446-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There are spelling mistakes in dev_err messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/sma1303.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index d3ee831e88f0..3d8e3900f5c3 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -500,7 +500,7 @@ static int sma1303_aif_in_event(struct snd_soc_dapm_widget *w,
 			sma1303->amp_mode = SMA1303_STEREO;
 			break;
 		default:
-			dev_err(sma1303->dev, "%s : Invald value (%d)\n",
+			dev_err(sma1303->dev, "%s : Invalid value (%d)\n",
 								__func__, mux);
 			return -EINVAL;
 		}
@@ -640,7 +640,7 @@ static int sma1303_aif_out_event(struct snd_soc_dapm_widget *w,
 				change = true;
 			break;
 		default:
-			dev_err(sma1303->dev, "%s : Invald value (%d)\n",
+			dev_err(sma1303->dev, "%s : Invalid value (%d)\n",
 								__func__, mux);
 			return -EINVAL;
 		}
-- 
2.30.2

