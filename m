Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C0275B02C
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 15:36:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A26557F4;
	Thu, 20 Jul 2023 15:35:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A26557F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689860161;
	bh=kk9csLHNwA8avf4Sjd/RKTiBUJJ+SbAVz06eMNameoc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JBmYDrJsW/5tfcHXLaGQmFllnMdMlL2r2fzvljItU4QeRG1EBWbb7ljnkxNdX/gvc
	 wWLHFjzFjnP28S3A1rbU/+j6gIvp4FR2hoBy38XUIx7OBPMCnvsT9SO837d12YFWdY
	 wefNrTpzz2UJRfgx4e2XC5dsPzwAnONFQtm6HfO4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE40AF8047D; Thu, 20 Jul 2023 15:33:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9BABF8032D;
	Thu, 20 Jul 2023 15:33:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43CE3F8047D; Thu, 20 Jul 2023 15:33:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 59391F80535
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 15:32:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59391F80535
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=kbnguTSp
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36KAupUn002185;
	Thu, 20 Jul 2023 08:32:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=bnOAAEmWyve6CI2E3qxgDsyTBy0nDrUWAehd/iigJAs=; b=
	kbnguTSpJGBDJPZ0lK8V8J8j3shpQC6PT/E+31+BLEsuv1w6Qx/4NjIZE5knsrsG
	qFY+rR7gWaKiyXaN9By2PmB1xcRu7TZpXkQN8T+4L+FlPs+DOIBOnFcfTTSNtSAk
	nPfL6OVbHhhMoThacPEjeXPgkCN86PhAcChWthpRpolDF5ycqy37SpkhVMZctMSD
	lOqiJQv5vDLshsspejuPXK8J0zDxQwoL4dSt9hINd5VBDVr7guQ2VPjop9tvIaL3
	vL9/wY2d2KkrF58VYM2Z70HQqqSZkJAAqaAYeYcwNdt24lyUJBA5Qm/m/LS6kdX8
	XOTf7LtnYnZ3t/VXie6XTw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3rus6gx5mq-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 08:32:12 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 20 Jul
 2023 14:32:10 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Thu, 20 Jul 2023 14:32:10 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.219])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 992BE356C;
	Thu, 20 Jul 2023 13:32:10 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v1 06/11] ALSA: hda: hda_component: Add pre and post playback
 hooks to hda_component
Date: Thu, 20 Jul 2023 14:31:42 +0100
Message-ID: <20230720133147.1294337-7-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720133147.1294337-1-sbinding@opensource.cirrus.com>
References: <20230720133147.1294337-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: BRvf9KiVnvmrbAwiCK7SOMreFWg9xIXB
X-Proofpoint-GUID: BRvf9KiVnvmrbAwiCK7SOMreFWg9xIXB
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: YCSHXNBLSJYHYG5MSY5WTNG4LXEIJDAG
X-Message-ID-Hash: YCSHXNBLSJYHYG5MSY5WTNG4LXEIJDAG
X-MailFrom: prvs=25651755c6=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YCSHXNBLSJYHYG5MSY5WTNG4LXEIJDAG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These hooks can be used to add callbacks that would be run before and after
the main playback hooks. These hooks would be called for all amps, before
moving on to the next hook, i.e. pre_playback_hook would be called for
all amps, before the playback_hook is called for all amps, then finally
the post_playback_hook is called for all amps.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/hda_component.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/hda_component.h b/sound/pci/hda/hda_component.h
index 534e845b9cd1d..f170aec967c18 100644
--- a/sound/pci/hda/hda_component.h
+++ b/sound/pci/hda/hda_component.h
@@ -15,5 +15,7 @@ struct hda_component {
 	struct device *dev;
 	char name[HDA_MAX_NAME_SIZE];
 	struct hda_codec *codec;
+	void (*pre_playback_hook)(struct device *dev, int action);
 	void (*playback_hook)(struct device *dev, int action);
+	void (*post_playback_hook)(struct device *dev, int action);
 };
-- 
2.34.1

