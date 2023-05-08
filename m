Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F076FD705
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 08:31:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4110F1055;
	Wed, 10 May 2023 08:30:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4110F1055
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683700307;
	bh=dBloFJhoaI9etuevx3RcZG3i5lC069MPcR3NIxpX0sM=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=rzX0xsQo+oTH1XoxSx2JZ3wx2sGxYE8gv6eXh8hxejYt/3axDMxuQZs9KWWd6m/1/
	 asVyKHrzpW4z/9eToB54TsPkqx9BG3FhL2CTYaLWCfOibdcGUrLo4HH+A5sCTESPKv
	 RyY9w2y7Zs3GyjUkm/oGGE7ArAonx5Xulfiy65Ec=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 505CFF80310;
	Wed, 10 May 2023 08:30:56 +0200 (CEST)
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 0/7] Add Chameleon v3 ASoC audio
Date: Mon,  8 May 2023 13:30:30 +0200
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Wed, 10 May 2023 06:30:50 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UVFG542LUC2PIG4W27NG4LRHYHOKKO2R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168370025444.26.1010294303910435639@mailman-core.alsa-project.org>
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
	id 92593F8032D; Mon,  8 May 2023 13:30:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CA64F802E8
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 13:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CA64F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=LaOiDwcc
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4ec8eca56cfso4909713e87.0
        for <alsa-devel@alsa-project.org>;
 Mon, 08 May 2023 04:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1683545449; x=1686137449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QROZZg0NcOAM6TrC3FRfcXoXcgrBsF3nV9ljtkhqs/g=;
        b=LaOiDwccr14aUQfXHiItTJRbSFtax2h3IM/zfRijGPvqXp3g1mZQ4/edBGu1qeOH9c
         bRteSh1Kbcm6J1asHyYNUnVkn4CKd5EFUpzPeLXSQgOmWKIeXPFWqpXj5ajw7uU0lDqU
         FrK1AKF+1igGV8vTA4QSP/eeY8c7bz5P8yKE7iChxrRITaG4FW0dGUkYfzA3XuINRfi0
         ZUC7A1791bXIxS3Dj8UBL3KH+vHmg2lCXVKnDpBW0PYTiS3+gCZHggHzw3AJzWJOBAkD
         8eCcP+NhlJPExY/TFpbYoU1K7sMTmHqX9AKf+9Cnn3yVUZISIzMz6lKI1Za/4+0jtF5K
         oPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683545449; x=1686137449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QROZZg0NcOAM6TrC3FRfcXoXcgrBsF3nV9ljtkhqs/g=;
        b=WHrgZpIZuEOAudpjdjwiktEWNLQ3CO3STtQoY9j586F+9z+K4Mf8wms5+5nAV/N8ZR
         pshuhjzfJxtxP4y8N42xIjprwO8b4AO6ZdquF6lYkIKS32L+acQTtzun7131PQlslDcz
         ZYQbi2jmI8XzA4IIn5vi8LhyYGC1bPNMzAQZHapzgfFZ/zSD64Yp3EW7URauLF18khFM
         TYuMcazGhlsqIgGbCEUhKMyuJZmJhDWpoolaC+97Gk3+4CWXW42qmfSJ8BDstHJ/o+vB
         6C5USh3NmHmIiucIFuRyGuKImqTtxijdqNU3M1KPbOJMxkeFbTzB4FIlNhqyMmcuY+Ql
         nK0w==
X-Gm-Message-State: AC+VfDzljReeC2Qm+yX8B0vwPAKGc/UhRaL8XYaMehc3KXClOfv6A1OW
	CjCI/kzEmBxaqvo8hjLa2HJ9942vdJTFH3K4WwY=
X-Google-Smtp-Source: 
 ACHHUZ5wHrOKKIsHA8UkSMl1QDKxcEx3roo4s774AFuy6ZE50c0cAvreNxNsl+gGMfStFlUTxtls3g==
X-Received: by 2002:a2e:918d:0:b0:2a8:b627:b92f with SMTP id
 f13-20020a2e918d000000b002a8b627b92fmr2717307ljg.29.1683545449157;
        Mon, 08 May 2023 04:30:49 -0700 (PDT)
Received: from panikiel.office.semihalf.net ([83.142.187.84])
        by smtp.gmail.com with ESMTPSA id
 k8-20020a2e2408000000b002a8b9353338sm1144406ljk.117.2023.05.08.04.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:30:48 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 0/7] Add Chameleon v3 ASoC audio
Date: Mon,  8 May 2023 13:30:30 +0200
Message-ID: <20230508113037.137627-1-pan@semihalf.com>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UVFG542LUC2PIG4W27NG4LRHYHOKKO2R
X-Message-ID-Hash: UVFG542LUC2PIG4W27NG4LRHYHOKKO2R
X-Mailman-Approved-At: Wed, 10 May 2023 06:30:50 +0000
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, amstan@chromium.org,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UVFG542LUC2PIG4W27NG4LRHYHOKKO2R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Google Chameleon v3 is a device made for testing audio and video
paths of other devices. This patchset adds support for ASoC audio on
this device. It has two audio sources: HDMI audio from the it68051 chip
(RX only), and analog audio from the ssm2603 chip (RX and TX).

The patchset adds the ASoC platform and codec drivers, as well as some
changes to the existing ssm2602 codec driver.

v2 changes:
  * Replace chv3-audio machine driver with simple-audio-card
  * Use regmap_register_patch() in ssm2602 workaround
  * Remove ssm2602 mute gpio patch, add a gpio hog instead
  * Simplify hw_pointer logic in chv3-i2s
  * Commit splits & other misc changes

Paweł Anikiel (7):
  ASoC: Add Google Chameleon v3 i2s driver
  ASoC: Add Google Chameleon v3 codec driver
  ASoC: dt-bindings: Add Google Chameleon v3 i2s device
  ASoC: dt-bindings: Add Google Chameleon v3 audio codec
  ARM: dts: chameleonv3: Add mute gpio hog
  ARM: dts: chameleonv3: Add Chameleon v3 audio
  ASoC: ssm2602: Add workaround for playback distortions

 .../bindings/sound/google,chv3-codec.yaml     |  31 ++
 .../bindings/sound/google,chv3-i2s.yaml       |  44 +++
 .../boot/dts/socfpga_arria10_chameleonv3.dts  |  62 ++++
 sound/soc/Kconfig                             |   1 +
 sound/soc/Makefile                            |   1 +
 sound/soc/codecs/Kconfig                      |   8 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/chv3-codec.c                 |  41 +++
 sound/soc/codecs/ssm2602.c                    |  15 +
 sound/soc/google/Kconfig                      |   6 +
 sound/soc/google/Makefile                     |   2 +
 sound/soc/google/chv3-i2s.c                   | 338 ++++++++++++++++++
 12 files changed, 551 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/google,chv3-codec.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
 create mode 100644 sound/soc/codecs/chv3-codec.c
 create mode 100644 sound/soc/google/Kconfig
 create mode 100644 sound/soc/google/Makefile
 create mode 100644 sound/soc/google/chv3-i2s.c

-- 
2.40.1.521.gf1e218fcd8-goog

