Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74186511B9B
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 17:08:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04836166C;
	Wed, 27 Apr 2022 17:07:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04836166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651072114;
	bh=YGq5cp7F2WcrDcFaY/sPH8LxZl4+AhIh0Reu89hiUfM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WlQD1+ynjDNWyulv6Kyb0J9qtDIBc/hkT1WKnclQ95V8hDkX9bwiqyzc95EcmH1Wn
	 0zmnekNF1CQOCivkDgyUG4vVCVEOfs0QMGPXu2++/xojk4+rvSEP0+UxmWba25XyBq
	 +oVNMHykeMLrjG0cSP11b1KRljrbqDZErr3oVOKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F466F8030F;
	Wed, 27 Apr 2022 17:07:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3A69F80253; Wed, 27 Apr 2022 17:07:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4250F80155
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 17:07:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4250F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dNMVB8sp"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23RBg6q7022428;
 Wed, 27 Apr 2022 10:07:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=xR1QWzKvp1UrM/eWKGRBrJ3BcY+T0HsyNQaHdSr1YGM=;
 b=dNMVB8spQQGvjcwlp4+DWmzo3jnfctPK+xAfC8xUWPP6tSpLFt06XE9Ec3yxBzmbsvzW
 M407GkZys+BZjPn1ej59mY203Dc5LtI08Jj0G+tzbbXjVNK+YLJjfc1bl7N7mo3uuWTI
 AoegkWGLqwbV7K6PikUb2IEq5X7pSD5NrAhBY9A6Iy7vD1GsI6z63GTYYx6fu8KSMAib
 UeISQ4iQg5b37/V879ambUoPNuatUayLvg9Xft1GtBx984PNtirfBjbZzaSY/6hRbxxd
 LkmS6FSTkgc+fyYAXeR/k4d+Nh4o7zbE2tJ/YSQeZZivApf0vQkAtibBXKWlLk1cSN5f Gg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fprt60xte-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 27 Apr 2022 10:07:28 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 16:07:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 27 Apr 2022 16:07:21 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.170])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BC6C546C;
 Wed, 27 Apr 2022 15:07:20 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH 00/26] ALSA: hda: cirrus: Add initial DSP support and firmware
 loading
Date: Wed, 27 Apr 2022 16:06:54 +0100
Message-ID: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7w4C3NTm56UhG3OX1dWR5v8Xuz1h_S6I
X-Proofpoint-ORIG-GUID: 7w4C3NTm56UhG3OX1dWR5v8Xuz1h_S6I
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

The CS35L41 Amplifier contains a DSP, capable of running firmware.
The firmware can run algorithms such as Speaker Protection, to ensure
that playback at high gains do not harm the speakers.
Adding support for CS35L41 firmware into the CS35L41 HDA driver also
allows us to support several extra features, such as hiberation 
and interrupts.

The chain adds support in stages:
- General fixes to improve generalization and code re-use inside
  the CS35L41 HDA driver.
- Add support for interrupts into the driver, which is required
  for complete support of the firmware.
- Refactor ASoC CS35L41 code which deals with firmware to allow
  for code re-use inside the CS35L41 HDA driver.
- Add support for loading firmware and tuning files from file system,
  and creating alsa controls to control it.
- Support firmware load paths for different hardware systems.
- Support suspend/resume in the driver when using firmware. The firmware
  supports hibernation, which allows the CS35L41 to drop into a low
  power mode during suspend.
- Support the ability to unload firmware, swap and reload the firmware.
  This is to allow different firmware to run during calibration.

The intended use-case is to load the firmware once on boot, and the driver
autmatically tries to load the firmware after it binds to the HDA driver.
This behaviour can be switched off using a kconfig, if desired.

Stefan Binding (25):
  ALSA: hda: cs35l41: Fix error in spi cs35l41 hda driver name
  ALSA: hda: cs35l41: Set Speaker Position for CLSA0100 Laptop
  ALSA: hda: cs35l41: Remove Set Channel Map api from binding
  ALSA: hda: cs35l41: Add Support for Interrupts
  ALSA: hda: cs35l41: Enable GPIO2 Interrupt for CLSA0100 laptops
  ASoC: cs35l41: Move cs35l41_set_cspl_mbox_cmd to shared code
  ASoC: cs35l41: Move cs35l41 fs errata into shared code
  ASoC: cs35l41: Move cs_dsp config struct into shared code
  ALSA: hda: cs35l41: Add Amp Name based on channel and index
  ALSA: hda: hda_cs_dsp_ctl: Add Library to support CS_DSP ALSA controls
  ALSA: hda: hda_cs_dsp_ctl: Add apis to write the controls directly
  ALSA: hda: cs35l41: Save codec object inside component struct
  ALSA: hda: cs35l41: Save Subsystem ID inside CS35L41 Driver
  ALSA: hda: cs35l41: Support reading subsystem id from ACPI
  ALSA: hda: cs35l41: Support multiple load paths for firmware
  ALSA: hda: cs35l41: Support Speaker ID for laptops
  ASoC: cs35l41: Move cs35l41 exit hibernate function into shared code
  ALSA: cs35l41: Do not print error when waking from hibernation
  ASoC: cs35l41: Add common cs35l41 enter hibernate function
  ALSA: hda: cs35l41: Support Hibernation during Suspend
  ALSA: hda: cs35l41: Read Speaker Calibration data from UEFI variables
  ALSA: hda: hda_cs_dsp_ctl: Add fw id strings
  ALSA: hda: cs35l41: Add defaulted values into dsp bypass config
    sequence
  ALSA: hda: cs35l41: Support Firmware switching and reloading
  ALSA: hda: cs35l41: Add kernel config to disable firmware autoload

Vitaly Rodionov (1):
  ALSA: hda: cs35l41: Add initial DSP support and firmware loading

 MAINTAINERS                     |   1 +
 include/sound/cs35l41.h         |  84 +++
 sound/pci/hda/Kconfig           |  17 +
 sound/pci/hda/Makefile          |   2 +
 sound/pci/hda/cs35l41_hda.c     | 954 +++++++++++++++++++++++++++++++-
 sound/pci/hda/cs35l41_hda.h     |  41 ++
 sound/pci/hda/cs35l41_hda_i2c.c |   1 +
 sound/pci/hda/cs35l41_hda_spi.c |   3 +-
 sound/pci/hda/hda_component.h   |   6 +-
 sound/pci/hda/hda_cs_dsp_ctl.c  | 424 ++++++++++++++
 sound/pci/hda/hda_cs_dsp_ctl.h  |  40 ++
 sound/pci/hda/patch_realtek.c   |  81 +--
 sound/soc/codecs/cs35l41-lib.c  | 193 +++++++
 sound/soc/codecs/cs35l41.c      | 186 +------
 sound/soc/codecs/cs35l41.h      |  18 -
 15 files changed, 1797 insertions(+), 254 deletions(-)
 create mode 100644 sound/pci/hda/hda_cs_dsp_ctl.c
 create mode 100644 sound/pci/hda/hda_cs_dsp_ctl.h

-- 
2.32.0

