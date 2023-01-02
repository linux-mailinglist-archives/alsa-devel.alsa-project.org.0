Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C28B065B59F
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Jan 2023 18:10:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 551BFA32F;
	Mon,  2 Jan 2023 18:09:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 551BFA32F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672679410;
	bh=YJCtI4ZSEmr9+LK//D8NWDALLm1+s3M3cIYSjl5IwJk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OqaROX+XAInJCfKZOzhh43OGK9Psmjk8beEK3EOmwoTf9+hzWwSGMkeZ56whyd/xr
	 y268mlHbGyGmvhFNeiKKLUy/35847zXaYGKgAwOTABbt09bDfSRlBQPAVSBWeznJa0
	 lkVJd1IEBLYTq3u0UfluAYNh2Dx0TUeNxZPbG04Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EBC2F800C0;
	Mon,  2 Jan 2023 18:08:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08C34F80543; Mon,  2 Jan 2023 18:08:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73F85F800C0
 for <alsa-devel@alsa-project.org>; Mon,  2 Jan 2023 18:08:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73F85F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=cANLTvui; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=qhLWtjBC
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DB1B934284;
 Mon,  2 Jan 2023 17:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672679286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gBho6uBNIZXwYIeeEbm+io1U/M7K9GbwJKCZ443DdEk=;
 b=cANLTvuiKnM1xDG/joGhcaer5VCyOqbykiD21zTL8WjoZWl5sgU1vzJoPzRamkp0y7iFqu
 rOLL0ReTQG7Wd/5dlZ30L8KfSP741iFDmKfuI3jnfWdS1eoNwgeA6N9pRmACq3jZB6HjBl
 E1O8zmZstvP1S6PaIaRJ5A1pMUKLeJY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672679286;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gBho6uBNIZXwYIeeEbm+io1U/M7K9GbwJKCZ443DdEk=;
 b=qhLWtjBC7PEmpS8vq0iIjUaxJJn1EFs9sxmt6RCSMMz+0vkFYvAVNP3MWyqLiwgbWSZCSi
 W4+lvOXsZBYHdzDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C35D1139ED;
 Mon,  2 Jan 2023 17:08:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CIsVL3YPs2ODGAAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 02 Jan 2023 17:08:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ALSA: usb-audio: Make sure to stop endpoints before
 closing EPs
Date: Mon,  2 Jan 2023 18:07:57 +0100
Message-Id: <20230102170759.29610-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230102170759.29610-1-tiwai@suse.de>
References: <20230102170759.29610-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

At the PCM hw params, we may re-configure the endpoints and it's done
by a temporary EP close followed by re-open.  A potential problem
there is that the EP might be already running internally at the PCM
prepare stage; it's seen typically in the playback stream with the
implicit feedback sync.  As this stream start isn't tracked by the
core PCM layer, we'd need to stop it explicitly, and that's the
missing piece.

This patch adds the stop_endpoints() call at snd_usb_hw_params() to
assure the stream stop before closing the EPs.

Fixes: bf6313a0ff76 ("ALSA: usb-audio: Refactor endpoint management")
Link: https://lore.kernel.org/r/4e509aea-e563-e592-e652-ba44af6733fe@veniogames.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 99a66d0ef5b2..7fc95ae9b2f0 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -525,6 +525,8 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 		if (snd_usb_endpoint_compatible(chip, subs->data_endpoint,
 						fmt, hw_params))
 			goto unlock;
+		if (stop_endpoints(subs, false))
+			sync_pending_stops(subs);
 		close_endpoints(chip, subs);
 	}
 
-- 
2.35.3

