Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6085A33C32C
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 18:01:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D65E41896;
	Mon, 15 Mar 2021 18:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D65E41896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615827709;
	bh=4LKMMPBl0x/7nO0GjsQegrRQZ0GHHSJzwerHvPqsk7g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qo8+0xJhnCV8Ryfmn3YGe+rDKjYQCPPuVfSTVtb6cXTlExgFqyR8OnIHaxh41tC7f
	 Y6beEaaEgBVZynHPY0PieTx5/IhT8kfVepSa1IeLTJ34bqJLNXWi2onevrRES2gafu
	 GqBInFvl0SXrhrMVCsU/h6wz8cTHaLYMSftzJiZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA003F804B2;
	Mon, 15 Mar 2021 17:57:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95388F804B2; Mon, 15 Mar 2021 17:57:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A594F804B2
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 17:57:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A594F804B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="pCC+UnFR"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FGmgbT030888; Mon, 15 Mar 2021 11:57:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=HXaAP0he+ha3pk5SUWEmSHuBygPUj19qfOKet2qcoIM=;
 b=pCC+UnFRih1ABJgoT+wSBNwcVaxOXy7R67zN754D8RHRaHQuPK5r8Zu5NWu+ENZUwBRD
 Ynf78aLIkn4FSEWJ9k7dwbE+LzK1ntFva33hfq84knzNiWMClHMyNFj5F4mxLEj4EWoR
 8ikPuDtkkhWY905Jl0Dx/dmzNplwNuLbMwdYCqLNWOAo9ADNF/EW78qHBo74ijWRVgS5
 c74wpyq6pc2pueF08+7mVk6CYZ/2cv4t4alfZf6c8eF/QBI37MizbbJqEwQY+UAtcsSJ
 ZOxIlUuvW/rTSmg+j4U9mpuQg8PLgajHTwLekuL3dslAmtXFknM75CyIRznjzVfTFn4E PA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3790bs2bks-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 15 Mar 2021 11:57:39 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 15 Mar
 2021 16:57:07 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 15 Mar 2021 16:57:07 +0000
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8B2C511D6;
 Mon, 15 Mar 2021 16:57:07 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 3/4] ALSA: hda/cirrus: Fix CS42L42 Headset Mic volume
 control name
Date: Mon, 15 Mar 2021 16:57:05 +0000
Message-ID: <20210315165706.3629-4-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315165706.3629-1-vitalyr@opensource.cirrus.com>
References: <20210315165706.3629-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 impostorscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150114
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
---
 sound/pci/hda/patch_cirrus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
index 7dd48f0ff000..b64c11e8c8a1 100644
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

