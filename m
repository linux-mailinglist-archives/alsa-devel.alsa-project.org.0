Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD766E2FFE
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Apr 2023 11:12:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 253F0AE9;
	Sat, 15 Apr 2023 11:11:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 253F0AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681549948;
	bh=AXUIMngCzsxNiINJkXbWpCesvLoamuuHv6HjOcT+zX4=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=n2GFhbXGr4Tu0NbWPRDwnbPdkEAzl0ftgqBKJYAgu7OU6HQlFiV07xZGFdmGY4oYt
	 2zjWYL9RvSjDXBinBcpA+iXddS7MwCCRaHbhoPrSRNGk8UlN1ShNvB1TxIMhXfYl4l
	 JkVfHVy7hoQEG1qjNR/kcJF3SY2mx7lnICGU1S04=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6E22F80567;
	Sat, 15 Apr 2023 11:09:34 +0200 (CEST)
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 5/9] ASoC: ssm2602: Add workaround for playback with external
 MCLK
Date: Fri, 14 Apr 2023 16:01:59 +0200
In-Reply-To: <20230414140203.707729-1-pan@semihalf.com>
References: <20230414140203.707729-1-pan@semihalf.com>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:08:58 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3I5QM7D5CTMMTWYN6NSYQSW6WB36KN4R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168154977392.26.12888416405257429334@mailman-core.alsa-project.org>
From: =?utf-8?q?Pawe=C5=82_Anikiel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Cc: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7335F8032B; Fri, 14 Apr 2023 16:03:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0041F8049C
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 16:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0041F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=ZIvH3A0h
Received: by mail-lj1-x22d.google.com with SMTP id a29so19758290ljq.0
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Apr 2023 07:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1681480969; x=1684072969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BhiBeghWpmkkfmklnaJ7LFrAZ1yIM3t/W3PcrsTKic=;
        b=ZIvH3A0hDweRAj48aerjGTpcA9Lg0NU1e7NMCLoS5TAsG28rGY5S7MJJ7LbPV4gE60
         W3yYf12rm7y/sW/HEklbkSOvWJmDZWZQwiNpOVw7yVUoaxeeA7zFBZZ2zB5PR2zDlVC1
         Jzxwbywa7p9UNHh/9090nxIM5BcN7qcekxA/XokHqil/W1PBhRURVtoj6oU2VBK+otcw
         kw8969oMp59kuqP0RWc9XYTRRZzccaxfh74IrcxN4FN1C60ATu7fDzedKERcZi8/WvrA
         RwNOJP8JIaYO06sGP69Q2Ktqq3xpmsNOvXg03BYydaElGUOPwCRTFZOiF2qBZlKogThI
         ebPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681480969; x=1684072969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BhiBeghWpmkkfmklnaJ7LFrAZ1yIM3t/W3PcrsTKic=;
        b=YTWAEuzUovPwC9cDPA+L09BgP8T0oGNtrYCR/IT0S3JWngMAlOi/zxJ/Qi5mtsyMIx
         4/NnNE/6QuC9Oq+bUfYYo2+i1xGrZ2h1WldCLQD8RheQmLpcfwWDghYLYs5Q4H709Fwn
         fA7gF64BJLaj6Piz3NbSaZbI5XcklZlD0wD9C6ikB9pECX8FoWPObZb0iPMKpBLXmRJK
         YhZXWvwpJY1/dq6yZGmHyMS6jDGdwb88ptRVMS6+5rw4ftsg5gvZjQlJvVQGtxlDJ0Wf
         CMTDIYw5OM7yiUfPzMj5hi/nqgV5+jI7JaZC34ov+CQ4aeuUUH/C2787B/6DTJEg3ZDy
         xBCA==
X-Gm-Message-State: AAQBX9dgV+0Zd0CVVAtKpGgTl8FNsZYx3I/B1vXjeCja75QbM60+nimn
	zkFC789PXccPPu8kgWu00ak9rRKwlknvEepfBucfew==
X-Google-Smtp-Source: 
 AKy350aAUvPCStAOQkhJe5KNXKrPlT0yHPb0kYSRktYXq6/BaxKviwWfDLqFxScPxtJeHZ5xGmQ/WQ==
X-Received: by 2002:a2e:804b:0:b0:295:9906:64e4 with SMTP id
 p11-20020a2e804b000000b00295990664e4mr1768345ljg.2.1681480968304;
        Fri, 14 Apr 2023 07:02:48 -0700 (PDT)
Received: from panikiel.roam.corp.google.com
 (staticline-31-182-201-26.toya.net.pl. [31.182.201.26])
        by smtp.gmail.com with ESMTPSA id
 15-20020a2eb2cf000000b002a76e2dedbcsm828684ljz.139.2023.04.14.07.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 07:02:47 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 5/9] ASoC: ssm2602: Add workaround for playback with external
 MCLK
Date: Fri, 14 Apr 2023 16:01:59 +0200
Message-ID: <20230414140203.707729-6-pan@semihalf.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230414140203.707729-1-pan@semihalf.com>
References: <20230414140203.707729-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3I5QM7D5CTMMTWYN6NSYQSW6WB36KN4R
X-Message-ID-Hash: 3I5QM7D5CTMMTWYN6NSYQSW6WB36KN4R
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:08:58 +0000
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3I5QM7D5CTMMTWYN6NSYQSW6WB36KN4R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Apply a workaround for what seems to be a hardware quirk: when using
an external MCLK signal, powering on Output and DAC for the first time
produces output distortions unless they're powered together with whole
chip power.

The workaround powers them on in probe for the first time, as doing it
later may be impossible (e.g. when starting playback while recording,
whole chip power will already be on).

Here are some initialization sequences run after all other control
registers were set (`ssmset reg val` sets the value of a register
via i2c):

  ssmset 0x09 0x01 # core
  ssmset 0x06 0x07 # chip, out
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

Here are some sequences run at the very start before a sw reset (and
later using one of the NOT OK sequences from above):

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

This was tested on a Google Chameleon v3 board using an SSM2603 with an
external MCLK. This doesn't seem to just be a PCB issue, as this was
also observed on a ZYBO Z7-10:
https://ez.analog.com/audio/f/q-a/543726/solved-ssm2603-right-output-offset-issue/480229

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 sound/soc/codecs/ssm2602.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/ssm2602.c b/sound/soc/codecs/ssm2602.c
index cbbe83b85ada..021e0c860fa1 100644
--- a/sound/soc/codecs/ssm2602.c
+++ b/sound/soc/codecs/ssm2602.c
@@ -589,6 +589,17 @@ static int ssm260x_component_probe(struct snd_soc_component *component)
 		return ret;
 	}
 
+	/* Workaround for what seems to be a hardware quirk: when using an
+	 * external MCLK signal, powering on Output and DAC for the first
+	 * time produces output distortions unless they're powered together
+	 * with whole chip power. We power them here for the first time,
+	 * as doing it later may be impossible (e.g. when starting playback
+	 * while recording, whole chip power will already be on)
+	 */
+	regmap_write(ssm2602->regmap, SSM2602_ACTIVE, 0x01);
+	regmap_write(ssm2602->regmap, SSM2602_PWR,    0x07);
+	regmap_write(ssm2602->regmap, SSM2602_RESET,  0x00);
+
 	/* set the update bits */
 	regmap_update_bits(ssm2602->regmap, SSM2602_LINVOL,
 			    LINVOL_LRIN_BOTH, LINVOL_LRIN_BOTH);
-- 
2.40.0.634.g4ca3ef3211-goog

