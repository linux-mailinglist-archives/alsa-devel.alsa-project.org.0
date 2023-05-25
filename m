Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84175711105
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 18:30:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C2D1208;
	Thu, 25 May 2023 18:29:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C2D1208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685032237;
	bh=AcsZSrp23xc45oeImu75XWNj6zM4jA7Teepc9bE1AEg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=phnDxYnEjz5vIBInzz5k79PFWeNusYnXk0CkSJg0ikb5N7lcmUn64s7+MWpr4096m
	 tZJ5g26MLsvF34+9HKXdpQKm+YMhViTfg4Jum+TueTLetz7WkksoX7Gdxjj3TmCYy3
	 oaCoH/Qt4B1A/N9eG5nH0odSV8t/+nGTwN/SCVow=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77B22F805F9; Thu, 25 May 2023 18:27:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1834F805F6;
	Thu, 25 May 2023 18:27:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B5DCF80580; Thu, 25 May 2023 18:27:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E100F80551
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 18:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E100F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=P6kEFVpu
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34PEEWVI026032;
	Thu, 25 May 2023 11:26:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=2PmIs0Q08Dk6L0sS+J7nSOBP8MhP2M6e7/lxtiv4sR0=;
 b=P6kEFVpuJvyAnQwgq2Hm33yzvTv7GYqe43Y9dRtOA3AQ+S2JeG73bAvWPrHULjIQ3wiW
 155txzq0SbmhsJ2+Ct4b8tfN+je3KSYgFvGTNwov+GL3arsBxkcD4UT+/tvj0WN5q8H9
 oHN75MXyn11YC4GmqjhV3Ogdyftl8OwSgKG6DAdShsB0sFR17gr91he58JgfABmCpxfT
 Lh66byOnAF7GXkt45/feDtOLMumPmZKZSZS4RtGPV2MyuhsVMAgqKGT/W+FqX0U18cxe
 hNE2P4v4bZIT3nO1Z5JADNkc3ExXMu1R8sgPiaj/V2cSD8kn5DpxPLwTK23goZfy74Uy 9g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qptmm74vu-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 May 2023 11:26:29 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 25 May
 2023 11:26:26 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 25 May 2023 11:26:26 -0500
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.166])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9186011D4;
	Thu, 25 May 2023 16:26:26 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>, <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH v2 11/12] ALSA: hda: Add mute_hook to hda_component
Date: Thu, 25 May 2023 17:26:17 +0100
Message-ID: <20230525162618.20146-12-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230525162618.20146-1-rf@opensource.cirrus.com>
References: <20230525162618.20146-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: vk3diJfc1zPjVbj6gAe0NQ2fVR7GRDy2
X-Proofpoint-GUID: vk3diJfc1zPjVbj6gAe0NQ2fVR7GRDy2
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 56RFRCGNUA5N3BMOJF5X5SFHLJHNTHK2
X-Message-ID-Hash: 56RFRCGNUA5N3BMOJF5X5SFHLJHNTHK2
X-MailFrom: prvs=050971c6a2=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/56RFRCGNUA5N3BMOJF5X5SFHLJHNTHK2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

Add a hook into hda_component to allow the amplifier mute to be
controlled by the owning HDA codec driver.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/hda_component.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/hda_component.h b/sound/pci/hda/hda_component.h
index 534e845b9cd1..2a2dfed3aed4 100644
--- a/sound/pci/hda/hda_component.h
+++ b/sound/pci/hda/hda_component.h
@@ -16,4 +16,5 @@ struct hda_component {
 	char name[HDA_MAX_NAME_SIZE];
 	struct hda_codec *codec;
 	void (*playback_hook)(struct device *dev, int action);
+	void (*mute_hook)(struct device *dev, bool mute);
 };
-- 
2.30.2

