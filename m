Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E936B702
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 18:39:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0609B16D5;
	Mon, 26 Apr 2021 18:39:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0609B16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619455193;
	bh=Jlfa4K1WLDtzXcB9/frLLlU2F9PZbyyomIpN4bJM55c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iqViriB/Ho74lj+25gg7i+tlnfau4+DwcruwgflvwC6szErSYZxvXx5/clpfOcVa+
	 dKgwgUOdplWOMOF9vMxOtPCgZn/z78Ak97bxG3tVvpqBurMUeVsQXAcSnIksnNGA70
	 evgj13Mtu/TA5Zu6xAk4Riknh/go+U3QhkHWqKd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24034F8029B;
	Mon, 26 Apr 2021 18:38:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF3F3F80165; Mon, 26 Apr 2021 18:38:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69821F8016C
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 18:37:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69821F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="KpYfWPKs"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QGbqwF021556; Mon, 26 Apr 2021 11:37:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=aIdnpCgM3UQro9gqLDx3/JAgxvdf6tSkYHdaHMt5Jz4=;
 b=KpYfWPKsuT4f25uS8lSPq/XHUefELafMhPCNnJbdaDlWGw3yb4ST87rIcLcMcF1bPRQO
 1+9xp4EQBoE1jmfIxuQbQnK0TjqwV7fokLPOFeYupl4W0+nJ9zYRZmiMBpszs1wownQe
 E1+QBfflrErOZ2Do6tGnkRJQtEw9UmuisKv9nwRZp8kn+PPLUllS04Fkd0Uqe+nPo2z6
 z/j5BX+cngKcWh9DUWWyN1vUp908/7TWRxogSBaQsH1RWNBHNCFhGzIrGb2VaOTAygdk
 qVO5yR6LAKCr43ycJ7mAHvZs+sQvil3eFEyWC+ACvRC/w/Kqcy/DpwlRDomgvaTPmRqm Hg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 385wdbrayd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 26 Apr 2021 11:37:52 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Apr
 2021 17:37:50 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 26 Apr 2021 17:37:50 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.203])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EC82A11CB;
 Mon, 26 Apr 2021 16:37:49 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 1/2] ALSA: hda/cirrus: Set Initial DMIC volume for Bullseye
 to -26 dB
Date: Mon, 26 Apr 2021 17:37:48 +0100
Message-ID: <20210426163749.196153-2-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426163749.196153-1-vitalyr@opensource.cirrus.com>
References: <20210426163749.196153-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -b3XCCRjQ8_z5Noia4w7BCHEoAJeTHXI
X-Proofpoint-GUID: -b3XCCRjQ8_z5Noia4w7BCHEoAJeTHXI
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104260127
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 You-Sheng Yang <vicamo.yang@canonical.com>, linux-kernel@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

After booting for first time on Bullseye, the DMIC is currently muted.
Instead, the DMIC volume should be set to a valid initial value.

Tested on DELL Inspiron-3505, DELL Inspiron-3501, DELL Inspiron-3500

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
BugLink: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1923557
Reported-and-tested-by: You-Sheng Yang <vicamo.yang@canonical.com>
---
 sound/pci/hda/patch_cirrus.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
index 5d57096b3a95..a4f82f147ff3 100644
--- a/sound/pci/hda/patch_cirrus.c
+++ b/sound/pci/hda/patch_cirrus.c
@@ -2172,6 +2172,11 @@ static void cs8409_cs42l42_fixups(struct hda_codec *codec,
 			(get_wcaps(codec, CS8409_CS42L42_AMIC_PIN_NID) | AC_WCAP_UNSOL_CAP));
 		break;
 	case HDA_FIXUP_ACT_PROBE:
+
+		/* Set initial volume on Bullseye to -26 dB */
+		if (codec->fixup_id == CS8409_BULLSEYE)
+			snd_hda_codec_amp_init_stereo(codec, CS8409_CS42L42_DMIC_ADC_PIN_NID,
+					HDA_INPUT, 0, 0xff, 0x19);
 		snd_hda_gen_add_kctl(&spec->gen,
 			NULL, &cs8409_cs42l42_hp_volume_mixer);
 		snd_hda_gen_add_kctl(&spec->gen,
-- 
2.25.1

