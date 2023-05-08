Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 361856FD710
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 08:33:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A94B2105B;
	Wed, 10 May 2023 08:32:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A94B2105B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683700423;
	bh=PCOckoW/5eaIwkP+fY5/rPlteO6+CJEYVXPtysD5yGM=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=QFoTYjl9Crl8EzEXoPCmvlvesVLXPo+sGvMMMXu6SF72N4hbjox6MwMcQFpzBlVPm
	 9ANuzRd4bjYxxRQ+WGUZr7XcQGdOhvksorKA+LHDzevQ/VbP9ZCcqS/+h1oYBIONza
	 bNj2xbDAAx+LjifftjYFUiaFQcIeJLiE2pxiabTg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 657B8F80558;
	Wed, 10 May 2023 08:32:21 +0200 (CEST)
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 7/7] ASoC: ssm2602: Add workaround for playback distortions
Date: Mon,  8 May 2023 13:30:37 +0200
In-Reply-To: <20230508113037.137627-1-pan@semihalf.com>
References: <20230508113037.137627-1-pan@semihalf.com>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Wed, 10 May 2023 06:32:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XTN4ZKSACHDINTUNJZFIIDUKQLOZEVLI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168370033943.26.10667784313872788366@mailman-core.alsa-project.org>
From: =?utf-8?q?Pawe=C5=82_Anikiel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Cc: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, amstan@chromium.org,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD785F8053B; Mon,  8 May 2023 13:31:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E237F804B1
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 13:31:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E237F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=EkbqMgpA
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ac8cc8829fso32056081fa.3
        for <alsa-devel@alsa-project.org>;
 Mon, 08 May 2023 04:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1683545461; x=1686137461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymKooIYpnS0yXmXMVqwK3LSKOegi+Ec1cIWEbDw6jNE=;
        b=EkbqMgpAbp9yuEgOG1A3wXusm0aFuxDIqSVict33dumhnUUCzPqZz/659moGrwOhHF
         pPFk+3yCI4QXcUi01EhSOBw6VaAiHtQPM+YIMzA/2+qi7olUCEk3u6uDy6A2v+8NQ2zK
         ZnZ8RpyT9XAfSuCIsajRwnGBkA/LT9BBPy2uK+9KuAlJZ70s0z/DkhmcR/+MLKSseZ39
         3WZg6CT0HDHuiKqwgjwg7prejSMg5M1t4v+TP+dat13Mf0wDnfP2JIzfd9rgkmr24x63
         G8P6wTgwuIp/0vi7wl2VIM5kk47T2Xj7Cka51IRwAm6KoWVs4p1sfhGcV93fJMslV/tE
         +rhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683545461; x=1686137461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymKooIYpnS0yXmXMVqwK3LSKOegi+Ec1cIWEbDw6jNE=;
        b=HSHk/R6S4OH8q571oV3EXL2Yp/6qnpwur1ZZK5iSEHcNQqI8Xe7vwtj8zGWLMTYX+p
         NjXpIAxllHaz8ZP6uS0BKa+mf/9iphs73PJjvh/t1XAAh8JGR7lTbA9GWBIsz4Gyaflf
         xc5zB87tKVRiXvWJ6f5CaM4E5INpsq1Wn5DDZoQ1AuzUB38aHjvXRp1tFcllYwbTz+0h
         tMFbHvwRObLdDw70plXafkR+yVr6h4pfyyU5tq8V06FnkCjFqhPU88g1WhldJfvkscZb
         BIxcqvGY+EVtVyfrs8/k1jxa0WMhAKv31+JTEIVYQAGmN2FYTn0cQvYo3TD65fotvMVM
         L5Uw==
X-Gm-Message-State: AC+VfDzk2RWZWN1uvnBStxUBbZJOGOil5DIAPyPDHMqOHNd60LU18Ygj
	Y5i/y7/9DythfcUuGev3pyXmIH4zJXVtovL5wpc=
X-Google-Smtp-Source: 
 ACHHUZ7Xo1m77SC9+1H52SaylyUjEYosNnuWegDfTXW98eJ0YFRyE7rIxq+OofISewu6mn1JhUksog==
X-Received: by 2002:a2e:9d87:0:b0:2a8:a629:c203 with SMTP id
 c7-20020a2e9d87000000b002a8a629c203mr2801101ljj.32.1683545461381;
        Mon, 08 May 2023 04:31:01 -0700 (PDT)
Received: from panikiel.office.semihalf.net ([83.142.187.84])
        by smtp.gmail.com with ESMTPSA id
 k8-20020a2e2408000000b002a8b9353338sm1144406ljk.117.2023.05.08.04.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:31:01 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 7/7] ASoC: ssm2602: Add workaround for playback distortions
