Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A6669E7A7
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 19:38:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A924EE85;
	Tue, 21 Feb 2023 19:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A924EE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677004698;
	bh=l9Tvg3xCXE1LEULfRgL7vvOvJSC0aCQ9+4oeC5HMhEg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gI243G5StZV4GfO5BY5j2WLEAhMFgMG37nxlK+sUIRZfH5lz2DDkqG3y/p6lomaSm
	 LWALaGSXIkiw/PKK/q6YUXpykWqUf+XUaSz2HwzirWQfPKOulYwaSR0thfkQGfSvLn
	 F3I0xQmD3m5GYx4lL7SRLvbJU0r9BBubO1l3RMj8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1055F80496;
	Tue, 21 Feb 2023 19:36:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80DF6F804FC; Tue, 21 Feb 2023 19:32:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 501CFF80266
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 19:32:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 501CFF80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=n5P5sUEH
Received: by mail-ed1-x532.google.com with SMTP id ck15so22231788edb.0
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Feb 2023 10:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAXecBgeRkHu8ZmrGSEh+xC8pZ8csJk/gLQuqMv+ZEI=;
        b=n5P5sUEHLppfy1KRySapcmLr3VmalIXip2527iBV1pCY+xwS8ywbsnb6vBwPteurfH
         Ou9heSahzhfGJVOnzPjla6C+JQo2VGd0yOCOpw4k/pjtCPDEpRrjpZLdpNF66Pi1DKH9
         WLP3xJQVbHYcEVJ7Wy9+73EuPBfWRbCokMg00ejhFAjQXjTyfePQrZKDmFkJzrRKuLnx
         e3M1VTGBwW93NFqHDNrX3XzJJqgBFJMitGzKukSDLzjuw8aKsmEHHiVsL6l5ARdcTx7Z
         NB5lKQ8K6GmD8sZRwzyMJ4RNTwnljCCDwYAzGsGxScbfzvJvZWnorpAYlZQpX1l6rhMw
         Ad/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAXecBgeRkHu8ZmrGSEh+xC8pZ8csJk/gLQuqMv+ZEI=;
        b=KY0bJD0wkkAD7Ju0nSatY+3H4n2qyFyETT3UewdX0MbDydDFQdoKrNLNYfXxtDMmej
         Rbciz22dE/7sFaRcBcKAAB+J7czvhu4NhTQi8gINMAEnrCva6Lz3rVVpguLRHnt0OwC1
         6NL2Uosdnc9YgRDD4o/Jne3FPws+Li5rOx1r5KTbaF+LGDcQPdGvRwxrpGVEYFHTOolo
         BknZSQEIBj8xFdU9eUE4Klf+/B86k+dq0SgnJ2u4PH304117eMrTRiK9YRqUOTh82V35
         Mb5FuW7w81CkBionFyBpiGmC0K5xKKvuhVnxzp9Zxt3ZZdcNdOeyO4e9ZjKG8JhRCUjM
         A9tQ==
X-Gm-Message-State: AO0yUKUtFVDL1hoey1IvXZfF/229qUZ70NHmrqpHv0lUSEmuKLWkeH6F
	GdOJNwx7by10X6UXfTqNl3Y=
X-Google-Smtp-Source: 
 AK7set9zWlurnl/3CRZ7DTez58dz2jKnck1MAztIosG4p1jWNb1dZJz3bfbLFRpOyeGB3qiJQ4VlZQ==
X-Received: by 2002:aa7:ca56:0:b0:4ae:e5ab:46d7 with SMTP id
 j22-20020aa7ca56000000b004aee5ab46d7mr3752692edt.8.1677004345190;
        Tue, 21 Feb 2023 10:32:25 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a50c3c3000000b004af5aa16fcasm169102edf.66.2023.02.21.10.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:32:24 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 02/10] sound: soc: jack: allow multiple interrupt per gpio
Date: Tue, 21 Feb 2023 20:32:03 +0200
Message-Id: <20230221183211.21964-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230221183211.21964-1-clamor95@gmail.com>
References: <20230221183211.21964-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: E5743CSI3X7ZAHODHXEEP4NL6A3URH6P
X-Message-ID-Hash: E5743CSI3X7ZAHODHXEEP4NL6A3URH6P
X-Mailman-Approved-At: Tue, 21 Feb 2023 18:36:35 +0000
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E5743CSI3X7ZAHODHXEEP4NL6A3URH6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This feature is required for coupled hp-mic quirk used
by some Nvidia Tegra 3 based devices work properly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 sound/soc/soc-jack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-jack.c b/sound/soc/soc-jack.c
index fcece5ca38c6..f951acb2ce36 100644
--- a/sound/soc/soc-jack.c
+++ b/sound/soc/soc-jack.c
@@ -367,6 +367,7 @@ int snd_soc_jack_add_gpios(struct snd_soc_jack *jack, int count,
 
 		ret = request_any_context_irq(gpiod_to_irq(gpios[i].desc),
 					      gpio_handler,
+					      IRQF_SHARED |
 					      IRQF_TRIGGER_RISING |
 					      IRQF_TRIGGER_FALLING,
 					      gpios[i].name,
-- 
2.37.2

