Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F11440500
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 23:42:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C84EC1717;
	Fri, 29 Oct 2021 23:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C84EC1717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635543757;
	bh=5ferWMMUq8HaP27DzsP5+GEEugU4p65E+2ilWbjnKVU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MCc1ppU6vWmFio109ONa8AQ6EJjTyzTG4izoPsGo6YdxRwGR05k2L6rLzx8/0FSCD
	 iI72Gwafe23uuZDHXAy5gNwssJ1neDQkeShMamZJzTifVxgyFUhMGn6sq1mFDfANcG
	 8y5bDzxj10j3cM5go2irC/uJpZS551HWLvcZ22vw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D50ECF8025A;
	Fri, 29 Oct 2021 23:41:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA8A4F8025A; Fri, 29 Oct 2021 23:40:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3907EF800D1
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 23:40:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3907EF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="AYKEvG7V"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19TKsG6w012703; 
 Fri, 29 Oct 2021 16:40:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=T8jQ6ew7YFPmqWTC+Uo0Kmb3mepU33F2U9YO9ol1mPI=;
 b=AYKEvG7V307OvxXAPAI8msMtTpquZc81crGBbyccVMxgFfbqjXOdhevrL03MVu+xgSCq
 bCZMm2bP4YImUjQbyLeWUkE2IG2vBV4+HJNc1vnnhyjxF6xiLiUMTvM2mQcgQEkiKngP
 2eIDrqd+nDhrhNJ7QetMjarfXjfTW7onNw1SJAqOYC4VD7A3Hsslvw9pA9GLnw6mUB97
 Wo4nFKlTOPkXkujKxWFlHVu+q3VUCzRLFmBFOodh4P88ubvZwO1RLrP54dx/SAw6tekA
 CT5dQ2L4tvbZhErhn0vnEUm+ai6zZbMP1mR2JVUdKhhWQAxPXb5Rs7JdjtGVZg/LpaxI QQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3c0cm70unc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 29 Oct 2021 16:40:47 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.12; Fri, 29 Oct
 2021 22:40:46 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.12 via
 Frontend Transport; Fri, 29 Oct 2021 22:40:46 +0100
Received: from david-ubuntu20.crystal.cirrus.com
 (macC02XQ1DJJG5K.ad.cirrus.com [141.131.64.157])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 52EA9B38;
 Fri, 29 Oct 2021 21:40:44 +0000 (UTC)
From: David Rhodes <drhodes@opensource.cirrus.com>
To: <broonie@kernel.org>, <ckeepax@opensource.cirrus.com>,
 <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
 <david.rhodes@cirrus.com>, <brian.austin@cirrus.com>
Subject: [PATCH 1/2] ASoC: cs35l41: Change monitor widgets to siggens
Date: Fri, 29 Oct 2021 16:40:27 -0500
Message-ID: <20211029214028.401284-1-drhodes@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: s6VqP52vxdoNbUVLKTSsdB6YSEAZBk1n
X-Proofpoint-ORIG-GUID: s6VqP52vxdoNbUVLKTSsdB6YSEAZBk1n
X-Proofpoint-Spam-Reason: safe
Cc: David Rhodes <drhodes@opensource.cirrus.com>
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Currently the internal monitor sources are input widgets, which means
if the card is set to fully routed these will not enable unless connected
to something in the machine driver. However, all these are internal
monitor signals so it makes no sense to connect them to something in the
machine driver. As such switch them to siggen widgets which will have
the same behaviour except not require external linkage on a fully routed
card.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 94ed21d7676f..9d0530dde996 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -612,6 +612,12 @@ static const struct snd_soc_dapm_widget cs35l41_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("ASPTX3", NULL, 0, CS35L41_SP_ENABLES, 2, 0),
 	SND_SOC_DAPM_AIF_OUT("ASPTX4", NULL, 0, CS35L41_SP_ENABLES, 3, 0),
 
+	SND_SOC_DAPM_SIGGEN("VSENSE"),
+	SND_SOC_DAPM_SIGGEN("ISENSE"),
+	SND_SOC_DAPM_SIGGEN("VP"),
+	SND_SOC_DAPM_SIGGEN("VBST"),
+	SND_SOC_DAPM_SIGGEN("TEMP"),
+
 	SND_SOC_DAPM_ADC("VMON ADC", NULL, CS35L41_PWR_CTRL2, 12, 0),
 	SND_SOC_DAPM_ADC("IMON ADC", NULL, CS35L41_PWR_CTRL2, 13, 0),
 	SND_SOC_DAPM_ADC("VPMON ADC", NULL, CS35L41_PWR_CTRL2, 8, 0),
@@ -623,12 +629,6 @@ static const struct snd_soc_dapm_widget cs35l41_dapm_widgets[] = {
 			       cs35l41_main_amp_event,
 			       SND_SOC_DAPM_POST_PMD |	SND_SOC_DAPM_POST_PMU),
 
-	SND_SOC_DAPM_INPUT("VP"),
-	SND_SOC_DAPM_INPUT("VBST"),
-	SND_SOC_DAPM_INPUT("ISENSE"),
-	SND_SOC_DAPM_INPUT("VSENSE"),
-	SND_SOC_DAPM_INPUT("TEMP"),
-
 	SND_SOC_DAPM_MUX("ASP TX1 Source", SND_SOC_NOPM, 0, 0, &asp_tx1_mux),
 	SND_SOC_DAPM_MUX("ASP TX2 Source", SND_SOC_NOPM, 0, 0, &asp_tx2_mux),
 	SND_SOC_DAPM_MUX("ASP TX3 Source", SND_SOC_NOPM, 0, 0, &asp_tx3_mux),
@@ -674,8 +674,8 @@ static const struct snd_soc_dapm_route cs35l41_audio_map[] = {
 	{"VMON ADC", NULL, "VSENSE"},
 	{"IMON ADC", NULL, "ISENSE"},
 	{"VPMON ADC", NULL, "VP"},
-	{"TEMPMON ADC", NULL, "TEMP"},
 	{"VBSTMON ADC", NULL, "VBST"},
+	{"TEMPMON ADC", NULL, "TEMP"},
 
 	{"ASPRX1", NULL, "AMP Playback"},
 	{"ASPRX2", NULL, "AMP Playback"},
-- 
2.25.1

