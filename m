Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D68BB6DDF9C
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 17:26:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0750EF4;
	Tue, 11 Apr 2023 17:25:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0750EF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681226793;
	bh=x5RqxDLjSk0z2GVWWdkAHnr5fa86Y2cstqFnb1yydHY=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=oHBotP/5QQ/iE1tyqJLzMVBjgXz6/oYQt0g0J3KJpdvEq64AUjVY2/34FaTbYDFi7
	 +fXOc7kLoVXGSTEYSLpEKHHCHjzql7u63fnMKpAYEqPce7qxrGjllcbjVk6mZ/tHm1
	 gmL1uUyfUH85DuytpnONG+wCC2AqSUmg0AZyAGCA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAB6EF804F2;
	Tue, 11 Apr 2023 17:25:42 +0200 (CEST)
To: <broonie@kernel.org>
Subject: [PATCH 0/6] ASoC: cs35l56: Add system suspend handling
Date: Tue, 11 Apr 2023 16:25:22 +0100
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BFXT66UAJ42YIKHZTQHBKARSMWW7HTOQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168122674164.26.7343142697839184525@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04453F80529; Tue, 11 Apr 2023 17:25:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B55AF8023A
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 17:25:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B55AF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=oWNqFWyO
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33B5cuXF012801;
	Tue, 11 Apr 2023 10:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=IDUE8aPv5+jxNFKCCJKdWOof/bnjaMMvSIaTlA9bNcU=;
 b=oWNqFWyO+uHb5+jQtp/n51xZtSQ2V3Je/g3OXvXK0dMOTdOaCnDHXnQP7UKfV2T4tIsP
 nzY40WUDpoLJmqjXYE6BMHUEWYCtHgHVsgi7VqUyo/ib/nnwhfUuooVnuTgshoLI2NoF
 ptNwGulsTqjgUqmON11SP1eFWegZQId8QXS8knX1FB2wyCOgMW0l8Ff7WJI8wZqz103E
 wC4s1W4Sc6qeMeN9EgCw0vUiHtsutCarA9kRsue42CDDZTzxQLwMY5QdT7vev24DlsnD
 g5QgvmG1DjjmYj1OpqnkeSfhz+L0f7K8QjXAHeVasawOsmdxVCfQ5xvFFpk8m+XiIXZ5 oQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pu4pq54a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Apr 2023 10:25:29 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 11 Apr
 2023 10:25:28 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 11 Apr 2023 10:25:28 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 40C7445;
	Tue, 11 Apr 2023 15:25:28 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 0/6] ASoC: cs35l56: Add system suspend handling
Date: Tue, 11 Apr 2023 16:25:22 +0100
Message-ID: <20230411152528.329803-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 2QEWHzQlQzCpdtrnPdzQNRGUS7cRrJee
X-Proofpoint-ORIG-GUID: 2QEWHzQlQzCpdtrnPdzQNRGUS7cRrJee
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: BFXT66UAJ42YIKHZTQHBKARSMWW7HTOQ
X-Message-ID-Hash: BFXT66UAJ42YIKHZTQHBKARSMWW7HTOQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BFXT66UAJ42YIKHZTQHBKARSMWW7HTOQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This set of patches adds handling for system suspend.
Patches 1..4 make some code changes that simplify the
suspend implementation, mainly to avoid race conditions.

There are two seperate aspects to suspend, and these have
been done as two patches:
- the main suspend-resume handling,
- re-loading the firmware if necessary after resume.

Richard Fitzgerald (6):
  ASoC: cs35l56: Remove quick-cancelling of dsp_work()
  ASoC: cs35l56: Use DAPM widget for firmware PLAY/PAUSE
  ASoC: cs35l56: Skip first init_completion wait in dsp_work if
    init_done
  ASoC: cs35l56: Always wait for firmware boot in runtime-resume
  ASoC: cs35l56: Add basic system suspend handling
  ASoC: cs35l56: Re-patch firmware after system suspend

 include/sound/cs35l56.h        |   4 +
 sound/soc/codecs/cs35l56-sdw.c |  36 ++++
 sound/soc/codecs/cs35l56.c     | 335 ++++++++++++++++++++++++++-------
 sound/soc/codecs/cs35l56.h     |   7 +-
 4 files changed, 308 insertions(+), 74 deletions(-)

-- 
2.30.2

