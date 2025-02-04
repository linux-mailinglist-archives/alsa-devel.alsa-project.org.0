Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 944B7A37F5B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2025 11:08:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E94846028B;
	Mon, 17 Feb 2025 11:07:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E94846028B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739786881;
	bh=hTXjfUYY5jkGWVr3mwx6N3NFTy2eiwGjxT5HEGQnA0I=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rSFeXkGw7Vczn9iBfdDE6M769nO9K7/7vmwKDXqCz3ifQOgRr9A1Fl2Yb3yeMlVlJ
	 vbQgWXxdjRxMgjVOtT4MMaKzbcVaNZa4wHRw1ttXwBZN1Re0EFk+AKa2uFCfaRgGO5
	 /bstKXnDfG5B3QqpKMoZQm3lzCqlSgv5kNhYz8T8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 539FBF805E8; Mon, 17 Feb 2025 11:07:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 266C2F805C9;
	Mon, 17 Feb 2025 11:07:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15642F80528; Wed,  5 Feb 2025 00:19:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD09DF800BD
	for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2025 00:19:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD09DF800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=e/LSWgbH
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 514FmiGj029318;
	Tue, 4 Feb 2025 17:19:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ZHHnYJ0H+qOjkw25
	Mfu1e2Mk+Cj3/9kmu6Acd5OIRLc=; b=e/LSWgbHbdqAy5e4Au0YqEACXX3/BJ2R
	5eL7sDXobIum2lr0Q2e2nMK3KRClXtMJhuWxncQ3pwjp7Xz4FxU8dIaNHo+qNQZl
	396BEi0pdbkDdw+yUjZurhSi07DB1ycpz36MSURdy8rsiSSsWJ5I1nFshgiPsU7c
	DmXWJ87vcSSRcdkV82q5qefHOeZ8aBr2l5l7ZKu+Mw3549XlgDwJ2tOhqDRIITRJ
	Ah+lfubPWAZaYyTbTQToSQPFrybuzWOy9O9l6/IaDlr9kT/8Rh7okIIvVgqvMfvn
	FSZtRWrBYoMHRKcmVAJikRQeonuVPn4g0exYwqEhJcyHQZ98NRo5cg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44hhw53pjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 17:19:18 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 4 Feb
 2025 23:19:15 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 4 Feb 2025 23:19:10 +0000
Received: from ftrev.crystal.cirrus.com (ftrev.ad.cirrus.com [141.131.145.81])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 53E69820248;
	Tue,  4 Feb 2025 23:19:06 +0000 (UTC)
From: Fred Treven <ftreven@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        James Ogletree <jogletre@opensource.cirrus.com>,
        Ben Bright
	<ben.bright@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Jeff LaBundy
	<jeff@labundy.com>, Heiko Stuebner <heiko@sntech.de>,
        Karel Balej
	<balejk@matfyz.cz>,
        Igor Prusov <ivprusov@salutedevices.com>,
        Jack Yu
	<jack.yu@realtek.com>,
        Weidong Wang <wangweidong.a@awinic.com>,
        Binbin Zhou
	<zhoubinbin@loongson.cn>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        "Paul
 Handrigan" <paulha@opensource.cirrus.com>,
        Masahiro Yamada
	<masahiroy@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
        Fred Treven
	<ftreven@opensource.cirrus.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH RESEND 0/7] Initial Support for CS40L26
Date: Tue, 4 Feb 2025 17:18:29 -0600
Message-ID: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: QamCuf7WV-kZl5nFaQXqFsH101IxiZvn
X-Authority-Analysis: v=2.4 cv=W/3CVQWk c=1 sm=1 tr=0 ts=67a2a076 cx=c_pps
 a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17
 a=T2h4t0Lz3GQA:10 a=78G1mFUK9uwQN7RrU40A:9
X-Proofpoint-GUID: QamCuf7WV-kZl5nFaQXqFsH101IxiZvn
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=113024ff55=ftreven@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZWC24IEO47MEDY4THKZ33MY2GEDLLUED
X-Message-ID-Hash: ZWC24IEO47MEDY4THKZ33MY2GEDLLUED
X-Mailman-Approved-At: Mon, 17 Feb 2025 10:07:19 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZWC24IEO47MEDY4THKZ33MY2GEDLLUED/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Introduce driver for Cirrus Logic Device CS40L26:
A boosted haptics driver with integrated DSP and
waveform memory with advanced closed loop algorithms
and LRA protection.

The core CS40L26 driver is in MFD and touches the
Input Force Feedback subsystem for haptics and
the ASoC subsystem for audio to haptics streaming.

This patchset includes changes to the CS DSP firmware
driver which fixes two bugs and introduces support for
multiple coefficient files.

Fred Treven (7):
  firmware: cs_dsp: Fix error checking in wseq_write()
  firmware: cs_dsp: Check for valid num_regs in
    cs_dsp_wseq_multi_write()
  firmware: cs_dsp: Add ability to load multiple coefficient files
  dt-bindings: mfd: cirrus,cs40l26: Support for CS40L26
  mfd: cs40l26: Add support for CS40L26 core driver
  ASoC: cs40l26: Support I2S streaming to CS40L26
  Input: cs40l26 - Add support for CS40L26 haptic driver

 .../bindings/mfd/cirrus,cs40l26.yaml          |   81 +
 MAINTAINERS                                   |    4 +-
 drivers/firmware/cirrus/cs_dsp.c              |   70 +-
 drivers/input/misc/Kconfig                    |   10 +
 drivers/input/misc/Makefile                   |    1 +
 drivers/input/misc/cs40l26-vibra.c            |  669 ++++++++
 drivers/mfd/Kconfig                           |   29 +
 drivers/mfd/Makefile                          |    4 +
 drivers/mfd/cs40l26-core.c                    | 1412 +++++++++++++++++
 drivers/mfd/cs40l26-i2c.c                     |   63 +
 drivers/mfd/cs40l26-spi.c                     |   63 +
 include/linux/firmware/cirrus/cs_dsp.h        |   14 +
 include/linux/mfd/cs40l26.h                   |  341 ++++
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/cs40l26-codec.c              |  523 ++++++
 16 files changed, 3281 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/cirrus,cs40l26.yaml
 create mode 100644 drivers/input/misc/cs40l26-vibra.c
 create mode 100644 drivers/mfd/cs40l26-core.c
 create mode 100644 drivers/mfd/cs40l26-i2c.c
 create mode 100644 drivers/mfd/cs40l26-spi.c
 create mode 100644 include/linux/mfd/cs40l26.h
 create mode 100644 sound/soc/codecs/cs40l26-codec.c

-- 
2.34.1

