Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 773726CB26
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 10:45:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E930E1673;
	Thu, 18 Jul 2019 10:44:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E930E1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563439527;
	bh=wQkCsz35vfgHKg5nNdcIpSBRP2zZ0jY7GH1QB3B6A+E=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lZk2CrYSZS7bgfrtysyrJ9AeZ8qcESK9/Fzjg74d1OibEqEDjpnveiQgJmWfsQNwa
	 qRgheGcuQJ7Lvqhvkts9PKdNzO73jtgmX4vopiJUIHloeALs3QuDYKBUeHXSYUoVlq
	 nh9NmofevPoJjmMl3OkSZdjc4Vs5it8IELfq4gsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A71B4F8038F;
	Thu, 18 Jul 2019 10:43:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 128CCF80376; Thu, 18 Jul 2019 10:43:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E01BF800C0
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 10:43:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E01BF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="SVJp5g+2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6I8ZOCa026173; Thu, 18 Jul 2019 03:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=/OC4Bf1UT1nbfu+roN/Ki/gJPZkSbh9rEE7y4hVgUI4=;
 b=SVJp5g+2hLPvSLla4SWIxu28jDfBToeqZusMlaYaoK3i2jVfLJr3u84x329hiTm57FBf
 IMKZJekQQ7Yf4fChIxaEUgVXhp6ni/iEdHMEOSjxOAaq5/lDgi2WkOV/8ShhMhmFgu0C
 +oquahUN+QjlhxzSYxqqom+hz0p6eN3CX95CtZ6wMoNFxFYFdg6tw5PONKQNFJ8AJDCp
 uS7JvX7fZbHATYj5QVdF3vmyQlp1c/WM7wc1BgodhXAjJ34Eczi2dI795VPfL/qrRf+B
 ig/QToPa5rjyfRqhd9a/Wm+PlD4oTXTGqLeDghv3ptAmBSKU1Oz4rNZLw9yBzv0KY49V RA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2tt7xd8wjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 18 Jul 2019 03:43:35 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 18 Jul
 2019 09:43:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 18 Jul 2019 09:43:33 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B09832A1;
 Thu, 18 Jul 2019 09:43:33 +0100 (BST)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Thu, 18 Jul 2019 09:43:33 +0100
Message-ID: <20190718084333.15598-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=940 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907180099
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: dapm: Fix handling of
	custom_stop_condition on DAPM graph walks
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

DPCM uses snd_soc_dapm_dai_get_connected_widgets to build a
list of the widgets connected to a specific front end DAI so it
can search through this list for available back end DAIs. The
custom_stop_condition was added to is_connected_ep to facilitate this
list not containing more widgets than is necessary. Doing so both
speeds up the DPCM handling as less widgets need to be searched and
avoids issues with CODEC to CODEC links as these would be confused
with back end DAIs if they appeared in the list of available widgets.

custom_stop_condition was implemented by aborting the graph walk
when the condition is triggered, however there is an issue with this
approach. Whilst walking the graph is_connected_ep should update the
endpoints cache on each widget, if the walk is aborted the number
of attached end points is unknown for that sub-graph. When the stop
condition triggered, the original patch ignored the triggering widget
and returned zero connected end points; a later patch updated this
to set the triggering widget's cache to 1 and return that. Both of
these approaches result in inaccurate values being stored in various
end point caches as the values propagate back through the graph,
which can result in later issues with widgets powering/not powering
unexpectedly.

As the original goal was to reduce the size of the widget list passed
to the DPCM code, the simplest solution is to limit the functionality
of the custom_stop_condition to the widget list. This means the rest
of the graph will still be processed resulting in correct end point
caches, but only widgets up to the stop condition will be added to the
returned widget list.

Fixes: 6742064aef7f ("ASoC: dapm: support user-defined stop condition in dai_get_connected_widgets")
Fixes: 5fdd022c2026 ("ASoC: dpcm: play nice with CODEC<->CODEC links")
Fixes: 09464974eaa8 ("ASoC: dapm: Fix to return correct path list in is_connected_ep.")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-dapm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index f013b24c050a1..f73882cf0031d 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1157,8 +1157,8 @@ static __always_inline int is_connected_ep(struct snd_soc_dapm_widget *widget,
 		list_add_tail(&widget->work_list, list);
 
 	if (custom_stop_condition && custom_stop_condition(widget, dir)) {
-		widget->endpoints[dir] = 1;
-		return widget->endpoints[dir];
+		list = NULL;
+		custom_stop_condition = NULL;
 	}
 
 	if ((widget->is_ep & SND_SOC_DAPM_DIR_TO_EP(dir)) && widget->connected) {
@@ -1195,8 +1195,8 @@ static __always_inline int is_connected_ep(struct snd_soc_dapm_widget *widget,
  *
  * Optionally, can be supplied with a function acting as a stopping condition.
  * This function takes the dapm widget currently being examined and the walk
- * direction as an arguments, it should return true if the walk should be
- * stopped and false otherwise.
+ * direction as an arguments, it should return true if widgets from that point
+ * in the graph onwards should not be added to the widget list.
  */
 static int is_connected_output_ep(struct snd_soc_dapm_widget *widget,
 	struct list_head *list,
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
