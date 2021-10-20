Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BD8434783
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 11:01:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2FC3169A;
	Wed, 20 Oct 2021 11:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2FC3169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634720479;
	bh=qYfhCbq88ROgU/66amRctqf3Ba0Cq+lfrmgnJ0faRpI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LeFUEViftWvaiwP6nnazYzHOQcbkXWvEDwbUGW8NQ6obmC8o7wClaaUlBCOyg4MWt
	 o76XVOUWPJA9xYgKpDkh0p8sx/PZxz0EoGB3jxKWkJM9ZduXT5UFktBtAHZMfUK02S
	 7fpKnJYSFZG95mJmL5tCTc+Fex14ogUqbi0hWebE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F417F80224;
	Wed, 20 Oct 2021 11:00:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FDEFF80253; Wed, 20 Oct 2021 10:59:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF2C6F800ED
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 10:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF2C6F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="XErknXsh"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19K5H3Xu026523; 
 Wed, 20 Oct 2021 03:59:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=+O36JWjC5ZXwGoQw3AKB9Rbjg7nf6gOPh3aLObxoE7g=;
 b=XErknXshbsjFnZr/Nugoff10RIBBHz8dqo1WlCdqhGTXlGVxUjHOYR7kI8l5L8L58hcG
 BnmLjECpvtmbzGzp41xa4IjBPsQlu0xbe24yyekcyIgDEWHxUfGA/Dav8Cpc0pPmZ1Ah
 w5zGvcyzv8apHE4Qx40SFtoyTtoZ/tjPQ42NyGSmd/AaFK4djSVtoWDCZBL2LyQ1vYm9
 LbOAy0HqWlAxhycNwvzTD4tH8T/yZsR896xqilWelcbQeRHS9O0heb/KJtzJZ/lHMZU7
 9pymEhYZiUYDK5ebyS88TmrBWlvzQTQgl16doOAmfTtpDNfzLcaiG4tUzrlxA4urG2HI 9w== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3bst7q1jty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 20 Oct 2021 03:59:48 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Wed, 20 Oct
 2021 09:59:46 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Wed, 20 Oct 2021 09:59:46 +0100
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.166])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AA18711D2;
 Wed, 20 Oct 2021 08:59:45 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, "Jaroslav
 Kysela" <perex@perex.cz>, Len Brown <lenb@kernel.org>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>
Subject: [RFC PATCH v2 0/3] Add support for Legion 7 16ACHg6 laptop
Date: Wed, 20 Oct 2021 09:59:41 +0100
Message-ID: <20211020085944.17577-1-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: tQDFLlznbJ_LI0CRoY4fRA16gpamDsvt
X-Proofpoint-GUID: tQDFLlznbJ_LI0CRoY4fRA16gpamDsvt
X-Proofpoint-Spam-Reason: safe
Cc: linux-acpi@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com
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

Hi,

I would like to get some guidance about this solution to
support the 16ACHg6 laptop.

Hardware:
 - The 16ACHg6 laptop has two CS35L41 amplifiers, connected
to Realtek ALC287 by an I2S bus and by and direct I2C to the CPU.
 - The ALC287 codec is connected to the CPU by an HDA bus.
 - The CS35L41 has a DSP which will require firmware to be loaded.

Architecture:
 - To load the firmware for CS35L41, this solution will require
the wm_adsp library, which requires regmap, header definitions and
register tables.
 - The HDA machine driver will find the registered ASoC by its
 dai name.
 - To minimize the duplication of the code, the HDA will call
 snd_soc_dai_ops from the ASoC driver.

Notes:
 - This is a work in progress, so the code is not functional, its
only intent is to demonstrate the overall solution

Changes from V1:

 - Split into multiple patches, separating ACPI, ASoC and HDA patches
 - Removed CS35L41 exported functions, moved code to snd_soc_dai_ops
 - Patch realtek uses dai ops functions

Lucas Tanure (3):
  sound: cs35l41: Allow HDA systems to use CS35l41 ASoC driver
  ALSA: hda/realtek: Add support for Legion 7 16ACHg6 laptop Speakers
  ACPI / scan: Create platform device for INT3515 ACPI nodes

 drivers/acpi/scan.c                          |   1 +
 drivers/platform/x86/i2c-multi-instantiate.c |   7 +
 include/sound/cs35l41.h                      |   1 +
 sound/pci/hda/patch_realtek.c                | 109 ++++++++++++++-
 sound/soc/codecs/cs35l41.c                   | 139 +++++++++++++++++--
 sound/soc/codecs/cs35l41.h                   |   1 +
 6 files changed, 249 insertions(+), 9 deletions(-)

-- 
2.33.1

