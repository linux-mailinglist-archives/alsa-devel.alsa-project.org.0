Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AA0733F1
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 18:30:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FAB018F2;
	Wed, 24 Jul 2019 18:29:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FAB018F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563985807;
	bh=7Z7PBfXoE52kQEHvTGNxzOFAZzeo5A/uMiYGV1b4Vq0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XiSTDK92GVq+qKehKpZjWePSJe9q9lHVGtxC3CBVaZuWhQT/UenIs1LKZehevuNmy
	 O8PvX4gn10DcYAXhhBrcxIBqGpuV6SSVtu613P+r/kbXS1lJkpsA0y4wCHphn6jZ0t
	 dkLL4wubZAzJ1zBCltvlgHvEcQPJThC8A8XNkBT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2816EF805A1;
	Wed, 24 Jul 2019 18:24:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93FE3F8049A; Wed, 24 Jul 2019 18:24:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCFB8F804A9
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 18:24:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCFB8F804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="tU0u8Kzo"
Received: by mail-wr1-x444.google.com with SMTP id z1so47622729wru.13
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 09:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UJ9KDGBOl8aIUqKuxRToZa5/dKJVoJYKCqFTu5LeV1A=;
 b=tU0u8Kzo4EqYFk+S/PB7XaSJUsAodzLIXYMpL2tWf18qebqFw73F789ZMYL9or9SsK
 dqKPqCfMrQm/8qtBnymmETaftmj2gXdDTqbZeXG94Gcn5Fb8vfeZiMuiL+siIEU4EZO/
 chX0PSxfTCfqr/6ho4HEP9cQJ2OvcSntdppRHBL7xpC02MhR5YZN537v2LeeBKtn3aS6
 B5HCEKhe4Bsa/xsFrKapjdoaJaoSFK7pS35WXAQ5rGtDx/6F5GLO3/LdkR2T/9mTXY2o
 RR5rolvIqI94A16zqWHC8eg7NqWQBgxATiaOGRqNE18Pf+VU9hDDWW9yyNX5nK4rWcRh
 S24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UJ9KDGBOl8aIUqKuxRToZa5/dKJVoJYKCqFTu5LeV1A=;
 b=oKdhoovSG/2Mr0lhNluAz0kjZkOw3ENvghFHDzqC6DEdUKZD2XUY7AqOtDDlw7D/Ql
 T7ewGN4QMmZjf3wH+lfMsnUWfA3k6hen87k2cRl+ROsKfv6tH6ENbBOOim/uoACTSQ9u
 Ork55ULh4ihNdUG6L4V7Yon3Q+2A2CxkKmb7YVYm2M3IwUDDdPehL6gTdsbWx0zQzFZp
 oHzK9iUwo9t/cXKjqrqpXZLekS5atCzivypQQ7ivQOWOpLKA6rZo8LV3IQLKpCksyP1H
 9XmCvxMrh7ZKQc9xRptv4g5QQ5ZDBpm0oZ+/8mNNxhDTJZH/YvIvsmEHS5dXbN9Z0FIA
 crzA==
X-Gm-Message-State: APjAAAVXLOXinFHWhgXuFOgI8BkWTZI5jwSDpxQJCo1t0KEL+CP5ApuG
 Fyrp1IiRQJvNCRQDKJWbBZyhDnK21gs=
X-Google-Smtp-Source: APXvYqzsz5R+uA08ZspQl/NwiF9hq2F7Y6DPHaohqRpu1K0XA0Ds+ppWxCNxwgiM91KqJEfr0XmU8A==
X-Received: by 2002:adf:da4d:: with SMTP id r13mr57578825wrl.281.1563985455657; 
 Wed, 24 Jul 2019 09:24:15 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id f70sm55688960wme.22.2019.07.24.09.24.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 09:24:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Wed, 24 Jul 2019 18:24:05 +0200
Message-Id: <20190724162405.6574-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724162405.6574-1-jbrunet@baylibre.com>
References: <20190724162405.6574-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 6/6] ASoC: codec2codec: fill some of the
	runtime stream parameters
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Set the information provided struct snd_soc_pcm_stream in the
struct snd_pcm_runtime of the codec to codec link.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-dapm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index e0eedff5fe94..a6bc3eda275d 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3892,6 +3892,11 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 			dapm_update_dai_unlocked(substream, &params, sink);
 		}
 
+		runtime->format = params_format(&params);
+		runtime->subformat = params_subformat(&params);
+		runtime->channels = params_channels(&params);
+		runtime->rate = params_rate(&params);
+
 		break;
 
 	case SND_SOC_DAPM_POST_PMU:
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
