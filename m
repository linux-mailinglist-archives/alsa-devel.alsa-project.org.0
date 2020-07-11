Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4513521C301
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jul 2020 09:10:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1ABA165E;
	Sat, 11 Jul 2020 09:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1ABA165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594451440;
	bh=zp14fzWRa8YWjMJp4KzxBn00fVthB21eVreWFBI/NC4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oAuMWxoxhsoowl+0ItoDOFMyECzdLX4dkXVysSkuECVMU8kDoJdYqXpRFvISfubjd
	 imdTt85hFShstbTlE4nq9n8+KfkpNkvy54sNq2gLXloiUnTmSk0ckJP9iNLC4OyPcZ
	 pLlNpIlbKjntbcogl/LdbHlieoNcgWSU9/mlFP/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F170FF8014A;
	Sat, 11 Jul 2020 09:08:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B1A5F80216; Sat, 11 Jul 2020 09:08:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3438DF8011C
 for <alsa-devel@alsa-project.org>; Sat, 11 Jul 2020 09:08:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3438DF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WD5wrr46"
Received: by mail-il1-x143.google.com with SMTP id h16so6977260ilj.11
 for <alsa-devel@alsa-project.org>; Sat, 11 Jul 2020 00:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3zaiLFbNh7L3+bFoK+wl7i5xM2TsBDsZ5cXl+f5vIV8=;
 b=WD5wrr46I1z4QIoObyt1ro0aEC7r5zKOQHU9c903/TxQOkyxxlhlIxviz5lYwf/5JK
 EFfesDnDXaffkFcOthkfV0fD0f2MpVCfKKZUntQs9jPfPv6opWoZVayzQsYcIQ0F9vkV
 LUpCEtRs5XapkrGV0fLRT4fgqSxGkN3lL2++5iRAyFuZ9DPmDn5ShbHYwahMM4m+KKl+
 Zs9BrTHUGG3fbf7Bxahk/liKjy8+wm3hCp07fNoAXC4wksLX15poHHxAVg2opHZ9bsRB
 6fJMLzSbAbtJuH/350dCONdeSeeqg+WgP0hJKK+jtax0Bxz+4gom36xYxmMLQVHhb4l7
 0fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3zaiLFbNh7L3+bFoK+wl7i5xM2TsBDsZ5cXl+f5vIV8=;
 b=AiF3fjtQO7xvPmeLo2TSa5lECrqt97r1qc4qdjtGhEyfL7VcGh4XYTcaBmllZKTXYl
 Tze83m261zlTukuA6cRWDXDqtGjYRUdpOb33O1UWs3XP9NRq+/9qTd8PyZFhdEdKnPNc
 3W2I6gnZZLYrYu6c7bcq6pBK+7RRyHjZKwR3SlYEhZUpHHuSoURhixHKw0rPOY4ILD1H
 0xs6r2AINpHEsDOTFOONd6veWH+F1w0a6E+hnNe4/su44l/IoKPrrS6mz6GsYmCJTj83
 4y9i8sRHczUUcBpiSRTJuLDXN4CpU0LMCuo2nadDAwWq8JC85roLf+Kf+BXbV8HzpCYF
 z3kQ==
X-Gm-Message-State: AOAM530UgJQqbr3xDfHjIkpj73/5mcin2H4YrypREKLrIobJB32yc3Gj
 EoqmtO8bOpVD7nM8XfuL2gM=
X-Google-Smtp-Source: ABdhPJw9FantHw3DWTcb4xX67aNuzRPAdFkv7mM8PWkXa8Wel+7ugRwbStJKPaNhZueRIwsrpkQ0ow==
X-Received: by 2002:a92:41d0:: with SMTP id
 o199mr22608975ila.205.1594451324621; 
 Sat, 11 Jul 2020 00:08:44 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [160.94.145.20])
 by smtp.googlemail.com with ESMTPSA id u6sm4469475ilg.32.2020.07.11.00.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2020 00:08:44 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Navid Emamdoost <navid.emamdoost@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: trident: Fix a memory leak in snd_trident_create
Date: Sat, 11 Jul 2020 02:08:30 -0500
Message-Id: <20200711070835.4855-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: emamd001@umn.edu, kjlu@umn.edu, smccaman@umn.edu
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

In the implementation of snd_trident_create(), the allocated trident is
leaked if snd_trident_mixer() fails. Release via snd_trident_free().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 sound/pci/trident/trident_main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/pci/trident/trident_main.c b/sound/pci/trident/trident_main.c
index 6e50376163a2..e98c692f6aa9 100644
--- a/sound/pci/trident/trident_main.c
+++ b/sound/pci/trident/trident_main.c
@@ -3582,8 +3582,11 @@ int snd_trident_create(struct snd_card *card,
 		return err;
 	}
 
-	if ((err = snd_trident_mixer(trident, pcm_spdif_device)) < 0)
+	err = snd_trident_mixer(trident, pcm_spdif_device);
+	if (err < 0) {
+		snd_trident_free(trident);
 		return err;
+	}
 	
 	/* initialise synth voices */
 	for (i = 0; i < 64; i++) {
-- 
2.17.1

