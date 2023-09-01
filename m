Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEB578F8DA
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 09:02:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2318E3E8;
	Fri,  1 Sep 2023 09:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2318E3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693551757;
	bh=1ECqT2emgTpOl3wCbBrkACMiGNOlBnXgFVQONTmHbQU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QaZ3NP1peDySWQfakM7/Xx3J59F/R9qAowwnWdgzWDOM3s3pnMCYbYbFLCVIdsrPt
	 aqcRRLk0LT7LkocamAIEEc3oCUWWJ6xuM9jIKa+RNQcDBt2r3bpzqRowCQZ9AEODPa
	 F2G3Kd2BEnyywhSrbnoTlHV2GhEZOJj76B5GVWWg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6220CF804DA; Fri,  1 Sep 2023 09:01:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D66CBF80158;
	Fri,  1 Sep 2023 09:01:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B729F8023B; Fri,  1 Sep 2023 09:00:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AC_FROM_MANY_DOTS,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
	by alsa1.perex.cz (Postfix) with ESMTP id EB92BF80094
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 09:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB92BF80094
X-IronPort-AV: E=Sophos;i="6.02,218,1688396400";
   d="scan'208";a="174702086"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 Sep 2023 15:59:59 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A6D004002949;
	Fri,  1 Sep 2023 15:59:55 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 0/3] Match data improvements for wm8580 driver
Date: Fri,  1 Sep 2023 07:59:49 +0100
Message-Id: <20230901065952.18760-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GROBBQV4HFBPNJ4Y5EJ66CRTHWJ777X4
X-Message-ID-Hash: GROBBQV4HFBPNJ4Y5EJ66CRTHWJ777X4
X-MailFrom: biju.das.jz@bp.renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GROBBQV4HFBPNJ4Y5EJ66CRTHWJ777X4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series aims to add match data improvements for wm8580 driver.

This patch series is only compile tested.

v3->v4:
 * Created patch#2 for removing trailing comma in the terminator entry
   for OF table.
v2->v3:
 * Added Rb tag from Andy.
 * Restored OF table postion and moved in patch#2
 * Moved OF table near to the user.
v1->v2:
 * Added Ack from Charles Keepax.
 * Removed comma in the terminator entry.
 * Restored original error code -EINVAL

Biju Das (3):
  ASoC: wm8580: Simplify probe()
  ASoC: wm8580: Remove trailing comma in the terminator entry
  ASoC: wm8580: Move OF table

 sound/soc/codecs/wm8580.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

-- 
2.25.1

