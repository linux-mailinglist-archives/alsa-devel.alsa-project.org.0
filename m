Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B70942F402
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 15:40:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C33A8176F;
	Fri, 15 Oct 2021 15:40:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C33A8176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634305251;
	bh=VJQXwoqH9b60LgaVCv4OjuZtNCh+4sZUoFuEMwIdnsw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cUSCHbxPMqYqZTWQx45aDY2zohhXIjr+RkP5FXELrKudZzDBWu5B99kOyWCGKJTOn
	 RgR4Xbr7MZImDZAvccget3OZvSWR/bE9ON2xR88JOC510LneTR8PQTQzrt02IBZTqU
	 NkhEKHiBpom+PNHIAXNtt688vsPU5viRJ/567/5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29DAFF80528;
	Fri, 15 Oct 2021 15:37:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 228DDF80507; Fri, 15 Oct 2021 15:36:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA566F804E5
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 15:36:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA566F804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="O/qRXigP"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FCfErP009690; 
 Fri, 15 Oct 2021 08:36:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Lqn+dMnPf/Auw1mZimgpK3xzRBk2TMw3cJpKbswty5w=;
 b=O/qRXigP1YoegWsNfmLajCpD79sIJ3lQ6TpVQJlH27O+BCPxRrkFci/SWCdZTHGt+9H3
 ZQHh+wUIw4Fj56FqzRP0ECCKV1xCGLtyuxE3/VmYvxWeoU0JUSRK7N76iCY0O2MezvVY
 QMFqq03yfPeivEwk8LLHmeQggCQUlVGk0gIX6NMQ1b5mKUaOsuE4MN2cVj8fuA6TZcrx
 q85wN+jShz+elVnxasT4VsGOHAHYYvpMBl9IT7Aqy0u2kvZ7Ddz1N9Z5EwHyBv1sPL1U
 ycnlTV3QANPzWcKnPMWkO8sOhS1EKttmAfI8UVev9Gwvwsyygf4gK1SyDYwDsDbA7ZAD Pw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3bq1gagp5w-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 15 Oct 2021 08:36:27 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 15 Oct
 2021 14:36:26 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Fri, 15 Oct 2021 14:36:26 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.254])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2EBB1B2F;
 Fri, 15 Oct 2021 13:36:26 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 16/16] ASoC: cs42l42: Always enable TS_PLUG and TS_UNPLUG
 interrupts
Date: Fri, 15 Oct 2021 14:36:19 +0100
Message-ID: <20211015133619.4698-17-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211015133619.4698-1-rf@opensource.cirrus.com>
References: <20211015133619.4698-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 62cBwAWc3VX-bRCcDHrjfmn43wsI0vSR
X-Proofpoint-GUID: 62cBwAWc3VX-bRCcDHrjfmn43wsI0vSR
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

The headset type detection must run to set the analogue switches
correctly for the attached headset type. Without this only headsets
with wiring matching the chip default will have a functioning mic.

commit c26a5289e865 ("ASoC: cs42l42: Add support for set_jack calls")
moved the interrupt unmasking to the component set_jack() callback.
But it's not mandatory for a machine driver to register a struct
snd_soc_jack handler. Without a registered handler the type detection
would not have run and so the mic would not work on some types of
headset.

This patch restores the unmasking of TS_PLUG and TS_UNPLUG interrupts
during probe.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 8f0c58097d64..d30bb9ad4191 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -524,12 +524,6 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
 
 	cs42l42->jack = jk;
 
-	regmap_update_bits(cs42l42->regmap, CS42L42_TSRS_PLUG_INT_MASK,
-			   CS42L42_RS_PLUG_MASK | CS42L42_RS_UNPLUG_MASK |
-			   CS42L42_TS_PLUG_MASK | CS42L42_TS_UNPLUG_MASK,
-			   (1 << CS42L42_RS_PLUG_SHIFT) | (1 << CS42L42_RS_UNPLUG_SHIFT) |
-			   (0 << CS42L42_TS_PLUG_SHIFT) | (0 << CS42L42_TS_UNPLUG_SHIFT));
-
 	return 0;
 }
 
@@ -1798,8 +1792,8 @@ static void cs42l42_set_interrupt_masks(struct cs42l42_private *cs42l42)
 			CS42L42_TS_UNPLUG_MASK,
 			(1 << CS42L42_RS_PLUG_SHIFT) |
 			(1 << CS42L42_RS_UNPLUG_SHIFT) |
-			(1 << CS42L42_TS_PLUG_SHIFT) |
-			(1 << CS42L42_TS_UNPLUG_SHIFT));
+			(0 << CS42L42_TS_PLUG_SHIFT) |
+			(0 << CS42L42_TS_UNPLUG_SHIFT));
 }
 
 static void cs42l42_setup_hs_type_detect(struct cs42l42_private *cs42l42)
-- 
2.11.0

