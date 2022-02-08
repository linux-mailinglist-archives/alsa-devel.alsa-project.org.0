Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 591E04AD3E3
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 09:45:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0168117A5;
	Tue,  8 Feb 2022 09:44:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0168117A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644309909;
	bh=a6vgBGTpTCWKD2K/Lu1HjpQs1vhJPHH2BmOpsR0sSHY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Po1lc9NJv+8/buMApJIXtAbbqTiaKBVCgo5fxcSOvdv+5vdxK/kNwz098/tBx+rAv
	 8KtTF1BPxGQ6w3ZfmIDt/+DOxqDeEmhhLk/szDxCPRhINO98Bn8vfxcNAEc0v/HvXg
	 7ZgzlOy+tCNBSX5KMOcPpVOpx3kSJ7RWu3OH+XNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FACFF80161;
	Tue,  8 Feb 2022 09:42:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C15CCF80161; Tue,  8 Feb 2022 09:42:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D61ABF80161
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 09:42:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D61ABF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cogentembedded-com.20210112.gappssmtp.com
 header.i=@cogentembedded-com.20210112.gappssmtp.com header.b="3MWbe0vi"
Received: by mail-lf1-x12a.google.com with SMTP id u6so31844010lfm.10
 for <alsa-devel@alsa-project.org>; Tue, 08 Feb 2022 00:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OqsnPBD75OEIg0YKhpWxP7ylQrnXYC+DLarhM8bDSAE=;
 b=3MWbe0vi62zn/YVDnF5AtSjnMWk8c4SBFKMTP6yKlW3QOxcHBOzJnAJuDxR7FCvAGs
 Ps1jDNA7iChEK/zGZ7XUHry/uWERzhbiHUYdDpQjU2KjSMsmrlXrCF5s/LcYL3Ixpwoi
 awrIfufh4k7dLcivn5jOg2y2BbEbiAtCWZ0USyrE9hXvvZON6+yHTGjy9fblj3HTzsEh
 TiC2cYjWPffoFw3xbdE4jq6adsp2ji2X5N16P/WDZVtc66nlOiRL+WnFAydGbuBquRV7
 WP0IEiZjvq7h0IC+JrttRh7CnsEACVKT4o2Rz61YE04PQ/uvfFoeX6Kc0W0kA3jd/gqC
 /JOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OqsnPBD75OEIg0YKhpWxP7ylQrnXYC+DLarhM8bDSAE=;
 b=KeUCbID3UPraoBpbklw2wD4cKvedhlLLfFnss/aNSFtMfoZ8CdntiTdIWjEdsgsiTG
 YOtFhVW02twL7jlBo1FgwI4KjBjoDsoKxE9jEtOcpuzeMw9lA4cxfGw0FJsQPaMozume
 kPLGSw0MIPp/UVvVSSE12+18tv7BQ3iPACPKyYeOPy+lA23wcDPMBeJLzv/q1UoFZmAg
 D1dc8nDivezW9o3IOP6aKSQpJ+Mc7q1KSaXnxkHAEgLeTmbW198ObbLS7fiFXZ1sva/N
 WbwJTKe7uhRiNu7wwLizCRjSMNjt9iqTeaT0NKWlcxHj6WnNbgWQ/Mgp3t1UxcmJutYM
 to5A==
X-Gm-Message-State: AOAM532jMCfsPIc4rKmxD4d2vp4aEAW7kQ35Cs4Pd3QBJw0KNrd5xhpl
 c846w12xzAKq+kUukIM+4Fif5w==
X-Google-Smtp-Source: ABdhPJyRjmxFsSQKhUcZklAkzKieZBtNVZ0fLTFeF4+lWwQjOFe79DqlC62orWr4LAzCsom/vZ4HFw==
X-Received: by 2002:ac2:46ed:: with SMTP id q13mr2283630lfo.99.1644309764661; 
 Tue, 08 Feb 2022 00:42:44 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
 by smtp.gmail.com with ESMTPSA id o12sm1830361lfu.96.2022.02.08.00.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 00:42:44 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/4] ASoC: pcm3168a: remove numeric PCM3168A_NUM_SUPPLIES
Date: Tue,  8 Feb 2022 11:42:20 +0300
Message-Id: <20220208084220.1289836-5-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220208084220.1289836-1-nikita.yoush@cogentembedded.com>
References: <20220208084220.1289836-1-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Just use ARRAY_SIZE() instead.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 sound/soc/codecs/pcm3168a.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 1d3821f2c5f1..7417cf45d916 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -34,8 +34,7 @@
 #define PCM3168A_FMT_I2S_TDM		0x6
 #define PCM3168A_FMT_LEFT_J_TDM		0x7
 
-#define PCM3168A_NUM_SUPPLIES 6
-static const char *const pcm3168a_supply_names[PCM3168A_NUM_SUPPLIES] = {
+static const char *const pcm3168a_supply_names[] = {
 	"VDD1",
 	"VDD2",
 	"VCCAD1",
@@ -57,7 +56,7 @@ struct pcm3168a_io_params {
 };
 
 struct pcm3168a_priv {
-	struct regulator_bulk_data supplies[PCM3168A_NUM_SUPPLIES];
+	struct regulator_bulk_data supplies[ARRAY_SIZE(pcm3168a_supply_names)];
 	struct regmap *regmap;
 	struct clk *scki;
 	struct gpio_desc *gpio_rst;
-- 
2.30.2

