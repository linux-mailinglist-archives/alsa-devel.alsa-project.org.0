Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3927275A909
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 10:22:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9618D1F7;
	Thu, 20 Jul 2023 10:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9618D1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689841360;
	bh=YPdece36CIOV01ws0uXvrVQI0SgzlSm5HDu+xhYXB2Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=okUkCrHzvbBhZURSdGmbctk2hoBhDvcIGyeuTmA8A7laRm8ecL3uErJAPySCSQFFR
	 Pb9IIToZ+Ut2EUmxtpM1V7fCLxgFD/5AXv9IhTGma6OZaD07sVPbzKMxYNJdb2W1tt
	 A2eCaque2GvBlI1inUkyeBzr++XUGB5iVUvngzHg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF4B1F80558; Thu, 20 Jul 2023 10:21:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96C60F80548;
	Thu, 20 Jul 2023 10:21:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C849F8047D; Thu, 20 Jul 2023 10:20:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28BC6F8032D
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:20:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28BC6F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=hRAqG/+0
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36K6I2k9026820;
	Thu, 20 Jul 2023 03:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=0ztLXni07vsC3C/pWxkosmXk1jxksKOi3kov4TK10D0=; b=
	hRAqG/+0BC68YGW/xlrdZfTNxb70kTnLmkwxgaGmLDbiy+5/foic0pecRLUIH1MA
	kPgKzRlcFMMUxjbSG0CXAftTbfJeV0i7oqkTeDDoxITqNuhqxrfdjGAV2ZsklTH+
	BjPMBuxo/4rZSnnYkTftAMvLLxgCDKNwowNPsL1QO/jcJVQ9kfq9fGDmxgR1qDES
	J7oMqbrDVXAKBAYl4JGuBxvGfbFkwf1K+HO+N7GnPb4k5zjs+xNSQl+bkKOTIoTP
	QLoF0lSW3sWyxCYf3T68NiGpv4Igu4X+TKTrwPn/P8E2oIg6EBXxhNyK1LKXK9x4
	xFYsFcCvGOPTPLnn/vC/9Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3rus6gwu9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 03:20:45 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 20 Jul
 2023 09:20:43 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Thu, 20 Jul 2023 09:20:43 +0100
Received: from lon-bigdaddy.ad.cirrus.com (unknown [198.61.64.114])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6B241458;
	Thu, 20 Jul 2023 08:20:43 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.com>
CC: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Vitaly Rodionov
	<vitalyr@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH 2/2] ALSA: hda/realtek: Add support for DELL Oasis 13/14/16
 laptops
Date: Thu, 20 Jul 2023 09:20:22 +0100
Message-ID: <20230720082022.13033-2-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720082022.13033-1-vitalyr@opensource.cirrus.com>
References: <20230720082022.13033-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: bEnsyKbpU1jp28Ozrjm9PgyqqK3HpZPA
X-Proofpoint-GUID: bEnsyKbpU1jp28Ozrjm9PgyqqK3HpZPA
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LKLAVJDDAR66FP6AU35SXBRWTNPG7D2X
X-Message-ID-Hash: LKLAVJDDAR66FP6AU35SXBRWTNPG7D2X
X-MailFrom: prvs=25656500a3=vitalyr@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LKLAVJDDAR66FP6AU35SXBRWTNPG7D2X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adding support for new Dell laptops using Cirrus Logic CS35L41
smart amplifiers with Realtek codec.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_realtek.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 56cbf5b38d48..943dccc14c0d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9398,6 +9398,14 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0c1c, "Dell Precision 3540", ALC236_FIXUP_DELL_DUAL_CODECS),
 	SND_PCI_QUIRK(0x1028, 0x0c1d, "Dell Precision 3440", ALC236_FIXUP_DELL_DUAL_CODECS),
 	SND_PCI_QUIRK(0x1028, 0x0c1e, "Dell Precision 3540", ALC236_FIXUP_DELL_DUAL_CODECS),
+	SND_PCI_QUIRK(0x1028, 0x0cbd, "Dell Oasis 13 CS MTL-U", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x1028, 0x0cbe, "Dell Oasis 13 2-IN-1 MTL-U", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x1028, 0x0cbf, "Dell Oasis 13 Low Weight MTU-L", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x1028, 0x0cc1, "Dell Oasis 14 MTL-H/U", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1028, 0x0cc2, "Dell Oasis 14 2-in-1 MTL-H/U", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1028, 0x0cc3, "Dell Oasis 14 Low Weight MTL-U", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1028, 0x0cc4, "Dell Oasis 16 MTL-H/U", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1028, 0x0cc5, "Dell Oasis MLK 14 RPL-P", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1028, 0x164a, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x164b, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x1586, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC2),
-- 
2.34.1

