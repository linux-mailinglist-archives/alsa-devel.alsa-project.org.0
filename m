Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E38D5EC23B
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 14:16:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C945822;
	Tue, 27 Sep 2022 14:15:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C945822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664280959;
	bh=zfQdbqND1E0P6FnF7UKds5cuN677Uk478kSqki/UF6w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MFlbr1fTr4qHrc/FWp/eqmNUoXsQFPv7Z7mlE6IJFi3jEgzOp75KmBkdwOEWscXW7
	 EviU7Gu/nD6mNx830P88NvWO91g3kJMeHWy2mwV4tRR7Y2x+GAEU7hPveBzqG1KrRk
	 YKPX0J7LRdQ1EI9omKqSGGrxOURIe1PdT8LWH/1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F6DEF80166;
	Tue, 27 Sep 2022 14:15:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57012F8025E; Tue, 27 Sep 2022 14:15:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 486C6F800AA
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 14:14:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 486C6F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="OIdSAPLn"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28R6OnaL022026;
 Tue, 27 Sep 2022 07:14:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=vInO/r8CP2irGLFP0WnlEE++JH/IImoDg4aYw3XeL10=;
 b=OIdSAPLnjjRog17GK3egdqPZNTTbZhKup92L5/COtwgah0zqGujp9CROHP05XTRtIimQ
 S9fuxfQ8s2YOWsyCFl42EEif1UyQntOYoVCK36140Kt3BVUtcvUWD94vesVi2FBpv9Mc
 Jgc6PJcFENagW57PGul3c+TBinDinzB/a0Al0KX7R42qkgJUfB3OpP6OpgqGNc2PWpV9
 MOYFj8Cq2kVWOUmPFQv7JA06+4oSmyT1SmMrv5uo/emt+lenb23fm7/1fTDrUuHrFbSp
 o6WapEwSTRsFrIqP0nNkhlZ0RZrGOBzUiuGufUjhkjUO7nmdGG5hUdgbylfILAav2DSL GA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3jsya2bb7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 07:14:51 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Tue, 27 Sep
 2022 07:14:49 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Tue, 27 Sep 2022 07:14:49 -0500
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7867D15A3;
 Tue, 27 Sep 2022 12:14:49 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v1] ASoC: cs42l42: Fallback to headphones for type detect
Date: Tue, 27 Sep 2022 13:14:40 +0100
Message-ID: <20220927121440.2506632-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: t5qUL_Y7G8WnIHC7TnrHLA_52lnw49Yy
X-Proofpoint-GUID: t5qUL_Y7G8WnIHC7TnrHLA_52lnw49Yy
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

After tip sense detects a jack insertion, if automatic
type detection, and manual type detection fails, then
fall back to assume the jack connected belongs to
headphones.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index bdc7e6bed6ac..2fefbcf7bd13 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1199,14 +1199,11 @@ static void cs42l42_manual_hs_type_detect(struct cs42l42_private *cs42l42)
 			cs42l42->hs_type = CS42L42_PLUG_OMTP;
 			hs_det_sw = CS42L42_HSDET_SW_TYPE2;
 			break;
-		case CS42L42_HSDET_COMP_TYPE3:
+		/* Detect Type 3 and Type 4 Headsets as Headphones */
+		default:
 			cs42l42->hs_type = CS42L42_PLUG_HEADPHONE;
 			hs_det_sw = CS42L42_HSDET_SW_TYPE3;
 			break;
-		default:
-			cs42l42->hs_type = CS42L42_PLUG_INVALID;
-			hs_det_sw = CS42L42_HSDET_SW_TYPE4;
-			break;
 		}
 	}
 
-- 
2.34.1

