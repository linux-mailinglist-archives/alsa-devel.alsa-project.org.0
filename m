Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A16CA5FAD29
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 09:03:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 339DC3764;
	Tue, 11 Oct 2022 09:02:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 339DC3764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665471797;
	bh=P3pb9AMff+rABe+t3nKv1e7RHFi0c6b6aMwBjW552rY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SddJzz1wrY+mjLj7vH2PgNiVJ0xmN7axsryvTzwXkQPfQC1GnAR5Fg9xh+shlkeb2
	 5g1k+qwzOdbSMliaSYv4VLhqcbvc1Bxx4P4i0op+tLiWQlCMbI69x4dkBdom3//PNA
	 2n5DyRCJd9Bcg7/n1rqhKiqWRRAMYlRRSbdqCcMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B126BF802E8;
	Tue, 11 Oct 2022 09:02:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44636F80134; Tue, 11 Oct 2022 09:01:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CCFCF80134
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 09:01:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CCFCF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="YJe6DgAn"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="iYP/Sdwc"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 45E3221D7D;
 Tue, 11 Oct 2022 07:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665471712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yN8/D6vcSIgB+oj/vlBa+7/ursq1iveibcn1bajTIE4=;
 b=YJe6DgAnIUQxnV3koQnNLF4OSrLnsapoeCB+tRLJv1F1q3etl9CyBuom8p8dUYuKol7Vp8
 a7zHvTX24A50+olrXwgrfnpL/cpd/6w8KKSrJrXcWa0rF0uFuHZJVvZFa5Kmiz8OkrS6bu
 1u0E+GeuMvJAp4rrJ9R8kS4lYq9iDS8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665471712;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yN8/D6vcSIgB+oj/vlBa+7/ursq1iveibcn1bajTIE4=;
 b=iYP/Sdwcsnmuvijdb17Tb2WV6P04VhQWW7OOf7yQFNpCu+gXfBRTl2PjyrOBM3Ywmwgm1D
 t+PMdXrf7wAaR+BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 25740139ED;
 Tue, 11 Oct 2022 07:01:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5Ur4B+AURWOafAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 11 Oct 2022 07:01:52 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: rawmidi: Drop register_mutex in snd_rawmidi_free()
Date: Tue, 11 Oct 2022 09:01:46 +0200
Message-Id: <20221011070147.7611-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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

The register_mutex taken around the dev_unregister callback call in
snd_rawmidi_free() may potentially lead to a mutex deadlock, when OSS
emulation and a hot unplug are involved.

Since the mutex doesn't protect the actual race (as the registration
itself is already protected by another means), let's drop it.

Link: https://lore.kernel.org/r/CAB7eexJP7w1B0mVgDF0dQ+gWor7UdkiwPczmL7pn91xx8xpzOA@mail.gmail.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/rawmidi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 6963d5a487b3..d8edb6055072 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -1899,10 +1899,8 @@ static int snd_rawmidi_free(struct snd_rawmidi *rmidi)
 
 	snd_info_free_entry(rmidi->proc_entry);
 	rmidi->proc_entry = NULL;
-	mutex_lock(&register_mutex);
 	if (rmidi->ops && rmidi->ops->dev_unregister)
 		rmidi->ops->dev_unregister(rmidi);
-	mutex_unlock(&register_mutex);
 
 	snd_rawmidi_free_substreams(&rmidi->streams[SNDRV_RAWMIDI_STREAM_INPUT]);
 	snd_rawmidi_free_substreams(&rmidi->streams[SNDRV_RAWMIDI_STREAM_OUTPUT]);
-- 
2.35.3

