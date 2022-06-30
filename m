Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0091560DEB
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 02:24:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4338C1636;
	Thu, 30 Jun 2022 02:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4338C1636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656548690;
	bh=zjz5reZq2x1AEh2QreKKnA4Tki+OCeTSwQ7srEOopdM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XAds8J2sMoxD2Z/vsZvvDrxMx1lCPxIkFSFe8J/YayY/63ulviZwA+ZR7JS6GrJw2
	 qvglOQJgXkc0E43i/LlBy2Sjyp0qi39cndpYNBJTGwOlAvmmxuBLTqNjM8wrPp71zf
	 VMzjkS8GQSfOZx5sF0AbIoP3jvcCXcHPuNJmFfPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B83C5F80245;
	Thu, 30 Jun 2022 02:23:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AB70F80245; Thu, 30 Jun 2022 02:23:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF217F80115
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 02:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF217F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="mKbG3Wna"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25TNvJvG021960;
 Wed, 29 Jun 2022 19:23:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=oUm9OGlO8y2JiDbD8O6kuDzqGt+w9zxkAJ1wrpdYSTE=;
 b=mKbG3WnatP+SDRHfpkOBOtQvrmYPzimrfCYk8jqsFfMjiJ2k+Zx5wCS8HepLc806NSgn
 UVZbh0Jub7pwNPj79PKvcDUTxC2rN/NH3HIV7iMvXu+CPMnkY6LCk/OhLDyqSCXyLRHv
 LDKUgDRAOyG5BLbojcQ9+3AnhN6Q6/ysR9PFO0o0XSW4a4HklN+DVUV9sMYXLNOPDRBo
 R4UYmff4iAF72XArRlcz+gPOU5pBVIIjJoNe05MEJ4Uwcr4v7/7RjhOh5JXCcUW3I07W
 vHpGbinyFsZ8wg+0MTDj1uY+i7tGjcF/Zv9gtQ4GFR4LkCXVx/qBqbwziMtJWOn7PE5/ nw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gwxsq5vf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Jun 2022 19:23:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 30 Jun
 2022 01:23:36 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 30 Jun 2022 01:23:36 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.125])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1958C2A9;
 Thu, 30 Jun 2022 00:23:36 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v8 00/14] ALSA: hda: cirrus: Add initial DSP support and
 firmware loading
Date: Thu, 30 Jun 2022 01:23:21 +0100
Message-ID: <20220630002335.366545-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: iahNl7avNbhLrGyp8oKGLWE2L7bk4rXM
X-Proofpoint-ORIG-GUID: iahNl7avNbhLrGyp8oKGLWE2L7bk4rXM
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

changes since v7:
 - Use private_data rather than private_value to save control info
 - Clean up alsa control memory allocation/deallocation
 - Remove unnecessary whitespace
 - Get subsystem id from codec, rather than saving it separately

changes since v6:
 - Fix warning by kernel test robot <lkp@intel.com>
 
changes since v5:
 - Fix warning by kernel test robot <lkp@intel.com>
 
changes since v4:
- Fully remove tlv remnants from control add apis
- Remove unnecessary debug
- Rename variable to be more generic
- Remove redundent length check from read/write control apis


- Use SNDRV_CTL_ELEM_IFACE_CARD for firmware load controls
- Make kcontrol add/remove synchronous
- Load firmware asynchronous when loading via control
- Used cached controls when reloading firmware; only delete
controls when removing the driver itself


- Improve kcontrol remove
- Fix control write + notify
- Cleanup of unnecessary code
- Fix race condition when loading firmware before playback
- Ensure errors are properly propogated
- Fix include for Module parameters

Stefan Binding (13):
  ALSA: hda: hda_cs_dsp_ctl: Add Library to support CS_DSP ALSA controls
  ALSA: hda: hda_cs_dsp_ctl: Add apis to write the controls directly
  ALSA: hda: cs35l41: Save codec object inside component struct
  ALSA: hda: cs35l41: Save Subsystem ID inside CS35L41 Driver
  ALSA: hda: cs35l41: Support reading subsystem id from ACPI
  ALSA: hda: cs35l41: Support multiple load paths for firmware
  ALSA: hda: cs35l41: Support Speaker ID for laptops
  ALSA: hda: cs35l41: Support Hibernation during Suspend
  ALSA: hda: cs35l41: Read Speaker Calibration data from UEFI variables
  ALSA: hda: hda_cs_dsp_ctl: Add fw id strings
  ALSA: hda: cs35l41: Add defaulted values into dsp bypass config
    sequence
  ALSA: hda: cs35l41: Support Firmware switching and reloading
  ALSA: hda: cs35l41: Add module parameter to control firmware load

Vitaly Rodionov (1):
  ALSA: hda: cs35l41: Add initial DSP support and firmware loading

 MAINTAINERS                     |   1 +
 include/sound/cs35l41.h         |   4 +
 sound/pci/hda/Kconfig           |   8 +
 sound/pci/hda/Makefile          |   2 +
 sound/pci/hda/cs35l41_hda.c     | 883 +++++++++++++++++++++++++++++++-
 sound/pci/hda/cs35l41_hda.h     |  39 ++
 sound/pci/hda/cs35l41_hda_i2c.c |   1 +
 sound/pci/hda/cs35l41_hda_spi.c |   1 +
 sound/pci/hda/hda_component.h   |   3 +
 sound/pci/hda/hda_cs_dsp_ctl.c  | 240 +++++++++
 sound/pci/hda/hda_cs_dsp_ctl.h  |  39 ++
 sound/pci/hda/patch_realtek.c   |  26 +-
 12 files changed, 1242 insertions(+), 5 deletions(-)
 create mode 100644 sound/pci/hda/hda_cs_dsp_ctl.c
 create mode 100644 sound/pci/hda/hda_cs_dsp_ctl.h

-- 
2.34.1

