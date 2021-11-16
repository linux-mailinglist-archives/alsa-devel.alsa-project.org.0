Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4060F4537D4
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 17:41:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A41D31840;
	Tue, 16 Nov 2021 17:40:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A41D31840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637080909;
	bh=7BG8ioGpzOsfvtQPHPQRlnlpj1I8WuFez4UkaZMi1Ps=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=puEuPYIVzYsa7QxYP39La1iooK9a17sAw9mLk887J8U59ZIVfofZR4SQ56YGPHTsL
	 5n7UOLDxfgLdJe9f4TkCStyoFMpQBOY13xYgsg9d/0tjCuxei5GHx0OHl9oTVeXp6U
	 z78TMMj1G5K11ziaOVOPHh/iqxR0KMLn7zJyR6/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FFE9F804FC;
	Tue, 16 Nov 2021 17:39:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4CC9F804F2; Tue, 16 Nov 2021 17:39:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75818F8026D
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 17:39:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75818F8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="mLlflyU5"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AG9thsn031145;
 Tue, 16 Nov 2021 10:39:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=LlLWUwoVTY7e/cT3Hvc6VuaHfWQ2FKZj8rcPcydDakw=;
 b=mLlflyU5Wj9ZQnNcAtrMLmXEVfq8hUJUzxw7uYcSZKO/7mfEbHPy7AMbsyDJyYOQ8S2f
 AAkE7oFrc+y13Tbuo6NZnsRUd4kEh7EgaUCUI0d0Hnznby80vi6/i8RHLAYnX02VL7Py
 sNFG95GFJFMD4cCz6Rmgewkc+2NEidhdKHTrYTGkNKvyDfwAsYF/3ieym4ftXnUBrzpG
 p91u7osbzt3zo3nXrvMH/QFW1FjB5IAtUE+GOQmpVwOAq4MiMWFBkq/+bP++Yx0xsVfE
 AkKMK7zHLhurnA/P2Eq2635cXw09MH13zUz7oGMGKtVUAUYBbkSescAG8v8zsJoIxO8U kA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cbjn01y8t-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 16 Nov 2021 10:39:07 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 16:39:05 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 16 Nov 2021 16:39:05 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.41])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D272315A4;
 Tue, 16 Nov 2021 16:39:04 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 3/4] ASoC: cs42l42: Simplify reporting of jack unplug
Date: Tue, 16 Nov 2021 16:39:00 +0000
Message-ID: <20211116163901.45390-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211116163901.45390-1-rf@opensource.cirrus.com>
References: <20211116163901.45390-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: FkYlUtjzA0bRxeMbEVqeIUnf4bR2U7rl
X-Proofpoint-ORIG-GUID: FkYlUtjzA0bRxeMbEVqeIUnf4bR2U7rl
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

When reporting a jack unplug there's no need to make the reported
flags conditional on which flags were reported during the plug
event. It's perfectly safe to report all flags and buttons as
not-present and let the higher code filter for changes.

There's also no need to make two separate snd_soc_jack_report()
calls for presence flags and button flags. It can all be done in
one report.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 3674f73301dc..8efcee3e60d3 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1657,18 +1657,8 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 				cs42l42->plug_state = CS42L42_TS_UNPLUG;
 				cs42l42_cancel_hs_type_detect(cs42l42);
 
-				switch (cs42l42->hs_type) {
-				case CS42L42_PLUG_CTIA:
-				case CS42L42_PLUG_OMTP:
-					snd_soc_jack_report(cs42l42->jack, 0, SND_JACK_HEADSET);
-					break;
-				case CS42L42_PLUG_HEADPHONE:
-					snd_soc_jack_report(cs42l42->jack, 0, SND_JACK_HEADPHONE);
-					break;
-				default:
-					break;
-				}
 				snd_soc_jack_report(cs42l42->jack, 0,
+						    SND_JACK_HEADSET |
 						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
 
-- 
2.11.0

