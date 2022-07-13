Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD10573491
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 12:49:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28A6F1701;
	Wed, 13 Jul 2022 12:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28A6F1701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657709384;
	bh=pcSaHUGaHctQpErNQRm/n/CA5oMX/pN6S8SoYf7uaEk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sy15Ny5yy33XYIgTtLO4Fn2rLt3ihi/8Y9xsbyceNwt9ZfdE1o0DhWH4Br3zu3EaZ
	 OCuDrsaVpl4z6E0WgLYrohQbhf2dlBlWI4ooilewEWwReaz7KuN1B6Meds11OklWv8
	 4aC49167f9Hi0fNEFg2IQMviD5R8m4JVuVqFBhZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBB33F80548;
	Wed, 13 Jul 2022 12:48:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CC47F80542; Wed, 13 Jul 2022 12:48:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08C13F8019B
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 12:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08C13F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="BH3hyzK/"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="k+JQlUmL"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6BA0333B0E;
 Wed, 13 Jul 2022 10:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657709286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E5HGNIQ4kQeUNjtKil0agkuchDbqc5ag8+MBkFoMXwc=;
 b=BH3hyzK/T6J/DkovYnFGeCu4n0nF5uc+BiDZAAeqdthLZ0CSiioAPyEQJda/2llf3HrJbU
 eOpi9Fl7grUtlswXRzTsunLGAz9bE6G0DJKswzpQcnRWsLFjs9vhwkYWwcYkyDvbXdmNCJ
 rO16PufSqcd2nWF0IYiorg3RlVqVm9A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657709286;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E5HGNIQ4kQeUNjtKil0agkuchDbqc5ag8+MBkFoMXwc=;
 b=k+JQlUmLtioDTi3r3qNxB/lR4WA+gawGdyFUONC2QivAzidIPJYVD2AGiZ9mgVRoQ0Imk3
 ZcbwXhK6WEEBCoAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CEF713AC7;
 Wed, 13 Jul 2022 10:48:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OHoJEuaizmLceAAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 13 Jul 2022 10:48:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/7] ALSA: compress: Enable kernel doc markers for some
 functions
Date: Wed, 13 Jul 2022 12:47:53 +0200
Message-Id: <20220713104759.4365-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713104759.4365-1-tiwai@suse.de>
References: <20220713104759.4365-1-tiwai@suse.de>
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

The exported functions snd_compress_new() and snd_compr_stop_error()
had already kernel-doc-style comments but they were not processed as
they weren't marked properly.  Let's enable them.

This patch also fixes the missing argument id for snd_compress_new
comments, too.

Reported-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Link: https://lore.kernel.org/r/3cd6b93b36b32ad6ae160931aaa00b20688e241a.1656759989.git.mchehab@kernel.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/compress_offload.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index de514ec8c83d..cf415fe231ed 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -810,7 +810,7 @@ static void error_delayed_work(struct work_struct *work)
 	mutex_unlock(&stream->device->lock);
 }
 
-/*
+/**
  * snd_compr_stop_error: Report a fatal error on a stream
  * @stream: pointer to stream
  * @state: state to transition the stream to
@@ -1157,11 +1157,12 @@ static int snd_compress_dev_free(struct snd_device *device)
 	return 0;
 }
 
-/*
+/**
  * snd_compress_new: create new compress device
  * @card: sound card pointer
  * @device: device number
  * @dirn: device direction, should be of type enum snd_compr_direction
+ * @id: ID string
  * @compr: compress device pointer
  */
 int snd_compress_new(struct snd_card *card, int device,
-- 
2.35.3

