Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A424CC3FC
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 18:33:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7E641943;
	Thu,  3 Mar 2022 18:32:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7E641943
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646328829;
	bh=CXWIGsolUZtCu/tRLytdpDgRgcJdF7W72/c8kbQP8T0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hdBv6uuWCTfFcC8L3ztB2Y+puaOfRnO++H/V4e/BnjQEK7pv8BU/0iqq9H+yRXK+K
	 lTNOYsnAG2JcQ9o7BW+20xWNOnR67xvrAStKX34FzdFvuTqe5KPu8EKIqS3qjCGgiX
	 GcMRa54bNjH1nHOyzwa/v8CbqoDgyMCUY1YtMQoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 397CEF8053B;
	Thu,  3 Mar 2022 18:31:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D84B1F80536; Thu,  3 Mar 2022 18:31:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F9FBF80167
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 18:31:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F9FBF80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="SbrtGi9j"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2234AADw028599;
 Thu, 3 Mar 2022 11:31:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=cnANgRnNMxthB+Az/dRLrs4+S0q0VAMFd2idCCcyUx8=;
 b=SbrtGi9jspS/LEHsQnK5k/SqWDU0/GbrU1zCBvCbOiDdBnoH/S9P+kSq7mS9x712fCoy
 6RkAttrWIHmvVjBx5ucGCt1B0wGI+rHZF3nuEZbOhD1CkLoudQvtS6Ase7ZYgcoOKeRa
 08JfhVXTdwlv4A+jeBbFVTOZGsEU4Wh0+GuM3e6jDwX2nwDC7NAyfP9HUKeIAHzEzRQf
 y3ijhju/ApAJLjB7l+eGI8oTn0OYQRDZ5oH4/hk906oLYogclie2rseGo53y+m5/0wD2
 FOHNC1Hv+6T28M4zTgSuVgd3IEjNw4nP0qLaEN7tPbIzZ/gmRjwPa7HXK5LG2coerTXJ rg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ejncq8ybk-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 03 Mar 2022 11:31:08 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 17:31:07 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 3 Mar 2022 17:31:07 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.198])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id ECF3AB1A;
 Thu,  3 Mar 2022 17:31:06 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 13/20] sound: cs35l41: Enable Internal Boost in shared lib
Date: Thu, 3 Mar 2022 17:30:52 +0000
Message-ID: <20220303173059.269657-14-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
References: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 60vMfnR0GnMQSWeoaeHXc0Rk7eZROQIh
X-Proofpoint-GUID: 60vMfnR0GnMQSWeoaeHXc0Rk7eZROQIh
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 devicetree@vger.kernel.org
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

Boost enable is the default option from reset,
but with external boost support, internal boost
must be disabled.
Add the enable of boost in cs35l41_boost_config
to centralize the internal boost configuration.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41-lib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 3fae34a232cd..34ba163874a6 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -1036,6 +1036,9 @@ int cs35l41_boost_config(struct device *dev, struct regmap *regmap, int boost_in
 		return ret;
 	}
 
+	regmap_update_bits(regmap, CS35L41_PWR_CTRL2, CS35L41_BST_EN_MASK,
+			   CS35L41_BST_EN_DEFAULT << CS35L41_BST_EN_SHIFT);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(cs35l41_boost_config);
-- 
2.35.1

