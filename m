Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA54640D6E7
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 11:58:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4990517B5;
	Thu, 16 Sep 2021 11:57:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4990517B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631786313;
	bh=ys4+G8SsMqHAsgXepmiz/gGwsac1jDhRkOvVkYKNyt0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rcsuyi6h0qllbVWhaf6Voz52ZeXb+MNB7HwTGqrNTJd/cImF9jzRSXUu3n8ca6IMr
	 dEl1Vr2aqsVCnc4Nd5MCAmZli+SNNNuAaxWAq3zVk6kxSVmsPAX1z0IkbP/7HVTjmp
	 QNOBMv5pBvuNkntKw4N2wAGBVJH05K0p2w3XaVE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71C73F80271;
	Thu, 16 Sep 2021 11:57:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E50A6F8025E; Thu, 16 Sep 2021 11:57:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45276F80117
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 11:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45276F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="U42uK82d"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18G6UqLC017886; 
 Thu, 16 Sep 2021 04:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=ha17yogEQU4qUFAR7cWFbPaW839EX045J1Xb9CypQhc=;
 b=U42uK82d138PV2FiMjHB6SQYsz7P0lo0o6uQCs/khVjit7ufPu780IaTutRJFJkj4BDa
 cbqZN86wAxKnY6XZdqQ8r/M6ViuyYD7kbbba83Oi9F1+xSg5UNzHEy7rG2n77R6xZWwg
 k4GoVerwuGm3jZz2Ncvj6HoXxQfnTFwH2gbNKjwmq9th5CwdkKV7xFeAD/YR5ov6nhzX
 bDVTr3hd031wa90RiyBQstmuHT2NQ23Kpleu1Bvhwk7Omnvzjw5DIZ54//NTceE2Ssl9
 1pXyzA2bp9jChVMW0kOGO+PkSzRbqcoZCJQr8PCFpex4Dx6T1a0GyoTlmaoljyVV27kI Yw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3b3wfv0b8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Sep 2021 04:57:02 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 16 Sep
 2021 10:57:01 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Thu, 16 Sep 2021 10:57:01 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.230])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 19C96B15;
 Thu, 16 Sep 2021 09:57:00 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: hda/cs8409: Setup Dolphin Headset Mic as Phantom Jack
Date: Thu, 16 Sep 2021 10:56:46 +0100
Message-ID: <20210916095646.7631-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9eaEMjPcBWfdvc6H-_2mCOrYJ3a9_56S
X-Proofpoint-ORIG-GUID: 9eaEMjPcBWfdvc6H-_2mCOrYJ3a9_56S
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

Dell's requirement to have headset mic as phantom jack on this
specific dolphin hardware platform.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_cs8409.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 3c7ef55d016e..31ff11ab868e 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -1207,6 +1207,9 @@ void dolphin_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int ac
 		snd_hda_jack_add_kctl(codec, DOLPHIN_LO_PIN_NID, "Line Out", true,
 				      SND_JACK_HEADPHONE, NULL);
 
+		snd_hda_jack_add_kctl(codec, DOLPHIN_AMIC_PIN_NID, "Microphone", true,
+				      SND_JACK_MICROPHONE, NULL);
+
 		cs8409_fix_caps(codec, DOLPHIN_HP_PIN_NID);
 		cs8409_fix_caps(codec, DOLPHIN_LO_PIN_NID);
 		cs8409_fix_caps(codec, DOLPHIN_AMIC_PIN_NID);
-- 
2.25.1

