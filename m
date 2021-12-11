Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6515F471744
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Dec 2021 00:13:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9FD41AEA;
	Sun, 12 Dec 2021 00:12:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9FD41AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639264413;
	bh=RK6M6WGVDvkL7zKHg2gwvJGNUiI0k05tjccd5eybRKk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KtWtEtgZY5yRZdkSBnLVXHiX4akPnd0YqJY9i/6Wuls37YRjUcDl6EjsgWUhyf34O
	 yEy9v/6kOFl7d4uXbtPOsZ7s4WL8lfu1j5IwVPN+SzenAHMLMMgEclWg7C96IY3CTs
	 4MjkKwGYwCRRixhBAxvyCDVKTITtS0CV+PMQMozw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62398F804CF;
	Sun, 12 Dec 2021 00:12:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4E7CF804CF; Sun, 12 Dec 2021 00:12:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 415C7F80059
 for <alsa-devel@alsa-project.org>; Sun, 12 Dec 2021 00:12:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 415C7F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iv1VPRF+"
Received: by mail-lj1-x22a.google.com with SMTP id i63so18714438lji.3
 for <alsa-devel@alsa-project.org>; Sat, 11 Dec 2021 15:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kPxf9grrnoWloQst2uU9IfqibnQT7tauNIkF1tWEVPM=;
 b=iv1VPRF+eoCMivY+B3upLgqHfCb4yEjs/UwpHIyzSI3osJrZtB1Uq4IM2Keaz6gflL
 o8nurH5MMlhEda26gC433U5qD5D+Q3FaV9OsfIyVxjFOVSjXN3nLmMjeWzmb/N8tq0D6
 09hvmSkKcZm5NwuqSteHIBZtZuNtfurf3sQPyi/Cgdtxw5SD2rxmO81Yc+R1P0X9WtXl
 Q6h3vt8JU7EyWrJ5/oZ2qHtOxQZzveu1w8apbHDCXuEJH/+BOWmUAfoC+oy1JCAtoUuJ
 45VhxEEc3FrvaiWKl8VDfCNJKDgopkHDT6DjaCZ++UlX4gk2FQQ8a+8sITwjaTTBCon0
 Pdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kPxf9grrnoWloQst2uU9IfqibnQT7tauNIkF1tWEVPM=;
 b=jZ0Aov9jEQbwo8GPej0P8L37CQ2n8B/n3MD9BYd/PsUS/edL9VM9hy1A4NPiZGOs3G
 C7LDDPxQqXGQ7EiuY9oWbbTAGcntn4swkHMBEGxPmxmWBTxdqCbU3upzfI3m/DZMsr1u
 44bm/araCHi+fuA5XFt8+VXMpRMzFTFQJPyWDxY646scFBWg3RUZ7zZ9zvbtN8C3BpLb
 Tn6b2Mi6uPXzVFPty7KIqYZYmGW89RqrM12EIs0MKo5Do22tbakJCl8SQvq00haabnoZ
 zKJ0PhsIqvmdmT+ZaAMSWo8t6jW6X2ObAyi7CNB8hZt17bBjhV66XNMqBeoNRu19aPX5
 RxRw==
X-Gm-Message-State: AOAM530aUsr/Bc+5O5IkazPkkdnhlITYUrH/JvIvwjROidmgHMe5j2t5
 L6ZEoXnlXApBbFUAdn3gjuc=
X-Google-Smtp-Source: ABdhPJz6U8F7uSQT0Ay6KQjB8ZUSZ03cdHyOnttDpC7Q5jA4IEL7tkiNymo0ZLbxwH4T2DRTMeznkA==
X-Received: by 2002:a2e:700d:: with SMTP id l13mr20988515ljc.219.1639264337371; 
 Sat, 11 Dec 2021 15:12:17 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id t204sm793683lff.87.2021.12.11.15.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 15:12:16 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Thomas Graichen <thomas.graichen@gmail.com>
Subject: [PATCH v1 1/2] ASoC: tegra: Add DAPM switches for headphones and mic
 jack
Date: Sun, 12 Dec 2021 02:11:45 +0300
Message-Id: <20211211231146.6137-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
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

UCM of Acer Chromebook (Nyan) uses DAPM switches of headphones and mic
jack. These switches were lost by accident during unification of the
machine drivers, restore them.

Cc: <stable@vger.kernel.org>
Fixes: cc8f70f ("ASoC: tegra: Unify ASoC machine drivers")
Reported-by: Thomas Graichen <thomas.graichen@gmail.com> # T124 Nyan Big
Tested-by: Thomas Graichen <thomas.graichen@gmail.com> # T124 Nyan Big
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index b95438c3dbf7..f3e86bd714b4 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -116,6 +116,8 @@ static const struct snd_kcontrol_new tegra_machine_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 	SOC_DAPM_PIN_SWITCH("Internal Mic 1"),
 	SOC_DAPM_PIN_SWITCH("Internal Mic 2"),
+	SOC_DAPM_PIN_SWITCH("Headphones"),
+	SOC_DAPM_PIN_SWITCH("Mic Jack"),
 };
 
 int tegra_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)
-- 
2.33.1

