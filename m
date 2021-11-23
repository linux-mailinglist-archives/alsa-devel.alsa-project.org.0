Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D4F45B4E6
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:08:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D80631686;
	Wed, 24 Nov 2021 08:07:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D80631686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637737684;
	bh=catN777902tt1rL1/ptzyKoSkbEfm3notS8gDCy755I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IvjirdDPL7ewKCGUg38HWQc+AbNqHwDaqHKyufwH6ldmd97wwxOsILS9EzB3dlitJ
	 3ZYDxR4qN/qBxp54uiaSiVXFTSyK7OHyJlZdx8Uvi2OAkuV08CLDBocScgM1+4spQI
	 sbQClF/raX6xiXSZaFjj9vWuyPP+bi1cPifYYu9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFBD5F8011F;
	Wed, 24 Nov 2021 08:05:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C343F804F1; Tue, 23 Nov 2021 17:32:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05F7BF804E6
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 17:31:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05F7BF804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="cdqmwtw0"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1ANCeXB6012277;
 Tue, 23 Nov 2021 10:31:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=ucjt4u4uTbS/qnZq4hfiNfHKaM+njkEGxLdhXZteZWk=;
 b=cdqmwtw0ikxL8X54apKCvV2OhpmAGPO0XC639K5H7qExV0JE4uhL+ctpJDFFefLFBx2X
 krs7Xb3kQWq+JxZ/TsAHJwbwo8PY7HkGmAc+mGGBgP8SgSyTDHHwho56DsBxGysswYR4
 ae22w+hX2o0Qq26iZZ10AVZgDD3/3oRi0rs3fVNTz24hErlLooARRsmyVptdx2PNxzmt
 Y+eBWUlKgjx/SmkotdmTLnun7OIJSJHSQfKsc/JDHVKdhvqb4DQtWp4ZEHaCdnCrX0tQ
 f2uEKec9z6OyY55hc5GrpVQAf2leLCsp961NGFWCO/K4lmmktCGTpUnWL+HKLIduB2wS ow== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cg5ms21ng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Nov 2021 10:31:53 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 23 Nov
 2021 16:31:51 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 23 Nov 2021 16:31:51 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.11])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4C3562A1;
 Tue, 23 Nov 2021 16:31:50 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 "Liam Girdwood" <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Kailang Yang <kailang@realtek.com>,
 Shuming Fan <shumingf@realtek.com>, "Pierre-Louis
 Bossart" <pierre-louis.bossart@linux.intel.com>, David Rhodes
 <david.rhodes@cirrus.com>, Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: [PATCH v3 00/11] Add support for Legion 7 16ACHg6 laptop
Date: Tue, 23 Nov 2021 16:31:38 +0000
Message-ID: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ic3OlGLxT8IDaeMWD-aoYxFb4fz33N4k
X-Proofpoint-ORIG-GUID: ic3OlGLxT8IDaeMWD-aoYxFb4fz33N4k
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Wed, 24 Nov 2021 08:05:53 +0100
Cc: Chris Chiu <chris.chiu@canonical.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Jack Yu <jack.yu@realtek.com>, Lucas
 Tanure <tanureal@opensource.cirrus.com>, Arnd
 Bergmann <arnd@arndb.de>, Jeremy Szu <jeremy.szu@canonical.com>,
 patches@opensource.cirrus.com, Elia Devito <eliadevito@gmail.com>,
 alsa-devel@alsa-project.org, Werner Sembach <wse@tuxedocomputers.com>,
 platform-driver-x86@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 linux-acpi@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Sami Loone <sami@loone.fi>, Cameron Berkenpas <cam@neo-zeon.de>,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support for laptops that have CS35L41 connected to an
HDA codec by I2S and direct I2C/SPI connection to the CPU

Hardware:
 - The 16ACHg6 laptop has two CS35L41 amplifiers, connected
to Realtek ALC287 by an I2S bus and by and direct I2C to the CPU.
 - The ALC287 codec is connected to the CPU by an HDA bus.
 - The CS35L41 has a DSP which will require firmware to be loaded.

Architecture:
 - Creation of a library of shared functions for CS35L41 ASoC and HDA
 - HDA codec driver (RealTek) and CS35L41 HDA driver are combined
 by using component binding, where it uses device names to find the
 components and bind to the master
 - The HDA CS35L41 driver applies pre-defined registers sequences
 for each action in playback for HDA Sound card

Changes from V2:
 - Not an RFC
 - Create a new HDA driver for CS35L41 instead of using the ASoC one
 - Use component binding and device names to find the CS35L41 driver
 - Create a shared library for ASoC and HDA CS35L41 drivers

Lucas Tanure (11):
  ASoC: cs35l41: Set the max SPI speed for the whole device
  ASoC: cs35l41: Convert tables to shared source code
  ASoC: cs35l41: Move regmap config struct to shared code
  ASoC: cs35l41: Create function for init array of Supplies
  ASoC: cs35l41: Move cs35l41_otp_unpack to shared code
  ASoC: cs35l41: Move power initializations to reg_sequence
  ASoC: cs35l41: Create shared function for errata patches
  ASoC: cs35l41: Create shared function for setting channels
  ASoC: cs35l41: Create shared function for boost configuration
  hda: cs35l41: Add support for CS35L41 in HDA systems
  ACPI / scan: Create platform device for CLSA0100 ACPI nodes

 MAINTAINERS                                   |   2 +
 drivers/acpi/scan.c                           |   1 +
 drivers/platform/x86/i2c-multi-instantiate.c  |   7 +
 include/sound/cs35l41.h                       | 741 ++++++++++++++++++
 sound/pci/hda/Kconfig                         |  10 +
 sound/pci/hda/Makefile                        |  28 +-
 sound/pci/hda/cs35l41_hda.c                   | 522 ++++++++++++
 sound/pci/hda/cs35l41_hda.h                   |  69 ++
 sound/pci/hda/cs35l41_hda_i2c.c               |  61 ++
 sound/pci/hda/hda_component.h                 |  20 +
 sound/pci/hda/patch_realtek.c                 | 103 +++
 sound/soc/codecs/Makefile                     |   4 +-
 sound/soc/codecs/cs35l41-i2c.c                |  16 -
 .../{cs35l41-tables.c => cs35l41-lib.c}       | 400 +++++++++-
 sound/soc/codecs/cs35l41-spi.c                |  49 +-
 sound/soc/codecs/cs35l41.c                    | 390 +--------
 sound/soc/codecs/cs35l41.h                    | 739 -----------------
 17 files changed, 1964 insertions(+), 1198 deletions(-)
 create mode 100644 sound/pci/hda/cs35l41_hda.c
 create mode 100644 sound/pci/hda/cs35l41_hda.h
 create mode 100644 sound/pci/hda/cs35l41_hda_i2c.c
 create mode 100644 sound/pci/hda/hda_component.h
 rename sound/soc/codecs/{cs35l41-tables.c => cs35l41-lib.c} (68%)

-- 
2.34.0

