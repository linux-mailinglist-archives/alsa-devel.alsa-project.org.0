Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 176AE6B05BF
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 12:22:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FEF817C8;
	Wed,  8 Mar 2023 12:21:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FEF817C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678274538;
	bh=loyDz9yJuafSlo1nbkMlH5QST7DnoH1EIXvfgrL+198=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IIj3/lUxedidp5TvJEUHHOOx9DNg8Pi8O9K9/xaKpueinJg22R1kds81shi2YtMAP
	 y4wPN821XA4wq5L+gejyY6BGuPHJ50RwQHg0ffTJgw99C134x6AO5GBD3dae2bJ+ve
	 ZA39vg9HvCYeomTjVviAp1ZTB+4i5LrLotHROKFE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF6DDF80542;
	Wed,  8 Mar 2023 12:19:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEAF8F80533; Wed,  8 Mar 2023 08:35:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 599BDF80431
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 08:35:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 599BDF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gfFE6M8D
Received: by mail-ed1-x529.google.com with SMTP id a25so62257382edb.0
        for <alsa-devel@alsa-project.org>;
 Tue, 07 Mar 2023 23:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678260925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlkyO8OW+WgRQk2FFiUYUZ/IqArcuXEwbJRily5asgc=;
        b=gfFE6M8DHtIav5RU6MsJ3sTZtpxapVJLnD8kVuiiozcjPo1XQt7IOzULrdEeV6Ahgs
         iUWujv1S+BM7sNUt1+eH9PhUb48XhuuB2bfK+8kmt10oXE804Y0eJw4HShFnmVMJS+q0
         MZaeF+1WVM2fBRbuxRN7i9bC99UNr+pqarOQX6snESecTdHoQaZGuEMSR2YC8xViyjmZ
         z4mgfTI9lSSJv4a7kRoo+owwHnE5E+R0wnLHLm/2+RLks9ascL54EsewO0uHEOCegjF9
         AONbZtwPe9uWywrlVKLkJQqTCR0MwysL3in3OytvhQWFFAzP9Nl6LFWaIBnSY16qus/a
         f68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678260925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlkyO8OW+WgRQk2FFiUYUZ/IqArcuXEwbJRily5asgc=;
        b=Pesttt3229/tfAEIezFQL4UjnaJ3yHWQFHdu4OHhCqqizjzTxsoxZjQ8FvSJIc2YXL
         NjIutSD5b5ZYtSom59hq94XQSe/MZaPsfVi1iwjW6zZlxMlQn8RbtieLK6gD0/txagO6
         w41auZy9AXUq4JARwMS4czIoZ8e2XQHTl70ujs8N6I+TrYKEEe+LruoPT5Yru4+TJT1t
         b6F4lB0lvCF1BZHNfHl2e18KT0QSBlZSSOcQ8aATr05irUgJJgVBQg0J7HZaP4HtRldz
         8sCFdyEMxf4JgdeFfSAeEzwvvn+jTbbA951EiLHy6/U4+iHKhVWYCGi8ygD7MBM+vjin
         zqdg==
X-Gm-Message-State: AO0yUKVkZZk6P5HiV3jW8BJsU3itSAWFqJbjExX5OKdaW2v3UbgVF4lt
	dO08VO+wftpUBmAmsZI0PAQ=
X-Google-Smtp-Source: 
 AK7set8wJa4R62qf3wc3kdQ1c8vp1MPY3uW4wwyBLP60VdjYnr0RAEWRy/Eqj8agSppBc4asejUskw==
X-Received: by 2002:a17:907:2bde:b0:906:2b5c:7390 with SMTP id
 gv30-20020a1709072bde00b009062b5c7390mr15767615ejc.16.1678260925211;
        Tue, 07 Mar 2023 23:35:25 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id
 h15-20020a1709062dcf00b008dffda52d71sm7051880eji.124.2023.03.07.23.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 23:35:25 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 2/8] ASoC: tegra: Support coupled mic-hp detection
Date: Wed,  8 Mar 2023 09:34:56 +0200
Message-Id: <20230308073502.5421-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230308073502.5421-1-clamor95@gmail.com>
References: <20230308073502.5421-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 44C2OJ3TZF275FXS3H4NIZ3BB4MVXAEB
X-Message-ID-Hash: 44C2OJ3TZF275FXS3H4NIZ3BB4MVXAEB
X-Mailman-Approved-At: Wed, 08 Mar 2023 11:19:42 +0000
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/44C2OJ3TZF275FXS3H4NIZ3BB4MVXAEB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This quirk is used for cases when there is GPIO which detects
any type of 3.5 Jack insertion and actual type of jack is defined
by other GPIO. 3.5 Jack GPIO generates interrupt and MIC GPIO
indicates type of Jack only if 3.5 Jack GPIO is active.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 78faa8bcae27..7b6d5d90c3a2 100644
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
2.37.2

