Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2627C6F9574
	for <lists+alsa-devel@lfdr.de>; Sun,  7 May 2023 02:34:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19A3F17F8;
	Sun,  7 May 2023 02:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19A3F17F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683419649;
	bh=40z2ZpojbXuP6tB3+OAoSZu6KHvjy/jbjRj5UZ9K8Nw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=as2Hg7wsQUa4VWcvrZ8N4iqpFqOPZWWE/Ws9MR3RTE3gZfHp/YpWHA3BWQNg4bwnU
	 06+lAegzz6U2CxwAJRXhReP6QBdGdTyEJKkLYwDrIlsAMDKCnNRQ/u+Czf7s7XsAMx
	 BtQTqvgEW7WQVSeQx5lS8bce4pdRk1kB29UEEGzY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54689F8053D;
	Sun,  7 May 2023 02:33:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBC39F80548; Sun,  7 May 2023 02:33:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25B9DF8053B
	for <alsa-devel@alsa-project.org>; Sun,  7 May 2023 02:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25B9DF8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qjfVFoE4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0BB46614D3;
	Sun,  7 May 2023 00:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09087C433D2;
	Sun,  7 May 2023 00:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683419584;
	bh=40z2ZpojbXuP6tB3+OAoSZu6KHvjy/jbjRj5UZ9K8Nw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qjfVFoE4RPhkELOCVf9rbOFEKk19Q1zv2OSTY+qTucKOlD3IScSBpXO5y90EEysDY
	 QinuuxuXsgPKr979gvP/OLKFgyqXF/s90xEgylJ01v1SNkhKf3qsTu7Vt98s+lPJGN
	 tI6jepOTVZh1zk3RMla8sgleR81nINkxuAioAUNtPjoWP88XjQk3WqqZIi9f9GqWVZ
	 2s3mDEbGZ9KOW3RefuY8zHDHL3Dci9PHKzcDPSI4HoPm24NUdjYJMRx+TKFbIQ2ATp
	 y7awlCJR5SViFtzD3gXezxtigfY4IQ4eSY7kzu01enTJWJQpnzcHh0vCFpLDgrlvbB
	 k1AMZBjE3vXFQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 06/20] ASoC: tegra: Support coupled mic-hp
 detection
Date: Sat,  6 May 2023 20:32:21 -0400
Message-Id: <20230507003237.4074305-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507003237.4074305-1-sashal@kernel.org>
References: <20230507003237.4074305-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DRLY4CW7ZNEKF3JCACFCB37EPNLD34YA
X-Message-ID-Hash: DRLY4CW7ZNEKF3JCACFCB37EPNLD34YA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DRLY4CW7ZNEKF3JCACFCB37EPNLD34YA/>
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
index 78faa8bcae274..7b6d5d90c3a2d 100644
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

