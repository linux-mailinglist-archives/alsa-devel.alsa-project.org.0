Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1942B78F447
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 22:48:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E8F61FC;
	Thu, 31 Aug 2023 22:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E8F61FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693514928;
	bh=A9V1FA5rPo9B+lz2r07GxpCr6sxFslSJS+Juyew20bg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ckk4Iq+7FWUws0E/q3QBDffndHowdB3kz+CkcTCZAhM6tjR7LN9ocX/dDmcl1f0n6
	 w30esc0Fmns0NMAYNkFI98/ypqmRmthMmjn7N3CC/PTPhbXISpE51bY8PkW7vS+5c7
	 hJCpvsM1bd+F8iE9NjM3f/UYo/PqlV+4DRMFn2yA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84308F800F5; Thu, 31 Aug 2023 22:47:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CD88F80155;
	Thu, 31 Aug 2023 22:47:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01FE0F80158; Thu, 31 Aug 2023 22:47:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=AC_FROM_MANY_DOTS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
	by alsa1.perex.cz (Postfix) with ESMTP id 21FC8F800D1
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 22:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21FC8F800D1
X-IronPort-AV: E=Sophos;i="6.02,217,1688396400";
   d="scan'208";a="174635226"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Sep 2023 05:47:39 +0900
Received: from localhost.localdomain (unknown [10.226.92.179])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E3E31402951B;
	Fri,  1 Sep 2023 05:47:36 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 0/2] Match data improvements for ak4642 driver
Date: Thu, 31 Aug 2023 21:47:32 +0100
Message-Id: <20230831204734.104954-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UCIWCRUC7DPSZLTPP66GJUHGDDX3A7LR
X-Message-ID-Hash: UCIWCRUC7DPSZLTPP66GJUHGDDX3A7LR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UCIWCRUC7DPSZLTPP66GJUHGDDX3A7LR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series aims to add match data improvements for ak4642 driver.

This patch series is only compile tested.

v2->v3:
 * Patch#1 for cleanups and patch#2 for simplifying probe()
 * Replace local variable np with dev_fwnode()
 * Replace dev_err()->dev_err_probe().
 * Remove comma in the terminator entry for OF table.
 * Drop a space in the terminator entry for ID table.
v1->v2:
 * Removed forward declaration ak4642_of_match and ak4642_i2c_id.
 * Restored error EINVAL.
 * Used dev_fwnode() and replaced dev->of_node.
 * Removed comma in the terminator entry.

Biju Das (2):
  ASoC: ak4642: Minor cleanups in probe()
  ASoC: ak4642: Simplify probe()

 sound/soc/codecs/ak4642.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

-- 
2.25.1

