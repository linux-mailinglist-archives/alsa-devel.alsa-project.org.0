Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B3E7B6599
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 11:35:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E3E9844;
	Tue,  3 Oct 2023 11:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E3E9844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696325733;
	bh=cHm9nqqcEX/5yspeX23G5VL6Y70h4RyPh1U4B7dhARw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Wx0cEWenp/91cfbuTiTPddU3vqqkd2mormWAPnEeWR/YM2I21xShPPFv/F15T1azn
	 KF6jmi8gaq35KbRdmT4Q2Y9kP/RTsG+6wb2HimbwlLlMaG4LzIRK8XTRU3FKRJAQ4D
	 e5W8xhfYzWvex4l9b4uPlaFXLAmy63dqodBwXKYw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEF28F8055A; Tue,  3 Oct 2023 11:34:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69867F80310;
	Tue,  3 Oct 2023 11:34:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D277F8047D; Tue,  3 Oct 2023 11:34:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27B52F801EB
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 11:34:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27B52F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=nUbs1eiL
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3935eiRf001901;
	Tue, 3 Oct 2023 04:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=+
	x4NQb1d9mbAApEiNZTnO6OPZ2dnnHZ0KF4kLSPR8hI=; b=nUbs1eiLsCyzjw7wN
	G0i1ldKudnKkSsOVztNhjs+fnWPW/F6UGpMQIYebYX0sw9UJOG/MxyxgIEpFQtJI
	OlK99vsAw4KcSFqyERoOKCSKbBPaLc/Jpf7PbRFKA4dW3MTSRuFUUQW0Vdzhsbav
	x5IyCazLZIGwha3dlZIRzo5DaTXoBzDd5vdUIXe1r+g1+hPikq7whJXKMwFvk1I2
	hHeEaAaxfukrTkW+VQm9APfJNTNRccpbH37txAwQ06ufWjnGpn1Lyztm7T/mcFm0
	/2VVYoLexuMuQggB4t8nd4H/jJ+sxuPbxGafbL5Cnvh1N1RXmzsk3Tp5xT/32c68
	Nr4lQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3teh2xvbf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Oct 2023 04:34:26 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 3 Oct
 2023 10:34:23 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Tue, 3 Oct 2023 10:34:23 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.133])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6FD5246B;
	Tue,  3 Oct 2023 09:34:23 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l56: Remove unused hibernate wake constants
Date: Tue, 3 Oct 2023 10:34:18 +0100
Message-ID: <20231003093418.21600-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: J9UD8EF50h0AyDX4iDgBSOibNIJlH6ED
X-Proofpoint-ORIG-GUID: J9UD8EF50h0AyDX4iDgBSOibNIJlH6ED
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4AP5Z5OTU3DAA4F63EBHKNATM5Q2UTDH
X-Message-ID-Hash: 4AP5Z5OTU3DAA4F63EBHKNATM5Q2UTDH
X-MailFrom: prvs=5640520b62=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4AP5Z5OTU3DAA4F63EBHKNATM5Q2UTDH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

The two CS35L56_HIBERNATE_WAKE_* constants in cs35l56.h aren't used by
any of the driver code.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 3950322bf3cb..762b96b29211 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -242,8 +242,6 @@
 #define CS35L56_CONTROL_PORT_READY_US			2200
 #define CS35L56_HALO_STATE_POLL_US			1000
 #define CS35L56_HALO_STATE_TIMEOUT_US			50000
-#define CS35L56_HIBERNATE_WAKE_POLL_US			500
-#define CS35L56_HIBERNATE_WAKE_TIMEOUT_US		5000
 #define CS35L56_RESET_PULSE_MIN_US			1100
 
 #define CS35L56_SDW1_PLAYBACK_PORT			1
-- 
2.30.2

