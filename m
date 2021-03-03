Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3371E32BA0B
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 19:55:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7EAE1865;
	Wed,  3 Mar 2021 19:54:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7EAE1865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614797734;
	bh=njzE0w8rCntgkz3ptXGF4TN5JXpCq3zLGAiYT7ChyE4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RJKmcY3jq1k/vEHVztxENvZ9+C74vmM2dd3CUFQJdfDD0QLdNiGKG3pP3ORV9V1mr
	 paigh/NVNZkc6H3D8EMSs1TiWL3+SMdDbfya15/VM7cq/yW7C63RihzdzCM67EwRPR
	 cmkkvpgUdez4zaCBF7eS6uyB2iTByLk+829Lfp80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB451F8027D;
	Wed,  3 Mar 2021 19:54:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF686F8027D; Wed,  3 Mar 2021 19:54:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DCE0F80257
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 19:53:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DCE0F80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="W6zqW9oF"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 123IrMkK001579; Wed, 3 Mar 2021 12:53:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ZEQD75MSzh+ZhgpO7KjMll57Fo8bXKYznJcXEyOmr0w=;
 b=W6zqW9oFcEGk5W5ddLo2pU9FxAwNvNWENc/T16HllzIGb0wte9zHXPbk+lThvrhB6TLP
 7y4ERo9DAIVLahL4H2md/UGRKI6PhxGB9YeVTrxRutZmskSOAdgGDoLPYa5XUOiViE9R
 vusCZjWHeXvtWpmbqrl0r63D7xkEmgUzJ2mnVVn3UwMjWfAn30k7193stcMfRJzNjgOI
 QFJwO90u76e5NIFLA0sNGqcumD3pPdpN5D2F7g6YRI69zXIVoVdkLv6wOgeT7wn4xFKg
 V71iFxG5q96w7I03U4E2xZaSn0aeiUjmtw/Kg0TvsGVjwnZ63saY7gcSPsmCOr6VQcbz Sw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 36ykctnd7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 03 Mar 2021 12:53:52 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 3 Mar 2021
 18:53:50 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Wed, 3 Mar 2021 18:53:50 +0000
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 40A9211D5;
 Wed,  3 Mar 2021 18:53:50 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/4] ALSA: hda/cirrus: Increase AUTO_CFG_MAX_INS from 8 to 18
Date: Wed, 3 Mar 2021 18:53:46 +0000
Message-ID: <20210303185349.6227-2-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303185349.6227-1-vitalyr@opensource.cirrus.com>
References: <20210303185349.6227-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103030131
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

In preparation to support Cirrus Logic CS8409 HDA bridge on new Dell platforms
it is nessasary to increase AUTO_CFG_MAX_INS and AUTO_CFG_NUM_INPUTS values.
Currently AUTO_CFG_MAX_INS is limited to 8, but Cirrus Logic HDA bridge CS8409
has 18 input pins, 16 ASP receivers and 2 DMIC inputs. We have to increase this
value to 18, so generic code can handle this correctly.

Tested on DELL Inspiron-3505, DELL Inspiron-3501, DELL Inspiron-3500

Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/hda_auto_parser.h | 2 +-
 sound/pci/hda/hda_local.h       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_auto_parser.h b/sound/pci/hda/hda_auto_parser.h
index a22ca0e17a08..df63d66af1ab 100644
--- a/sound/pci/hda/hda_auto_parser.h
+++ b/sound/pci/hda/hda_auto_parser.h
@@ -27,7 +27,7 @@ enum {
 };
 
 #define AUTO_CFG_MAX_OUTS	HDA_MAX_OUTS
-#define AUTO_CFG_MAX_INS	8
+#define AUTO_CFG_MAX_INS	18
 
 struct auto_pin_cfg_item {
 	hda_nid_t pin;
diff --git a/sound/pci/hda/hda_local.h b/sound/pci/hda/hda_local.h
index 5beb8aa44ecd..317245a5585d 100644
--- a/sound/pci/hda/hda_local.h
+++ b/sound/pci/hda/hda_local.h
@@ -180,7 +180,7 @@ int snd_hda_create_spdif_in_ctls(struct hda_codec *codec, hda_nid_t nid);
 /*
  * input MUX helper
  */
-#define HDA_MAX_NUM_INPUTS	16
+#define HDA_MAX_NUM_INPUTS	36
 struct hda_input_mux_item {
 	char label[32];
 	unsigned int index;
-- 
2.25.1

