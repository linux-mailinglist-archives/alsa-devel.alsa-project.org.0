Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DCF79859C
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 12:18:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31F01846;
	Fri,  8 Sep 2023 12:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31F01846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694168299;
	bh=bOG4ImyC/oRx31Iu3ay/VC5I95TsUYgTSSyGrVu7fZs=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oj3+H2bGASdqtztul7WxI5fHHbRIJAQsYTwv2+JpQpwQt12Fh1nhpWSqZN7rRy0jQ
	 vWrlkeOuf8kkiOW44lA4FYiGBk8NI5NHO928JTytztiQZo/98MFiXmDW6oqMJ2nLHC
	 XM58F4CVdJUlAyL3ZnLrtMOKRnB0m9ei38/xZaVY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B64EF800F5; Fri,  8 Sep 2023 12:17:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0687F8047D;
	Fri,  8 Sep 2023 12:17:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B12D6F80494; Fri,  8 Sep 2023 12:17:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B77E8F800F5
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 12:17:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B77E8F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=UrvJZJca
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3886w1ct023995;
	Fri, 8 Sep 2023 05:17:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=/
	W1tPdE5V7gzD7bdUbDHgstk21GMGqWe6S5SZYdOVXU=; b=UrvJZJcacQqCE9t1d
	GJbBbh2rXEpAAAblgy6ABmmkryjZDQ6gzDmByfpWat1+SGQPyPDSsP14eERvVC5d
	VKckDfrqn9RyO9nxaKWfGS4O9E2xuEUZW4QMe9mcBCe/TyYTA8y5LuZzYAuvjk4G
	ViMRgIYBPKLlJSL6RanPTJfmDX0bJBdyOhqMXP1vpJJCaV+bzZx6obU2ewAtXaKq
	RnqpR49GPLgNFdheHP2Dp6V1JLkG+TUlqAxcmNlxYvMiOwMDpLJ5+2w99uXCD2jV
	oRjRbtBDXfTCa83eVc1hFFJUxLLLqfz9klYoS+iRcSvkZknZ7jKaLnqHnBor0gy4
	C0W8A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sv2ex7vtp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 05:17:18 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 8 Sep
 2023 11:17:16 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Fri, 8 Sep 2023 11:17:16 +0100
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.125])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 790E211AA;
	Fri,  8 Sep 2023 10:17:16 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l56: Call pm_runtime_dont_use_autosuspend()
Date: Fri, 8 Sep 2023 11:17:16 +0100
Message-ID: <20230908101716.2658582-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Zwh6kz_GL3q9JzEel03TLkBUi2GrakWm
X-Proofpoint-GUID: Zwh6kz_GL3q9JzEel03TLkBUi2GrakWm
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3WPNHC6BK334RP6NMSZJNOILSNYWF7LZ
X-Message-ID-Hash: 3WPNHC6BK334RP6NMSZJNOILSNYWF7LZ
X-MailFrom: prvs=46155e09a2=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3WPNHC6BK334RP6NMSZJNOILSNYWF7LZ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver remove() must call pm_runtime_dont_use_autosuspend().

Drivers that call pm_runtime_use_autosuspend() must disable
it in driver remove(). Unfortunately until recently this was
only mentioned in 1 line in a 900+ line document so most
people hadn't noticed this. It has only recently been added
to the kerneldoc of pm_runtime_use_autosuspend().

THIS WON'T APPLY CLEANLY TO V6.5 AND EARLIER:
We will send a separate backported patch to stable.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 600b79c62ec4..f2e7c6d0be46 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1207,6 +1207,7 @@ void cs35l56_remove(struct cs35l56_private *cs35l56)
 	flush_workqueue(cs35l56->dsp_wq);
 	destroy_workqueue(cs35l56->dsp_wq);
 
+	pm_runtime_dont_use_autosuspend(cs35l56->base.dev);
 	pm_runtime_suspend(cs35l56->base.dev);
 	pm_runtime_disable(cs35l56->base.dev);
 
-- 
2.30.2

