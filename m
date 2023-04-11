Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 591816DDFA6
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 17:28:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69033F0E;
	Tue, 11 Apr 2023 17:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69033F0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681226889;
	bh=Y51UQ2ugAy2nOw3puPqR97e5FQ4fHG7M3xmAcy9F10A=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=nBYcPY7tbGAVXimeHzLR5jL3ojwqcj3QhOixYoGk0CVu6+IMzHygEpTPYDBMPlrHn
	 f95arh9gSmsNnlsFbwHlkHXFDz+GWYfoHajN7VGgDq0M67CRl9an8AhCfSjZD5WM23
	 ciH4MHzKbJA6TLWqDvMdHgfJy8//KNU3HuHetJvA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D734F80551;
	Tue, 11 Apr 2023 17:25:52 +0200 (CEST)
To: <broonie@kernel.org>
Subject: [PATCH 3/6] ASoC: cs35l56: Skip first init_completion wait in
 dsp_work if init_done
Date: Tue, 11 Apr 2023 16:25:25 +0100
In-Reply-To: <20230411152528.329803-1-rf@opensource.cirrus.com>
References: <20230411152528.329803-1-rf@opensource.cirrus.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IHLDYBNWEZIEEGRSEDAUZILTRWSNEUPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168122675139.26.1346332199626475851@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1CCCF80534; Tue, 11 Apr 2023 17:25:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CDF97F80448
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 17:25:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDF97F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Rdn+cz2P
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33B5cuXH012801;
	Tue, 11 Apr 2023 10:25:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=VR8dS9XHi/tcgg98tMyvu5oqdaqQI1zEFWEB3e2GIBY=;
 b=Rdn+cz2PuBzL5/nLw7ZZd+bzotn5bAQU7bm7EuXWXvgYoH/upMoYC6qDk5Abml4ndy4v
 cyHFtHdwxs4Otgq4BRmxkDBoUMLbKPBbAGDUdhX74rD20VEHeBLSxtygp1UscMXrYb8+
 6/0UbjZ7capl9N97eQhA4fSl6TAaX7l38P711OEAeBwwY8D27mE4/pXCxtvmQ540AxOO
 y+p2Py6Jv/on7ImAJZCpLKMvGxOoLQnzY0bPDQ1KAaGYv8E7k5yWywsEq2OOENX4dhRz
 3kgBXZyz4g6bmiiUq3gSJy22bJht4Pxz/5eYqnjnx0XHY0KX0IGa230Ftk3ds7xtxdKY Fg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pu4pq54a3-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Apr 2023 10:25:31 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 11 Apr
 2023 10:25:28 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 11 Apr 2023 10:25:28 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6EED115B6;
	Tue, 11 Apr 2023 15:25:28 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 3/6] ASoC: cs35l56: Skip first init_completion wait in
 dsp_work if init_done
Date: Tue, 11 Apr 2023 16:25:25 +0100
Message-ID: <20230411152528.329803-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230411152528.329803-1-rf@opensource.cirrus.com>
References: <20230411152528.329803-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: j7ttbEAZI4NGRR5EORvwAyFKfnenpTWr
X-Proofpoint-ORIG-GUID: j7ttbEAZI4NGRR5EORvwAyFKfnenpTWr
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IHLDYBNWEZIEEGRSEDAUZILTRWSNEUPH
X-Message-ID-Hash: IHLDYBNWEZIEEGRSEDAUZILTRWSNEUPH
X-MailFrom: prvs=9465f6ee37=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IHLDYBNWEZIEEGRSEDAUZILTRWSNEUPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

At the start of dsp_work() only wait for init_completion if !init_done.
This allows system suspend to re-queue dsp_work() without having to
do a dummy complete() of init_completion.

A dummy completion in system suspend would have to be conditional on
init_done. But that would create a possible race condition between our
system resume and cs35l56_init() in the corner case that we suspend right
after the SoundWire core has enumerated and reported ATTACHED.

It is safer and simpler to have cs35l56_init() as the only place that
init_completion is completed, and dsp_work() as the only place that
it is consumed.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 997a5c5acaab..62c44276c121 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -866,7 +866,8 @@ static void cs35l56_dsp_work(struct work_struct *work)
 	unsigned int val;
 	int ret = 0;
 
-	if (!wait_for_completion_timeout(&cs35l56->init_completion,
+	if (!cs35l56->init_done &&
+	    !wait_for_completion_timeout(&cs35l56->init_completion,
 					 msecs_to_jiffies(5000))) {
 		dev_err(cs35l56->dev, "%s: init_completion timed out\n", __func__);
 		goto complete;
-- 
2.30.2

