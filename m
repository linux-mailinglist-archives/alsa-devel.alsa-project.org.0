Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D503E301683
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Jan 2021 16:59:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 694671AA1;
	Sat, 23 Jan 2021 16:58:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 694671AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611417559;
	bh=2bghC6+IqwZyeH9WCPJannx8by7Eex/SzrgX3dzWbUo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MGT9AYRy3CFycX98nNyz2RMDwTvNZuM1o47lBuK590pNurbXumgcBtng2+QF/BBh9
	 Hsq7OMYB6RjoFjxS+7OF8h1ZQnoM+BGMOOod90Lmlw5FkNIVzNnt5/hklBkgnLJUgE
	 EMZZGlaLUmSxXlF3bGgFq32viUCGdksoZnfPG0sQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DABC9F8026A;
	Sat, 23 Jan 2021 16:57:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 603E1F80257; Sat, 23 Jan 2021 16:57:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 856C7F8015B
 for <alsa-devel@alsa-project.org>; Sat, 23 Jan 2021 16:57:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 856C7F8015B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DC3DFAB92;
 Sat, 23 Jan 2021 15:57:36 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: One more dependency for hw constraints
Date: Sat, 23 Jan 2021 16:57:30 +0100
Message-Id: <20210123155730.22576-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jamie Heilman <jamie@audible.transient.net>
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

The fix for a long-standing USB-audio bug required one more dependency
variable to be added to the hw constraints.  Unfortunately I didn't
realize at debugging that the new addition may result in the overflow
of the dependency array of each snd_pcm_hw_rule (up to three plus a
sentinel), because USB-audio driver adds one more dependency only for
a certain device and bus, hence it works as is for many devices.  But
in a bad case, a simple open always results in -EINVAL (with kernel
WARNING if CONFIG_SND_DEBUG is set) no matter what is passed.

Since the dependencies are real and unavoidable (USB-audio restricts
the hw_params per looping over the format/rate/channels combos), the
only good solution seems to raise the bar for one more dependency for
snd_pcm_hw_rule -- so does this patch: now the hw constraint
dependencies can be up to four.

Fixes: 506c203cc3de ("ALSA: usb-audio: Fix hw constraints dependencies")
Reported-by: Jamie Heilman <jamie@audible.transient.net>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h     | 2 +-
 sound/core/pcm_native.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 2336bf9243e1..2e1200d17d0c 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -229,7 +229,7 @@ typedef int (*snd_pcm_hw_rule_func_t)(struct snd_pcm_hw_params *params,
 struct snd_pcm_hw_rule {
 	unsigned int cond;
 	int var;
-	int deps[4];
+	int deps[5];
 
 	snd_pcm_hw_rule_func_t func;
 	void *private;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 9f3f8e953ff0..c4aac703dc22 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -382,8 +382,8 @@ static int constrain_params_by_rules(struct snd_pcm_substream *substream,
 			continue;
 
 		/*
-		 * The 'deps' array includes maximum three dependencies
-		 * to SNDRV_PCM_HW_PARAM_XXXs for this rule. The fourth
+		 * The 'deps' array includes maximum four dependencies
+		 * to SNDRV_PCM_HW_PARAM_XXXs for this rule. The fifth
 		 * member of this array is a sentinel and should be
 		 * negative value.
 		 *
-- 
2.26.2

