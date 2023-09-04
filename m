Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2271D79102B
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 04:48:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9938210;
	Mon,  4 Sep 2023 04:47:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9938210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693795721;
	bh=+K68lfgDJnncZhdPoXtkx8rsl+vybU3TKHpTw1jqewI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SEuaUKeogDWyNEPcfkNFIDiVH3dhzM+5rNgZbtOeNFkCgXJwIOHM95B+K+0JnLMPc
	 0lxFwemMCyFGySb9Cylu9dN7GIQG8/ulnv46pEtFwp6UQCuJbeuF38HDryIt0kS/ru
	 hp/9a8hM+bkwMGgaSKwJqKN33Ng+LwMf5iQEYsu4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4888FF8047D; Mon,  4 Sep 2023 04:47:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62037F80431;
	Mon,  4 Sep 2023 04:47:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C68F2F8047D; Mon,  4 Sep 2023 04:47:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3529EF80236
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 04:47:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3529EF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lOKt5jZt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693795657; x=1725331657;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+K68lfgDJnncZhdPoXtkx8rsl+vybU3TKHpTw1jqewI=;
  b=lOKt5jZtYAOGdShMaxwzdMVWlFVefrcvSBWfik7m6v1y/D3p7AxCaY1t
   vKZuf9Lgodz+xyqzP7w694H4PX2JvSfInSDizJ/QIiZuBgoEtuj3bDQUv
   U7gzNk//FakXjwjmpCLIfrBDC7MW/oWE9nvz3uUW5h8JstpbuIVJ6/9Rs
   Dr0fb2w5yIUX7DeZHwIA7PjJ3QBiI/l59lDf1qFwGHjdl2cqps1TTap1Y
   rJlMwHIVG0sUBrV3lJpZy+qwwhx+q9Te+IzrP9LKWA9XJKwxN2ZncCUxe
   rjbtQj4+z/qXVEegPszvNyQGb0jr1fFLNcCPzv47xpcM/+jCS4oEbd2mc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="407499751"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000";
   d="scan'208";a="407499751"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2023 19:47:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="810743609"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000";
   d="scan'208";a="810743609"
Received: from brentlu-desktop.itwn.intel.com ([10.5.252.92])
  by fmsmga004.fm.intel.com with ESMTP; 03 Sep 2023 19:47:29 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	Brent Lu <brent.lu@intel.com>
Subject: [PATCH] ASoC: rt5645: NULL pointer access when removing jack
Date: Mon,  4 Sep 2023 18:40:46 +0800
Message-Id: <20230904104046.4150208-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FOJQCHU4JVBFRRVYXXFWFGJGWE6SGVJB
X-Message-ID-Hash: FOJQCHU4JVBFRRVYXXFWFGJGWE6SGVJB
X-MailFrom: brent.lu@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FOJQCHU4JVBFRRVYXXFWFGJGWE6SGVJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Machine driver calls snd_soc_component_set_jack() function with NULL
jack and data parameters when removing jack in codec exit function.
Do not access data when jack is NULL.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/codecs/rt5645.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 5be5ec0260e9..2412b0853364 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3263,13 +3263,17 @@ static int rt5645_component_set_jack(struct snd_soc_component *component,
 {
 	struct snd_soc_jack *mic_jack = NULL;
 	struct snd_soc_jack *btn_jack = NULL;
-	int *type = (int *)data;
+	int type;
 
-	if (*type & SND_JACK_MICROPHONE)
-		mic_jack = hs_jack;
-	if (*type & (SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-		SND_JACK_BTN_2 | SND_JACK_BTN_3))
-		btn_jack = hs_jack;
+	if (hs_jack) {
+		type = *(int *)data;
+
+		if (type & SND_JACK_MICROPHONE)
+			mic_jack = hs_jack;
+		if (type & (SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			SND_JACK_BTN_2 | SND_JACK_BTN_3))
+			btn_jack = hs_jack;
+	}
 
 	return rt5645_set_jack_detect(component, hs_jack, mic_jack, btn_jack);
 }
-- 
2.34.1

