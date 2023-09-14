Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0701D7A06F2
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 16:10:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4535846;
	Thu, 14 Sep 2023 16:09:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4535846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694700619;
	bh=9mrMSq3PC2SZDwmy2J42QCWfmoFhe7s2RWAFD4cfCk0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GFDg5tK0m3t30OcPTidBl9wyTPgK3jeP5XTC4puOfCMrkf5cqnkN3bXnEOJQCSp+L
	 f+Oar0sNZrXU0UmeZ8b3qWcZXC+dvS6stj38lsRZJxQ2bZq1LdXt19cvA1FnCI02o6
	 MsPvPVd1lW1pWcYVYDFuWlxurTKmiLoIGxFc7+QM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2E4FF80558; Thu, 14 Sep 2023 16:09:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88C67F80212;
	Thu, 14 Sep 2023 16:09:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAB3FF80246; Thu, 14 Sep 2023 16:09:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C28F7F80141
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 16:08:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C28F7F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=LxEo36sU
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38E3ihQq012982;
	Thu, 14 Sep 2023 09:08:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=4
	HgihXxVrhiu2Qr7o1AFiNL6OECM0mNgN7UuJbdBwcg=; b=LxEo36sUTZ9NjyabM
	APBU5ZX9VP3h7y/Ta68+R0QT17lDzPTbi5ppoD9d2Yi1KY3Vg5emY1/qgBDF17K7
	JujFfWW/VZqkxmtvtIY6dYQI5oj6G86X+T6lo1teMmhG23vX6F4hxAAQZk48Mqb0
	6n7kpxtPrea/DxIWp1967yGbyG6F68pSqvhh2f/xBe/q+k744mon1YLNYjB3VtIc
	XLhDIDP/vn7CL8K26uLNeiyF64d/x3Bymf2PBPKQcK92tU6Mh8jL1ma+NysSxHrW
	IdoczHSn7HYGwogKxVbBcpQLHQW63atRQzJ/+vrYkbcAaddRmUC5PeOCAPOj1uIV
	kJ8Dg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t2y7u2gp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 09:08:56 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 14 Sep
 2023 15:08:54 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Thu, 14 Sep 2023 15:08:54 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.215])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 48E9C15B4;
	Thu, 14 Sep 2023 14:08:54 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda: cs35l56: Don't 'return ret' if ret is always zero
Date: Thu, 14 Sep 2023 15:08:52 +0100
Message-ID: <20230914140852.7112-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: npi1-VwBihTbS2d2xtl1agzUXGFvtmK9
X-Proofpoint-ORIG-GUID: npi1-VwBihTbS2d2xtl1agzUXGFvtmK9
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: EWBA3SBJOF2DXRA4XPN2NPZIWXBUL7MS
X-Message-ID-Hash: EWBA3SBJOF2DXRA4XPN2NPZIWXBUL7MS
X-MailFrom: prvs=46218c6399=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EWBA3SBJOF2DXRA4XPN2NPZIWXBUL7MS/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The final return in cs35l56_hda_posture_get() was returning the
value of 'ret', but ret is always zero at this point. So this
can be a simple 'return 0'.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index a9844336bdc9..c64600280f02 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -216,11 +216,11 @@ static int cs35l56_hda_posture_get(struct snd_kcontrol *kcontrol,
 	if (ret)
 		return ret;
 
 	ucontrol->value.integer.value[0] = pos;
 
-	return ret;
+	return 0;
 }
 
 static int cs35l56_hda_posture_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-- 
2.30.2

