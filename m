Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F7F212D33
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:38:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1880516D3;
	Thu,  2 Jul 2020 21:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1880516D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593718737;
	bh=3UAgwWR05A/h1+a8XxqcCfu3F5K6Fy2x2gpTP8fNp+k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aJtTstGFeqbvCb3XHwQdD69iy2Pl4KFtfLKBFWnZ9oG9iYGZMKmzn/1Fzlhwdu85O
	 9Kfu+nUq7GV/6OG8k1dBZ9psHJRxbRIhLPmB9U7yJ7mj7k/Vd+R0ZywDzMwCFdWiYO
	 KVVgPceA5PJvTquKYZAFeAtByvfOO5jOl+B/EY3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26464F802DB;
	Thu,  2 Jul 2020 21:36:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57ECAF800C1; Thu,  2 Jul 2020 21:36:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EA8DF800C1
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EA8DF800C1
IronPort-SDR: oFkuKKlYkBkXOJTKIYwkluV6Vl3wWkxNefmymU3sjifU3dkqx4MxQBN2AjmyTJQrX9CClrurc9
 T5TCmRC8OOdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="148549339"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="148549339"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:18 -0700
IronPort-SDR: WKYBJFjkvJ6rMfKl0tvnwJytFbk02hrZg+KVWLOTjEWWf6g42HXvHKoH8kF0ZxI7I5hapC9hq3
 GGuPBVNxrmdw==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="482116350"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 01/23] ALSA: isa/gus: remove -Wmissing-prototypes warnings
Date: Thu,  2 Jul 2020 14:35:42 -0500
Message-Id: <20200702193604.169059-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
References: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Fix W=1 warnings by adding prototypes to header file

sound/isa/gus/gus_timer.c:141:6: warning: no previous prototype for
‘snd_gf1_timers_init’ [-Wmissing-prototypes]
  141 | void snd_gf1_timers_init(struct snd_gus_card * gus)
      |      ^~~~~~~~~~~~~~~~~~~
sound/isa/gus/gus_timer.c:177:6: warning: no previous prototype for
‘snd_gf1_timers_done’ [-Wmissing-prototypes]
  177 | void snd_gf1_timers_done(struct snd_gus_card * gus)
      |      ^~~~~~~~~~~~~~~~~~~

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/gus.h       | 4 ++++
 sound/isa/gus/gus_reset.c | 2 --
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/sound/gus.h b/include/sound/gus.h
index 410939ecf3a5..cd8da68cab92 100644
--- a/include/sound/gus.h
+++ b/include/sound/gus.h
@@ -613,4 +613,8 @@ int snd_gus_dram_write(struct snd_gus_card *gus, char __user *ptr,
 int snd_gus_dram_read(struct snd_gus_card *gus, char __user *ptr,
 		      unsigned int addr, unsigned int size, int rom);
 
+/* gus_timer.c */
+void snd_gf1_timers_init(struct snd_gus_card *gus);
+void snd_gf1_timers_done(struct snd_gus_card *gus);
+
 #endif /* __SOUND_GUS_H */
diff --git a/sound/isa/gus/gus_reset.c b/sound/isa/gus/gus_reset.c
index 07bfcda43827..9a1ab5872c4f 100644
--- a/sound/isa/gus/gus_reset.c
+++ b/sound/isa/gus/gus_reset.c
@@ -9,8 +9,6 @@
 #include <sound/core.h>
 #include <sound/gus.h>
 
-extern void snd_gf1_timers_init(struct snd_gus_card * gus);
-extern void snd_gf1_timers_done(struct snd_gus_card * gus);
 extern int snd_gf1_synth_init(struct snd_gus_card * gus);
 extern void snd_gf1_synth_done(struct snd_gus_card * gus);
 
-- 
2.25.1

