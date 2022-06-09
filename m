Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63693544B3F
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 14:04:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA8471B41;
	Thu,  9 Jun 2022 14:03:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA8471B41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654776273;
	bh=Vjw+FhveGZgOIEo7VssDoC2aYGwmgG6f3TPCxfBG2gc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mFEa5VJlHf4bj5ySA3zIAPA9Yj5Jj2dOTyYnjLIlzWzrJ20nUvGYcJqpXx35Ay5bZ
	 JVjkcL0Nr1StQc92NcqBCygB4kpba6Aq/x8AmK+IAS8X/LMTeSAndZaGfgOD6GTVQy
	 soaCgl/GEPjd8qfBLwvUaf1WRke1bE7mV1nrD64g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78301F80536;
	Thu,  9 Jun 2022 14:02:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3C05F80240; Thu,  9 Jun 2022 14:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8548F8019D
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 14:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8548F8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="befPs5eJ"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="5YUK/xMM"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 38BFE1FE31;
 Thu,  9 Jun 2022 12:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654776143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=To29Eq0HqCLM4wfxjEuBfn58P/ZDbPWCkj0uCT+P/CI=;
 b=befPs5eJd9i+JhgbeQHa9ehLEIKndyOLtBxbc+N1ZUkT9qxYTeWFYHKGXLZlVN9RnYs5cc
 11IkLe8KHzdgZdTltS11mbQUPDJ//Hgl3WigMur+sYTUOFBSfL8kxSrrpflh2eYMpYTlCP
 f6VYNP5HAsfnwSrFap14YfqsG9QCNzw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654776143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=To29Eq0HqCLM4wfxjEuBfn58P/ZDbPWCkj0uCT+P/CI=;
 b=5YUK/xMMhRiS5NlO3jtl0Nw91JpRYg/wV9/kTZWSc0nCxZF8Y6MVXC0LQOzGSUDB8klJtW
 CpF+0wlstJnLJODA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01A0E13A97;
 Thu,  9 Jun 2022 12:02:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mAJIO07hoWL1MAAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 09 Jun 2022 12:02:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ALSA: control: Drop superfluous ifdef CONFIG_SND_CTL_DEBUG
Date: Thu,  9 Jun 2022 14:02:18 +0200
Message-Id: <20220609120219.3937-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220609120219.3937-1-tiwai@suse.de>
References: <20220609120219.3937-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Compilers should be smart enough to optimize out the dead functions,
so we don't need to define ugly dummy functions with ifdef.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 21741dc653ed..339d420fb9f7 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -855,7 +855,6 @@ static const unsigned int value_sizes[] = {
 	[SNDRV_CTL_ELEM_TYPE_INTEGER64] = sizeof(long long),
 };
 
-#ifdef CONFIG_SND_CTL_DEBUG
 /* fill the remaining snd_ctl_elem_value data with the given pattern */
 static void fill_remaining_elem_value(struct snd_ctl_elem_value *control,
 				      struct snd_ctl_elem_info *info,
@@ -967,21 +966,6 @@ static int sanity_check_elem_value(struct snd_card *card,
 
 	return ret;
 }
-#else
-static inline void fill_remaining_elem_value(struct snd_ctl_elem_value *control,
-					     struct snd_ctl_elem_info *info,
-					     u32 pattern)
-{
-}
-
-static inline int sanity_check_elem_value(struct snd_card *card,
-					  struct snd_ctl_elem_value *control,
-					  struct snd_ctl_elem_info *info,
-					  u32 pattern)
-{
-	return 0;
-}
-#endif
 
 static int __snd_ctl_elem_info(struct snd_card *card,
 			       struct snd_kcontrol *kctl,
-- 
2.35.3

