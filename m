Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1723A26AEF
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2025 05:08:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F19F60195;
	Tue,  4 Feb 2025 05:08:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F19F60195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738642138;
	bh=WVJKJCXafoZDt2fgMo2hfVB4TrepTpU/rLmSnRwwsmE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=D8x+E5Rg+qIafx4yoyf/sOfCqcfHTgVn8AjJjJyJwfLAp77S5pBaDtIbs3scU7mLa
	 0NqzAafCAKr0+GMKEqRY0N3Iq3jL+VnXiiHp2b5PrfTzFlxwA1K7Yut1/cbKe4ErZS
	 RykMAXJ/LURAL1NgCzMES84zMeKTqg7g8bnKEOOk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAEF9F804B0; Tue,  4 Feb 2025 05:08:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC0FCF804B0;
	Tue,  4 Feb 2025 05:08:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0029F80527; Tue,  4 Feb 2025 05:07:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6EFC8F8016E
	for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2025 05:07:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EFC8F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=tIoNct5z
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51447iLN3082441
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 22:07:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738642064;
	bh=p5otmGI6O7LQBHDsBHInGlKABWHLbf34yMb/QXQ/q1o=;
	h=From:To:CC:Subject:Date;
	b=tIoNct5zTj3F/Q1KaRd+YJJgEb/mxc9nf2MVY66QK7ZFa/A2XUJPalsTAnaBt2HRh
	 qltKSVCZcTJxRy0g0xt8j6Sx5FbItnTPeJ/vWAuoN7efA++ZGlqmX1OKBuApMJAxtg
	 V4YxMtgyD4vu1LNwKnAcjFj8VUOsw24B3QxAlqZY=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51447ifX103878
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 22:07:44 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 22:07:44 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 22:07:43 -0600
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.127])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51447etc078001;
	Mon, 3 Feb 2025 22:07:41 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <linux-kernel@vger.kernel.org>
CC: <baojun.xu@ti.com>, <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        Shenghao Ding
	<shenghao-ding@ti.com>
Subject: [PATCH v1] MAINTAINERS: remove Kevin Lu from TEXAS INSTRUMENTS AUDIO
 (ASoC/HDA) DRIVERS
Date: Tue, 4 Feb 2025 12:07:37 +0800
Message-ID: <20250204040737.657-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: OAGKWNN7OX6DG56K6TQSQ6QWNGHB6DY5
X-Message-ID-Hash: OAGKWNN7OX6DG56K6TQSQ6QWNGHB6DY5
X-MailFrom: shenghao-ding@ti.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OAGKWNN7OX6DG56K6TQSQ6QWNGHB6DY5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Due to internal re-org, Kevin Lu has no longer maintained audio driver.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..bc0bf402818d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23370,7 +23370,6 @@ F:	sound/soc/ti/
 
 TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS
 M:	Shenghao Ding <shenghao-ding@ti.com>
-M:	Kevin Lu <kevin-lu@ti.com>
 M:	Baojun Xu <baojun.xu@ti.com>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
-- 
2.34.1

