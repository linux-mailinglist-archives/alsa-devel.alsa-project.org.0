Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 089994CD736
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 16:08:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A93961B1B;
	Fri,  4 Mar 2022 16:07:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A93961B1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646406523;
	bh=OdZYYssmo6c3Mb8xzOcqNZaS3P1T+ZOfW8NYzLJeuaM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fvVaWm5YSOr5jt/lyf630WVFha7Z0E5tUzscmtGJwoA1DjKvLwI7zcijM+657yf9C
	 NIOGS3C26iIZJ8TcvGSpLCcNj7dRB+/foTLCMWD18gIqUsno378hnu95hjfuLxM57+
	 nhKIvXKCIoufP8SABR9w408Nn1Ij9Q9on4A99S1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50904F80519;
	Fri,  4 Mar 2022 16:07:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CBAEF80515; Fri,  4 Mar 2022 16:07:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AC65F80139
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 16:07:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AC65F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="nthAdfW/"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2248TInB019088;
 Fri, 4 Mar 2022 09:07:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=o/svsH3mKdQh2w7l93HqT3MWcfDGsdP0tpIyvmUqC4M=;
 b=nthAdfW/pHfh/griJOYc4x7Zctg2Xl04KxrLrkfbMFeuQCkMKwxp8Plpu3rkXnPjvYOo
 9jSlhZUf9i2XNVF1Ya26Zup0qXM0y+gEIaFQcJeSWEBF2KoWGI+OvaTTgmSWIAEbAWcb
 sON3CPUbHcVj1CNlgs+Re+h1aKICOkxn6znnNuHIninxScyna7rH4L7sUO3Vh75JI1Gc
 iKhKPFmymlJ+Euh82t63J69T8kI6ql0OgLtFVNa7h4MxLCCSj7chNvtwJYNKKCUBnjUr
 ZcyWUmtQJ5vKb31J5YplxwnUMad1eU+xxpEL4iU6JBUfPrkGduxgxvVeWvpsCjl73li2 rg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ek4j3h413-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 04 Mar 2022 09:07:25 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Mar
 2022 15:07:23 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 4 Mar 2022 15:07:23 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.198])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 52417B06;
 Fri,  4 Mar 2022 15:07:23 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 00/20] Support external boost at CS35l41 ASoC driver
Date: Fri, 4 Mar 2022 15:07:01 +0000
Message-ID: <20220304150721.3802-1-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ehVGpwv1bl5E8i1YZkXmXSNJ6dLE_oD6
X-Proofpoint-ORIG-GUID: ehVGpwv1bl5E8i1YZkXmXSNJ6dLE_oD6
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

v2 changelog:
 - Instead of removing the log, playback actions will log the last regmap access.
 - Documentation patch with the correct subject line and fixed bug reported by Rob Herring on the
 provided example.

Previous versions:
 v1: https://lkml.org/lkml/2022/3/3/759

David Rhodes (2):
  ASoC: cs35l41: Fix GPIO2 configuration
  ASoC: cs35l41: Document CS35l41 External Boost

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
  hda: cs35l41: Remove cs35l41_hda_reg_sequence struct
  hda: cs35l41: Reorganize log for playback actions
  hda: cs35l41: Handle all external boost setups the same way
  hda: cs35l41: Move external boost handling to lib for ASoC use
  ASoC: cs35l41: Support external boost

 .../bindings/sound/cirrus,cs35l41.yaml        |  44 ++-
 include/sound/cs35l41.h                       |  53 +++-
 sound/pci/hda/cs35l41_hda.c                   | 295 ++++++------------
 sound/pci/hda/cs35l41_hda.h                   |  27 +-
 sound/soc/codecs/cs35l41-i2c.c                |   4 +-
 sound/soc/codecs/cs35l41-lib.c                | 190 ++++++++++-
 sound/soc/codecs/cs35l41-spi.c                |   4 +-
 sound/soc/codecs/cs35l41.c                    | 174 +++++------
 sound/soc/codecs/cs35l41.h                    |   5 +-
 9 files changed, 440 insertions(+), 356 deletions(-)

-- 
2.35.1