Date: Mon,  8 May 2023 13:30:37 +0200
Message-ID: <20230508113037.137627-8-pan@semihalf.com>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
In-Reply-To: <20230508113037.137627-1-pan@semihalf.com>
References: <20230508113037.137627-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XTN4ZKSACHDINTUNJZFIIDUKQLOZEVLI
X-Message-ID-Hash: XTN4ZKSACHDINTUNJZFIIDUKQLOZEVLI
X-Mailman-Approved-At: Wed, 10 May 2023 06:32:16 +0000
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, amstan@chromium.org,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XTN4ZKSACHDINTUNJZFIIDUKQLOZEVLI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Apply a workaround for what appears to be a hardware quirk.

The problem seems to happen when enabling "whole chip power" (bit D7
register R6) for the very first time after the chip receives power. If
either "output" (D4) or "DAC" (D3) aren't powered on at that time,
playback becomes very distorted later on.

This happens on the Google Chameleon v3, as well as on a ZYBO Z7-10:
https://ez.analog.com/audio/f/q-a/543726/solved-ssm2603-right-output-offset-issue/480229
I suspect this happens only when using an external MCLK signal (which
is the case for both of these boards).

Here are some experiments run on a Google Chameleon v3. These were run
in userspace using a wrapper around the i2cset utility:
ssmset() {
        i2cset -y 0 0x1a $(($1*2)) $2
}

For each of the following sequences, we apply power to the ssm2603
chip, set the configuration registers R0-R5 and R7-R8, run the selected
sequence, and check for distortions on playback.

  ssmset 0x09 0x01 # core
  ssmset 0x06 0x07 # chip, out, dac
  OK

  ssmset 0x09 0x01 # core
  ssmset 0x06 0x87 # out, dac
  ssmset 0x06 0x07 # chip
  OK

  (disable MCLK)
  ssmset 0x09 0x01 # core
  ssmset 0x06 0x1f # chip
  ssmset 0x06 0x07 # out, dac
  (enable MCLK)
  OK

  ssmset 0x09 0x01 # core
  ssmset 0x06 0x1f # chip
  ssmset 0x06 0x07 # out, dac
  NOT OK

  ssmset 0x06 0x1f # chip
  ssmset 0x09 0x01 # core
  ssmset 0x06 0x07 # out, dac
  NOT OK

  ssmset 0x09 0x01 # core
  ssmset 0x06 0x0f # chip, out
  ssmset 0x06 0x07 # dac
  NOT OK

  ssmset 0x09 0x01 # core
  ssmset 0x06 0x17 # chip, dac
  ssmset 0x06 0x07 # out
  NOT OK

For each of the following sequences, we apply power to the ssm2603
chip, run the selected sequence, issue a reset with R15, configure
R0-R5 and R7-R8, run one of the NOT OK sequences from above, and check
for distortions.

  ssmset 0x09 0x01 # core
  ssmset 0x06 0x07 # chip, out, dac
  OK

  (disable MCLK)
  ssmset 0x09 0x01 # core
  ssmset 0x06 0x07 # chip, out, dac
  (enable MCLK after reset)
  NOT OK

  ssmset 0x09 0x01 # core
  ssmset 0x06 0x17 # chip, dac
  NOT OK

  ssmset 0x09 0x01 # core
  ssmset 0x06 0x0f # chip, out
  NOT OK

  ssmset 0x06 0x07 # chip, out, dac
  NOT OK

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 sound/soc/codecs/ssm2602.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/codecs/ssm2602.c b/sound/soc/codecs/ssm2602.c
index 00b60369b029..c29324403e9d 100644
--- a/sound/soc/codecs/ssm2602.c
+++ b/sound/soc/codecs/ssm2602.c
@@ -53,6 +53,18 @@ static const struct reg_default ssm2602_reg[SSM2602_CACHEREGNUM] = {
 	{ .reg = 0x09, .def = 0x0000 }
 };
 
+/*
+ * ssm2602 register patch
+ * Workaround for playback distortions after power up: activates digital
+ * core, and then powers on output, DAC, and whole chip at the same time
+ */
+
+static const struct reg_sequence ssm2602_patch[] = {
+	{ SSM2602_ACTIVE, 0x01 },
+	{ SSM2602_PWR,    0x07 },
+	{ SSM2602_RESET,  0x00 },
+};
+
 
 /*Appending several "None"s just for OSS mixer use*/
 static const char *ssm2602_input_select[] = {
@@ -598,6 +610,9 @@ static int ssm260x_component_probe(struct snd_soc_component *component)
 		return ret;
 	}
 
+	regmap_register_patch(ssm2602->regmap, ssm2602_patch,
+			      ARRAY_SIZE(ssm2602_patch));
+
 	/* set the update bits */
 	regmap_update_bits(ssm2602->regmap, SSM2602_LINVOL,
 			    LINVOL_LRIN_BOTH, LINVOL_LRIN_BOTH);
-- 
2.40.1.521.gf1e218fcd8-goog

