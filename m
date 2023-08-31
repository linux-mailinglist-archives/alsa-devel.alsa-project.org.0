Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C54C178F3CB
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 22:16:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE427A4B;
	Thu, 31 Aug 2023 22:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE427A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693512990;
	bh=V9FIrAJDOCI8N/rHU5AtTGYoCRDJmxyG2WhZw5QjlyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vJHmtl+qNVCYWt2z6rsZIZvVwWhOLJ1iKqhEkrotuuYn/JF1W8A6/FHvykEpR7g/+
	 uGuDqaIh+WA+BqvY5itfZu4bfIFLHxIj+jbp1BvoLlkwQ3BnW8MA0l3FQNDfH8TDJF
	 vkQse5OQ4/leanxaXSMXUaBYN6A8PX325Q8yoaBU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F10D7F80570; Thu, 31 Aug 2023 22:14:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 271B1F80564;
	Thu, 31 Aug 2023 22:14:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAFB0F8023B; Thu, 31 Aug 2023 22:14:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
	by alsa1.perex.cz (Postfix) with ESMTP id E5342F800F5
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 22:14:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5342F800F5
X-IronPort-AV: E=Sophos;i="6.02,217,1688396400";
   d="scan'208";a="174633941"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 Sep 2023 05:14:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.179])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 46A834005B44;
	Fri,  1 Sep 2023 05:14:40 +0900 (JST)
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
Subject: [PATCH v3 2/2] ASoC: wm8580: Move OF table
Date: Thu, 31 Aug 2023 21:14:29 +0100
Message-Id: <20230831201429.94554-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831201429.94554-1-biju.das.jz@bp.renesas.com>
References: <20230831201429.94554-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q4V2K6WB74PTDHYYQTDIDF4BZ3FS3BW7
X-Message-ID-Hash: Q4V2K6WB74PTDHYYQTDIDF4BZ3FS3BW7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q4V2K6WB74PTDHYYQTDIDF4BZ3FS3BW7/>
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
v2:
 * New patch.
---
 sound/soc/codecs/wm8580.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index 826c39ec4a1e..28c0ba348634 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -988,13 +988,6 @@ static const struct wm8580_driver_data wm8581_data = {
 	.num_dacs = 4,
 };
 
-static const struct of_device_id wm8580_of_match[] = {
-	{ .compatible = "wlf,wm8580", .data = &wm8580_data },
-	{ .compatible = "wlf,wm8581", .data = &wm8581_data },
-	{ },
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

