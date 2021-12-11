Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81914471745
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Dec 2021 00:14:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24A091B12;
	Sun, 12 Dec 2021 00:13:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24A091B12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639264446;
	bh=CKSd2ptLdyw/tZCO5oaWtkuWKH6AW8oh6EwLxuQWlIo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UBxfMzQcCYsuDWUDlX2Ty+VwYDHoIUrjdOPeJCbqcicBILhoYKzhHDZcJveJ0jxvh
	 /iGyWTmkrg+jpb7IpxaQj1V9RcN80TiP4UhY998UMG/jKYeheuGUdd2WF8qSN+oeV7
	 C7WB58WuJ/JrtBa9a9D2fMqxmuuurfzS8hQ2YvG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11699F804FC;
	Sun, 12 Dec 2021 00:12:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55D53F804CC; Sun, 12 Dec 2021 00:12:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9874F80083
 for <alsa-devel@alsa-project.org>; Sun, 12 Dec 2021 00:12:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9874F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="E4wlOElm"
Received: by mail-lf1-x134.google.com with SMTP id b1so24287712lfs.13
 for <alsa-devel@alsa-project.org>; Sat, 11 Dec 2021 15:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ym10hnKuBcKIeD8nrAPP58e/kT21b1G7mLiKyPVSoD4=;
 b=E4wlOElmgq674cOJXJQJXdmVOktVmiFgjL5N4aj28JpOAZdJSt9+4bG7fgykIVrqa2
 At1U9jdqcTVZrBgym5DzdRTR5Q12P+JsrVNWkJkwkjcXVOppe1/92PR9yr1MGaAULjad
 1KzUsponnMNj9ks6BdyeClPCbe8txCoo9bUfIpXvZKe3SlovsXB9TQpbfucZKO0hcA0b
 m5qvGodI8eL0B9st8CUfHt4LGoAcnICxQUOUlXVHmeLQbJam230QznJ/8zsYFIH8BuVy
 cXn2mZSRRllixL6vj87XhkVW2RGN1RHF8ISureR1JTRPSGsgxp79p3UwAf2J2SbTss3k
 tifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ym10hnKuBcKIeD8nrAPP58e/kT21b1G7mLiKyPVSoD4=;
 b=oKWzNjiQMSECH48sufbgdbMXKbaPEZzGEhMlsU2shs+0GCFw5GAflD0d9xDJLLHJDU
 7x4kEWm4BEF7rFZCAURx7vHIW5YNsaSJcvyfmtszWDvLsbG/vxqZW8aqlEskSuxCege0
 oETA/GwPCS88/IXuWLf0/rmTZYf7i2IZ4tDy7VrQIDI9JM5zEzmb3yUX5/i/hxd+v5Xq
 2g4Rdb/Dc8D/Wrc4U60rB0r0rYbFytNt+43PGATTEW3tCRmqMTWOJJudnpRSz1NKG1wr
 vrp0/mWIMHdElqxQ7mgeddd3xk6dkAgECw4KjxFkTjODFxRdfTggcU/Ir9DhuL2tNORO
 bjqg==
X-Gm-Message-State: AOAM532+JrBq/94qgaYakHIW//z5V9czgjRutO2rFd4dCHgN4Qig3j6j
 ucb6pvPKTwCg59+9Kkoc2Pw=
X-Google-Smtp-Source: ABdhPJzNfB/rGRkTLf61EvGxKr6RAEK9Chuavx+JfSsufGjNr/bGWUj5dyCuKl8VcMqRB6aDPI3wnQ==
X-Received: by 2002:a05:6512:344d:: with SMTP id
 j13mr21650892lfr.347.1639264338308; 
 Sat, 11 Dec 2021 15:12:18 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id t204sm793683lff.87.2021.12.11.15.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 15:12:17 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Thomas Graichen <thomas.graichen@gmail.com>
Subject: [PATCH v1 2/2] ASoC: tegra: Restore headphones jack name on Nyan Big
Date: Sun, 12 Dec 2021 02:11:46 +0300
Message-Id: <20211211231146.6137-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211211231146.6137-1-digetx@gmail.com>
References: <20211211231146.6137-1-digetx@gmail.com>
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

UCM of Acer Chromebook (Nyan) uses a different name for the headphones
jack. The name was changed during unification of the machine drivers and
UCM fails now to load because of that. Restore the old jack name.

Cc: <stable@vger.kernel.org>
Fixes: cc8f70f ("ASoC: tegra: Unify ASoC machine drivers")
Reported-by: Thomas Graichen <thomas.graichen@gmail.com> # T124 Nyan Big
Tested-by: Thomas Graichen <thomas.graichen@gmail.com> # T124 Nyan Big
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 9 ++++++++-
 sound/soc/tegra/tegra_asoc_machine.h | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index f3e86bd714b4..a73404879aa1 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -124,10 +124,16 @@ int tegra_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct tegra_machine *machine = snd_soc_card_get_drvdata(card);
+	const char *jack_name;
 	int err;
 
 	if (machine->gpiod_hp_det && machine->asoc->add_hp_jack) {
-		err = snd_soc_card_jack_new(card, "Headphones Jack",
+		if (machine->asoc->hp_jack_name)
+			jack_name = machine->asoc->hp_jack_name;
+		else
+			jack_name = "Headphones Jack";
+
+		err = snd_soc_card_jack_new(card, jack_name,
 					    SND_JACK_HEADPHONE,
 					    &tegra_machine_hp_jack,
 					    tegra_machine_hp_jack_pins,
@@ -660,6 +666,7 @@ static struct snd_soc_card snd_soc_tegra_max98090 = {
 static const struct tegra_asoc_data tegra_max98090_data = {
 	.mclk_rate = tegra_machine_mclk_rate_12mhz,
 	.card = &snd_soc_tegra_max98090,
+	.hp_jack_name = "Headphones",
 	.add_common_dapm_widgets = true,
 	.add_common_controls = true,
 	.add_common_snd_ops = true,
diff --git a/sound/soc/tegra/tegra_asoc_machine.h b/sound/soc/tegra/tegra_asoc_machine.h
index d6a8d1320551..6f795d7dff7c 100644
--- a/sound/soc/tegra/tegra_asoc_machine.h
+++ b/sound/soc/tegra/tegra_asoc_machine.h
@@ -14,6 +14,7 @@ struct snd_soc_pcm_runtime;
 struct tegra_asoc_data {
 	unsigned int (*mclk_rate)(unsigned int srate);
 	const char *codec_dev_name;
+	const char *hp_jack_name;
 	struct snd_soc_card *card;
 	unsigned int mclk_id;
 	bool hp_jack_gpio_active_low;
-- 
2.33.1

