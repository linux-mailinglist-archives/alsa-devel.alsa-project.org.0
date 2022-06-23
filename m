Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 771B055783D
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 12:54:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1869F1B53;
	Thu, 23 Jun 2022 12:53:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1869F1B53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655981648;
	bh=D8ymrI+ZJpDY3JdYK2FugXvXF8B1ZnMDWfwpxbtfgBQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o8oVhvL/145mHrYyn5ctL6pHzPh86CukoInCaF9Qn89DSFyQxxMochq6vTRKqRHcJ
	 7E9CR4EL+fTELZljyqcHiHPSLgJ5QlzsTn0nYF76nyZDZ6iPWCopJodOBxR6RZoOwl
	 5K8rg+jqE8TeoK5uO6C5haCnwh3slPY+rDUxL+Is=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D146F80553;
	Thu, 23 Jun 2022 12:51:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDCB3F80544; Thu, 23 Jun 2022 12:51:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06B9CF804BB
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 12:51:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06B9CF804BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="d5Y7RicZ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NAKUqE006859;
 Thu, 23 Jun 2022 05:51:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=PqTwzrb4S4WU+IKe42NZ58931YA2zsn+4TLdSNVlyA4=;
 b=d5Y7RicZHCIcuVwhORgaW2TwwmC4FiYNeUGB+LtM4KbURSkMr4y64k4rsC/MKKr+ziQ7
 aU4IeN4Zbkh3rSCJHsbLNemLo/xsT9v7ZDaO5xOUz8AR9h6+WLn1vmecNOPc6FVn5fCB
 szn4neTeZAXmIwXzmJuq+eDoWm789Ypc3fBlCRP3Y1vCYckd5LaMTxwDyVOWIz0wE1SX
 1ncV69gMJViHg2mNaPqIZR7Nb6v2K5eNIpW943lZvTABdYtB5FNhZDUfkWuLOiqOAD9R
 es4L7dWW6qZoxygOauoQwjycBLkfxSPV4fqNqysbNGZyYycpPxtKyjRyNKFwdFY8MsPX gA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41f17q-2
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
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 353A511D3;
 Thu, 23 Jun 2022 10:51:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 3/6] ASoC: cs47l15: Fix event generation for low power mux
 control
Date: Thu, 23 Jun 2022 11:51:17 +0100
Message-ID: <20220623105120.1981154-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623105120.1981154-1-ckeepax@opensource.cirrus.com>
References: <20220623105120.1981154-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: QT_BBaCGrsJ8nfY_jQ9gRizWN6dSzuU2
X-Proofpoint-ORIG-GUID: QT_BBaCGrsJ8nfY_jQ9gRizWN6dSzuU2
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

cs47l15_in1_adc_put always returns zero regardless of if the control
value was updated. This results in missing notifications to user-space
of the control change. Update the handling to return 1 when the value is
changed.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs47l15.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index 391fd7da331fd..1c7d52bef8935 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -122,6 +122,9 @@ static int cs47l15_in1_adc_put(struct snd_kcontrol *kcontrol,
 		snd_soc_kcontrol_component(kcontrol);
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 
+	if (!!ucontrol->value.integer.value[0] == cs47l15->in1_lp_mode)
+		return 0;
+
 	switch (ucontrol->value.integer.value[0]) {
 	case 0:
 		/* Set IN1 to normal mode */
@@ -150,7 +153,7 @@ static int cs47l15_in1_adc_put(struct snd_kcontrol *kcontrol,
 		break;
 	}
 
-	return 0;
+	return 1;
 }
 
 static const struct snd_kcontrol_new cs47l15_snd_controls[] = {
-- 
2.30.2

