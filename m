Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 407C333C687
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 20:10:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 996AA1921;
	Mon, 15 Mar 2021 20:09:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 996AA1921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615835437;
	bh=9mMp7aEEsrWdzAkmnrBKiwuMcbUELC68SkzuJ1ckVqI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B6gHNYcGvmn8xHl5tRhv95PRePmlYcR0Y3DewlFa+sHPvkkHVUOxBBX8+DKkT3EN5
	 xCWBzfR514TGTNmN/bqYRn/RCwnOBAMMcGmF0WJnQi7M5f4KUDjZpNPHd3KQNjGL6B
	 B1pDmEYiSGLSji++1skxa0Eda5/ddx98NACQEIto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EB4CF80425;
	Mon, 15 Mar 2021 20:07:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BD4FF80254; Mon, 15 Mar 2021 20:07:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D7B0F8021C
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 20:07:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D7B0F8021C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="DJVvMjmC"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FJ65v9021194; Mon, 15 Mar 2021 14:07:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=7KBPY2X89s0vTPAt6SMa+ECPtJ75/eiv5q7pLjiQtvs=;
 b=DJVvMjmCkwM3IOS1qkGtFcLmK2Zpldvp3tp1NoQBFBHmwTX6dD9snhA1uu2Srrpe3FS9
 C2gMUt7iuv/Kp5ir8WUH/IAddLRyeaTyOPLw56VumyoMFCohWvsLBeVECYnwr8yMQJkB
 5n9MsGVY98CSOpJDCofB9yryFiIIE5qIrzhY16fv96qd3/b2d2DcZOVOdZHsVqJkHegL
 kSTIeecUQenm3T/TCm8OqOiyGInzdk696o7TZY9+DTe/AY5k4snuy7EOCORr2UnhsNcF
 BhWAIzQIgkNSIhCdHZeJfcTJQXy6Irf6YjXhHiNcN4Aq03pcG1GdiiUu1c7Iu8RRJ4vs cQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 378tpv2t0m-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 15 Mar 2021 14:07:20 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 15 Mar
 2021 19:07:18 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 15 Mar 2021 19:07:18 +0000
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 00B8411CB;
 Mon, 15 Mar 2021 19:07:17 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 3/4] ALSA: hda/cirrus: Fix CS42L42 Headset Mic volume
 control name
Date: Mon, 15 Mar 2021 19:07:15 +0000
Message-ID: <20210315190716.47686-4-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315190716.47686-1-vitalyr@opensource.cirrus.com>
References: <20210315190716.47686-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150128
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

Existing name "Headset Mic Volume Control" causes multiple Microphone
entries to appear in UI. Using name "Mic Volume Control" ensures only a
single Microphone entry exists when the Headset is connected.

Tested on DELL Inspiron-3505, DELL Inspiron-3501, DELL Inspiron-3500

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
BugLink: https://bugs.launchpad.net/bugs/1918378
Reported-and-tested-by: You-Sheng Yang <vicamo.yang@canonical.com>

Changes in v1:
- No changes

Changes in v2:
- No changes

Changes in v3:
- No changes

---
 sound/pci/hda/patch_cirrus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
index 275bba02cc05..c99ec5e485af 100644
--- a/sound/pci/hda/patch_cirrus.c
+++ b/sound/pci/hda/patch_cirrus.c
@@ -1789,7 +1789,7 @@ static const struct snd_kcontrol_new cs8409_cs42l42_hp_volume_mixer = {
 static const struct snd_kcontrol_new cs8409_cs42l42_amic_volume_mixer = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.index = 0,
-	.name = "Headset Mic Capture Volume",
+	.name = "Mic Capture Volume",
 	.subdevice = (HDA_SUBDEV_AMP_FLAG | HDA_SUBDEV_NID_FLAG),
 	.access = (SNDRV_CTL_ELEM_ACCESS_READWRITE
 			 | SNDRV_CTL_ELEM_ACCESS_TLV_READ),
-- 
2.25.1

