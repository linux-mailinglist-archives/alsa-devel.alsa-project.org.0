Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E0378F8E0
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 09:03:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF8097F1;
	Fri,  1 Sep 2023 09:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF8097F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693551814;
	bh=MdehHleLjDARyPc+Ib3vigZCG/qA1CNQAr3VjBRIqMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sAL5MG8jd0QCZUTnQmiDD495YRjuMeQ2seTQ5XElAk9eIbDXZ9J1v2uMOkXTBNnSZ
	 H0QbWo5/vjVzQXMpNYxEIrdu50Oyny763H/toAhQGvphvmvWllK5FCDy+eBWeAmYRe
	 WDkI9sDQZpzgPuQJXnwmuzKCuIjoDV62JIGeB7og=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83C3AF8056F; Fri,  1 Sep 2023 09:01:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C0F3F80563;
	Fri,  1 Sep 2023 09:01:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00767F80236; Fri,  1 Sep 2023 09:00:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
	by alsa1.perex.cz (Postfix) with ESMTP id E76B0F80094
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 09:00:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E76B0F80094
X-IronPort-AV: E=Sophos;i="6.02,218,1688396400";
   d="scan'208";a="178409384"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 01 Sep 2023 16:00:12 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 76C264008C5C;
	Fri,  1 Sep 2023 16:00:08 +0900 (JST)
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
Subject: [PATCH v4 3/3] ASoC: wm8580: Move OF table
Date: Fri,  1 Sep 2023 07:59:52 +0100
Message-Id: <20230901065952.18760-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230901065952.18760-1-biju.das.jz@bp.renesas.com>
References: <20230901065952.18760-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4P2FZU4YBIT7GYHSXEFJFMI4PM6X5562
X-Message-ID-Hash: 4P2FZU4YBIT7GYHSXEFJFMI4PM6X5562
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4P2FZU4YBIT7GYHSXEFJFMI4PM6X5562/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move OF table near to the user.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Created patch#2 for removing trailing comma in the terminator entry for
   OF table.
v3:
 * New patch.
---
 sound/soc/codecs/wm8580.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index ba47b01f13e7..28c0ba348634 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -988,13 +988,6 @@ static const struct wm8580_driver_data wm8581_data = {
 	.num_dacs = 4,
 };
 
-static const struct of_device_id wm8580_of_match[] = {
-	{ .compatible = "wlf,wm8580", .data = &wm8580_data },
-	{ .compatible = "wlf,wm8581", .data = &wm8581_data },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, wm8580_of_match);
-
 static int wm8580_i2c_probe(struct i2c_client *i2c)
 {
 	struct wm8580_priv *wm8580;
@@ -1031,6 +1024,13 @@ static int wm8580_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
+static const struct of_device_id wm8580_of_match[] = {
+	{ .compatible = "wlf,wm8580", .data = &wm8580_data },
+	{ .compatible = "wlf,wm8581", .data = &wm8581_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wm8580_of_match);
+
 static const struct i2c_device_id wm8580_i2c_id[] = {
 	{ "wm8580", (kernel_ulong_t)&wm8580_data },
 	{ "wm8581", (kernel_ulong_t)&wm8581_data },
-- 
2.25.1

