Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3527F4D1E70
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 18:18:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C088C16E8;
	Tue,  8 Mar 2022 18:18:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C088C16E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646759930;
	bh=XlEF5yJuUaGcyFBNauk1Rxu+ukdIdn6GQxAKs0vTpNQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lQmNKwCiOmPEdOwFJV1VgquXYy4N54GnHZK/g6RdOSm7RQoqMPsTbxUiEUMhzRq0o
	 c7NNvOvZ3GGyRRqXN5SlmGbDKg9JWKCamT7XTK/41CW56TZ3ipzw481r61nXqUSrC5
	 +4D1MmzZWJJkayw9w4vOSlzMvJfM3H94xF0o4F/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37936F80271;
	Tue,  8 Mar 2022 18:17:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC259F80271; Tue,  8 Mar 2022 18:17:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E89F7F800D2
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 18:17:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E89F7F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="JX/h4Eoi"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 228FxtbT015166;
 Tue, 8 Mar 2022 11:17:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=ct6f8v+b3c9iZFTsuJ+tCBScraovnh0qwyDJ/LoPqIQ=;
 b=JX/h4EoiuTDt10EmzTVbV+r8ONYg9fFWniIVfFpV4nQPLgZ8qzxRDvBvOA6xz1FFQvCy
 ST3FKXcN1FenpIvJV1HJl8lYYCKnvx3VkCvBgXjqTtb6RZoG0y92tyfr9xFvMHR61Ftw
 5n8t0otRTzmWA3CFPw1SNA2O6HTlYuJXjBFRzR4pGMwV46akpgVjgDVPRqvzE4lsetis
 ozijxSHwdmjK6o2QHtErc7izMqXcvqWWxhfnzsl1bfWZSM+jHfC0zSvz3+zVPoTdtI5Z
 JOVeJSof6JTMABKy2zYTBmntQI/+qb8wr9WNviMPL9b3tasvaxZDqjaOZ/JSNXuGcDRG EA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3em55svhnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 08 Mar 2022 11:17:33 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Mar
 2022 17:17:31 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Tue, 8 Mar 2022 17:17:31 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.38])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3C312B06;
 Tue,  8 Mar 2022 17:17:31 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 00/16] Support external boost at CS35l41 ASoC driver
Date: Tue, 8 Mar 2022 17:17:14 +0000
Message-ID: <20220308171730.454587-1-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: XR-m0K5S2IcWeMonhctnAFUFDN43nhlM
X-Proofpoint-GUID: XR-m0K5S2IcWeMonhctnAFUFDN43nhlM
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 devicetree@vger.kernel.org
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

Move the support for CS35L41 external boost to its shared library
for ASoC use.
This move resulted in cs35l41_hda_reg_sequence being removed,
and its steps were broken down into regmap writes or functions
from the library. And hardware configuration struct was unified
for its use in the shared lib.
While at it, some minor bugs were found and fixed it.

v3 changelog:
 - Remove patches already accepted
 - Improved logic in documentation patch
 - Documentation patch goes before its code
 - Fixed missing Signed-off-by
 - Fixed subject for HDA patches

v2 changelog:
 - Instead of removing the log, playback actions will log the last regmap access.
 - Documentation patch with the correct subject line and fixed bug reported by Rob Herring on the
 provided example.

Previous versions:
 v1: https://lkml.org/lkml/2022/3/3/759
 v2: https://lkml.org/lkml/2022/3/4/743

David Rhodes (1):
  ASoC: dt-bindings: cs35l41: Document CS35l41 External Boost

Lucas Tanure (15):
  sound: cs35l41: Unify hardware configuration
  sound: cs35l41: Check hw_config before using it
  sound: cs35l41: Move cs35l41_gpio_config to shared lib
  ALSA: hda: cs35l41: Fix I2S params comments
  ALSA: hda: cs35l41: Always configure the DAI
  ALSA: hda: cs35l41: Add Boost type flag
  hda: cs35l41: Put the device into safe mode for external boost
  hda: cs35l41: Mute the device before shutdown
  sound: cs35l41: Enable Internal Boost in shared lib
  ALSA: hda: cs35l41: Move boost config to initialization code
  ALSA: hda: cs35l41: Remove cs35l41_hda_reg_sequence struct
  ALSA: hda: cs35l41: Reorganize log for playback actions
  ALSA: hda: cs35l41: Handle all external boost setups the same way
  ALSA: hda: cs35l41: Move external boost handling to lib for ASoC use
  ASoC: cs35l41: Support external boost

 .../bindings/sound/cirrus,cs35l41.yaml        |  44 ++-
 include/sound/cs35l41.h                       |  53 +++-
 sound/pci/hda/cs35l41_hda.c                   | 295 ++++++------------
 sound/pci/hda/cs35l41_hda.h                   |  27 +-
 sound/soc/codecs/cs35l41-i2c.c                |   4 +-
 sound/soc/codecs/cs35l41-lib.c                | 190 ++++++++++-
 sound/soc/codecs/cs35l41-spi.c                |   4 +-
 sound/soc/codecs/cs35l41.c                    | 166 +++++-----
 sound/soc/codecs/cs35l41.h                    |   5 +-
 9 files changed, 437 insertions(+), 351 deletions(-)

-- 
2.35.1

