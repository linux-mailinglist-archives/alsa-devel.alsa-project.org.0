Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F46678C67D
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 15:53:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 867C83E8;
	Tue, 29 Aug 2023 15:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 867C83E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693317238;
	bh=uEpMob8MSDwWPb9K6z1p9AUsGzPr2SlnFbqr1ruzBBg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OiS4yaRiuvNIA0xfudKLvLXu0wkpy5Ec0q3bJoSgwqV7L7ZIlCC6ebR0kLceJid/V
	 3/xb3IUDk3aJglcGMQoyGoQ/aMwlikg9BLN6zS52M3bQQj3k2yCknw0YvF/R31HOV3
	 djdsDnlWQmb1iNsaw+R/08ZWRQqdSSNbaBwx08rU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0AB3F80155; Tue, 29 Aug 2023 15:53:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00B54F80155;
	Tue, 29 Aug 2023 15:53:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B12A6F80158; Tue, 29 Aug 2023 15:53:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D066FF800F5
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 15:52:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D066FF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FNeewRU8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693317181; x=1724853181;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uEpMob8MSDwWPb9K6z1p9AUsGzPr2SlnFbqr1ruzBBg=;
  b=FNeewRU8oRd3nFLa6AKXr6aK6rR3lf6ZqIMXrjjgnjh9+tzHn5T6YwOr
   RSUtCfP2r0usbhpLq+pjRZBpaUj8ciEK1AZlOHEbsXkiJrjCCvT1ztA5E
   Y8Or/BqprkLqjCsTbckiLUX34mJv/N2tPM3VvQGGfNMroaY8TeXGP3h37
   j56xmWYqqzrh2M8XgTWAS/QrdRjGkYAd+B66lkf5Uu5QLHt0tU3ZRklAM
   fF/9jna7oMfCiYFMfXgUYkB9+yi17Za0E9ONGTgO8I/ODn6pKnVt/f8BD
   SjK67+5eBs8VjkiSMEhia5VyeQltVvgOIW6M8RhMQu/Hq/QTAu+OGSIHw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="379141116"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="379141116"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 06:52:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="985357063"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="985357063"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 29 Aug 2023 06:52:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D871933B; Tue, 29 Aug 2023 16:52:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] ALSA: control: Use list_for_each_entry_safe()
Date: Tue, 29 Aug 2023 16:52:52 +0300
Message-Id: <20230829135252.3915124-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2DWHYI63QZCC6LV6O2SDFXA7PYRDQLX7
X-Message-ID-Hash: 2DWHYI63QZCC6LV6O2SDFXA7PYRDQLX7
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2DWHYI63QZCC6LV6O2SDFXA7PYRDQLX7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of reiterating the list, use list_for_each_entry_safe()
that allows to continue without starting over.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Takashi, if you have anybody or want yourself to spend some time,
I believe you can simplify a lot the parser in this file with
the help of lib/cmdline.c APIs.

 sound/core/control_led.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index a78eb48927c7..afc9ffc388e3 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -297,16 +297,13 @@ static void snd_ctl_led_clean(struct snd_card *card)
 {
 	unsigned int group;
 	struct snd_ctl_led *led;
-	struct snd_ctl_led_ctl *lctl;
+	struct snd_ctl_led_ctl *lctl, _lctl;
 
 	for (group = 0; group < MAX_LED; group++) {
 		led = &snd_ctl_leds[group];
-repeat:
-		list_for_each_entry(lctl, &led->controls, list)
-			if (!card || lctl->card == card) {
+		list_for_each_entry_safe(lctl, _lctl, &led->controls, list)
+			if (!card || lctl->card == card)
 				snd_ctl_led_ctl_destroy(lctl);
-				goto repeat;
-			}
 	}
 }
 
@@ -314,7 +311,7 @@ static int snd_ctl_led_reset(int card_number, unsigned int group)
 {
 	struct snd_card *card;
 	struct snd_ctl_led *led;
-	struct snd_ctl_led_ctl *lctl;
+	struct snd_ctl_led_ctl *lctl, _lctl;
 	struct snd_kcontrol_volatile *vd;
 	bool change = false;
 
@@ -329,14 +326,12 @@ static int snd_ctl_led_reset(int card_number, unsigned int group)
 		return -ENXIO;
 	}
 	led = &snd_ctl_leds[group];
-repeat:
-	list_for_each_entry(lctl, &led->controls, list)
+	list_for_each_entry(lctl, _lctl, &led->controls, list)
 		if (lctl->card == card) {
 			vd = &lctl->kctl->vd[lctl->index_offset];
 			vd->access &= ~group_to_access(group);
 			snd_ctl_led_ctl_destroy(lctl);
 			change = true;
-			goto repeat;
 		}
 	mutex_unlock(&snd_ctl_led_mutex);
 	if (change)
-- 
2.40.0.1.gaa8946217a0b

