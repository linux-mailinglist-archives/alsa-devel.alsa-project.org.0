Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9512378CA0
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 15:15:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B07916B1;
	Mon, 10 May 2021 15:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B07916B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620652539;
	bh=gKRTuZO8XmJ8ETg79hroja1WDSpT6hffInZHTKpKefM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ucoj1cGnUC6vu8CI9VjGzDgja3PEcZLGx3V86SiUXpPr1yaEG9umuFgGJQah9rc+L
	 Nl9BV1l0DH+Mqpjh/uWqB6OfXjdc2GsIJcAeMETP2UAMb6IclKmL7rniTv8ms5m8bj
	 dSjIxOAqhbppRojePr2iObItxNIxFo8ESzxUSKzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB2CFF80430;
	Mon, 10 May 2021 15:14:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC331F800EA; Mon, 10 May 2021 15:14:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27002F800EA
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 15:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27002F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="QtIJ2gYH"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14ADDl47002119; Mon, 10 May 2021 08:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=Q1WWjlg60EVIHsGfyuxVnwsXx7KAzUuVl1vvPc/IAM4=;
 b=QtIJ2gYHuUuKPq/fSMPmoxi9HKieftC5eHASjn9HdtbxIXLtlrbGCLWZOHpbcvgPaKOT
 NaB39ZUA9TObJ+Wp3yEEXTHm27hfs52LvUvQUJK0NXvQH77puDlRwxX9Zk6Vr4yhQPgE
 gc1dNk4Ule+s7XCMvlLLzpJmpExGAWDW+HsJ8C8a1qfHoWxwd+mc7xBGiQOMrjW6Z2au
 kI91qe/RF79KCG9V2JFwMuHLSHIWUDndqfbDDfCE+Nou4S0wFgEog9p6hXGEgB+LXynw
 FAZ7W9czh8lz/lauag51zut5FZygUUzJ8qz0tM4dbpe+yid44GNApmJ7XTKXoBbfv/wc pw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38f2d4r60v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 10 May 2021 08:13:59 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 10 May
 2021 14:13:57 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 10 May 2021 14:13:57 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AED0E11D1;
 Mon, 10 May 2021 13:13:57 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 00/10]  Tidy up device ID reading on legacy Cirrus parts
Date: Mon, 10 May 2021 14:13:47 +0100
Message-ID: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: gNPdrohVgkKfKRHypA8kTfTs4JuGOOaI
X-Proofpoint-ORIG-GUID: gNPdrohVgkKfKRHypA8kTfTs4JuGOOaI
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 mlxlogscore=812
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105100092
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, james.schulman@cirrus.com,
 david.rhodes@cirrus.com
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

Pierre requested I have a look at some cppcheck warnings in the cs42l42
driver, since it is reassigning the ret variable without ever checking
the result.  Looking a bit more broadly this happens in quite a few
legacy Cirrus parts, as they all use the same process to read the ID,
factor out a small helper so they can all share the same code. Whilst
in there fix up a couple of other trivial error path issues as well.

Thanks,
Charles

Charles Keepax (10):
  ASoC: cirrus: Add helper function for reading the device ID
  ASoC: cs35l32: Minor error paths fixups
  ASoC: cs35l33: Minor error paths fixups
  ASoC: cs35l34:  Minor error paths fixups
  ASoC: cs35l35:  Minor error paths fixups
  ASoC: cs35l35: Correct errata handling
  ASoC: cs42l42:  Minor error paths fixups
  ASoC: cs42l73:  Minor error paths fixups
  ASoC: cs43130:  Minor error paths fixups
  ASoC: cs53l30:  Minor error paths fixups

 sound/soc/codecs/cirrus_legacy.h | 21 +++++++++++++++++++++
 sound/soc/codecs/cs35l32.c       | 34 ++++++++++++++++++----------------
 sound/soc/codecs/cs35l33.c       | 15 +++++++++------
 sound/soc/codecs/cs35l34.c       | 39 ++++++++++++++++++++++-----------------
 sound/soc/codecs/cs35l35.c       | 21 ++++++++++-----------
 sound/soc/codecs/cs35l35.h       |  1 +
 sound/soc/codecs/cs42l42.c       | 18 ++++++++----------
 sound/soc/codecs/cs42l73.c       | 30 +++++++++++++++++-------------
 sound/soc/codecs/cs43130.c       | 31 +++++++++++++++++++------------
 sound/soc/codecs/cs53l30.c       | 22 +++++++++++-----------
 10 files changed, 136 insertions(+), 96 deletions(-)
 create mode 100644 sound/soc/codecs/cirrus_legacy.h

-- 
2.11.0

