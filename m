Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD1379CF30
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 13:05:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A591E80;
	Tue, 12 Sep 2023 13:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A591E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694516732;
	bh=QwVU5oOHgWjfPmqwrEV3ZqF19Xp1vFXf2zAbfRKHkrA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EvX89LPEcNJnIYKBmknu76blLSRmWAQFCOeZB/Lib+wRE7Xw8cxQGCehtBXVrCF43
	 rUpo6oeWOVluFbIny3i21eis1KPwz2cbGhhXSsfTtC+0fzKdZnde4Nm8vjiNy6aRG8
	 iDH8FkA93Jx587MbnDocDofR/CSkgKllrB46FBa0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D14CF800AA; Tue, 12 Sep 2023 13:04:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5B04F80425;
	Tue, 12 Sep 2023 13:04:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AED9F80431; Tue, 12 Sep 2023 13:02:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2360AF800AA
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 13:01:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2360AF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=msp3JdlP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694516495; x=1726052495;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QwVU5oOHgWjfPmqwrEV3ZqF19Xp1vFXf2zAbfRKHkrA=;
  b=msp3JdlPMAv324MdrL7N1+pbuxNrP9o4lUSuUdClju+GqUjGJbEj3X88
   s5IaqGsWuCdWlQIdmr39+iYIbAAK1n7D83i06Jeo5B7LPHRn/LG24bp1h
   lTmwwgSEr/lRaw4rKnesRYpA5kXGs7XpQ65ibEBe6QORR63Yw1efBfL/s
   W7lvWeS7rdz6EwukgkvMsUd0/6jpwuM0XWmn21LhEuIrUeyO0l56ottg5
   z5WyR8BPwYODtTcvGBOBwcoylC+bYLMN7u4mz9/tEiYb+6iPX81u1tIEX
   5TCAryKRap1w2tFJd7GU++m/jtYVbSz65LyIOh71g0c9HkgzCu8e1N3Bl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="381041272"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000";
   d="scan'208";a="381041272"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:01:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="833868062"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000";
   d="scan'208";a="833868062"
Received: from mkidd-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.217.72])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:01:10 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: tiwai@suse.com,
	perex@perex.cz,
	arnd@arndb.de
Cc: masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: core: Use dev_name of card_dev as debugfs directory
 name
Date: Tue, 12 Sep 2023 14:01:13 +0300
Message-ID: <20230912110113.3166-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4PNVQXJ7GMZ2H5V2MJEQEGZFFT2GEP27
X-Message-ID-Hash: 4PNVQXJ7GMZ2H5V2MJEQEGZFFT2GEP27
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4PNVQXJ7GMZ2H5V2MJEQEGZFFT2GEP27/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is no need to use temporary string for the debugfs directory name as
we can use the device name of the card.

This change will also fixes the following compiler warning/error (W=1):

sound/core/init.c: In function ‘snd_card_init’:
sound/core/init.c:367:28: error: ‘%d’ directive writing between 1 and 10 bytes into a region of size 4 [-Werror=format-overflow=]
  367 |         sprintf(name, "card%d", idx);
      |                            ^~
sound/core/init.c:367:23: note: directive argument in the range [0, 2147483646]
  367 |         sprintf(name, "card%d", idx);
      |                       ^~~~~~~~
sound/core/init.c:367:9: note: ‘sprintf’ output between 6 and 15 bytes into a destination of size 8
  367 |         sprintf(name, "card%d", idx);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

The idx is guarantied to be less than SNDRV_CARDS (max 256 or 8) by the
code in snd_card_init(), however the compiler does not see that.

The warnings got brought to light by a recent patch upstream:
commit 6d4ab2e97dcf ("extrawarn: enable format and stringop overflow warnings in W=1")

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/core/init.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index d61bde1225f2..22c0d217b860 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -278,9 +278,6 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 			 size_t extra_size)
 {
 	int err;
-#ifdef CONFIG_SND_DEBUG
-	char name[8];
-#endif
 
 	if (extra_size > 0)
 		card->private_data = (char *)card + sizeof(struct snd_card);
@@ -364,8 +361,8 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 	}
 
 #ifdef CONFIG_SND_DEBUG
-	sprintf(name, "card%d", idx);
-	card->debugfs_root = debugfs_create_dir(name, sound_debugfs_root);
+	card->debugfs_root = debugfs_create_dir(dev_name(&card->card_dev),
+						sound_debugfs_root);
 #endif
 	return 0;
 
-- 
2.42.0

