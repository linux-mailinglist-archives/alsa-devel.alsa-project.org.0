Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DED34333A
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Mar 2021 16:41:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DFAE166A;
	Sun, 21 Mar 2021 16:40:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DFAE166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616341279;
	bh=W9RU/icZPj0J963r65DiRtPjb4C/U/e1yAv8RgMo8DY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JVYMi/yNGMkl6Zlu4Z5Nd7jMVoZ/UNUnK6dOVx9vINIr/2Yhmheffwuuhgu2hyRCF
	 KzjW4s+6ycOII6dCgllcNlYScPYWI/UeLRz3VBydL9yHwpf2Bm7s44nx2e6FPLPtKC
	 vQkPpOCS5+prWVLnitzeSDylg+DJMrPODEAxocgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58893F8032B;
	Sun, 21 Mar 2021 16:39:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF2BDF8032B; Sun, 21 Mar 2021 16:39:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE062F802A0
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 16:39:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE062F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MW7M/frk"
Received: by mail-qt1-x835.google.com with SMTP id g24so10561652qts.6
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 08:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yRW9PE4PemHN72A5ymHlcDFWXespNNcujE5EyueWS1k=;
 b=MW7M/frksjY68Z6hpZ1XKQm1soDl0ROTOrzcboTIYi7FXWRONGkTl39yZgcXoYWN60
 NjY1+yS88ZN5QGacqwT6pOsmVFn3b1E5PagRClGs7ZJTRItxPvIb8mFPIALP46u9Yavn
 QBS7YxKKGxLjzMOo+TkEtRzKR0QPDocLUzSfrxruVBIvIdp/th3/BZwrqvaIWE6LkCRO
 /mxJjnEMT0M5N6dz0Kh6grvvLHGLY/ZhYwHnDn16s1dNZE5d1vHThaIe0Ay7TF5o9nAt
 AX91QRtWBHHyefmveaWQco9k4g8+B8UihXlj9z6j9PGy0auW5E+5zGKU5b2VNc3uGwyL
 l0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yRW9PE4PemHN72A5ymHlcDFWXespNNcujE5EyueWS1k=;
 b=eKtGPltEpzpoVYcGXR15S+32ecEtNeKolzO5bSVEJu/7iOl6awY3g2YjSbGSnMcPsk
 0Y7c0zAVgXrgjL0MyOr+JnnLA785Sewm1aYaSH1wGZO93Q4hRygt1m/7gQSJzt3+RrWp
 1fjb2UGdm4Jg0fzZhxdsz+enQDBUijl4aerbBMSoS5tLP84m/pCdjxveKVdxOrA30iO1
 PEPGvBKdCGxLpGLoDSNvnFRbpReqszevYu8LoZyfejZ8BbUu0jI89AlvEuPFXvxidTdH
 x4w/4+TZMK1HGoX5wx1Rooi80tdKTuGVNeMPOF6KHkifWvvAOM4cDi8VArTTwCQfQ5Md
 T6rg==
X-Gm-Message-State: AOAM532SGehhPuPOnRZ3XvKCKVqpdENhGUJykbk3ZmSdbjlkaFq1Ua1N
 +S1Aeu+gXlr7p87rM3ePuTk=
X-Google-Smtp-Source: ABdhPJx/FaxehlsgcmepHvvf0n9MUE0QFGhKRNoO+mNkK2Tvb8q+G43gvlzfNlT4hbQ3hQY9eDWCfw==
X-Received: by 2002:a05:622a:8a:: with SMTP id
 o10mr6164651qtw.50.1616341145901; 
 Sun, 21 Mar 2021 08:39:05 -0700 (PDT)
Received: from tong-desktop.local ([2601:5c0:c200:27c6:f925:bb4b:54d2:533])
 by smtp.googlemail.com with ESMTPSA id y19sm8976317qky.111.2021.03.21.08.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 08:39:05 -0700 (PDT)
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
Subject: [PATCH v3 3/3] ALSA: rme9652: don't disable if not enabled
Date: Sun, 21 Mar 2021 11:38:40 -0400
Message-Id: <20210321153840.378226-4-ztong0001@gmail.com>
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

rme9652 wants to disable a not enabled pci device, which makes kernel
throw a warning. Make sure the device is enabled before calling disable.

[    1.751595] snd_rme9652 0000:00:03.0: disabling already-disabled device
[    1.751605] WARNING: CPU: 0 PID: 174 at drivers/pci/pci.c:2146 pci_disable_device+0x91/0xb0
[    1.759968] Call Trace:
[    1.760145]  snd_rme9652_card_free+0x76/0xa0 [snd_rme9652]
[    1.760434]  release_card_device+0x4b/0x80 [snd]
[    1.760679]  device_release+0x3b/0xa0
[    1.760874]  kobject_put+0x94/0x1b0
[    1.761059]  put_device+0x13/0x20
[    1.761235]  snd_card_free+0x61/0x90 [snd]
[    1.761454]  snd_rme9652_probe+0x3be/0x700 [snd_rme9652]

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 sound/pci/rme9652/rme9652.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index 4df992e846f2..f407a95fc81f 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -1731,7 +1731,8 @@ static int snd_rme9652_free(struct snd_rme9652 *rme9652)
 	if (rme9652->port)
 		pci_release_regions(rme9652->pci);
 
-	pci_disable_device(rme9652->pci);
+	if (pci_is_enabled(rme9652->pci))
+		pci_disable_device(rme9652->pci);
 	return 0;
 }
 
-- 
2.25.1

