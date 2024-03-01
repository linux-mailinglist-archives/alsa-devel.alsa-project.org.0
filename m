Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6AE86E4E9
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Mar 2024 17:03:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98A20EB1;
	Fri,  1 Mar 2024 17:03:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98A20EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709309013;
	bh=nNSRPr6lxLFdnUExIt+zynSAQytjJW4eQcCx1q4zZuU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ozNrQG1PDEB75LzazM5ADXMO/PNN8FNLIiwbF3cETgEdlHQoi5mRmbqCXsnEfEobK
	 l3Sb7105rFVLPOtcl/wLTetwvWIYwUc5LXoGiCd8McBNX4FOO8ZbnbC7fUl6oxAwQa
	 ElR2NSL208kkVQGhGc4JCc8TmAxUMWDwZUdi+M60=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E28CF805BB; Fri,  1 Mar 2024 17:02:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 310EEF805AE;
	Fri,  1 Mar 2024 17:02:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDE3DF8024E; Fri,  1 Mar 2024 17:02:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43C36F800F0
	for <alsa-devel@alsa-project.org>; Fri,  1 Mar 2024 17:02:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43C36F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ecGfPuzY
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 421Ewl9N003471;
	Fri, 1 Mar 2024 10:02:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=owhu2xi9jxikmNkGg5f5Rx2eiLy40QXG4CfupHtzXog=; b=
	ecGfPuzYckd0erLYaMn0VH2mCNv/J1eMgScB4BOVqw+Nxi8TlCVUXIVTdcahz3U6
	dkH6IZOfzotDwMsjggOte/ly4JHUnoK7yJPg5/yMLmKMFjO8JehtlGX9GGNlq9N9
	5QBO2B3ZHqeOWAAze2m3gv/dX12K9jjYUKqxwKxTJkmfBBTjIPkrStD+aHrIzIl2
	HGIKBBu193INkC1e8jP5idSQp4h4n7O0Avw8ZM0qKeN+LvDClLFU5pZnaAa0u2iY
	o1wEb31oyA6xSiSkuuOOPzjH1jGb2UPNWyAhLmj2ySil0BGh6AKd7pd7kVoiX+d1
	AGI/tq0Ko723S/lR09pjCQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wkh8r02na-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 10:02:16 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Mar
 2024 16:02:11 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 1 Mar 2024 16:02:11 +0000
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.61.65.72])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3462282024B;
	Fri,  1 Mar 2024 16:02:11 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 2/3] ALSA: hda/realtek: Add quirks for Lenovo Thinkbook 16P
 laptops
Date: Fri, 1 Mar 2024 16:01:53 +0000
Message-ID: <20240301160154.158398-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301160154.158398-1-sbinding@opensource.cirrus.com>
References: <20240301160154.158398-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 9enwOup4wSEbui0cnv5LWX-ocyCamMnY
X-Proofpoint-GUID: 9enwOup4wSEbui0cnv5LWX-ocyCamMnY
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: CYNI6AOEY6FEGXWNIXCFQ6DQRME5TLOW
X-Message-ID-Hash: CYNI6AOEY6FEGXWNIXCFQ6DQRME5TLOW
X-MailFrom: prvs=079039dfa1=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYNI6AOEY6FEGXWNIXCFQ6DQRME5TLOW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These models use 2 CS35L41 amps with HDA using I2C.
Both models have _DSD support inside cs35l41_hda_property.c.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218437

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f112eb1a868f..0b40aa713d3c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10190,6 +10190,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3886, "Y780 VECO DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38a7, "Y780P AMD YG dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38a8, "Y780P AMD VECO dual", ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x38a9, "Thinkbook 16P", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x17aa, 0x38ab, "Thinkbook 16P", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b4, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.34.1

