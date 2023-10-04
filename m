Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5467B8295
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 16:43:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6117482C;
	Wed,  4 Oct 2023 16:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6117482C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696430596;
	bh=JtflGlFyEyH5XrZvo6LnPZ3ZLu5jUFSAx/T0+B1k7FY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OsGNUpO+vF2hCmFsar9nNxT20OnU1h+YQ1K2pRYQjgTJfaj3Jinqco/SsQ40pMLQ/
	 3yfMWjYXR0NhSujWp5OUrgYFz5xhQtsE08k5022u5ggHJu89qirui9WtO5RNYs6Jda
	 6fflimG2bHvUdpwA2rRzcpimaaF9PT9F+u72Vxyc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4FFBF80130; Wed,  4 Oct 2023 16:42:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2662AF80310;
	Wed,  4 Oct 2023 16:42:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3401AF8047D; Wed,  4 Oct 2023 16:42:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1597AF80130
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 16:42:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1597AF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=LUUI1unL
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 394Eg5cL001398;
	Wed, 4 Oct 2023 09:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=S
	xz1387w7IYaa7wmEtu62QpVmMzjRznmYrElSjKXwTs=; b=LUUI1unLS7Q8eVAZc
	N8JgCk0dkAFpbwwYPJ2Fvh5O4AdMYJkn3MHingKXDK1SIbywTRnBA7VpUUODtKQ5
	mqkQ43HXP6cJkBk7QoKiGVhP39XOH1uMjoQulQtQm1ANuZUI+kKRLMrk1eVQa2IX
	2hyB2ezXkgBveDdtXhH8D4NOzUgzTgPIDllNUVOYg2NMcAgBEecrJVWD4a+c4/Af
	49YgJRkiaS9jcxwVMhcj+ATDV7lUF5dsNSfDVZHSyeR+cQQuekpeUSrjEx3uRXeP
	lj5SFbrANIqgCEzEX9kyanD+1i9udaC94jMcMrPpGZ37wf6id610o/gJ4dfimOoB
	S/p0Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3teg3k5jcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 09:42:05 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 4 Oct
 2023 15:42:03 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Wed, 4 Oct 2023 15:42:03 +0100
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.13])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9F24411AB;
	Wed,  4 Oct 2023 14:42:03 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l56: Initialise a variable to silence possible
 static analysis error
Date: Wed, 4 Oct 2023 15:42:03 +0100
Message-ID: <20231004144203.151775-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Mz-5BQscbemOf1J2sAwCXxS1MWd-TJdP
X-Proofpoint-ORIG-GUID: Mz-5BQscbemOf1J2sAwCXxS1MWd-TJdP
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: PLXWN3RPTRXUCV3KNXAE22VONQPIV33O
X-Message-ID-Hash: PLXWN3RPTRXUCV3KNXAE22VONQPIV33O
X-MailFrom: prvs=5641074c1a=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PLXWN3RPTRXUCV3KNXAE22VONQPIV33O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

read_poll_timeout() is a macro and val will be populated before use,
however some static analysis tools treat it as a function and warn of
uninitialised variable usage.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 98b1e63360ae..01b6fa97b36b 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -242,7 +242,7 @@ EXPORT_SYMBOL_NS_GPL(cs35l56_firmware_shutdown, SND_SOC_CS35L56_SHARED);
 int cs35l56_wait_for_firmware_boot(struct cs35l56_base *cs35l56_base)
 {
 	unsigned int reg;
-	unsigned int val;
+	unsigned int val = 0;
 	int read_ret, poll_ret;
 
 	if (cs35l56_base->rev < CS35L56_REVID_B0)
-- 
2.30.2

