Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D17C4503F9
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 13:03:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05F611682;
	Mon, 15 Nov 2021 13:02:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05F611682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636977811;
	bh=/9Dx0YdlRwZPevk2dit622AFlYyit0YJUltesf19JIQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ubNrOkAjC1rl27RayAmypF+0GsQrQJ6SCB+c/SJMGVZZgQ373dk/pdbAh+nyWxBQI
	 fZSoQcu1V8nrEH2neOYCtZEuZOripXyaFxlq0zW7IbTvzpiXGsShF+MSGvHttwnwAT
	 RZ15ZG/APdYZ11VXLYBDj1JINoyKXvJRNetOFl80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65250F800FA;
	Mon, 15 Nov 2021 13:02:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA075F80134; Mon, 15 Nov 2021 13:02:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D7E5F80134
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 13:02:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D7E5F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="f0uaYMWH"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AF7nAsf005825;
 Mon, 15 Nov 2021 06:02:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=hPnjS/k7NJ8FcJVokz4adou63iq8Ssngsj/Yr0ArBgM=;
 b=f0uaYMWH9YenfLrJU77fA+Sjah0x7rOPcrom+KYJJkz4QM1o0lwUuq3SfStRqSqv6Asq
 3K4GTi+tnAAKtzq0UNQzYGG3+ErVZvVz1Rfcc8jpDo0NhG7vyiin80aMMNkuViOzIc2c
 UwH2UbEjWAlP8AAQtXEgZ5ytcPWewoX+L+X8obmaVr3cx7GNxgSVO3PYZD+9gpeHTk7Q
 8UF8jr4m3YsupRUTinY4TKTzknX4AMPjBs47Zs4BdjzCQVdBj3Z0NJQrX0FtlAbpb7Kb
 3OFJ8WWI0cM0TjrotQUj5a/M1K/iHrr4bvbvmd2kfD7Fv6yrE5gUZO8Ap43+TR4YPwoN LA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3cbdjgrfce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 15 Nov 2021 06:02:02 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 15 Nov
 2021 12:02:00 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 15 Nov 2021 12:02:00 +0000
Received: from simont-vb.lan?044ad.cirrus.com (unknown [198.90.238.231])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D27F2B2F;
 Mon, 15 Nov 2021 12:01:59 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: wm_adsp: wm_adsp_control_add() error: uninitialized
 symbol 'ret'
Date: Mon, 15 Nov 2021 12:01:54 +0000
Message-ID: <20211115120154.56782-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: kXTFqMASEdeS1C8X3bMwYzykUhe7o171
X-Proofpoint-GUID: kXTFqMASEdeS1C8X3bMwYzykUhe7o171
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>
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

This patch fixes the static analysis warning as it is correctly
indicating a possible code path, it cannot know that for the affected
firmware versions subname would always be NULL.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index d4f0d72cbcc8..6cb01a8e08fb 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -617,8 +617,9 @@ static int wm_adsp_control_add(struct cs_dsp_coeff_ctl *cs_ctl)
 	switch (cs_dsp->fw_ver) {
 	case 0:
 	case 1:
-		snprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s %s %x",
-			 cs_dsp->name, region_name, cs_ctl->alg_region.alg);
+		ret = scnprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
+				"%s %s %x", cs_dsp->name, region_name,
+				cs_ctl->alg_region.alg);
 		break;
 	case 2:
 		ret = scnprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
-- 
2.33.0

