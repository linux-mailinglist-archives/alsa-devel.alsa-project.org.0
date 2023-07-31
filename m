Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4785769D74
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 18:59:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B598C845;
	Mon, 31 Jul 2023 18:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B598C845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690822768;
	bh=Jb6aLZPK4CwvetGQrTqSldlZPCKgqDm0ez1lpYXX2yE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YZ4ef2ggCpTLUp5gQdI+6lobyFCDOl/CAvWwgV4Ze4mSCxp3lAi5V7pexjSlDt38A
	 wG/t7790/Pi6fhlV9FvyDUkBVCsYjS6pu11PHw63tbCGvMLmnlZ1oWhMQER6cHA3bK
	 2H8NjjKc+Dg+CyUWgBehBm31ZFJo0KL+S6bUgx+Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF66EF80563; Mon, 31 Jul 2023 18:57:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E961EF8015B;
	Mon, 31 Jul 2023 18:57:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6AFFF80544; Mon, 31 Jul 2023 18:57:42 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 97A5CF8016D
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 18:57:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97A5CF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=pgWhXHho
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36VDp2Y2022362;
	Mon, 31 Jul 2023 11:57:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=uIxcNFIlhCWl+DHFeYj1CnUBImgYJ6FmRvXCKssmj0Y=; b=
	pgWhXHhoM571lbT5+7eFEG99yK8Y0Zy/5q+7ey11g/2RUMB61bfa+ZPtP/QZQFgj
	4qOVAYm0ddVNUMwRT+qy3pnq3eKqSEK/twLAKrBD3y+OqBitRA/Ln6NT2/m2URPq
	82iucUFPpcWd6v2EO1TRKcOfEgnQdXFVzcg2IxaveqeGpdtFrgahQ+2ygmQ/mU/b
	lYPxP0OPA5K3Zz8ZcWRc/R9ITGfrSECvXkNxzn8jWq50qmY8PVMKyxsfaNLLalPk
	oCPwI/fCNefjCz4Cvv7jO5XafoWSREB3BI8xrY1W4CAIHj3YkMku0Pt1g9Uo5yCi
	Up6yWGbLEeXqLSYqGzEksw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3s5gk1sg46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 11:57:33 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 31 Jul
 2023 17:57:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Mon, 31 Jul 2023 17:57:31 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.107])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 70B6311D3;
	Mon, 31 Jul 2023 16:57:31 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        Richard
 Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 5/9] ALSA: hda/cs35l56: Call cs_dsp_power_down() before
 calling cs_dsp_remove()
Date: Mon, 31 Jul 2023 17:57:22 +0100
Message-ID: <20230731165726.7940-6-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230731165726.7940-1-rf@opensource.cirrus.com>
References: <20230731165726.7940-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: GwJk94tO8R7z1VWfOhv5pfJ5SXsoxW-V
X-Proofpoint-ORIG-GUID: GwJk94tO8R7z1VWfOhv5pfJ5SXsoxW-V
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: A2CJTOJOZN6CN6EEIU47MIBUA5PIZGI7
X-Message-ID-Hash: A2CJTOJOZN6CN6EEIU47MIBUA5PIZGI7
X-MailFrom: prvs=3576b45159=rf@opensource.cirrus.com
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In cs35l56_hda_unbind() cs_dsp_power_down() must be called to cleanup
before calling cs_dsp_remove cs_dsp_remove().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 2870f82bfa45..e8c41a4a0c40 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -649,6 +649,9 @@ static void cs35l56_hda_unbind(struct device *dev, struct device *master, void *
 	debugfs_remove_recursive(cs35l56->debugfs_root);
 #endif
 
+	if (cs35l56->base.fw_patched)
+		cs_dsp_power_down(&cs35l56->cs_dsp);
+
 	cs_dsp_remove(&cs35l56->cs_dsp);
 
 	if (comps[cs35l56->index].dev == dev)
-- 
2.30.2

