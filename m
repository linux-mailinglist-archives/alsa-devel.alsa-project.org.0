Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9874D8765D0
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Mar 2024 14:59:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FE3084A;
	Fri,  8 Mar 2024 14:59:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FE3084A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709906389;
	bh=QXNA9tK+wmD2HHQFcTyFQ7nNugKbTesrK1cHl52yxac=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PTySBhIhiJGKc7BUbLVev7AcafRR+k4EUTQTg6hvZR33NP6E5416ZXbj5YJhSkbGR
	 eZ23DiMfJJ4lYe4AeqYCcChfrgbp2ZYqcsHse97YTocy2kjoo9lW/McHsKRu3NhtMu
	 PoGTuBabVFmynqKeRsRUdyfqxTcb3nvUtIZskQ/s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C819F805AE; Fri,  8 Mar 2024 14:59:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E142F805A9;
	Fri,  8 Mar 2024 14:59:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9774FF80496; Fri,  8 Mar 2024 14:59:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CFA0F80088
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 14:59:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CFA0F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=WkjmJMD9
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4286juhT000826;
	Fri, 8 Mar 2024 07:59:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=d
	yH+H0ET4bfpETq9uSfKDHwS0TiJSVm0/9UjiFrw1Jc=; b=WkjmJMD9A5Sz8dkxo
	FD1JGeB7zDA6cxNieh+CJIwTTkOWEy57p0d+6Ppi2TZeBb1we138EGpnvdmij37z
	Ey2L2NOIEiUKWcwINcG/dbe1QfjGU6ONNnJKKMNAsJU/nHSTpFGiMT09ofXoo5NW
	xaw+NLcIBegx/zgWB4ArskBCQuMs6Awfa9dunQkc/P8Yx6GVO/TP1L16e3yL/uBi
	Ufr004L8mfJ95rcEsMMWNyH1+kaXCrcnMm1q4/GdZmo09RLo/mUiffXsWI3BN/T4
	bJc89x6nR6/BGhg6qGs5x+W2EKqgyMr1+Y1qbybH9Uf6ycpq2ISZ30wqxthBpMD1
	zmzlA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wpn933f32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 07:59:02 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 8 Mar 2024
 13:59:00 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Fri, 8 Mar 2024 13:59:00 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B4D59820242;
	Fri,  8 Mar 2024 13:59:00 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <hdegoede@redhat.com>,
        <lenb@kernel.org>, <rafael@kernel.org>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <platform-driver-x86@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 0/3] ALSA: Add support for Cirrus Logic CS35L54 and CS35L57
Date: Fri, 8 Mar 2024 13:58:57 +0000
Message-ID: <20240308135900.603192-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3Pz0AOdoologX1j2pdPnX3OURDvv61KF
X-Proofpoint-ORIG-GUID: 3Pz0AOdoologX1j2pdPnX3OURDvv61KF
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IA3LGSLHOUSEVXVFCYDHZNGEQ75ZOVWM
X-Message-ID-Hash: IA3LGSLHOUSEVXVFCYDHZNGEQ75ZOVWM
X-MailFrom: prvs=07979bcd0a=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IA3LGSLHOUSEVXVFCYDHZNGEQ75ZOVWM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The CS35L54 and CS35L57 are Boosted Smart Amplifiers. The CS35L54 has
I2C/SPI control and I2S/TDM audio. The CS35L57 also has SoundWire
control and audio.
    
The hardware differences between L54, L56 and L57 do not affect the
driver control interface so they can all be handled by the same driver.

The HDA patch has build dependencies on the ASoC patch.

The final patch updates serial-multi-instantiate and scan.c to trap
the ACPI HID for HDA systems that declare multiple amps all under one
Device() node. This patch does not have any build dependency on the
first two patches so can be taken separately.

Simon Trimmer (3):
  ASoC: cs35l56: Add support for CS35L54 and CS35L57
  ALSA: hda: cs35l56: Add support for CS35L54 and CS35L57
  platform/x86: serial-multi-instantiate: Add support for CS35L54 and
    CS35L57

 drivers/acpi/scan.c                           |  2 ++
 .../platform/x86/serial-multi-instantiate.c   | 28 +++++++++++++++++++
 include/sound/cs35l56.h                       |  1 +
 sound/pci/hda/cs35l56_hda.c                   | 16 +++++++----
 sound/pci/hda/cs35l56_hda.h                   |  2 +-
 sound/pci/hda/cs35l56_hda_i2c.c               |  7 +++--
 sound/pci/hda/cs35l56_hda_spi.c               |  7 +++--
 sound/soc/codecs/cs35l56-sdw.c                |  3 +-
 sound/soc/codecs/cs35l56-shared.c             |  8 ++++--
 sound/soc/codecs/cs35l56.c                    | 14 +++++++++-
 10 files changed, 73 insertions(+), 15 deletions(-)

-- 
2.30.2

