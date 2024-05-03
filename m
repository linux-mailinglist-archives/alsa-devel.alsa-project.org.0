Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C3E8BAF3E
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 16:50:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E140E68;
	Fri,  3 May 2024 16:50:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E140E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714747810;
	bh=ZdaAcZwjeEGQL9HK0+7ZDImDJwKA/pqYRR2WTr4YDiM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Z0j+OYvaDSjudXxmMf9aSdiW6o41gnoxEN32vX3rcNY371rxGeD4cFnzCVNCwdP/Z
	 6pElYRagb4FiMpaW6MCOVxkXQvBlTbcBQrjx/yr16pIO9RJuQV4gpFzIWQ+VO9YYu5
	 mLXr0KK4xFpgnCTdFd1UoTdFTeiG6Hcx8fN+Go6Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12C59F804FB; Fri,  3 May 2024 16:49:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AAA72F8049C;
	Fri,  3 May 2024 16:49:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A1F7F80266; Fri,  3 May 2024 16:49:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 980AAF800E2
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 16:49:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 980AAF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=P66wCa8G
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4436vduw010022;
	Fri, 3 May 2024 09:49:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=e
	9rixmbrWHDGZ6J2M+NgxEP1yn4EKSSaL4tVG+ihimE=; b=P66wCa8GLTtrFWKdE
	PfQ7r9FrXlgaNykLWwGyIYcD+OhuKU9SeZDW/rFjqbVszsxMdWLZh6weseJoFGwD
	HrUx0sV5jTIP2wMim1DpqUaVKQpcH6g2YBrtPtuASZTfGdVQaePFBp3p9hpb2eDx
	Rm1syQ5Yo1D8eJnGxkdf4X0uU8a+RwzEmhSnMg0ib+F6BLhjgh3uH87gS4xyUZua
	ZwVHXcYp/HvG/LIYgUcYc5FIh93F+QO9IxPISnZDffCS1Hi815fqTUQ6G9Yzn1/U
	l2ZjKvdwyItvH1kj+w7Y2anbv65nRBZLDjiog40G6oPeqdhjq+vXfUznB2DN5WXH
	bSDkg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xv0e8hn7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 May 2024 09:49:22 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 May 2024
 15:49:20 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 3 May 2024 15:49:20 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 506D582026C;
	Fri,  3 May 2024 14:49:20 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH] ALSA: hda/cs_dsp_ctl: Actually remove ALSA controls
Date: Fri, 3 May 2024 15:49:20 +0100
Message-ID: <20240503144920.61075-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: M9uz6xZrXz6IqMHVhnaAae2NIHxiVlhN
X-Proofpoint-GUID: M9uz6xZrXz6IqMHVhnaAae2NIHxiVlhN
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: GKCXC3FPBD3DDRQDS6YLTTZP45L4TBCZ
X-Message-ID-Hash: GKCXC3FPBD3DDRQDS6YLTTZP45L4TBCZ
X-MailFrom: prvs=2853e2c642=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GKCXC3FPBD3DDRQDS6YLTTZP45L4TBCZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

hda_cs_dsp_control_remove() must remove the ALSA control when
deleting all the infrastructure for handling the control.

Without this it is possible for ALSA controls to be left in
the Soundcard after the amp driver module has been unloaded.
So the get/set callbacks point to code that no longer exists.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 3233b978af23 ("ALSA: hda: hda_cs_dsp_ctl: Add Library to support CS_DSP ALSA controls")
---
Note: it would be better to use the control private_free to do the
cleanup, and that is my plan long-term. But that is a larger change
to the code.

I like to keep bugfix patches as simple as possible so they are
low-risk and easy to cherry-pick into older kernels. So this patch
fixes the bug. Sometime I will send a patch for future kernel
versions that reworks the cleanup to use private_free.
---
 sound/pci/hda/hda_cs_dsp_ctl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/hda_cs_dsp_ctl.c b/sound/pci/hda/hda_cs_dsp_ctl.c
index 463ca06036bf..a42653d3473d 100644
--- a/sound/pci/hda/hda_cs_dsp_ctl.c
+++ b/sound/pci/hda/hda_cs_dsp_ctl.c
@@ -203,6 +203,10 @@ void hda_cs_dsp_control_remove(struct cs_dsp_coeff_ctl *cs_ctl)
 {
 	struct hda_cs_dsp_coeff_ctl *ctl = cs_ctl->priv;
 
+	/* Only public firmware controls will have an associated kcontrol */
+	if (ctl && ctl->kctl)
+		snd_ctl_remove(ctl->card, ctl->kctl);
+
 	kfree(ctl);
 }
 EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_control_remove, SND_HDA_CS_DSP_CONTROLS);
-- 
2.39.2

