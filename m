Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2116192A3
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 09:19:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 562EE16A0;
	Fri,  4 Nov 2022 09:18:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 562EE16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667549950;
	bh=XaK8ZsJ0ojvZ0nsM+wfVszODQY15sBeNjY4qW3NZQK4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KDi5KC950XxXZU3kQx8a8ofAgdm5UJ+ppexAk+ULyE/mdR5NFzzOyunvKs2hgF0Jc
	 BFxeXsnsrCKzV1vyLhLVN8rbXWPUO1I5y7rn+EJaHazYZRxUHDvaQPQhFpBDj3Y7qJ
	 RtMnl48brOcKm5uveu06StXOFJuoU5iW+0aSGu/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22822F8057F;
	Fri,  4 Nov 2022 09:16:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1AFCF8051E; Thu,  3 Nov 2022 15:46:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8848DF80155
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 15:46:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8848DF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="iTRxiwXg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667486782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CJkpFb1DAm+sVktUmkKDmWhR4Gb2Q3CNwmufg7Xs7+c=;
 b=iTRxiwXgfwvaDhFYEG1Ceh9k2bLu5VBRmH/0LU4SdjE2tqmrwcdwAF101mEZZ3StuhAI7V
 X1LpB4I127XPBdwaHtl6xJEkxBAzc2GS8UFoAieB0pn16Tts/Uk/m+ib2YB7c7khH/FI37
 hoHy2BUGINwrMvl2EgnRhECpJsynmYg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-477-GOPyb3KCOy6BMPbLGO3TCw-1; Thu, 03 Nov 2022 10:46:20 -0400
X-MC-Unique: GOPyb3KCOy6BMPbLGO3TCw-1
Received: by mail-qt1-f200.google.com with SMTP id
 c11-20020ac87dcb000000b0039cdb815f3bso1982058qte.4
 for <alsa-devel@alsa-project.org>; Thu, 03 Nov 2022 07:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CJkpFb1DAm+sVktUmkKDmWhR4Gb2Q3CNwmufg7Xs7+c=;
 b=KOyeXVFolABwrxpS9nUl5rLKqQq9V8/8i8asAO6R2TznaCbvJup6qYDHqwqN8NWgiy
 7S8qIGEN8VNTf85pA9q9kqXHjHPuSV10wrUFfqLIcMCp+RmYAxPDcaamHGEZFESqomLN
 93G5zIxDIy7UjFbKGvKZ46j5BuTe13O/gbZK28o9vXzNk/YljZgq/xHIzA0UqS924IfJ
 d9e2+boB/zJjruF3r+H2Czb60pl1lUSzRyIvEDAvXstXPUSz2JCtxwqeTuSnx4dRGwED
 zKfWMX0IO3H77oS4DEn7fJWKbTA952DzH0WcEzUE8jURYNDU8AjzAoYrqgQVKkHzclfa
 NpVQ==
X-Gm-Message-State: ACrzQf20gqr/1+q3CmKppS6+MYUvl1XpuSBF0M169fGJF7FigPwaqoff
 ug8qyk5coK5mqWVh6RfujORrtIzfS6/meCcW61wj+//WEzFEc5Z1rncAwCe71IbzUYtbMwXuWTM
 RJyxWR7YuC+fF+hFLYf7feHU=
X-Received: by 2002:a05:620a:244d:b0:6ee:7a23:dfa6 with SMTP id
 h13-20020a05620a244d00b006ee7a23dfa6mr23135217qkn.463.1667486780483; 
 Thu, 03 Nov 2022 07:46:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM44Qf1+rRdA3GgSs9RSbnt8FRAE99HpxH7zhBi9j+kvh16bWVVObc8Hqnl0MvXVtoxAOKZg8w==
X-Received: by 2002:a05:620a:244d:b0:6ee:7a23:dfa6 with SMTP id
 h13-20020a05620a244d00b006ee7a23dfa6mr23135175qkn.463.1667486780123; 
 Thu, 03 Nov 2022 07:46:20 -0700 (PDT)
Received: from p1.montleon.intra (066-026-073-226.inf.spectrum.com.
 [66.26.73.226]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05620a244f00b006fa468342a3sm873175qkn.108.2022.11.03.07.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 07:46:19 -0700 (PDT)
From: Jason Montleon <jmontleo@redhat.com>
To: pierre-louis.bossart@linux.intel.com
Subject: [PATCH v4 1/2] ASoC: rt5514: fix legacy dai naming
Date: Thu,  3 Nov 2022 10:46:11 -0400
Message-Id: <20221103144612.4431-1-jmontleo@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Mailman-Approved-At: Fri, 04 Nov 2022 09:16:01 +0100
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, regressions@lists.linux.dev,
 jmontleo@redhat.com, cezary.rojewski@intel.com, stable@vger.kernel.org,
 tiwai@suse.com, broonie@kernel.org
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

Starting with 6.0-rc1 these messages are logged and the sound card
is unavailable. Adding legacy_dai_naming to the rt5514-spi causes
it to function properly again.

[   16.928454] kbl_r5514_5663_max kbl_r5514_5663_max: ASoC: CPU DAI
spi-PRP0001:00 not registered
[   16.928561] platform kbl_r5514_5663_max: deferred probe pending

Fixes: fc34ece41f71 ("ASoC: Refactor non_legacy_dai_naming flag")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=216641
Signed-off-by: Jason Montleon <jmontleo@redhat.com>
---
 sound/soc/codecs/rt5514-spi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 1a25a3787935..362663abcb89 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -298,13 +298,14 @@ static int rt5514_spi_pcm_new(struct snd_soc_component *component,
 }
 
 static const struct snd_soc_component_driver rt5514_spi_component = {
-	.name		= DRV_NAME,
-	.probe		= rt5514_spi_pcm_probe,
-	.open		= rt5514_spi_pcm_open,
-	.hw_params	= rt5514_spi_hw_params,
-	.hw_free	= rt5514_spi_hw_free,
-	.pointer	= rt5514_spi_pcm_pointer,
-	.pcm_construct	= rt5514_spi_pcm_new,
+	.name			= DRV_NAME,
+	.probe			= rt5514_spi_pcm_probe,
+	.open			= rt5514_spi_pcm_open,
+	.hw_params		= rt5514_spi_hw_params,
+	.hw_free		= rt5514_spi_hw_free,
+	.pointer		= rt5514_spi_pcm_pointer,
+	.pcm_construct		= rt5514_spi_pcm_new,
+	.legacy_dai_naming	= 1,
 };
 
 /**
-- 
2.37.3

