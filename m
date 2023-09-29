Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B007B30BE
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 12:40:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E36DAE9;
	Fri, 29 Sep 2023 12:39:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E36DAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695984028;
	bh=H74qFM+oOOUHPmlwGKYaOXRgArSJXWBY6J00GbX4p3s=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gIGrmvsySuIMOMlROTJam4vicDKmJqv8QUmUIXbdCwl1k59lTPc/uOJqtdz4fExpi
	 rjdnC/pr9Fwb/Oay7ly5akh5gnKF3oLUAHFsd6h1fWWYClQ0juLrA0KapRB7H1DAX6
	 PPRHyNO0YbIwK2s72hAVClxow+KHPNLKWISeBY94=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4816AF80551; Fri, 29 Sep 2023 12:39:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC788F8016A;
	Fri, 29 Sep 2023 12:39:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20D76F801D5; Fri, 29 Sep 2023 12:36:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43CA8F8007C
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 12:33:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43CA8F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=h13fj35N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695983597; x=1727519597;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H74qFM+oOOUHPmlwGKYaOXRgArSJXWBY6J00GbX4p3s=;
  b=h13fj35NcpKXY6LCgVnIqUztChUZ72avQI/mz6MeVquYruRE+9HOIjEb
   +zhii7FkowEOLob0HAj6sl8m0coOVDjhgicsxK9GOo837aWzE/6sOuYn6
   cfDUX7555UUuitbNM1WJ1WPyvcpUKSe6TiWJsAFgJTJoCbRItqIcaU86Z
   5riiXqch3B97ZhbVJp71nXBmR76pb5nI1bMvaJmRu/bKET4ETaQ7Az4nz
   5phNQyX2tGeLCIx2SgRo1omPU75aCQ5oip7R6JEt/Mna9QzG/N+WmAv1I
   uKG8lAwY0T/q5AUbm49ud79qbBudHgfl7OhPahzaEvJL9hnayKDHNfwpp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="386135658"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="386135658"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 03:32:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="699604548"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="699604548"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga003.jf.intel.com with ESMTP; 29 Sep 2023 03:32:34 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 1/2] ASoC: core: Print component name when printing log
Date: Fri, 29 Sep 2023 12:32:42 +0200
Message-Id: <20230929103243.705433-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6QM4QPZKBHYBHMG4DJRKDJNO5EEJMPL5
X-Message-ID-Hash: 6QM4QPZKBHYBHMG4DJRKDJNO5EEJMPL5
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6QM4QPZKBHYBHMG4DJRKDJNO5EEJMPL5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When printing log related to component it is useful to know, to which
component it applies to.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c305e94762c3..2b8d522eb106 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1445,8 +1445,8 @@ static int soc_probe_component(struct snd_soc_card *card,
 	if (component->card) {
 		if (component->card != card) {
 			dev_err(component->dev,
-				"Trying to bind component to card \"%s\" but is already bound to card \"%s\"\n",
-				card->name, component->card->name);
+				"Trying to bind component \"%s\" to card \"%s\" but is already bound to card \"%s\"\n",
+				component->name, card->name, component->card->name);
 			return -ENODEV;
 		}
 		return 0;
-- 
2.34.1

