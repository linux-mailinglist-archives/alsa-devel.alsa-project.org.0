Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF7978F3C9
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 22:15:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92B53741;
	Thu, 31 Aug 2023 22:14:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92B53741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693512941;
	bh=Jbn3TFG8SQtpvPI84zuKCdb8QkaRPTKljU9Yf0mK/ZI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GiXijrRRU+DdqNpXwES4iEvi6VlOSF4Tc4doLtj5F1/r/Px3SSqAod7+col6TuGJi
	 njSA3tN0aFcA6y25nr9HisXv2Zot9soM6ek50vij1C01pMFruEx3Lj7eDyhGWuKfeX
	 jVrvsi7XhiaK353a160FrDauGeb1nHoAh9ZxyymE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC93AF80158; Thu, 31 Aug 2023 22:14:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28689F80158;
	Thu, 31 Aug 2023 22:14:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FD72F80158; Thu, 31 Aug 2023 22:14:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=AC_FROM_MANY_DOTS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FCFCF80094
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 22:14:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FCFCF80094
X-IronPort-AV: E=Sophos;i="6.02,217,1688396400";
   d="scan'208";a="174633923"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 Sep 2023 05:14:35 +0900
Received: from localhost.localdomain (unknown [10.226.92.179])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6AC8D400F727;
	Fri,  1 Sep 2023 05:14:32 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Match data improvements for wm8580 driver
Date: Thu, 31 Aug 2023 21:14:27 +0100
Message-Id: <20230831201429.94554-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: J7FTW5XF3KRWTNWJRO4NUQE57SV56SQJ
X-Message-ID-Hash: J7FTW5XF3KRWTNWJRO4NUQE57SV56SQJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J7FTW5XF3KRWTNWJRO4NUQE57SV56SQJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series aims to add match data improvements for wm8580 driver.

This patch series is only compile tested.

v2->v3:
 * Added Rb tag from Andy.
 * Restored OF table postion and moved in patch#2
 * Moved OF table near to the user.
v1->v2:
 * Added Ack from Charles Keepax.
 * Removed comma in the terminator entry.
 * Restored original error code -EINVAL

Biju Das (2):
  ASoC: wm8580: Simplify probe()
  ASoC: wm8580: Move OF table

 sound/soc/codecs/wm8580.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

-- 
2.25.1

