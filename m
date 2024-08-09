Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B890B952A62
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 10:25:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F27A22AE;
	Thu, 15 Aug 2024 10:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F27A22AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723710351;
	bh=AYpUK+lsd5PQ6SJlU43+rLfSAt/aIyQe9U7/8RSvafE=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Dhgm5reBm7p33B5J3C5SGV4Hdo6FAM6Fyf41i0nq5CzqwvlA1Jwa1dNSynUUl23vX
	 a0rsgrR4vno+jJblflhNXOLaxLRCoYHk3r/wJtoJmoKxEz1Ly2zMh8WlSzFGZ3YQ6G
	 14J/WlFH/UvQ8B1IWxk1SwXPVRK6WEiMeTttaQAM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B848F806B2; Thu, 15 Aug 2024 10:23:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B76FF806BB;
	Thu, 15 Aug 2024 10:23:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57B02F80448; Fri,  9 Aug 2024 10:34:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68399F800BF
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 10:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68399F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=BTvdNArz
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5b8c2a6117aso721239a12.0
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Aug 2024 01:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1723192450; x=1723797250;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hzfw/96lJb4bQMm0DPGLtxg5MZTXy4gKlDaf+3Ud31A=;
        b=BTvdNArzilEE6h+JRinx/we4qdsMw9q0WCikVxwFwAdlsC1Rkvq8aIV+g4u8BdUFCn
         grrLDFSBasMJZhh7oZKDb0C3PAwmNxI0jxsEw3YjX9c0j5wvAllKbaTzH32J3xfGuCN4
         Eem3kLngUy+aItHp3WEKAyoSBWoZRBiCuFOY6T5GR72tb4S2dpKGlhHOG06tWMqKA0qd
         dJl9lVOH8g0eEsfDqXcBxRKtt+vrT07Ioz2GQsyTA+YX+xwdm5tvdr0XV4jH7V9/UHLS
         7+d1OEMduK2YQaqKpRxmMueQQS75BarF8mNjS03V1EXDjUczJJpfOjEOSNwyeGPj4lw3
         6sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723192450; x=1723797250;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hzfw/96lJb4bQMm0DPGLtxg5MZTXy4gKlDaf+3Ud31A=;
        b=H6mpOEOBImCSKBR3QVjcTWSZEVu9nfO1S9VflTWXH2RaaN/ExoCCwd63YL8jqlRD03
         5a10LAV3scxvv+LSEodksE/SNqu/VXqyiKDYQHvmYAR9owVB1XAA3dG+F+HDAHahcG6U
         UWbNfFKE5azzOig9mRVDeeWsShRFyaIf0BB/j6VSZT4cUNd/ONR+pXB25g9R8W9TxAZ+
         A0jGC84TboOisjKbIWdNr++Ro+bgLP1/y9+wkr3M9IAic1Gd3VwRju+6Wn2UWWOWIKPa
         zaJcxjQi23PV9RWkBYftCGHMFHQFGmMkStX27PsZn5RiC7OfIZQHVnFlZ1QwojfkQLAg
         CYaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMgWAEZ/zyvQjdjoEmcYq1/wUrT51gTIY5a8+MXI/NQgRiGgSD7D8gB8qdP8RlVpirXYgBrtA1GCE9NiIo+zNbqJJxf2VCk1Nk2hQ=
X-Gm-Message-State: AOJu0YzcsBJcVXaJO6L8QU2v1aDobNK91awCZxkWdjo4TRWcyNZ3HbFw
	eT7901Kq52gShvO8YtHla2PYuJdUiHXLbWIR9Kwqc43HOhFlZK3Tmya8GcHRRF0=
X-Google-Smtp-Source: 
 AGHT+IHunt1rt24Z66zT/GRjyNQR/iZlMfySgAZmzArvUQ0sChkXB8EfaUarNZjHNUHUBwjWkQ08Lw==
X-Received: by 2002:a05:6402:13d1:b0:5a1:f9bc:7f13 with SMTP id
 4fb4d7f45d1cf-5bd0a577dbdmr755422a12.22.1723192450418;
        Fri, 09 Aug 2024 01:34:10 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl.
 [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2c41916sm1336288a12.41.2024.08.09.01.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:34:10 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add DisplayPort sound support for Fairphone 5
 smartphone
Date: Fri, 09 Aug 2024 10:33:56 +0200
Message-Id: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHTUtWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCwNL3bQCU92UAt3i/NK8FN0kY3MzizRjA0PLpBQloJaCotS0zAqwcdG
 xtbUALdDLb14AAAA=
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.1
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: E2QGSOJLMJWS5YCHJUNAUUN3X232INZI
X-Message-ID-Hash: E2QGSOJLMJWS5YCHJUNAUUN3X232INZI
X-Mailman-Approved-At: Thu, 15 Aug 2024 08:23:15 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E2QGSOJLMJWS5YCHJUNAUUN3X232INZI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the necessary sound card bits and some dts additions to enable sound
over DisplayPort-over-USB-C, e.g. to a connected TV or monitor.

The UCM files can be found here:
https://gitlab.com/postmarketOS/pmaports/-/tree/master/device/testing/device-fairphone-fp5/ucm

Two extra notes:

1. I don't quite understand whether the sound driver should have
   SoC-specific compatible or device-specific compatible. Some earlier
   patches by another author for a QCM6490 board and a QCS6490 board use
   device-specific compatible - but from what I can tell this is not how
   it's generally done for other sound drivers?

2. Unfortunately DisplayPort enablement itself for Fairphone 5 is not
   upstream yet. This is blocked by DSI display bringup upstream which
   is blocked by DSC 1:1:1 not being supported upstream yet and just
   working with a hacky patch. Nevertheless, DisplayPort audio was
   validated working with no additional sound-related changes so once
   DisplayPort gets enabled, sound should also just work upstream.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      ASoC: dt-bindings: qcom,sm8250: Add generic QCM6490 sound card
      ASoC: qcom: sc8280xp: Add support for generic QCM6490
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add DisplayPort sound support

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 37 ++++++++++++++++++++++
 sound/soc/qcom/sc8280xp.c                          |  1 +
 3 files changed, 39 insertions(+)
---
base-commit: 6cdb38a56eaf615abc60fbeec0e4ccbdf93468e3
change-id: 20240809-fp5-dp-sound-b3768f3019bd

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

