Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2674B4F83B1
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 17:39:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7E1117E5;
	Thu,  7 Apr 2022 17:38:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7E1117E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649345970;
	bh=Eyy9KS+6oagqRdODfolLXx+eJPFtFdYNTi7J2Gy7WEs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r43Cb5S6CRMbr7VtHX54jy3/vCdiib/2F6aKIXCjgoA4SX/+M8AuZ/6CVuNu9qA4c
	 Wx6ZJ+DscKv09uBM+5j2QzH+bYtIi4UleBKT0CT4JCanp6MuRSyMc4zs0Ht048n/XJ
	 EU8iOjZApM55yu+lxH5UX8IYSVVbqXwA1tI3WpPM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D467F8026A;
	Thu,  7 Apr 2022 17:38:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0B61F8024C; Thu,  7 Apr 2022 17:38:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D40EF80085;
 Thu,  7 Apr 2022 17:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D40EF80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="fRJvXqN8"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 237FGtj7010987;
 Thu, 7 Apr 2022 10:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=UjykvzUh2yttPVC3FFI1GJ+d5P2prlyxQC8ykG4n7sQ=;
 b=fRJvXqN8Wu6nZ+GIXmhS2fn10nWnylZl+cv9hyK0piv+ipqkZrkMii2sGEsr4uvzOscn
 9GxXTJjLSg+5++q0vdWEkpBWdDUD2jYdhVTdSAm8rlGGCh5Fnwd3W9SFAPGv0O6wQQBf
 CEd4BAsssW0L6I5JuF3FykaZgXyilMn4suGFYrBYFqwIhCM5BhLRMjzzDSozrXvxUEBn
 oDcSHnFZtsdCOajRfZdy7BBqwqxw5UgL2rNxkrCr8g/eRAPyTgV50ZmO6Br/3WIvgzfZ
 iPCbf8ARAraeU3uoG9w0K2avvZP1AIU5wzxdcIGTl84i/JOqRhMblepvZQGWe20gvn6+ 4Q== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3f6jwnxnvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 07 Apr 2022 10:38:18 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 7 Apr
 2022 16:38:17 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 7 Apr 2022 16:38:17 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.88])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1230946A;
 Thu,  7 Apr 2022 15:38:16 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <pierre-louis.bossart@linux.intel.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <peter.ujfalusi@linux.intel.com>,
 <kai.vehmanen@linux.intel.com>, <ranjani.sridharan@linux.intel.com>
Subject: [PATCH] ASoC: SOF: Kconfig: Make SND_SOC_SOF_HDA_PROBES tristate
Date: Thu, 7 Apr 2022 16:38:13 +0100
Message-ID: <20220407153813.1231866-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: B4yOzWpazVgc6L5sHf2qOyFj5y7r6tbT
X-Proofpoint-GUID: B4yOzWpazVgc6L5sHf2qOyFj5y7r6tbT
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

SND_SOC_SOF_HDA_PROBES must be tristate because the code it builds
depends on code that is tristate.

If SND_SOC_SOF_HDA_PROBES is bool it leads to the following build
inconsistency:

SND_SOC_SOF_HDA_COMMON=m
  which selects SND_SOC_SOF_HDA_PROBES
    but since this is a bool SND_SOC_SOF_HDA_PROBES=y

SND_SOC_SOF_HDA_PROBES=y
  selects SND_SOC_SOF_DEBUG_PROBES=y
    so sof-client-probes.c is built into the kernel.

sof-client-probes.c calls functions in sof-client.c, but

SND_SOC_SOF=m
  sof-client.c is built into a loadable module.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/sof/intel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 172419392b33..0def2aa5581d 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -260,7 +260,7 @@ config SND_SOC_SOF_HDA
 	  'select' statements at a higher level.
 
 config SND_SOC_SOF_HDA_PROBES
-	bool
+	tristate
 	select SND_SOC_SOF_DEBUG_PROBES
 	help
 	  The option enables the data probing for Intel(R) Skylake and newer
-- 
2.30.2

