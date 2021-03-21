Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DB134333B
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Mar 2021 16:41:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EF14112;
	Sun, 21 Mar 2021 16:40:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EF14112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616341296;
	bh=TP9DDxZKTQq/8YQ/f14bFh/oxRptkfV80QkJ8fAA2tU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bPPrDiJ+E5PIgsqp0R2hngStKVmm+3DMA1f4iqatpkFHL78SoYSpt1g5w+8yrbZVc
	 Pmi2G9EULuIXVjsCaA6wOj2daMEL5QDzT+BDJnTBfFCSSf+RCLfSDPF4A4FySpff2Y
	 ej0hPbgYBlgL6Z6b1ESNi+NDSj+/9M1Y0Brkjahg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FF50F8032C;
	Sun, 21 Mar 2021 16:39:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D4F0F802E3; Sun, 21 Mar 2021 16:39:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 809A1F80118
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 16:39:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 809A1F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="D5zyTgKc"
Received: by mail-qk1-x72d.google.com with SMTP id y5so6584494qkl.9
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 08:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PRVsQVQHUV1BTAm1l1VygqbQNUFWwnup1fJPgSm87Fc=;
 b=D5zyTgKciaCTPsJGfDhlC/sxvSRbX4JibEGi31MBUNvdLN5TRwkkVmRCpRNNUNrRFr
 vLNZQ/o8WdXj76ikmdcEDHs1jK4uFcVCh8pFJNa1tvkpFzaydU/J/FBLJIezcusljaqL
 8LPZisVKD6eWlAbCGfbR03nBgsK9u/v7T3Q4BHlDFPG9twTjNQSf8IWPOyZO48zYgnyA
 jXNVdbyFOxqbQ77EjiN1ALOvwiWavm4q7h6/tzeZAs1oM9dirqWe7pLmAJ5yUqhkhepg
 yAlhJWlddfzBJAXzla/dId4/f0bMe1zlLlv6PPuitLEjqbfdU0bMSAe3bSlkQECHZ62b
 dEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PRVsQVQHUV1BTAm1l1VygqbQNUFWwnup1fJPgSm87Fc=;
 b=Txj8FNVNP+tfQytP5kqkMc+wQgdxzuiftW5p6j4dH/335GQdfTOOl4nNhQ4tTFMBzM
 KiFBD0wa8jBwYfCfyMgfkWGNnk4c1MIBeK07Z9CzPKLLrHCdMUIxRdkJ8XDwLBjVZXtk
 L6lH+EU83ZtySVx6Ha3PVDTJdTaMfWOPioua9w5hJQcPASEYzFN0g+5xV282wFaapPcj
 56XqvGYEtcuQDuz8ldBcAy52wd78k0SrFMYjIXWEgXETB0foWJkL6/zwL+8NK5SDaLmF
 mf0L3fKBo6mcWS6wU+JTVDDZPSDIqBzdbi7JFKAx/ZceGs+TKXXUhR5GW2wYiJYJ+f+w
 DYvQ==
X-Gm-Message-State: AOAM533akehYz4toa+A1m/UlbkUADKwraLd4SGeS+uIJ8WOZzhCMD+uP
 zdNEx/EHNNm+tGc3KrbB5kM=
X-Google-Smtp-Source: ABdhPJzpV1P+8tfIMZzfJjEPtm9lJqr3HvoQc/iullzdikquKZTsSxj4zzQMf8kSPkyUg4a9UsopfQ==
X-Received: by 2002:a37:6115:: with SMTP id v21mr7298791qkb.239.1616341142570; 
 Sun, 21 Mar 2021 08:39:02 -0700 (PDT)
Received: from tong-desktop.local ([2601:5c0:c200:27c6:f925:bb4b:54d2:533])
 by smtp.googlemail.com with ESMTPSA id y19sm8976317qky.111.2021.03.21.08.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 08:39:02 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Tong Zhang <ztong0001@gmail.com>, Jasmin Fazlic <superfassl@gmail.com>,
 Leon Romanovsky <leon@kernel.org>, Romain Perier <romain.perier@gmail.com>,
 Allen Pais <allen.lkml@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Naoki Hayama <naoki.hayama@lineo.co.jp>, Tom Rix <trix@redhat.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>
Subject: [PATCH v3 2/3] ALSA: hdspm: don't disable if not enabled
Date: Sun, 21 Mar 2021 11:38:39 -0400
Message-Id: <20210321153840.378226-3-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <s5htup4exbl.wl-tiwai@suse.de>
References: <s5htup4exbl.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

hdspm wants to disable a not enabled pci device, which makes kernel
throw a warning. Make sure the device is enabled before calling disable.

[    1.786391] snd_hdspm 0000:00:03.0: disabling already-disabled device
[    1.786400] WARNING: CPU: 0 PID: 182 at drivers/pci/pci.c:2146 pci_disable_device+0x91/0xb0
[    1.795181] Call Trace:
[    1.795320]  snd_hdspm_card_free+0x58/0xa0 [snd_hdspm]
[    1.795595]  release_card_device+0x4b/0x80 [snd]
[    1.795860]  device_release+0x3b/0xa0
[    1.796072]  kobject_put+0x94/0x1b0
[    1.796260]  put_device+0x13/0x20
[    1.796438]  snd_card_free+0x61/0x90 [snd]
[    1.796659]  snd_hdspm_probe+0x97b/0x1440 [snd_hdspm]

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 sound/pci/rme9652/hdspm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 8d900c132f0f..00cbf81ab2a6 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -6883,7 +6883,8 @@ static int snd_hdspm_free(struct hdspm * hdspm)
 	if (hdspm->port)
 		pci_release_regions(hdspm->pci);
 
-	pci_disable_device(hdspm->pci);
+	if (pci_is_enabled(hdspm->pci))
+		pci_disable_device(hdspm->pci);
 	return 0;
 }
 
-- 
2.25.1

