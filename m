Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D06F71A340
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 17:52:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E7B686E;
	Thu,  1 Jun 2023 17:51:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E7B686E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685634745;
	bh=AcsZSrp23xc45oeImu75XWNj6zM4jA7Teepc9bE1AEg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cdUbAUEwkOv9eHCksc7R45Z4dnoErQHNx1ss3u+f1lUiFP5TWj3JgUZ6EtPv2wwoO
	 /4hii8nKCTZa7yA56tvtl/iEryDmG5/CKLJBQnmd06SV63r/H3BBRu8KdQar+r6I6v
	 b0LW4EBaA+nwEvngKMDLUnLsqmCVfNh9hgQ7pDAE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46417F80610; Thu,  1 Jun 2023 17:48:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82489F8060C;
	Thu,  1 Jun 2023 17:48:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7003CF805A8; Thu,  1 Jun 2023 17:47:57 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A2F1F80494
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 17:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A2F1F80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=NlM66qHE
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 351CPISb014930;
	Thu, 1 Jun 2023 10:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=2PmIs0Q08Dk6L0sS+J7nSOBP8MhP2M6e7/lxtiv4sR0=;
 b=NlM66qHEOFu4NNxgOZ7t1ao0wMUYNrj/F5L5mCMJK8/e3lCb27hHx/BbzLBNrUxbmGqb
 lw/jhq9vP+x8/Y7TNAsbolDL5mxgRXiHqC+nSC8/mk+acR+ldT5iIYuldK/96PG/B7L0
 ifmarhFI+4NMuAer8sWevHtJ6t6E98cWk+LZnlIv/9dR2xsU1vVE0k2BXhvTKL3chsI5
 GSX4wmVfqCRrvM06UDuI+b4YQHO2VEGP8BuSXn1FEaqxi15Riuj0vBWuZthpby4DVCIK
 Ox02aKIfWwPVdFF4cYcrXNGNU/13y3cxLKTdlBfFbZMIY9PLdu5XL5eij8L4m7zi9LPf gQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3quf90x42d-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 10:47:38 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 1 Jun
 2023 16:47:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 1 Jun 2023 16:47:32 +0100
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E7DC315B7;
	Thu,  1 Jun 2023 15:47:31 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>, <perex@perex.cz>, <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH v4 11/12] ALSA: hda: Add mute_hook to hda_component
Date: Thu, 1 Jun 2023 16:47:30 +0100
Message-ID: <20230601154731.3210572-12-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230601154731.3210572-1-rf@opensource.cirrus.com>
References: <20230601154731.3210572-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: hzxxi4eL9sSZKMDNWlAMEAkYhXIyzHOG
X-Proofpoint-ORIG-GUID: hzxxi4eL9sSZKMDNWlAMEAkYhXIyzHOG
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VGDHOKETSKAT6FAZZ2S6WBM6OCCBWJHB
X-Message-ID-Hash: VGDHOKETSKAT6FAZZ2S6WBM6OCCBWJHB
X-MailFrom: prvs=151698faa0=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VGDHOKETSKAT6FAZZ2S6WBM6OCCBWJHB/>
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

