Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 183C43BA8DB
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Jul 2021 16:07:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F75E1692;
	Sat,  3 Jul 2021 16:06:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F75E1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625321252;
	bh=XJmub2GIFfpS3UOzpC7x8akIBnSGwHskiSua3ehQo2o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AEXaRLFl1wF+EjG2ZE5Lm8Od6oqgpF6PfwMziH+WOOAn1rcq6oRrpZbQAXr2oLaXF
	 8HNTW6WWwFOMqU7ozhn607cMyoy7zh9qZUdOqS3ymeT4a1JIPFScmyo6Uhu71lZL0F
	 iIHPHGJ0C6+mcQeVA1daD/khQkniVQGUcsQfEvhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01C92F800BA;
	Sat,  3 Jul 2021 16:06:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 629F4F802D2; Sat,  3 Jul 2021 16:06:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F59BF800E3
 for <alsa-devel@alsa-project.org>; Sat,  3 Jul 2021 16:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F59BF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="hp7ICpZ9"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 163E0YWr013527; Sat, 3 Jul 2021 09:05:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=EOf4cKIB0FqWNQK2j6LhV/cilGvo/DOygUIpnrYil1E=;
 b=hp7ICpZ9Jq5/U8+nLVtdWJRfDUQuDn9e75hYmOlF+b9b3ECQJCp33rhk2MwnQFHCrCeg
 RIcWFh4D7mUdmW7dquHLjvjW0+H8OQCPPVZxWXuX/nwigSGi7s8lcykTniFgtn8yXXwK
 kwT4CtcJdbdU5PaBMQTfd8ITAXkYoIUp7kHtuxSCAkst2XurhfhOFMmYKmy0CB2gfRyT
 JDA07yotqeQmI1RjOPjAuIOqhZOZ3f08Nif228Ni1QwE7SIN8hJb6m1svpiIfHhDH6Q4
 S+SQ2fIGXjw5MyUWBVF7xMJHqPPZ0XDvT1yhIFiLRK56gLtFzA27RyPymgUWy5OJ4TB6 SQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 39jmar88ha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 03 Jul 2021 09:05:54 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Sat, 3 Jul 2021
 13:50:45 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Sat, 3 Jul 2021 13:50:45 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (unknown [141.131.79.42])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5812545D;
 Sat,  3 Jul 2021 12:50:37 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: dapm: Revert "use component prefix when checking widget
 names"
Date: Sat, 3 Jul 2021 13:50:34 +0100
Message-ID: <20210703125034.24655-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: IyvtYpgLWwGE8sf6t0jw3YsMfjJ5lkof
X-Proofpoint-ORIG-GUID: IyvtYpgLWwGE8sf6t0jw3YsMfjJ5lkof
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=930 bulkscore=0 clxscore=1011
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107030089
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, shumingf@realtek.com,
 rander.wang@linux.intel.com
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

This reverts
commit ae4fc532244b ("ASoC: dapm: use component prefix when checking widget names")

That commit breaks all users of the snd_soc_component_*_pin() functions
because it results in the prefix being added twice. It also breaks code
that correctly uses the snd_soc_dapm_*_pin() functions.

Use the snd_soc_component_*_pin() functions if you want the component
prefix to be prepended automatically.

Use the raw snd_soc_dapm_*_pin() functions if the caller has the full
name that should be matched exactly.

Fixes: commit ae4fc532244b ("ASoC: dapm: use component prefix when checking widget names")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/soc-dapm.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 91bf939d5233..1369a3fea911 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2528,20 +2528,9 @@ static struct snd_soc_dapm_widget *dapm_find_widget(
 {
 	struct snd_soc_dapm_widget *w;
 	struct snd_soc_dapm_widget *fallback = NULL;
-	char prefixed_pin[80];
-	const char *pin_name;
-	const char *prefix = soc_dapm_prefix(dapm);
-
-	if (prefix) {
-		snprintf(prefixed_pin, sizeof(prefixed_pin), "%s %s",
-			 prefix, pin);
-		pin_name = prefixed_pin;
-	} else {
-		pin_name = pin;
-	}
 
 	for_each_card_widgets(dapm->card, w) {
-		if (!strcmp(w->name, pin_name)) {
+		if (!strcmp(w->name, pin)) {
 			if (w->dapm == dapm)
 				return w;
 			else
-- 
2.11.0

