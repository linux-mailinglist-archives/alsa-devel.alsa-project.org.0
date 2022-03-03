Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8094CC3E9
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 18:32:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86AAB17CF;
	Thu,  3 Mar 2022 18:31:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86AAB17CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646328741;
	bh=rckFrXc+EQlZBum0ZyfONDbiWqrnvfxK8XH1YlcITic=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MQ56NU5NPAB6Mvr/k0ROG++sFR0hVDyYKy2XE3rhNGfeYNGh499bcPa09/5sqjwgT
	 vI6jT3gC5i3guHcps7xshcMjG4GNaKpd1TtW1MBKZfdcjs9b2Clq/VToeuR1Tqb6JL
	 IAwRLxnP1IEnuQCVPubc2TSiLqT1fd/UPndjO0Es=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0EDAF8051A;
	Thu,  3 Mar 2022 18:31:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30FF4F80167; Thu,  3 Mar 2022 18:31:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10F6CF800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 18:31:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10F6CF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="HypInva5"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2234AADq028599;
 Thu, 3 Mar 2022 11:31:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=84WJudr3xL0dnDa99zgx/2vbQMEBCtApcqUKb6n+efY=;
 b=HypInva52hCFc29e6Nv9O3DrICfHRSSEQ0AAoQ2ML9sNQHTJ+L6KCmvpqsU8U/3H/pbp
 NkGodak61EfPyU+MX2Q4Tvgv5z0ByntS35sawRFBzq4m645/LxUlg7kJ5iq4ZSHuu70n
 qq2awF0yVCIVSoMKTb3g2h3Cz8SemV6qfbyOhoP6v04Wf2+ZPUdRRUqd6dYeaaEYaMkL
 APIZ2wrTRX23oXyUUByJMXQTmPxAd4lj17lq086R69yd/UUxzGRJCqvsJL+1NOGYdvbU
 s/WGIjfC6rvchwd8r80d8exjj7suA/RLFyYIvsGtitr8gRkp43q8ElrllOkLZ9VAAXvz BQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ejncq8ybk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 03 Mar 2022 11:31:04 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 17:31:02 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 3 Mar 2022 17:31:02 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.198])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BAA842A1;
 Thu,  3 Mar 2022 17:31:01 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 00/20] Support external boost at CS35l41 ASoC driver
Date: Thu, 3 Mar 2022 17:30:39 +0000
Message-ID: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 6tBsN7_2izzr_E_NtrMPINF7rOwLB622
X-Proofpoint-GUID: 6tBsN7_2izzr_E_NtrMPINF7rOwLB622
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

David Rhodes (2):
  ASoC: cs35l41: Fix GPIO2 configuration
  Documentation: devicetree: CS35l41 External Boost

Lucas Tanure (18):
  ASoC: cs35l41: Fix max number of TX channels
  ASoC: cs35l41: Fix DSP mbox start command and global enable order
  ASoC: cs35l41: Remove unnecessary param
  sound: cs35l41: Unify hardware configuration
  sound: cs35l41: Check hw_config before using it
  sound: cs35l41: Move cs35l41_gpio_config to shared lib
  hda: cs35l41: Fix I2S params comments
  hda: cs35l41: Always configure the DAI
  hda: cs35l41: Add Boost type flag
  hda: cs35l41: Put the device into safe mode for external boost
  hda: cs35l41: Mute the device before shutdown
  sound: cs35l41: Enable Internal Boost in shared lib
  hda: cs35l41: Move boost config to initialization code
  hda: cs35l41: Remove unnecessary log
  hda: cs35l41: Remove cs35l41_hda_reg_sequence struct
  hda: cs35l41: Handle all external boost setups the same way
  hda: cs35l41: Move external boost handling to lib for ASoC use
  ASoC: cs35l41: Support external boost

 .../bindings/sound/cirrus,cs35l41.yaml        |  42 ++-
 include/sound/cs35l41.h                       |  53 +++-
 sound/pci/hda/cs35l41_hda.c                   | 296 +++++-------------
 sound/pci/hda/cs35l41_hda.h                   |  27 +-
 sound/soc/codecs/cs35l41-i2c.c                |   4 +-
 sound/soc/codecs/cs35l41-lib.c                | 185 ++++++++++-
 sound/soc/codecs/cs35l41-spi.c                |   4 +-
 sound/soc/codecs/cs35l41.c                    | 174 +++++-----
 sound/soc/codecs/cs35l41.h                    |   5 +-
 9 files changed, 431 insertions(+), 359 deletions(-)

-- 
2.35.1

