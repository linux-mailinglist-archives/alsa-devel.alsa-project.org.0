Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0839E6E2FF5
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Apr 2023 11:11:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 697A6852;
	Sat, 15 Apr 2023 11:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 697A6852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681549866;
	bh=zEwiuE4JpQtRF6mTS/EhLHBsFVYL+jNqoaaZujeH+a4=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=DqHEMLJ2BYoTXA7r4UqUX3+N07WPhjnaXP2wiDRfPVE7bAVxDfzHukOIQLP8Wq0ce
	 8Jp2sCvKg+60vp50fzGomCkT2bNQwT8MFCUgVgwetZn1LGy0fR1ibavxPUkGKyUGJV
	 hOPRPcY4S/zfPyEUbUAjsYPODzAP7J3nJfM41iEo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B97D5F804F2;
	Sat, 15 Apr 2023 11:09:26 +0200 (CEST)
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 0/9] Add Chameleon v3 ASoC audio
Date: Fri, 14 Apr 2023 16:01:54 +0200
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:08:54 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37Q5ACSMHI3FBLVLWZ67IH4DTXTDDGSS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168154976533.26.14470787512531099158@mailman-core.alsa-project.org>
From: =?utf-8?q?Pawe=C5=82_Anikiel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Cc: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBD60F80448; Fri, 14 Apr 2023 16:02:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54B33F8023A
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 16:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54B33F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=nX4Kdpat
Received: by mail-lj1-x236.google.com with SMTP id n22so17290016ljq.8
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Apr 2023 07:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1681480962; x=1684072962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6CmKFXx/xfojEaW7/QBPIIKO9g8KorbKrua0cC4RrJY=;
        b=nX4KdpatJdru56O41hIK0y/nHXVcDcxnMfPovuQbKYYpANGyF6FaK2xOBz+EgXHDVP
         J+loYySH+aJNuAgpdPoY79jVbGug7NsdV+BPBjueeICVJAQmRhT4OBSH3V8oUXz8Qr7q
         B2GgoRHJ0lz/lG/r6ThO9OeqNGVDXumR+mkV6++4NWDuIq5yzxWrTmvSbBN6CA5ivlSV
         /PVnLgk5cHVDlFUj9rrKxPhbb357nqwGQHaanx8dudSlqq3x0A1yYE2Ow7kVDtSGWL/k
         sxJj1+PrqSf/xFHXi/J56wNGnyeVEAqfLx2wWhFEk5j2IZWk89QtiR46kJga7RCBLJzN
         FGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681480962; x=1684072962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CmKFXx/xfojEaW7/QBPIIKO9g8KorbKrua0cC4RrJY=;
        b=jA1qfDKyvtfLPuMNqPagGnz0GePXTLvJGiJx0++B2dXCgLKpDwgnTx8jJZlX506ciD
         Pwo5/P7FE/Na1iBRBbkaKUogble47jVALCf3NBZJ9ZUiZynM6pkPJKevOD2dNQhS9phs
         p444a3GBeye0mLaj89PlTe7jkP6gePd3uSelPCC/Y9d9PFnFdb95jNJYhpJbTN96+Xze
         2AFZaUHacrenuh9sF+l0FMz3P0AkxLKAX3eS4jBKEDLI4i+8qKBSX5c/nAH/7+JQYvRE
         OKq+UdPz7YyKsIpdVJ3jfomw4fJh07LD4QruWsXuco3wI39Au5o9mNiLBktVQFcme6xz
         x3YA==
X-Gm-Message-State: AAQBX9dCl4KyZ9BgccRVt2n2gFhaEnxvdV6hBSPgVVmrEhdihqNm97IY
	7M8hW66P1ON47Qhx5UIONkXMNl9jd+nrJbjNbtLnUA==
X-Google-Smtp-Source: 
 AKy350ZKVU9Q0jCCIA9VriNQc1B7S0oO5F5h9xArFBdAxOSR8FmbdC8A69TYdJ5iCGu/V+wGWtgclA==
X-Received: by 2002:a2e:8542:0:b0:2a7:6daa:da39 with SMTP id
 u2-20020a2e8542000000b002a76daada39mr2266282ljj.22.1681480962193;
        Fri, 14 Apr 2023 07:02:42 -0700 (PDT)
Received: from panikiel.roam.corp.google.com
 (staticline-31-182-201-26.toya.net.pl. [31.182.201.26])
        by smtp.gmail.com with ESMTPSA id
 15-20020a2eb2cf000000b002a76e2dedbcsm828684ljz.139.2023.04.14.07.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 07:02:41 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 0/9] Add Chameleon v3 ASoC audio
Date: Fri, 14 Apr 2023 16:01:54 +0200
Message-ID: <20230414140203.707729-1-pan@semihalf.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 37Q5ACSMHI3FBLVLWZ67IH4DTXTDDGSS
X-Message-ID-Hash: 37Q5ACSMHI3FBLVLWZ67IH4DTXTDDGSS
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:08:54 +0000
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37Q5ACSMHI3FBLVLWZ67IH4DTXTDDGSS/>
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

The patchset adds the ASoC platform and machine drivers, as well as some
changes to the existing ssm2602 codec driver.

Paweł Anikiel (9):
  ASoC: Add Chameleon v3 audio
  dt-bindings: ASoC: Add chv3-i2s
  dt-bindings: ASoC: Add chv3-audio
  dt-bindings: ASoC: Add it68051
  ASoC: ssm2602: Add workaround for playback with external MCLK
  ASoC: ssm2602: Add support for CLKDIV2
  ASoC: ssm2602: Add mute gpio
  dt-bindings: ASoC: Add mute-gpio to ssm2602
  ARM: dts: chameleonv3: Add ssm2603 mute gpio

 .../devicetree/bindings/sound/adi,ssm2602.txt |   4 +
 .../bindings/sound/google,chv3-audio.yaml     |  49 +++
 .../bindings/sound/google,chv3-i2s.yaml       |  42 +++
 .../bindings/sound/ite,it68051.yaml           |  23 ++
 .../boot/dts/socfpga_arria10_chameleonv3.dts  |  30 ++
 sound/soc/Kconfig                             |   1 +
 sound/soc/Makefile                            |   1 +
 sound/soc/chameleonv3/Kconfig                 |   7 +
 sound/soc/chameleonv3/Makefile                |   2 +
 sound/soc/chameleonv3/chv3-audio.c            | 111 ++++++
 sound/soc/chameleonv3/chv3-i2s.c              | 347 ++++++++++++++++++
 sound/soc/chameleonv3/chv3-it68051.c          |  41 +++
 sound/soc/codecs/ssm2602.c                    |  37 +-
 13 files changed, 692 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/google,chv3-audio.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ite,it68051.yaml
 create mode 100644 sound/soc/chameleonv3/Kconfig
 create mode 100644 sound/soc/chameleonv3/Makefile
 create mode 100644 sound/soc/chameleonv3/chv3-audio.c
 create mode 100644 sound/soc/chameleonv3/chv3-i2s.c
 create mode 100644 sound/soc/chameleonv3/chv3-it68051.c

-- 
2.40.0.634.g4ca3ef3211-goog

