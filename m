Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F863F9878
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 13:34:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48E6016EF;
	Fri, 27 Aug 2021 13:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48E6016EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630064077;
	bh=c3H3SrCSpDN2Q98SXTsWoU9FRue2pkrSCjDy/tprFUQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H8u0AXivTNhqt1XUfCV0AewwCfO2uKoBmEgDDNnt+1Bne7iC0d4As3aejQBwA11Rh
	 iqUZmEkfhpLWHSfK5hsOVwsBiz81B/qHFqBFdoleDeQLMv43oCSPi6gSbLwbAUUErt
	 JXFMoHN7LrQAQY1jYRHpcSr6wc5XJRFpQSRwHzg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A26A0F801D8;
	Fri, 27 Aug 2021 13:33:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83DE9F801D5; Fri, 27 Aug 2021 13:33:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC02AF800FD
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 13:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC02AF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="n1wFxKxu"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17R81B0C012251; 
 Fri, 27 Aug 2021 06:33:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Le4te/e9isuWycyqZrcYYaONLdHszU7lSnZZrBkyn8g=;
 b=n1wFxKxu0eGhWzh5OCTtZ5sPPaC/Ts9+6IcMGCDGDxocd4KzZqIGqc9u0F8BRsyXgEP9
 4GGTALt0xKBkmRzP4N6rdX8MgPTgHRNT7AxAGFtiD5Mt8RWnL/jnXOahQiSnedl2rwGK
 qgmrYcZtuz06BxVHXclV2FOTFHp1uqnknY5BD+Ayt/4ZkoUOjGPyG6Yr1V7O7n9QBSMQ
 dl1tB/GDJvI3d9C0BvSjb5DMIVNIMc+JKrvS25swmkdE+nkcmNdwfODwMTQvcWinBden
 lRJTZD3HWmuM8D1hUMnHvZIIPtWn65Wc9ZywS9GmfLKDAsxSV/M5cZqZhf8tvo49R/ry HA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3apv5sg7fa-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 27 Aug 2021 06:33:08 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 27 Aug
 2021 12:03:01 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Fri, 27 Aug 2021 12:03:01 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.186])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5712846E;
 Fri, 27 Aug 2021 11:03:01 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/2] ALSA: hda/cs8409: Initialize Codec only in init fixup.
Date: Fri, 27 Aug 2021 12:02:52 +0100
Message-ID: <20210827110252.5361-2-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827110252.5361-1-vitalyr@opensource.cirrus.com>
References: <20210827110252.5361-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 6eawfstDClbsJ7B6N6n2XcMhn2MQ4Sdv
X-Proofpoint-GUID: 6eawfstDClbsJ7B6N6n2XcMhn2MQ4Sdv
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

It is not necessary to initialize the codec during both probe and inside
the init fixup.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_cs8409.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 805441b7bf86..3c7ef55d016e 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -1024,7 +1024,6 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 				&cs42l42_adc_volume_mixer);
 		/* Disable Unsolicited Response during boot */
 		cs8409_enable_ur(codec, 0);
-		cs8409_cs42l42_hw_init(codec);
 		snd_hda_codec_set_name(codec, "CS8409/CS42L42");
 		break;
 	case HDA_FIXUP_ACT_INIT:
@@ -1229,7 +1228,6 @@ void dolphin_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int ac
 		kctrl->private_value = HDA_COMPOSE_AMP_VAL_OFS(DOLPHIN_HP_PIN_NID, 3, CS8409_CODEC1,
 				       HDA_OUTPUT, CS42L42_VOL_DAC) | HDA_AMP_VAL_MIN_MUTE;
 		cs8409_enable_ur(codec, 0);
-		dolphin_hw_init(codec);
 		snd_hda_codec_set_name(codec, "CS8409/CS42L42");
 		break;
 	case HDA_FIXUP_ACT_INIT:
-- 
2.25.1

