Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 582BA8A9F5F
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:59:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68E6B2BCC;
	Thu, 18 Apr 2024 17:59:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68E6B2BCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455989;
	bh=8WkGnONM8NyXHIZlC0inPFTNaIF8xV/m3ME04BID7B0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DcXva41domYQqt+6fsrQ0IqR1QOhjR73KosQgB4yS/t32t5tmPZ29+AMP6QPOv7uG
	 2w6YMhD61Lyd2HArwxbSEW5PKVn0S5hzv/BuKBISJ6r7GOtuplutaHjDYbDPPrPmji
	 3RtZHk62OmWZjZwTutCnoNrWr6yjg30o3m1DN+sM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7738F89734; Thu, 18 Apr 2024 17:53:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40DAAF89732;
	Thu, 18 Apr 2024 17:53:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43784F8025A; Wed, 17 Apr 2024 20:42:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E884F80124
	for <alsa-devel@alsa-project.org>; Wed, 17 Apr 2024 20:42:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E884F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YTGJeotf
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1e51398cc4eso626575ad.2
        for <alsa-devel@alsa-project.org>;
 Wed, 17 Apr 2024 11:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713379329; x=1713984129;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p6icFNRiHIPy7y0oehBoYWRS/JN2fyumo7JjrGWSgTc=;
        b=YTGJeotfToz0Bv4ykKrKXgIr2zpbewdGE+rnifiBQoZNmJAW6xUHReVQQ2B6HSeU/U
         JLiheG/hUvF9K7AxMm/2XJptXkzygDIl2yzzYYK+Uyp7bL81J5GozHOJlpy7hYhu5up8
         wW5J69gcMIAOw789Hiim7+UW7+sHdAwl9XB4hqG5x1/IRV28J88j/IjtpUrNTGaLlBRk
         DpgKJ6GPgp/g7ARRl6bRu6FFUqTfjwu/8N4CZhSi/qCNXG7klWAwnH/kgXliHhIkiF/G
         t344ARXR9AnaAF0A+q+rZ/YHxDfykE7S81T4rSwnnI5lK78EJL6qgf4hfm2BmYaj40zy
         B7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713379329; x=1713984129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p6icFNRiHIPy7y0oehBoYWRS/JN2fyumo7JjrGWSgTc=;
        b=HZ/CIXtfyuKulAb6pWv47/Zuq5/aluZdVwgrdMY1Yw4yRV2IKywrul/S9zKMrAO3Ja
         IepsWgh04YKtmB4DqVeqr1elZ6OK1e2Hidi5SrYzuI1xOguTUKtwlO+mRQwQMnI/ia+Q
         EFatG9E1JAhG/Ib9LEeD1DcwzONDa2Kc/K/V1WdP/Y2KukmPAuh0eZzjWuWcg8YusxjC
         z1xtQzUSW31rGdfwWgGyixQABdPa769U3IjXTpJ2A+Vp94Py44P6d+PM06JJVkOuFVun
         aO8DnUNHEHuiERd2on32FgEztxWUMAuZu2teVfu+XcWCD8jX6993YkukVUsDEfWhPKbH
         p18w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd5zNhcjlyNHkU1EqYHKxFoO7vBP8r2ENWILYiGChTdLhRnzOBwDVEOT+Bodl9nkGfEvQ5QZ4AKioMPZZzH7SI9se4cdnN5fy1tfI=
X-Gm-Message-State: AOJu0YxtiyW/BAUrOI5L6j6CkBnWGJ/E0C2NiSO/cUdT+EtCygl+zAhY
	PTerE7I7VzmdCkqBfyETHzXoKsx8Bk3HMfnkiE1fo/PbaWeTyPYn
X-Google-Smtp-Source: 
 AGHT+IEMhCcxW5qKw/Nqo4PSr+iM5I23X69j3QH1wQH6SLQ/joYej+do+lIb3YoB+gOh/fd+u/kDnw==
