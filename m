Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0E07F7B27
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Nov 2023 19:02:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB7FCE85;
	Fri, 24 Nov 2023 19:02:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB7FCE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700848944;
	bh=+l6KxNDferI1koxwzcNqSm88xRD4alWiNxFnof8PVTM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DGhWlChkQhxU69AT+7HWt6uPupD4FEkBKxU/IdhZXMeh0OpYEV1B+VuHP/3Hu+n0k
	 rVCtcgxjm0LWZhO/zpS8Vf+TfZIhiFKiHEo+Cp0f+QbAjAgS7nkeywQj8csGnREdb/
	 1RWXwU/KOsmZG0Oi2JRmb7aGUsFrKXjE/xqugHTw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 442EFF80310; Fri, 24 Nov 2023 19:01:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77F54F8057A;
	Fri, 24 Nov 2023 19:01:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81012F802E8; Fri, 24 Nov 2023 19:01:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8620F80246
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 19:01:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8620F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rRKXyu2g
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5482df11e73so2979709a12.0
        for <alsa-devel@alsa-project.org>;
 Fri, 24 Nov 2023 10:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700848899; x=1701453699;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nMxbVR2rLfAZt5vPU+lVR4wGuvIRl6WENNaqc0E73kg=;
        b=rRKXyu2gUwe8MUfbp/lMxIQMsxARX1/rUoVMPI7WT8B6Kz/OI4iBI6CuPoMLEhUHg3
         86ItB/3scr5milpsqPfIviqzHwLowAYhJq75vZVprMPxobL8R3nKwvEcdUo85oUJWaq0
         DKVLVUoejR7U8S4rds1HmFTmsIPLM2lrtWjxHRyojQG8yZUYjrG4DGL76f7c4osUKsjZ
         hibUPK9eYdTV5N43z4Ntyeg/GUSRviRVJJarKsi1lUH+kTOtpW0rTav5CfGkuH9sFZhG
         5kJ7J9hTAV5ZjanW0hbretifyNmzDpQ5PRTCEgl9eBQYV0129I3iIMrUaLI6L9QedmSb
         2+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700848899; x=1701453699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMxbVR2rLfAZt5vPU+lVR4wGuvIRl6WENNaqc0E73kg=;
        b=W5KUnhjX0PV1A+33iM4obps/wPpeKKabr0SCcB1DWPNIkQK5R3VrGr9W7zas2NI3lf
         uG49NiTbFTgsEFghlqfEOso5IGmXxqaZcNJX4bVIFaBwQEdft2nRGgvFxQKUwVZRqIqS
         rbp8k2O1UQoTxMcAN2kmHxJNOMaBAP/s/tvxBXsbKqbvWfvKV5hVIJcTJP0NOPlgJp0x
         g2KYGGiZ12Jd6GFqQFbDBmuFsSjBjWspNRa2CP5wkWUT16PThCJhdZwFVu1OwqW5qUb1
         XYgfKlIveWbFNloW7i178pw/CYvCj68rLgVM+lMQHuL++vGFhtg6pVC2D0iA/bwRyoVm
         qtlw==
X-Gm-Message-State: AOJu0YycRnpuSvKfi6E7Yl9ni42WOvRkyT5yhl+FIGiu+ufu8Bb8X0C4
	k9wlHI43IuMQwBOIxuFW3Z00unGuWjSJTJdeDeA=
X-Google-Smtp-Source: 
 AGHT+IHsz3LcGDH3Rt86rCdvS80rKeIS5a4qh2ZQvdfnBPgmrONEFonUhMa3/w580MfYUG2pVVWF3Q==
X-Received: by 2002:a50:c042:0:b0:543:bf55:248b with SMTP id
 u2-20020a50c042000000b00543bf55248bmr2619735edd.13.1700848899134;
        Fri, 24 Nov 2023 10:01:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id
 bq2-20020a056402214200b00548a0e8c316sm2010965edb.20.2023.11.24.10.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 10:01:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Shreyas NC <shreyas.nc@intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] soundwire: stream: fix NULL pointer dereference for
 multi_link
Date: Fri, 24 Nov 2023 19:01:36 +0100
Message-Id: <20231124180136.390621-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PJMRZGIOEN2LYBIJXST6GTOX43GRCRHX
X-Message-ID-Hash: PJMRZGIOEN2LYBIJXST6GTOX43GRCRHX
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PJMRZGIOEN2LYBIJXST6GTOX43GRCRHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If bus is marked as multi_link, but number of masters in the stream is
not higher than bus->hw_sync_min_links (bus->multi_link && m_rt_count >=
bus->hw_sync_min_links), bank switching should not happen.  The first
part of do_bank_switch() code properly takes these conditions into
account, but second part (sdw_ml_sync_bank_switch()) relies purely on
bus->multi_link property.  This is not balanced and leads to NULL
pointer dereference:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
  ...
  Call trace:
   wait_for_completion_timeout+0x124/0x1f0
   do_bank_switch+0x370/0x6f8
   sdw_prepare_stream+0x2d0/0x438
   qcom_snd_sdw_prepare+0xa0/0x118
   sm8450_snd_prepare+0x128/0x148
   snd_soc_link_prepare+0x5c/0xe8
   __soc_pcm_prepare+0x28/0x1ec
   dpcm_be_dai_prepare+0x1e0/0x2c0
   dpcm_fe_dai_prepare+0x108/0x28c
   snd_pcm_do_prepare+0x44/0x68
   snd_pcm_action_single+0x54/0xc0
   snd_pcm_action_nonatomic+0xe4/0xec
   snd_pcm_prepare+0xc4/0x114
   snd_pcm_common_ioctl+0x1154/0x1cc0
   snd_pcm_ioctl+0x54/0x74

Fixes: ce6e74d008ff ("soundwire: Add support for multi link bank switch")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/stream.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 9dc6399f206a..f9c0adc0738d 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -742,14 +742,15 @@ static int sdw_bank_switch(struct sdw_bus *bus, int m_rt_count)
  * sdw_ml_sync_bank_switch: Multilink register bank switch
  *
  * @bus: SDW bus instance
+ * @multi_link: whether this is a multi-link stream with hardware-based sync
  *
  * Caller function should free the buffers on error
  */
-static int sdw_ml_sync_bank_switch(struct sdw_bus *bus)
+static int sdw_ml_sync_bank_switch(struct sdw_bus *bus, bool multi_link)
 {
 	unsigned long time_left;
 
-	if (!bus->multi_link)
+	if (!multi_link)
 		return 0;
 
 	/* Wait for completion of transfer */
@@ -847,7 +848,7 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
 			bus->bank_switch_timeout = DEFAULT_BANK_SWITCH_TIMEOUT;
 
 		/* Check if bank switch was successful */
-		ret = sdw_ml_sync_bank_switch(bus);
+		ret = sdw_ml_sync_bank_switch(bus, multi_link);
 		if (ret < 0) {
 			dev_err(bus->dev,
 				"multi link bank switch failed: %d\n", ret);
-- 
2.34.1

