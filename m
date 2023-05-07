Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D0B6F95BB
	for <lists+alsa-devel@lfdr.de>; Sun,  7 May 2023 02:37:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9269718CD;
	Sun,  7 May 2023 02:36:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9269718CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683419842;
	bh=w0/VlWq2cmv0raL1yTyE3NLrzjCf+QVPRk0dF2iGjqQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aE5nuevURo2v9wrAvr/HCQ5BhQtBSKfqDFidFYmsWE5JdvZlzYn9IBm7Yyz+xv3s1
	 xdV4O6t15xSEIMjUMRwqSIecmgibm2IWXJwuF0cmcCxJf6wrmkibihsa/j/n+V+Pce
	 /eYhSjqog18wVqSmW4jZ5JfP/9kTL3KQP/65ZPjY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C2B6F8057B;
	Sun,  7 May 2023 02:35:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0286F8057C; Sun,  7 May 2023 02:35:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4514AF80548
	for <alsa-devel@alsa-project.org>; Sun,  7 May 2023 02:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4514AF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AjWluKTt
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 36D9861500;
	Sun,  7 May 2023 00:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1635FC433EF;
	Sun,  7 May 2023 00:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683419730;
	bh=w0/VlWq2cmv0raL1yTyE3NLrzjCf+QVPRk0dF2iGjqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AjWluKTt6hEqpBZhmmMfl3ryl+v28q0jqISJ0hEBjbMn0OhK1pd03jQJij76C5ddB
	 gSkRPGDlEYm3soJqAx0DTDFmAazjrHJ94RyUebmqojNJerxYHxnDEAuHv/sW9LCBIn
	 XGQ6B4EYGQ+SygoATkdN0YZ3COnZujkCV4SJ9zRGd88Xfef8/YluC9N8P6NUV7er+Y
	 DB7ZKjbO/+JNyH1BllLAyfI2e7VthIwNtwdytx3GmbMDHSD+Mb7aTj6m2NxFzQukEf
	 OXaCMcy8XDvtVbEmqnP1hiPG7Uy9Pig27zCTVT800/AsFWN76J2Q0lPab0qFKfi/hB
	 8GtrkN7xqjVwA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 03/10] ASoC: tegra: Support coupled mic-hp
 detection
Date: Sat,  6 May 2023 20:35:09 -0400
Message-Id: <20230507003517.4078384-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507003517.4078384-1-sashal@kernel.org>
References: <20230507003517.4078384-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WGRJLP464SX7MG5ZC6EPD6G4QJRFJ6ZZ
X-Message-ID-Hash: WGRJLP464SX7MG5ZC6EPD6G4QJRFJ6ZZ
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Svyatoslav Ryhel <clamor95@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com, tiwai@suse.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, ion@agorria.com,
 jiapeng.chong@linux.alibaba.com, robh@kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WGRJLP464SX7MG5ZC6EPD6G4QJRFJ6ZZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Svyatoslav Ryhel <clamor95@gmail.com>

[ Upstream commit eb0b8481c2e03a5ae01f6bea60b42109bd12b6fe ]

This quirk is used for cases when there is GPIO which detects
any type of 3.5 Jack insertion and actual type of jack is defined
by other GPIO. 3.5 Jack GPIO generates interrupt and MIC GPIO
indicates type of Jack only if 3.5 Jack GPIO is active.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Link: https://lore.kernel.org/r/20230308073502.5421-3-clamor95@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/tegra/tegra_asoc_machine.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 2e549b69061ca..21ae1dd5191ca 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -51,6 +51,17 @@ static struct snd_soc_jack_gpio tegra_machine_headset_jack_gpio = {
 };
 
 /* Mic Jack */
+static int coupled_mic_hp_check(void *data)
+{
+	struct tegra_machine *machine = (struct tegra_machine *)data;
+
+	/* Detect mic insertion only if 3.5 jack is in */
+	if (gpiod_get_value_cansleep(machine->gpiod_hp_det) &&
+	    gpiod_get_value_cansleep(machine->gpiod_mic_det))
+		return SND_JACK_MICROPHONE;
+
+	return 0;
+}
 
 static struct snd_soc_jack tegra_machine_mic_jack;
 
@@ -183,8 +194,15 @@ int tegra_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)
 			return err;
 		}
 
+		tegra_machine_mic_jack_gpio.data = machine;
 		tegra_machine_mic_jack_gpio.desc = machine->gpiod_mic_det;
 
+		if (of_property_read_bool(card->dev->of_node,
+					  "nvidia,coupled-mic-hp-det")) {
+			tegra_machine_mic_jack_gpio.desc = machine->gpiod_hp_det;
+			tegra_machine_mic_jack_gpio.jack_status_check = coupled_mic_hp_check;
+		};
+
 		err = snd_soc_jack_add_gpios(&tegra_machine_mic_jack, 1,
 					     &tegra_machine_mic_jack_gpio);
 		if (err)
-- 
2.39.2

