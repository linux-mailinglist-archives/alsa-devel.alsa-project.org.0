Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4829557838
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 12:53:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 456321DF9;
	Thu, 23 Jun 2022 12:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 456321DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655981610;
	bh=lywrpjll9IwvGY9Wb1eHTs2QDBpBBBuygSWdVSPVokw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ji8WrKN+HBJxbvzIeYP4YpUbEKJ1T7ziEj2wSSTwhQxb8xe2K9Edu5fes6/29/Plw
	 iN6lXT6WqD1Zw0eTaga/b0xBTl7LMdIjjV2Ubdk2jqth9Bfow8+IRQqrcbR+yZ/qOn
	 oL+nvWaVPVyRCdmFl1fGIRnit/mhoyzY3vr+vsfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3447F8053B;
	Thu, 23 Jun 2022 12:51:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC037F800BD; Thu, 23 Jun 2022 12:51:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F3F3F800BD
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 12:51:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F3F3F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="LcGVKAgD"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NAKUqD006859;
 Thu, 23 Jun 2022 05:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=bNlM6ExkPAMQh4YAtjnCAor0Jwtg9hW9tj0kYJzlsTk=;
 b=LcGVKAgDLNNQSEVhWS7LDRQ+mZM8gCuUOUYLCiXBkcNa48a5pTkRy6ZWp5ELZXd7krof
 9iJxUXr97k9mhMj8eIEuPsuGq3A/OP9/nEWhqO+nPz9V2OariGc9oK0rHyMGy4Fv3EWl
 FRo6OsMYul1uywVRS3fm1Y/ilWwaiLWaDdNeLztX75tQwhJ5WCPD1Xq7PqPH9FEQX1Vh
 +g0DCf7PES2zS/ZyAre9PxVYA2f3JUYDY0Ay/fKFKpecLVTk2BlwfEaipEVN+wBK02HB
 WAlvdESK1SEFu28hKdWrcKcGkjVbSsnKZkTKAWOM8V3A0361Tn2uXxtZQxR7vwqG2LyC ag== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41f17q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 05:51:22 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 11:51:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 11:51:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 316F1475;
 Thu, 23 Jun 2022 10:51:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/6] ASoC: cs35l41: Add ASP TX3/4 source to register patch
Date: Thu, 23 Jun 2022 11:51:16 +0100
Message-ID: <20220623105120.1981154-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623105120.1981154-1-ckeepax@opensource.cirrus.com>
References: <20220623105120.1981154-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Yb22yhiQAqv62OHWXfOuIbfANN5Br6ho
X-Proofpoint-ORIG-GUID: Yb22yhiQAqv62OHWXfOuIbfANN5Br6ho
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, james.schulman@cirrus.com,
 linux-kernel@vger.kernel.org
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

The mixer controls for ASP TX3/4 are set to values that are not included
in their enumeration control. This will cause spurious event
notifications when the controls are first changed, as the register value
changes whilst the actual visible enumeration value does not. Use the
register patch to set them to a known value, zero, which equates to zero
fill, thereby avoiding the spurious notifications.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41-lib.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 0c7d1c7912798..04be71435491e 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -37,8 +37,8 @@ static const struct reg_default cs35l41_reg[] = {
 	{ CS35L41_DAC_PCM1_SRC,			0x00000008 },
 	{ CS35L41_ASP_TX1_SRC,			0x00000018 },
 	{ CS35L41_ASP_TX2_SRC,			0x00000019 },
-	{ CS35L41_ASP_TX3_SRC,			0x00000020 },
-	{ CS35L41_ASP_TX4_SRC,			0x00000021 },
+	{ CS35L41_ASP_TX3_SRC,			0x00000000 },
+	{ CS35L41_ASP_TX4_SRC,			0x00000000 },
 	{ CS35L41_DSP1_RX1_SRC,			0x00000008 },
 	{ CS35L41_DSP1_RX2_SRC,			0x00000009 },
 	{ CS35L41_DSP1_RX3_SRC,			0x00000018 },
@@ -644,6 +644,8 @@ static const struct reg_sequence cs35l41_reva0_errata_patch[] = {
 	{ CS35L41_DSP1_XM_ACCEL_PL0_PRI, 0x00000000 },
 	{ CS35L41_PWR_CTRL2,		 0x00000000 },
 	{ CS35L41_AMP_GAIN_CTRL,	 0x00000000 },
+	{ CS35L41_ASP_TX3_SRC,		 0x00000000 },
+	{ CS35L41_ASP_TX4_SRC,		 0x00000000 },
 };
 
 static const struct reg_sequence cs35l41_revb0_errata_patch[] = {
@@ -655,6 +657,8 @@ static const struct reg_sequence cs35l41_revb0_errata_patch[] = {
 	{ CS35L41_DSP1_XM_ACCEL_PL0_PRI, 0x00000000 },
 	{ CS35L41_PWR_CTRL2,		 0x00000000 },
 	{ CS35L41_AMP_GAIN_CTRL,	 0x00000000 },
+	{ CS35L41_ASP_TX3_SRC,		 0x00000000 },
+	{ CS35L41_ASP_TX4_SRC,		 0x00000000 },
 };
 
 static const struct reg_sequence cs35l41_revb2_errata_patch[] = {
@@ -666,6 +670,8 @@ static const struct reg_sequence cs35l41_revb2_errata_patch[] = {
 	{ CS35L41_DSP1_XM_ACCEL_PL0_PRI, 0x00000000 },
 	{ CS35L41_PWR_CTRL2,		 0x00000000 },
 	{ CS35L41_AMP_GAIN_CTRL,	 0x00000000 },
+	{ CS35L41_ASP_TX3_SRC,		 0x00000000 },
+	{ CS35L41_ASP_TX4_SRC,		 0x00000000 },
 };
 
 static const struct reg_sequence cs35l41_fs_errata_patch[] = {
-- 
2.30.2

