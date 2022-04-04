Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F06434F13E3
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 13:34:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8284D16F0;
	Mon,  4 Apr 2022 13:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8284D16F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649072048;
	bh=c0wFuTMFWKRfhUqfRe35SgYb06M5c27av/rwjk1yJxE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UEkjAonJnry30rIlczuvTTGuuN7y2tndm/aWVSaa20ZQ6H1sceZNn+2dnBX3FbbIt
	 kIQy1qTWbC+VNXiqFCd7rhZBVlKqEZ4XbedD1qEJ/QpVwxtA0RWLzp6BykZS5PeN/u
	 x1bNILoNpaxtvFt68/7wosjYAKQm3p6eCr/GvvGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC06FF801F7;
	Mon,  4 Apr 2022 13:33:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A634BF8010B; Mon,  4 Apr 2022 13:33:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1372F800D1
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 13:32:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1372F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="jSWvRvoK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 234ARsRs021747;
 Mon, 4 Apr 2022 06:32:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=H63J8bNo1U5sBmx2P4okC9/PwTimoEy0MqDW58hghvE=;
 b=jSWvRvoKOAi7WQU7VmBMfGcTKFHk4avxW2Im1ogeHTSiUC/RN0Gc79PFIvWzpezFNCvO
 HUAPp0x8BSNqLsP7e08h+BU03EZzxOtKq1Dl/m/T+2ztc+ekrX3t6qNIHVLRjcWGucPh
 qM50cVOXgavEGupm68sPUEHSIK07TONSC0jLIWfk3EmtvUPI0sL/5MDbW57UtfsULyNK
 V6SEnnpD/oUXTajdkDi8NBon3LbJmw3eHl6yP3Lj7FuhdpCxeJ53m3/rXvxy3Ig3jAj7
 ZQD78iFjuIP7VhSjKwmoXmDNwAxWvi2rXJrE5hJHj5MQzBGWL1zc5kJyoYEf5IXYjkc3 Vg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3f6jwnt2sf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 04 Apr 2022 06:32:57 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 4 Apr
 2022 12:32:55 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 4 Apr 2022 12:32:55 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.88])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9687FB10;
 Mon,  4 Apr 2022 11:32:55 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: simple-card-utils: Avoid NULL deref in
 asoc_simple_set_tdm()
Date: Mon, 4 Apr 2022 12:32:52 +0100
Message-ID: <20220404113252.1152659-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -H8KNmp3Gh51xxtvDil9ArkdgQVvLksO
X-Proofpoint-GUID: -H8KNmp3Gh51xxtvDil9ArkdgQVvLksO
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
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

Don't dereference simple_dai before it has been checked for NULL.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 1e974e5b82b3 ("ASoC: audio_graph_card2: Add support for variable slot widths")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/generic/simple-card-utils.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 8e037835bc58..f2157944247f 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -364,13 +364,15 @@ static int asoc_simple_set_tdm(struct snd_soc_dai *dai,
 				struct snd_pcm_hw_params *params)
 {
 	int sample_bits = params_width(params);
-	int slot_width = simple_dai->slot_width;
-	int slot_count = simple_dai->slots;
+	int slot_width, slot_count;
 	int i, ret;
 
 	if (!simple_dai || !simple_dai->tdm_width_map)
 		return 0;
 
+	slot_width = simple_dai->slot_width;
+	slot_count = simple_dai->slots;
+
 	if (slot_width == 0)
 		slot_width = sample_bits;
 
-- 
2.30.2

