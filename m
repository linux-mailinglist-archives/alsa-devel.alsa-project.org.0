Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED774851E1
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 12:33:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFF2817D9;
	Wed,  5 Jan 2022 12:33:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFF2817D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641382439;
	bh=wj90GHONnIaG7P4MYdZkJSSPZXUXKBfTwow001lEje8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lNk2YDxhhbc2KEuIIuGs1pmCvdP2pUXwZotfhgXH/OBe3/ygkODpHjodRJ5HQQqur
	 bKYOZeSo+j9hYpIykXIBwV3vQ6pbUIkAEpsCgMp/mHZHennBZKi64gUrIzKWag/13t
	 5msnUxGqD/6A7MUmkUe5JDiQuOtjpXNY58Rfekeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FBD9F80528;
	Wed,  5 Jan 2022 12:30:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E62EF80518; Wed,  5 Jan 2022 12:30:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89CF8F802D2
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 12:30:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89CF8F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="XkAiQo+n"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2059IfsA015775;
 Wed, 5 Jan 2022 05:30:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=Q5/0LsvAH2VHS0bWgL6ejSxyzG34HEAwq1zqgv3V9BU=;
 b=XkAiQo+nnfdJ5IrWNNmkcUh3oTQ4FEqQAmX5IibKm+r4wX8/76ctITiOdscEHcp4pwly
 FeqI+SrirEQ4biYB9uy+gaWSvJCefV6utc7ylqbYzKjDQBy/0xXww6WhUsezrUeGDgtc
 t1PEwezFP7p5gHmzAYurTg6RwAm1v+/6c6BYxGNggoXbFaiX8n/T6XdWzQWWzjD5TVE0
 41DaQFt+XlduS9oKlzTdsxUWouXiE04bxSr/W50iPo7j7DvFTeYIp6gtWcPriNZ2vUNI
 2MyZUunX9XqR9q1vTE9ue7Op9qYhOUCmfBQRfROKiUX5VjLyEjVmWi4AGQSH1ikm1Nxx 6Q== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dd8jy839d-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 05 Jan 2022 05:30:29 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 5 Jan
 2022 11:30:26 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 5 Jan 2022 11:30:26 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D309BB0E;
 Wed,  5 Jan 2022 11:30:26 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 0/8] Add low power hibernation support to cs35l41
Date: Wed, 5 Jan 2022 11:30:18 +0000
Message-ID: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: -sGtucqCx6jOgBTIZMmewXllNmh2zn6l
X-Proofpoint-ORIG-GUID: -sGtucqCx6jOgBTIZMmewXllNmh2zn6l
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com, lgirdwood@gmail.com, tiwai@suse.com
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

This patch series adds support for the low power hibernation feature
on cs35l41. This allows the DSP memory to be retained whilst the
device enters a very low power state.

Patches 1-6 can happily be applied straight away and are mostly bug
fixes to set things up for the series specifically around getting the
cache handling corrected in the driver.

Patches 7,8 specifically will cause some very minor conflicts with
Lucas's currently outstanding work on the HDA version of cs35l41.
Whilst things will still build, this patch adds a test key function
his code will now have to call. If his patches are getting merged
first I will respin this series to update his code, he is currently on
holiday until the 12th of Jan, so if we want to wait for another spin
of those patches I can work with him to update them at that time. Or
alternatively we could just merge them all and I will do a quick fixup
patch at the end, since there is no build breakage.

Thanks,
Charles

Charles Keepax (7):
  ASoC: cs35l41: Remove incorrect comment
  ASoC: cs35l41: Correct DSP power down
  ASoC: cs35l41: Correct handling of some registers in the cache
  ASoC: cs35l41: Update handling of test key registers
  firmware: cs_dsp: Clear core reset for cache
  ASoC: wm_adsp: Add support for "toggle" preloaders
  ASoC: cs35l41: Add support for hibernate memory retention mode

David Rhodes (1):
  ASoC: cs35l41: Add cs35l51/53 IDs

 drivers/firmware/cirrus/cs_dsp.c |  14 ++-
 include/sound/cs35l41.h          |   7 ++
 sound/soc/codecs/cs35l41-i2c.c   |   3 +
 sound/soc/codecs/cs35l41-lib.c   | 152 ++++++++++--------------
 sound/soc/codecs/cs35l41-spi.c   |   3 +
 sound/soc/codecs/cs35l41.c       | 246 +++++++++++++++++++++++++++++++++++----
 sound/soc/codecs/cs35l41.h       |   4 +
 sound/soc/codecs/wm_adsp.c       |  14 ++-
 sound/soc/codecs/wm_adsp.h       |   8 ++
 9 files changed, 328 insertions(+), 123 deletions(-)

-- 
2.11.0

Charles Keepax (7):
  ASoC: cs35l41: Remove incorrect comment
  ASoC: cs35l41: Correct DSP power down
  ASoC: cs35l41: Correct handling of some registers in the cache
  firmware: cs_dsp: Clear core reset for cache
  ASoC: wm_adsp: Add support for "toggle" preloaders
  ASoC: cs35l41: Update handling of test key registers
  ASoC: cs35l41: Add support for hibernate memory retention mode

David Rhodes (1):
  ASoC: cs35l41: Add cs35l51/53 IDs

 drivers/firmware/cirrus/cs_dsp.c |  14 ++-
 include/sound/cs35l41.h          |   7 ++
 sound/soc/codecs/cs35l41-i2c.c   |   3 +
 sound/soc/codecs/cs35l41-lib.c   | 152 ++++++++++--------------
 sound/soc/codecs/cs35l41-spi.c   |   3 +
 sound/soc/codecs/cs35l41.c       | 246 +++++++++++++++++++++++++++++++++++----
 sound/soc/codecs/cs35l41.h       |   4 +
 sound/soc/codecs/wm_adsp.c       |  14 ++-
 sound/soc/codecs/wm_adsp.h       |   8 ++
 9 files changed, 328 insertions(+), 123 deletions(-)

-- 
2.11.0