X-Received: by 2002:a17:902:d4ce:b0:1e6:3494:61fc with SMTP id
 o14-20020a170902d4ce00b001e6349461fcmr570341plg.0.1713379329167;
        Wed, 17 Apr 2024 11:42:09 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([201.82.41.210])
        by smtp.gmail.com with ESMTPSA id
 c17-20020a170902d49100b001e0d6cd042bsm11873501plg.303.2024.04.17.11.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 11:42:08 -0700 (PDT)
From: Joao Paulo Goncalves <jpaulo.silvagoncalves@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Jai Luthra <j-luthra@ti.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: ti: davinci-mcasp: Fix race condition during probe
Date: Wed, 17 Apr 2024 15:41:38 -0300
Message-Id: <20240417184138.1104774-1-jpaulo.silvagoncalves@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: jpaulo.silvagoncalves@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HVCL56XTL5XVTN5DAI3SMMBGGDMJPUWK
X-Message-ID-Hash: HVCL56XTL5XVTN5DAI3SMMBGGDMJPUWK
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:52:46 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVCL56XTL5XVTN5DAI3SMMBGGDMJPUWK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Joao Paulo Goncalves <joao.goncalves@toradex.com>

When using davinci-mcasp as CPU DAI with simple-card, there are some
conditions that cause simple-card to finish registering a sound card before
davinci-mcasp finishes registering all sound components. This creates a
non-working sound card from userspace with no problem indication apart
from not being able to play/record audio on a PCM stream. The issue
arises during simultaneous probe execution of both drivers. Specifically,
the simple-card driver, awaiting a CPU DAI, proceeds as soon as
davinci-mcasp registers its DAI. However, this process can lead to the
client mutex lock (client_mutex in soc-core.c) being held or davinci-mcasp
being preempted before PCM DMA registration on davinci-mcasp finishes.
This situation occurs when the probes of both drivers run concurrently.
Below is the code path for this condition. To solve the issue, defer
davinci-mcasp CPU DAI registration to the last step in the audio part of
it. This way, simple-card CPU DAI parsing will be deferred until all
audio components are registered.

Fail Code Path:

simple-card.c: probe starts
simple-card.c: simple_dai_link_of: simple_parse_node(..,cpu,..) returns EPROBE_DEFER, no CPU DAI yet
davinci-mcasp.c: probe starts
davinci-mcasp.c: devm_snd_soc_register_component() register CPU DAI
simple-card.c: probes again, finish CPU DAI parsing and call devm_snd_soc_register_card()
simple-card.c: finish probe
davinci-mcasp.c: *dma_pcm_platform_register() register PCM  DMA
davinci-mcasp.c: probe finish

Cc: stable@vger.kernel.org
Fixes: 9fbd58cf4ab0 ("ASoC: davinci-mcasp: Choose PCM driver based on configured DMA controller")
Signed-off-by: Joao Paulo Goncalves <joao.goncalves@toradex.com>
---
 sound/soc/ti/davinci-mcasp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index b892d66f78470..1e760c3155213 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -2417,12 +2417,6 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 
 	mcasp_reparent_fck(pdev);
 
-	ret = devm_snd_soc_register_component(&pdev->dev, &davinci_mcasp_component,
-					      &davinci_mcasp_dai[mcasp->op_mode], 1);
-
-	if (ret != 0)
-		goto err;
-
 	ret = davinci_mcasp_get_dma_type(mcasp);
 	switch (ret) {
 	case PCM_EDMA:
@@ -2449,6 +2443,12 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 		goto err;
 	}
 
+	ret = devm_snd_soc_register_component(&pdev->dev, &davinci_mcasp_component,
+					      &davinci_mcasp_dai[mcasp->op_mode], 1);
+
+	if (ret != 0)
+		goto err;
+
 no_audio:
 	ret = davinci_mcasp_init_gpiochip(mcasp);
 	if (ret) {
-- 
2.34.1

