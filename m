Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B38D773A68
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 15:22:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCB7E843;
	Tue,  8 Aug 2023 15:21:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCB7E843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691500933;
	bh=WDUOT5UowiddEaaoa3IH/xV4RAnAcyVDuA3zt441H50=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=doqyh/WSMkStb9WsXkOO3blFqIzAjdWj2w1VL0/QMniuUhQWPSFK74e6tZRyBRiac
	 bfVYZvUpdIO6rBEcDfxrhBjJMs9VTC60YtksJ6bwHu+SHYvYwZxNAw2ldfMWYCouVI
	 iCZUErwaVnvYSrOx1XPb6W4f5eynkrDVyZxm+lBo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3989EF8056F; Tue,  8 Aug 2023 15:20:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 682AFF800B8;
	Tue,  8 Aug 2023 15:20:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5363F80558; Tue,  8 Aug 2023 15:20:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA9BAF80534
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 15:20:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA9BAF80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=BT001ulU
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 378513nD020848;
	Tue, 8 Aug 2023 08:20:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=s0FyE52Cn+6PGgKvdPRmvC3yNUXMYoYPo4uX6E7w11E=; b=
	BT001ulURQZjA8nUsZd6raYfgXuw6YfGUdOwptLAUdoqp6HQhOGQzSDcSw9ANhRl
	MWYwnDH02w3TZNukhUrw3cSViJitGEJ+UwnyK+HsNRZvOifva9U21tdVqDmd8TPH
	lEvgUdSjIsdo71ityA4TkkC7Htqu6EQ9R9RTrEGqO2wl6gszl2sAR6j6Kfo4NTGm
	BcnFZG2atL+UX0LGOhmb6gN2HH8bIgcTmxWWyqEf/fmUiNkecJsyTnon1l/KXxYf
	yMgXRCoRgaK6nedJHGt429qfr7+Qea78FesmidediV0Xi29BpknAHQdLeOzQuSdd
	40sRWraoFIO+ntunZLtiMA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sb7vt8wd1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 08:20:16 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 8 Aug
 2023 14:20:13 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Tue, 8 Aug 2023 14:20:13 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CEB1C3575;
	Tue,  8 Aug 2023 13:20:13 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 02/12] ASoC: intel: sof_sdw: Remove duplicate NULL check on
 adr_link
Date: Tue, 8 Aug 2023 14:20:03 +0100
Message-ID: <20230808132013.889419-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
References: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: pGpizM-cBx1WdtmY2eTsc8BM3X-HbO9F
X-Proofpoint-ORIG-GUID: pGpizM-cBx1WdtmY2eTsc8BM3X-HbO9F
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XT6FALSG55QTQSTNNAKSTFK67L66YP2A
X-Message-ID-Hash: XT6FALSG55QTQSTNNAKSTFK67L66YP2A
X-MailFrom: prvs=3584cdf4cd=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XT6FALSG55QTQSTNNAKSTFK67L66YP2A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

get_dailink_info already checked if the adr_link pointer was NULL so
there is no need to recheck later in sof_card_dai_links_create.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 8f3329dcf7062..89614d08d0918 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1632,10 +1632,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	if (!sdw_be_num)
 		goto SSP;
 
-	adr_link = mach_params->links;
-	if (!adr_link)
-		return -EINVAL;
-
 	for (i = 0; i < SDW_MAX_LINKS; i++)
 		sdw_pin_index[i] = SDW_INTEL_BIDIR_PDI_BASE;
 
-- 
2.30.2

