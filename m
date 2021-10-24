Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4EA438BA4
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Oct 2021 21:31:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F77C1676;
	Sun, 24 Oct 2021 21:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F77C1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635103911;
	bh=UwS5inRIoY5tmGjIcUIfra5d2Km6gX7ZMf/0Pg3WWcM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JzrwC/qpfm2qU9B91n5vEciJJFn8xmHc/8R+uhAvc2riN2NKStchISbMq3h/hVB14
	 2dzlibMPRgG2qAEWGIfAQ64FM4++xvg1bfESeSDYnsdJbApq8pA/0uOqEKpDgAqCFQ
	 xb0wCi1HuzBNYHTIaNrDJz7+jgYM1h+D07J50x9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B126BF80300;
	Sun, 24 Oct 2021 21:30:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3969EF8013D; Sun, 24 Oct 2021 21:30:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4802BF8013D
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 21:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4802BF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JkkG3uRp"
Received: by mail-lf1-x136.google.com with SMTP id bq11so4937011lfb.10
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 12:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fssUPo649zl7hYXCezg8n0RZeu85Xq1Alf+1ngKVAWs=;
 b=JkkG3uRp6UIRQc8S3URH/qL5Y36IGMonoPcLuVzDUz5yFLlplSZr6YivUkaXR8eg1m
 Y6zMydyKTnWaGc1yz25mGzthi2KJ8K+KSsLomf22u1bYyRL3lELbk4/h9/ARaPJROpL6
 fzmHp65yEc6iexeIFLQk3HW82i/GZ91Gjg6YIU/9ZHuWTnp/AacuklVfVeJbppQE3rd3
 MbpYtzMW6PlkMma9FY+ZgrAMj6bInidDUMKizhXfyYXW/MQb8CnoF2Ru0nJMA7tD5EYN
 OfMSIQhFZeab9HzwwbyORdboAWnIUC3FwpNqkFEh8yK0wqdP4dR1ekdyGOm5ppE4CJXO
 iZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fssUPo649zl7hYXCezg8n0RZeu85Xq1Alf+1ngKVAWs=;
 b=pB4YbErMlp7UWed7l8Lh4u7Je/nTzTSzRRcnHjhoSjdWjFSSnugXDo/HyosX7uFNWM
 G2Gr7aIUv1uZt8+/6K1KKV2jMXi+AyGYFv+EehJRUnL0dWUuDZVBGmmsSs+2kf9kNwog
 kByhlc+q9WzVgLFrSQCXp10rvj0M+F+qUadtc8ZBxzyogPQ5fWlJJfCqt+gUoZrI4BRf
 N168+PslHeeMZFnJ4O6HYysEdUACwSyWU2TLdOeEk9jlATx1BicuWehF6GX9r6XYA6Ev
 zdOV7weKAVbTKQRaJzq1wCs96+/fvUoafz/Xf3xd+SirvQQwK5ZnK+XWibgGphDzNxub
 sLaQ==
X-Gm-Message-State: AOAM530O0xItrqQdQ7UNxISx+9JFpCyUwAWvDjZpeLR0nmDTnmM87hSM
 E+3MB4eZbG0t31FC475GyTE=
X-Google-Smtp-Source: ABdhPJzZw1oH1wNEEPnqrJKVnnGPyxkUNeSSGCfgs8uqukJkiYf3SfVa5/DG7hsouGPhzLpngVGoqQ==
X-Received: by 2002:ac2:5328:: with SMTP id f8mr3258220lfh.233.1635103795071; 
 Sun, 24 Oct 2021 12:29:55 -0700 (PDT)
Received: from localhost.localdomain (46-138-50-159.dynamic.spd-mgts.ru.
 [46.138.50.159])
 by smtp.gmail.com with ESMTPSA id t20sm1616902lft.240.2021.10.24.12.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 12:29:54 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 2/2] ASoC: tegra: Set default card name for Trimslice
Date: Sun, 24 Oct 2021 22:28:53 +0300
Message-Id: <20211024192853.21957-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211024192853.21957-1-digetx@gmail.com>
References: <20211024192853.21957-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

The default card name for Trimslice device should be "tegra-trimslice".
It got lost by accident during unification of machine sound drivers,
fix it.

Cc: <stable@vger.kernel.org>
Fixes: cc8f70f56039 ("ASoC: tegra: Unify ASoC machine drivers")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index d92fabff08bc..b95438c3dbf7 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -725,6 +725,7 @@ static struct snd_soc_dai_link tegra_tlv320aic23_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_trimslice = {
+	.name = "tegra-trimslice",
 	.components = "codec:tlv320aic23",
 	.dai_link = &tegra_tlv320aic23_dai,
 	.num_links = 1,
-- 
2.33.1

