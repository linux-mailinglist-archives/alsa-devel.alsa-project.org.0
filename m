Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 786C5544B31
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 14:03:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CE531B09;
	Thu,  9 Jun 2022 14:02:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CE531B09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654776210;
	bh=bVo+IZZ/zrNBOVcMRZ1EUyzPqU4fA6BEuDtMvThqfWU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tNCJtRklckEOf30z8XCckwUo0fF3kb/3hi3hy9uWK1AX/tKB0hnWu3tVJALNOI9rI
	 GJ38rxHUrZhR8+8uCXvphxapQ82qqDMyHJC59Od9f6bMvTa4HqvxFl8veUEOZL5Q5U
	 DxXYhUvatce2qQIIMEpRr8bgwr+cQJjsoF64ZQ+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69496F801F5;
	Thu,  9 Jun 2022 14:02:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13CECF804BD; Thu,  9 Jun 2022 14:02:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D054F80116
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 14:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D054F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="G3gSPfJu"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="VIJUQ8wG"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F3F2021ED1;
 Thu,  9 Jun 2022 12:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654776143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p1lHFP71791SBAKrwiXAM/qloLw0sEgIhq2fIJp+m5Q=;
 b=G3gSPfJuQyJq3eEC3b57IExpY/qfzG3M2gjSsCuiI/mnnpMa44vMVY6Qt0kT3LHjGHN7Bj
 E1kX7GHQJBHSvU1YtivrN1EVjawmEpaXuO7YbXCE2iN91pgYzYnVS+70tQkE8jbgUT0+4h
 MULYnIWG4eUxLW+Q//vTUBlgsh8c0rw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654776143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p1lHFP71791SBAKrwiXAM/qloLw0sEgIhq2fIJp+m5Q=;
 b=VIJUQ8wG3hydgf+hk3rM6PuRVvqvjsNQUbFq1gDmy8vUTpjB/98jnrqR4JyOb7LYEXg+Zr
 PzimE6pai4ZajhAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D40C113A8C;
 Thu,  9 Jun 2022 12:02:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WH0LM07hoWL1MAAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 09 Jun 2022 12:02:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ALSA: control: Rename CONFIG_SND_CTL_VALIDATION to
 CONFIG_SND_CTL_DEBUG
Date: Thu,  9 Jun 2022 14:02:17 +0200
Message-Id: <20220609120219.3937-3-tiwai@suse.de>
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

The purpose of CONFIG_SND_CTL_VALIDATION is rather to enable the
debugging feature for the control API.  The validation is only a part
of it.  Let's rename it to be more explicit and intuitive.

While we're at it, let's advertise, give more comment to recommend
this feature for development in the kconfig help text.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/control.h |  2 +-
 sound/core/Kconfig      | 17 +++++++++++------
 sound/core/control.c    |  4 ++--
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index 985c51a8fb74..fcd3cce673ec 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -23,7 +23,7 @@ typedef int (snd_kcontrol_tlv_rw_t)(struct snd_kcontrol *kcontrol,
 				    unsigned int __user *tlv);
 
 /* internal flag for skipping validations */
-#ifdef CONFIG_SND_CTL_VALIDATION
+#ifdef CONFIG_SND_CTL_DEBUG
 #define SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK	(1 << 24)
 #define snd_ctl_skip_validation(info) \
 	((info)->access & SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK)
diff --git a/sound/core/Kconfig b/sound/core/Kconfig
index dd7b40734723..5bd8c93931b2 100644
--- a/sound/core/Kconfig
+++ b/sound/core/Kconfig
@@ -178,14 +178,19 @@ config SND_PCM_XRUN_DEBUG
 	  sound clicking when system is loaded, it may help to determine
 	  the process or driver which causes the scheduling gaps.
 
-config SND_CTL_VALIDATION
-	bool "Perform sanity-checks for each control element access"
+config SND_CTL_DEBUG
+	bool "Enable debugging feature for control API"
 	depends on SND_DEBUG
 	help
-	  Say Y to enable the additional validation of each control element
-	  access, including sanity-checks like whether the values returned
-	  from the driver are in the proper ranges or the check of the invalid
-	  access at out-of-array areas.
+	  Say Y to enable the debugging feature for ALSA control API.
+	  It performs the additional sanity-checks for each control element
+	  read access, such as whether the values returned from the driver
+	  are in the proper ranges or the check of the invalid access at
+	  out-of-array areas.  The error is printed when the driver gives
+	  such unexpected values.
+	  When you develop a driver that deals with control elements, it's
+	  strongly recommended to try this one once and verify whether you see
+	  any relevant errors or not.
 
 config SND_JACK_INJECTION_DEBUG
 	bool "Sound jack injection interface via debugfs"
diff --git a/sound/core/control.c b/sound/core/control.c
index a25c0d64d104..21741dc653ed 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -855,7 +855,7 @@ static const unsigned int value_sizes[] = {
 	[SNDRV_CTL_ELEM_TYPE_INTEGER64] = sizeof(long long),
 };
 
-#ifdef CONFIG_SND_CTL_VALIDATION
+#ifdef CONFIG_SND_CTL_DEBUG
 /* fill the remaining snd_ctl_elem_value data with the given pattern */
 static void fill_remaining_elem_value(struct snd_ctl_elem_value *control,
 				      struct snd_ctl_elem_info *info,
@@ -1077,7 +1077,7 @@ static int snd_ctl_elem_read(struct snd_card *card,
 
 	snd_ctl_build_ioff(&control->id, kctl, index_offset);
 
-#ifdef CONFIG_SND_CTL_VALIDATION
+#ifdef CONFIG_SND_CTL_DEBUG
 	/* info is needed only for validation */
 	memset(&info, 0, sizeof(info));
 	info.id = control->id;
-- 
2.35.3

