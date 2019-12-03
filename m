Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D18F910F8EF
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 08:37:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 517D9165E;
	Tue,  3 Dec 2019 08:36:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 517D9165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575358644;
	bh=Kue/0l66TdfLTYFnuijJq+3vidf1KUN2rJp+RgsSEiU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B6ndkvR8BJ4F3E/sNgl+HbX4/rydE3fVrwt03jY6cXj1nvK5pYHVh4tuOPNwUBTrS
	 Mp2EDbhMCwELEMeNbB86uXSFyGmuCJugYvEkNHWtLZj3LCjIqeKmKBlhEEYH3LzlVD
	 BWCTElANnOUg5IxMzxCae5gZRAZVRM4RJJtKC55c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0EC9F8015A;
	Tue,  3 Dec 2019 08:35:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9E85F80227; Tue,  3 Dec 2019 08:35:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08508F800B4
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 08:35:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08508F800B4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 23:35:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,272,1571727600"; d="scan'208";a="235778260"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by fmsmga004.fm.intel.com with ESMTP; 02 Dec 2019 23:35:27 -0800
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Date: Tue,  3 Dec 2019 15:31:05 +0800
Message-Id: <1575358265-17905-1-git-send-email-brent.lu@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Brent Lu <brent.lu@intel.com>
Subject: [alsa-devel] [PATCH] ASoC: da7219: remove SRM lock check retry
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

For platforms not able to provide WCLK in the PREPARED runtime state, it
takes 400ms for codec driver to print the message "SRM failed to lock" in
the da7219_dai_event() function which is called when DAPM widgets are
powering up. The latency penalty to audio input/output is too much so the
retry (8 times) and delay (50ms each retry) are removed.

Another reason is current Cold output latency requirement in Android CDD is
500ms but will be reduced to 200ms for 2021 platforms. With the 400ms
latency it would be difficult to pass the Android CTS test.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/codecs/da7219.c | 3 ++-
 sound/soc/codecs/da7219.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index f83a6ea..042e701 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -833,7 +833,8 @@ static int da7219_dai_event(struct snd_soc_dapm_widget *w,
 				srm_lock = true;
 			} else {
 				++i;
-				msleep(50);
+				if (i < DA7219_SRM_CHECK_RETRIES)
+					msleep(50);
 			}
 		} while ((i < DA7219_SRM_CHECK_RETRIES) && (!srm_lock));
 
diff --git a/sound/soc/codecs/da7219.h b/sound/soc/codecs/da7219.h
index 88b67fe..3149986 100644
--- a/sound/soc/codecs/da7219.h
+++ b/sound/soc/codecs/da7219.h
@@ -770,7 +770,7 @@
 #define DA7219_PLL_INDIV_36_TO_54_MHZ_VAL	16
 
 /* SRM */
-#define DA7219_SRM_CHECK_RETRIES	8
+#define DA7219_SRM_CHECK_RETRIES	1
 
 /* System Controller */
 #define DA7219_SYS_STAT_CHECK_RETRIES	6
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
